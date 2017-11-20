/**   
* @Title: ForderActivity.java 
* @Package org.app.admin.action 
* @Description: TODO(用一句话描述该文件做什么) 
* @author fliay
* @date 2017年11月20日 下午3:51:10 
* @version V1.0   
*/
package org.app.admin.action;

import javax.servlet.http.HttpSession;

import org.app.admin.pojo.ForderActivity;
import org.app.admin.service.ForderActivityService;
import org.app.admin.service.ResourceService;
import org.app.framework.action.GeneralAction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/** 
* @ClassName: ForderActivity 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author fliay
* @date 2017年11月20日 下午3:51:10 
*  
*/
@Controller
@RequestMapping("/forderActivity")
public class ForderActivityAction extends GeneralAction<ForderActivity>{

	private static final Logger log = LoggerFactory.getLogger(ForderActivityAction.class);
	
	@Autowired
	private ForderActivityService forderActivityService;
	
	@Autowired
	private ResourceService resourceService;
	
	
	/***
	 * 
	* @Title: list 
	* @Description: TODO(查询所有该用户能访问到的文件夹跟活动) 
	* @param @return    设定文件 
	* @return ModelAndView    返回类型 
	* @throws
	 */
	@RequestMapping("/list")
	public ModelAndView  list(HttpSession session){
		log.info("查询所有的文件夹");
		
		
		ModelAndView modelAndView = new ModelAndView();

		return modelAndView;
	}
	
	
	/**
	 * 
	* @Title: addForderActivity 
	* @Description: TODO(添加活动或者文件夹) 
	* @param @param id
	* @param @param session
	* @param @return    设定文件 
	* @return ModelAndView    返回类型 
	* @throws
	 */
	@RequestMapping("/editor")
	public ModelAndView addForderActivity(@RequestParam(value="id",defaultValue="")String id,HttpSession session){
		
		ModelAndView modelAndView = new ModelAndView();

		return modelAndView;
		
		
	}
	
	
	
	
}
