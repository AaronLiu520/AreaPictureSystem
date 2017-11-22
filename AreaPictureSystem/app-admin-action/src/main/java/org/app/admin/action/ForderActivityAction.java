/**   
* @Title: ForderActivity.java 
* @Package org.app.admin.action 
* @Description: TODO(用一句话描述该文件做什么) 
* @author fliay
* @date 2017年11月20日 下午3:51:10 
* @version V1.0   
*/
package org.app.admin.action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.app.admin.pojo.ForderActivity;
import org.app.admin.service.ForderActivityService;
import org.app.admin.service.ResourceService;
import org.app.framework.action.GeneralAction;
import org.app.framework.util.Common;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * @ClassName: ForderActivity
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author fliay
 * @date 2017年11月20日 下午3:51:10
 * 
 */
@Controller
@RequestMapping("/forderActivity")
public class ForderActivityAction extends GeneralAction<ForderActivity> {

	private static final Logger log = LoggerFactory.getLogger(ForderActivityAction.class);

	@Autowired
	private ForderActivityService forderActivityService;

	@Autowired
	private ResourceService resourceService;

	/**
	 * 
	* @Title: list 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param session
	* @param @param parentId   父文件夹id
	* @param @param id         当前文件夹id
	* @param @return    设定文件 
	* @return ModelAndView    返回类型 
	* @throws
	 */
	@RequestMapping("/list") 
	public ModelAndView list(HttpSession session, @ModelAttribute("parentId") String parentId,
			@ModelAttribute("id") String id,
			@RequestParam(value="supid",defaultValue="")String supid) {
		log.info("查询所有的文件夹");

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("admin/app-admin/fileSystem/list");

		// 查询所有文件夹，包括子目录
		List<ForderActivity> list = this.forderActivityService.listForderActivity(parentId,id);

		modelAndView.addObject("listForderActivity", list);


		if(Common.isNotEmpty(id)){
		//当前目录
		ForderActivity forderActivity = this.forderActivityService.findForderById(id);
		
		
		
		
		if(forderActivity != null){
			
			if(Common.isNotEmpty(forderActivity.getParentId())){
				
				modelAndView.addObject("parentId", forderActivity.getParentId());
				
			}
			
			modelAndView.addObject("forderActivity", forderActivity);
			
		}
		
		//上级目录
		
		if(forderActivity.getParentId()!="0"){
			
			ForderActivity parentForderActivity = this.forderActivityService.findForderById(forderActivity.getParentId());
			
			if(parentForderActivity != null){
				
				modelAndView.addObject("parentForderActivity", parentForderActivity);
				
				}
			}
		}
		
		

		return modelAndView;

	}

	// @RequestParam(value="Enumtype",defaultValue="")String Enumtype
	/**
	 * 
	 * @Title: createForderActivity @Description: TODO(添加文件夹) @param @param
	 * forderActivity ForderActivity对象 @param @param Enumtype
	 * 接受界面的枚举枚举值 @param @return 设定文件 @return ModelAndView 返回类型 @throws
	 */
	@RequestMapping("/createForder")
	public ModelAndView createForderActivity(HttpSession session,
			@ModelAttribute("forderActivityName") ForderActivity forderActivity,
			@RequestParam(value = "Enumtype", defaultValue = "") String Enumtype, RedirectAttributes model) {
		log.info("进行编辑文件夹操作");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/forderActivity/list");
		if (Common.isNotEmpty(forderActivity.getParentId())) {
			model.addFlashAttribute("parentId", forderActivity.getParentId());
		}
		String message = this.forderActivityService.createForder(forderActivity, Enumtype, session);
		log.info(message);
		return modelAndView;
	}

}
