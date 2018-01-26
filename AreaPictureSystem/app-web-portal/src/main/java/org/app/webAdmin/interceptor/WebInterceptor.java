package org.app.webAdmin.interceptor;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.app.framework.util.CommonEnum;
import org.app.web.service.WebService;
import org.app.webAdmin.pojo.AdminMenu;
import org.app.webAdmin.pojo.Index;
import org.app.webAdmin.pojo.Setting;
import org.app.webAdmin.service.IndexService;
import org.app.webAdmin.service.SettingService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


/**
 * 
* @ClassName: WebInterceptor 
* @Description: TODO(前台拦截器) 
* @author fliay
* @date 2018年1月4日 下午2:33:58 
*
 */
@Repository
public class WebInterceptor extends HandlerInterceptorAdapter {

	private static final Logger LOG = LoggerFactory.getLogger(WebInterceptor.class);
	
	
	@Autowired 
	private WebService webService;
	
	@Autowired
	private SettingService settingService;
	
	@Autowired
	private IndexService indexService;
	
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


		HttpSession session = request.getSession();
		
		boolean flag = false;
		//检查用户是否登录过.
		if (session.getAttribute(CommonEnum.WEBMENUS) != null) {
			flag =true;
		}else{
			List<AdminMenu> list =this.webService.findAllWebMenu();
			session.setAttribute(CommonEnum.WEBMENUS, list);
			flag = true;
		}
		
		
		if (session.getAttribute(CommonEnum.WEBSETTING) != null) {
			flag =true;
		}else{
			//加载网站配置
			Setting setting = this.settingService.findOneByQuery(new Query(), Setting.class);
			session.setAttribute(CommonEnum.WEBSETTING, setting);
			flag = true;
		}
		
		
		
		if (session.getAttribute(CommonEnum.WEBINDEXBANANA) != null) {
			flag =true;
		}else{
			//加载网站配置
			Index index = this.indexService.findOneByQuery(new Query(), Index.class);
			session.setAttribute(CommonEnum.WEBINDEXBANANA, index);
			flag = true;
		}
		
		
		
		return flag;
		
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







	}



