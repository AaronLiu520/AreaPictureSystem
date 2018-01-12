package org.app.admin.interceptor;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.app.admin.pojo.AdminCompany;
import org.app.admin.pojo.AdminUser;
import org.app.admin.pojo.ForderActivity;
import org.app.admin.pojo.Resource;
import org.app.admin.service.*;
import org.app.admin.util.BaseType;
import org.app.admin.util.PhotoTime;
import org.app.admin.util.basetreetime.BaseTreeTime;
import org.app.admin.util.basetreetime.LayerAdmonCompany;
import org.app.framework.util.CommonEnum;
import org.app.framework.util.Pagination;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import java.util.List;


/**
 * 
 * 
 * @category
 * 登录时候的拦截器
 * @author aaron
 * 
 */
@Repository
public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final Logger LOG = LoggerFactory.getLogger(LoginInterceptor.class);
	@Autowired
	private org.app.admin.service.AdminCompanyService AdminCompanyService;

	@Autowired
	private ResourceService resourceService;//资源（图片）
	@Autowired
	private ForderActivityService forderActivityService;
	/**
	 * 在Controller方法前进行拦截<br>
	 * 如果返回false <br>
	 * 从当前拦截器往回执行所有拦截器的afterCompletion方法,再退出拦截器链.<br>
	 * 如果返回true<br>
	 * 执行下一个拦截器,直到所有拦截器都执行完毕. 再运行被拦截的Controller.<br>
	 * 然后进入拦截器链,从最后一个拦截器往回运行所有拦截器的postHandle方法.<br>
	 * 接着依旧是从最后一个拦截器往回执行所有拦截器的afterCompletion方法.
	 */

	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler) throws Exception {

		String url = request.getRequestURL().toString();
		LOG.info("app-admin 请求:" + url);


		/**
		LOG.info("访问者IPss：" + request.getRemoteAddr());
		LOG.info("访问者IP：" + request.getRemoteAddr());**/
		HttpSession session = request.getSession();
		loadTreeMenu(session);//验证菜单
		//Menu Check，Cookie
		if(request.getParameter("activeMenu")!=null && !request.getParameter("activeMenu").equals("")){
			LOG.info("菜单ID ："+request.getParameter("activeMenu"));
			session.removeAttribute(CommonEnum.WEBMENUSESSION);
			session.setAttribute(CommonEnum.WEBMENUSESSION,request.getParameter("activeMenu"));

		}
		//检查用户是否登录过.
		if (session.getAttribute(CommonEnum.USERSESSION) != null) {
			return true;
		}
		//开放资源信息.
		if(url.indexOf("assets")!=-1 || url.indexOf("public")!=-1){
			return true;
		}
		
		//判断请求是AJAX请求还是普通请求
		String requestType=request.getHeader("X-Requested-With");
		if(requestType!=null&&requestType.equals("XMLHttpRequest")){
			response.setContentType("json/application");
			response.setCharacterEncoding("utf-8");
			return false;
		}
		//当session过期时，获取用户问的地址信息。
		LOG.info("session 过期");
		response.sendRedirect(request.getContextPath()+"/adminUser/login");
		
		
		
		return false;
	}



	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	/**
	 * 在Controller方法后进行拦截 <br>
	 * 当有拦截器抛出异常时,会从当前拦截器往回执行所有拦截器的afterCompletion方法 <br>
	 */
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}





	public void loadTreeMenu(HttpSession session){
		AdminUser adminUser = (AdminUser) session.getAttribute(CommonEnum.USERSESSION);
		// 区域   AREA
		session.setAttribute("areaphotoTimeList", PhotoTime.getPhotoTime(loadForderActivityType(BaseType.Type.AREA.toString(),15), null,true));
		

		// 直属 DIRECTLYUTIS
		session.setAttribute("directlyphotoTimeList", PhotoTime.getPhotoTime(
				loadForderActivityType(BaseType.Type.DIRECTLYUTIS.toString(),15), null,true));

		//基层单位 BASEUTIS,,
		List<PhotoTime> lpt = PhotoTime.getPhotoTime(
				loadForderActivityType(BaseType.Type.BASEUTIS.toString(),100), null,true);
		//加载所有的企业
		List<AdminCompany> lac = this.AdminCompanyService.find(new Query(), AdminCompany.class);
		
		session.setAttribute("company", lac);
		
		List<LayerAdmonCompany> llac = LayerAdmonCompany.LayerAdmonCompany(lac, lpt);
		List<BaseTreeTime> lbpt = BaseTreeTime.getBaseTreeTime(llac);

		session.setAttribute("basePhotoTimeList", lbpt);
		//个人 PERSION
		if(adminUser != null){
			session.setAttribute("photoTimeList",
					getPhotoTimeListByPersionId(BaseType.Type.PERSION.toString(), null,adminUser.getId()));
		}

		
		
		
	}



	/**
	 * 按类型，
	 * @param type
	 * @param number
	 * @return
	 */
	public List<ForderActivity> loadForderActivityType(String type, int number){
		Query query=new Query();
		query.addCriteria(Criteria.where("parentId").is("0"));
		query.addCriteria(Criteria.where("listType.type").is(type));
		query.with(new Sort(Sort.Direction.DESC, "activityTime"));
		Pagination<ForderActivity> p=this.forderActivityService.findPaginationByQuery(query,0,number,ForderActivity.class);
		if(p==null) return null;

		return p.getDatas();

	}


	public List<PhotoTime> getPhotoTimeListByPersionId(String type,String check,String boundId){

		Query query=new Query();
		query.addCriteria(Criteria.where("listType.type").is(type));
		query.addCriteria(Criteria.where("parentId").is(0));
		query.addCriteria(Criteria.where("boundId").is(boundId));
//		Query query=super.craeteQueryWhere("type",type,"parentId", "0","boundId",boundId);
		List<ForderActivity> listFA = this.forderActivityService.find(query, ForderActivity.class);
		
		//TODO
		return PhotoTime.getPhotoTime(listFA,check,false);
	}

}
