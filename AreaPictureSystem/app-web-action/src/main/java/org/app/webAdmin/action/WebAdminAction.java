/**   
* @Title: WebAdminAction.java 
* @Package org.app.webAdmin.action 
* @Description: TODO(用一句话描述该文件做什么) 
* @author fliay
* @date 2018年1月4日 下午3:42:09 
* @version V1.0   
*/
package org.app.webAdmin.action;

import org.app.framework.action.GeneralAction;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/** 
* @ClassName: WebAdminAction 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author fliay
* @date 2018年1月4日 下午3:42:09 
*  
*/


@Controller
@RequestMapping("/webAdmin")
public class WebAdminAction extends GeneralAction<Object>{

	
	/**
	 * 
	* @Title: setting 
	* @Description: TODO(网站配置) 
	* @param @return    设定文件 
	* @return ModelAndView    返回类型 
	* @throws
	 */
	@RequestMapping("/setting")
	public ModelAndView setting(){
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("admin/app-admin/webadmin/setting");
		
		
		
		
		
		return modelAndView;
		
	}
	
	
	
	
	
	
	
	
	
}
