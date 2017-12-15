/**   
* @Title: ForderActivity.java 
* @Package org.app.admin.action 
* @Description: TODO(用一句话描述该文件做什么) 
* @author fliay
* @date 2017年11月20日 下午3:51:10 
* @version V1.0   
*/
package org.app.admin.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.app.admin.annotation.SystemControllerLog;
import org.app.admin.annotation.SystemErrorLog;
import org.app.admin.pojo.AdminUser;
import org.app.admin.pojo.ForderActivity;
import org.app.admin.service.ForderActivityService;
import org.app.admin.service.ResourceService;
import org.app.framework.action.GeneralAction;
import org.app.framework.util.Common;
import org.app.framework.util.CommonEnum;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	 * @Title: list @Description: TODO(这里用一句话描述这个方法的作用) @param @param
	 *         session @param @param parentId 父文件夹id @param @param id
	 *         当前文件夹id @param @return 设定文件 @return ModelAndView 返回类型 @throws
	 */
//	@RequestMapping("/list")
//	@SystemErrorLog(description="查询活动出错")
//	@SystemControllerLog(description = "查询活动信息")
//	public ModelAndView list(HttpSession session, @ModelAttribute("parentId") String parentId,
//			@RequestParam(value = "id", defaultValue = "") String id) {
//		log.info("查询所有的文件夹");
//
//		ModelAndView modelAndView = new ModelAndView();
//
//		modelAndView.setViewName("admin/app-admin/fileSystem/list");
//
//		// 查询所有文件夹，包括子目录
//		List<ForderActivity> list = this.forderActivityService.listForderActivity(parentId, id);
//
//		modelAndView.addObject("listForderActivity", list);
//		if (list != null) {
//			for (ForderActivity f : list) {
//				id = f.getParentId();
//			}
//		}
//
//		if (Common.isNotEmpty(id) && !("0").equals(id)) {
//			modelAndView.addObject("id", id);
//			// 当前目录
//			ForderActivity forderActivity = this.forderActivityService.findForderById(id);
//
//			if (forderActivity != null) {
//
//				modelAndView.addObject("forderActivity", forderActivity);
//
//			}
//
//			// 上级目录
//
//			ForderActivity parentForderActivity = this.forderActivityService
//					.findForderById(forderActivity.getParentId());
//
//			if (parentForderActivity != null) {
//
//				modelAndView.addObject("parentForderActivity", parentForderActivity);
//
//			}
//		} else if (Common.isNotEmpty(parentId) && Common.isEmpty(id)) {
//			// 直接获取上级目录
//			ForderActivity parentForderActivity = this.forderActivityService.findForderById(parentId);
//
//			if (parentForderActivity != null) {
//
//				modelAndView.addObject("parentForderActivity", parentForderActivity);
//			}
//		}
//		return modelAndView;
//	}

	/**
	 * 
	 * @Title: createForderActivity @Description: TODO(添加文件夹) @param @param
	 *         forderActivity ForderActivity对象 @param @param Enumtype
	 *         接受界面的枚举枚举值 @param @return 设定文件 @return ModelAndView 返回类型 @throws
	 */
//	@RequestMapping("/createForder")
//	@SystemErrorLog(description="创建活动出错")
//	@SystemControllerLog(description = "创建活动信息")
//	public ModelAndView createForderActivity(HttpSession session,
//			 ForderActivity forderActivity,
//			@RequestParam(value = "Enumtype", defaultValue = "") String Enumtype,
//			@RequestParam(value = "editid", defaultValue = "") String editid, RedirectAttributes model) {
//		log.info("进行编辑文件夹操作");
//		ModelAndView modelAndView = new ModelAndView();
//
//		modelAndView.setViewName("redirect:/forderActivity/list");
//
//		String message = this.forderActivityService.createForder(forderActivity, Enumtype, session, editid);
//
//		if (Common.isNotEmpty(forderActivity.getParentId())) {
//
//			model.addFlashAttribute("parentId", forderActivity.getParentId());
//
//		}
//		log.info(message);
//
//		return modelAndView;
//	}

	/**
	 * 
	 * @Title: delete @Description: TODO(这里用一句话描述这个方法的作用) @param @param
	 *         model @param @param id 删除的id包括集合 @param @param parentId
	 *         删除后需要显示的文件夹 @param @return 设定文件 @return ModelAndView 返回类型 @throws
	 */
