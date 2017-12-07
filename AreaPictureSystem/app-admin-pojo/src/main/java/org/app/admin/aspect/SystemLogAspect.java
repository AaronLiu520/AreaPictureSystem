/**   
* @Title: SystemLogAspect.java 
* @Package com.app.admin.aspect 
* @Description: TODO(用一句话描述该文件做什么) 
* @author fliay
* @date 2017年12月4日 下午5:26:23 
* @version V1.0   
*/
package org.app.admin.aspect;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.app.admin.annotation.SystemControllerLog;
import org.app.admin.annotation.SystemErrorLog;
import org.app.admin.pojo.AdminUser;
import org.app.admin.pojo.Log;
import org.app.admin.service.LogService;
import org.app.admin.util.RequestHolder;
import org.app.framework.util.CommonEnum;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;

/**
 * @ClassName: SystemLogAspect
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author fliay
 * @date 2017年12月4日 下午5:26:23
 * 
 */
@Aspect
@Component
public class SystemLogAspect {

	private static final Logger logger = LoggerFactory.getLogger(SystemLogAspect.class);

	@Autowired
	private LogService logService;

	// service层切点
	@Pointcut("@annotation(org.app.admin.annotation.SystemErrorLog)")
	public void ErrorAspect() {

	}

	// controller层切点
	@Pointcut("@annotation(org.app.admin.annotation.SystemControllerLog)")
	public void ControllerAspect() {

	}

	/**
	 * 
	 * @Title: doBefore @Description: TODO(用于拦截Controller层的用户操作记录) @param @param
	 *         joinPoint 切点 @return void 返回类型 @throws
	 */
	@Before("ControllerAspect()")
	public void doBefore(JoinPoint joinPoint) {
		// 获取但当前request请求
		HttpServletRequest request = RequestHolder.getRequest();
		// 获取当前的session
		HttpSession session = request.getSession();
		// 通过Session获取用户信息
		AdminUser adminUser = (AdminUser) session.getAttribute(CommonEnum.USERSESSION);
		// 获取请求IP
		String ip = request.getRemoteAddr();

		try {
			logger.info("====================前置通知开始======================");
			logger.info("请求方法："
					+ (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));
			logger.info("方法描述" + getControllerMethodDescription(joinPoint));
			logger.info("请求人：" + adminUser.getName());
			logger.info("请求IP：" + ip);
			/*************** 数据库日志 *****************/
			Log log = new Log();
			log.setDescription(getControllerMethodDescription(joinPoint));
			log.setAdminUser(adminUser);
			log.setExceptionCode(null);
			log.setExceptionDetail(null);
			log.setMethod(joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()");
			log.setRequestIp(ip);
			log.setType("0");// 0为操作日志
			this.logService.insert(log);
			logger.info("====================前置通知结束======================");
		} catch (Exception e) {
			logger.info("====================前置通知异常======================");
			logger.info("错误信息：{}" + e.getMessage());
		}

	}

	/**
	 * 异常通知 用于拦截service层记录异常日志
	 * 
	 * @param joinPoint
	 * @param e
	 */
	@AfterThrowing(pointcut = "ErrorAspect()", throwing = "e")
	public void doAfterThrowing(JoinPoint joinPoint, Throwable e) {
		Gson gson = new Gson();
		// 获取但当前request请求
		HttpServletRequest request = RequestHolder.getRequest();
		// 获取当前的session
		HttpSession session = request.getSession();
		// 通过Session获取用户信息
		AdminUser adminUser = (AdminUser) session.getAttribute(CommonEnum.USERSESSION);
		// 获取请求IP
		String ip = request.getRemoteAddr();
		// 获取用户求求方法的参数并且序列化为JSON格式字符串
		String params = "";
		if (joinPoint.getArgs() != null && joinPoint.getArgs().length > 0) {
			for (int i = 0; i < joinPoint.getArgs().length; i++) {
				params += gson.toJson(joinPoint.getArgs()[i]) + ";";
			}
		}
		try{
		/***************日志输出**********************/
	     logger.info("====================异常通知开始====================");    
	     logger.info("异常代码:" + e.getClass().getName());    
	     logger.info("异常信息:" + e.getMessage());    
	     logger.info("异常方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()"));    
	     logger.info("方法描述:" + getServiceMethodDescription(joinPoint));    
	     logger.info("请求人:" + adminUser.getName());    
	     logger.info("请求IP:" + ip);    
	     logger.info("请求参数:" + params); 

		/***************数据库日志****************/
		Log log = new Log();
		log.setDescription(getServiceMethodDescription(joinPoint));
		log.setAdminUser(adminUser);
		log.setExceptionCode(e.getClass().getName());
		log.setExceptionDetail(e.getMessage());
		log.setMethod(getServiceMethodDescription(joinPoint));
		log.setParams(params);
		log.setRequestIp(ip);
		log.setType("1");//service日志
		this.logService.insert(log);
		logger.info("====================异常通知结束====================");  
		
		}catch(Exception ex){
			 logger.info("====================异常通知异常====================");  
			 logger.error("异常信息:{}", ex.getMessage());    
		}finally{
			 /*==========记录本地异常日志==========*/    
	        logger.error("异常方法:{"+joinPoint.getTarget().getClass().getName() + joinPoint.getSignature().getName()+"}异常代码:{"+e.getClass().getName()+"}异常信息:{"+e.getMessage()+"}参数:{"+params+"}");    
	    
		}
		
	}

	/**
	 * 
	 * @Title: getServiceMethodDescription @Description:
	 *         TODO(获取注解中对方法的描述信息用于service层注解) @param @param
	 *         joinPoint @param @return @param @throws ClassNotFoundException
	 *         设定文件 @return String 返回类型 @throws
	 */
	public static String getServiceMethodDescription(JoinPoint joinPoint) throws ClassNotFoundException {

		// 获取文件名称
		String targetName = joinPoint.getTarget().getClass().getName();
		// 获取方法
		String methodName = joinPoint.getSignature().getName();
		// 获取传入参数
		Object[] args = joinPoint.getArgs();
		// 使用反射获取Class
		Class targetClass = Class.forName(targetName);
		// 获取该class中的所有方法
		Method[] methods = targetClass.getMethods();

		String description = "";

		for (Method method : methods) {

			if (method.getName().equals(methodName)) {

				Class[] clazzs = method.getParameterTypes();

				if (clazzs.length == args.length) {

					description = method.getAnnotation(SystemErrorLog.class).description();
					break;
				}
			}

		}

		return description;
	}

	/**
	 * 
	 * @Title: getServiceMethodDescription @Description:
	 *         TODO(获取注解中对方法的描述信息用于service层注解) @param @param
	 *         joinPoint @param @return @param @throws ClassNotFoundException
	 *         设定文件 @return String 返回类型 @throws
	 */
	public static String getControllerMethodDescription(JoinPoint joinPoint) throws ClassNotFoundException {

		// 获取文件名称
		String targetName = joinPoint.getTarget().getClass().getName();
		// 获取方法
		String methodName = joinPoint.getSignature().getName();
		// 获取传入参数
		Object[] args = joinPoint.getArgs();
		// 使用反射获取Class
		Class targetClass = Class.forName(targetName);
		// 获取该class中的所有方法
		Method[] methods = targetClass.getMethods();

		String description = "";

		for (Method method : methods) {

			if (method.getName().equals(methodName)) {

				Class[] clazzs = method.getParameterTypes();

				if (clazzs.length == args.length) {

					description = method.getAnnotation(SystemControllerLog.class).description();
					break;
				}
			}

		}

		return description;
	}

}
