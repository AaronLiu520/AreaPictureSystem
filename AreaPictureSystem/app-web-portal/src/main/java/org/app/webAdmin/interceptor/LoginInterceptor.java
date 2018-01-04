package org.app.webAdmin.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.app.framework.util.CommonEnum;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


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
		System.out.println(request.getContextPath()+"/adminUser/login");
		
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







	}