//	@RequestMapping("/delete")
//	@SystemErrorLog(description="删除活动出错")
//	@SystemControllerLog(description = "删除活动信息")
//	public ModelAndView delete(RedirectAttributes model, @RequestParam(value = "id", defaultValue = "") String id,
//			@RequestParam(value = "parentId", defaultValue = "") String parentId) {
//		ModelAndView modelAndView = new ModelAndView();
//
//		modelAndView.setViewName("redirect:/forderActivity/list");
//
//		if (Common.isNotEmpty(id)) {
//
//			this.forderActivityService.delete(id);
//
//		}
//		if (Common.isNotEmpty(parentId)) {
//
//			model.addFlashAttribute("parentId", parentId);
//		}
//
//		return modelAndView;
//
//	}

	/**
	 * 通过ajax获取相同目录下是否存在重复文件夹名称的信息
	 * 
	 * @param printWriter
	 * @param session
	 * @param response
	 */
	// TODO
	@RequestMapping(value = "/ajaxgetRepletes", method = RequestMethod.POST)
	@SystemErrorLog(description="查询重复活动出错")
	@SystemControllerLog(description = "查询重复活动信息")
	public void ajaxgetRepletes(
			@RequestParam(value = "forderActivityName", defaultValue = "") String forderActivityName, PrintWriter printWriter,
			HttpSession session, HttpServletResponse response) {

		AdminUser adminUser = (AdminUser) session.getAttribute(CommonEnum.USERSESSION);

		List<ForderActivity> list = this.forderActivityService.findForderActivityByUserType(forderActivityName, adminUser);

		if (list !=null) {
			printWriter.write("true");
		} else {
			printWriter.write("false");
		}

		printWriter.flush();
		printWriter.close();

	}
	
	/**
	 * 活动管理获取所有活动
	 */
	@SystemControllerLog(description="查询所有活动")
	@SystemErrorLog(description="查询所有活动出错")
	@RequestMapping("/list")
	public ModelAndView list(HttpSession session){
		
		ModelAndView modelAndView =new ModelAndView();
		
		modelAndView.setViewName("admin/app-admin/fileSystem/list");
		
		AdminUser adminUser = (AdminUser) session.getAttribute(CommonEnum.USERSESSION);
		
	
		List<ForderActivity> listForderActivity = this.forderActivityService.findForderActivityByUserType(null,adminUser);
		
		modelAndView.addObject("pageList",listForderActivity);
		
		
		return modelAndView;
	}
	
	
	
	
	@SystemControllerLog(description="查询所有活动")
	@SystemErrorLog(description="查询所有活动出错")
	@RequestMapping("/creatOrEditActivity")
	public ModelAndView creatOrEditActivity(HttpSession session,ForderActivity forderActivity
			,@RequestParam(value="edit",defaultValue="")String edit){
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("redirect:/forderActivity/list");
		
		
		AdminUser adminUser=(AdminUser) session.getAttribute(CommonEnum.USERSESSION);
		
		this.forderActivityService.creatOrEditActivity(forderActivity, adminUser, edit);
		
		return modelAndView;
		
	}
	
	
	@RequestMapping("/delete")
	@SystemErrorLog(description="删除活动出错")
	@SystemControllerLog(description = "删除活动信息")
	public ModelAndView delete(RedirectAttributes model, @RequestParam(value = "id", defaultValue = "") String id) {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("redirect:/forderActivity/list");

		if (Common.isNotEmpty(id)) {

			this.forderActivityService.delete(id);

		}
		return modelAndView;

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
