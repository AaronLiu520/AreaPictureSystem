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

import org.app.admin.annotation.SystemControllerLog;
import org.app.admin.annotation.SystemErrorLog;
import org.app.admin.pojo.AdminCompany;
import org.app.admin.pojo.AdminUser;
import org.app.admin.pojo.ForderActivity;
import org.app.admin.pojo.Resource;
import org.app.admin.pojo.Type;
import org.app.admin.service.AdminCompanyService;
import org.app.admin.service.ForderActivityService;
import org.app.admin.service.ResourceService;
import org.app.admin.service.TypeService;
import org.app.admin.util.BaseType;
import org.app.framework.action.GeneralAction;
import org.app.framework.util.BasicDataResult;
import org.app.framework.util.Common;
import org.app.framework.util.CommonEnum;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	private AdminCompanyService adminCompanyService;

	@Autowired
	private TypeService typeService;
	
	@Autowired
	private ResourceService resourceService;

	/**
	 * 通过ajax获取相同目录下是否存在重复文件夹名称的信息
	 * 
	 * @param printWriter
	 * @param session
	 * @param response
	 */
	// TODO
	@RequestMapping(value = "/ajaxgetRepletes")
	@ResponseBody
	@SystemErrorLog(description = "查询重复活动出错")
	@SystemControllerLog(description = "查询重复活动信息")
	public BasicDataResult ajaxgetRepletes(
			@RequestParam(value = "forderActivityName", defaultValue = "") String forderActivityName,
			@RequestParam(value = "companyId", defaultValue = "") String companyId,
			@RequestParam(value = "type", defaultValue = "") String type,
			@RequestParam(value = "activityTime", defaultValue = "") String activityTime, HttpSession session) {

		AdminUser adminUser = (AdminUser) session.getAttribute(CommonEnum.USERSESSION);
		
		
		List<List<Type>> listsType = this.typeService.addType(type);
		
		

		BasicDataResult result = this.forderActivityService.findForderActivityByforderActivityName(forderActivityName,
				adminUser, companyId, listsType, activityTime);

		return result;

	}

	/**
	 * 活动管理获取所有活动
	 */
	@SystemControllerLog(description = "查询所有活动")
	@SystemErrorLog(description = "查询所有活动出错")
	@RequestMapping("/list")
	public ModelAndView list(HttpSession session) {
		log.info("forder list");
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("admin/app-admin/fileSystem/list");

		AdminUser adminUser = (AdminUser) session.getAttribute(CommonEnum.USERSESSION);

		List<ForderActivity> listForderActivity = this.forderActivityService.findForderActivityByUserType(null,
				adminUser);

		List<AdminCompany> listAdminCompany = this.adminCompanyService.listCompay();// 获取所有的企业信息

		modelAndView.addObject("pageList", listForderActivity);

		modelAndView.addObject("company", listAdminCompany);

		return modelAndView;
	}

	@SystemControllerLog(description = "创建活动")
	@SystemErrorLog(description = "创建活动出错")
	@RequestMapping("/creatOrEditActivity")
	@ResponseBody
	public BasicDataResult creatOrEditActivity(HttpSession session, ForderActivity forderActivity,
			@RequestParam(value = "edit", defaultValue = "") String edit, RedirectAttributes ra) {
		log.info("进去create!");

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("redirect:/forderActivity/list");
		
		if(Common.isEmpty(forderActivity.getType())){
			return BasicDataResult.build(203, "请选择活动所属", null);
		}
		
		List<List<Type>> listsType = this.typeService.addType(forderActivity.getType());
		
		AdminUser adminUser = (AdminUser) session.getAttribute(CommonEnum.USERSESSION);
		
		
		BasicDataResult result = this.forderActivityService.creatOrEditActivity(forderActivity, adminUser, edit, listsType);

		
		return result;
	}

	@RequestMapping("/delete")
	@SystemErrorLog(description = "删除活动出错")
	@SystemControllerLog(description = "删除活动信息")
	public ModelAndView delete(RedirectAttributes model, @RequestParam(value = "id", defaultValue = "") String id) {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("redirect:/forderActivity/list");

		/*if (Common.isNotEmpty(id)) {

			this.forderActivityService.delete(id);

		}*/
		
		//删除活动
		
		ForderActivity forderActivity = this.forderActivityService.findOneById(id, ForderActivity.class);
		
		if(forderActivity!=null){
		
			//删除图片资源
			//1.如果是个人收藏
			Query query = new Query();
			if(forderActivity.getListType().get(0).getType().equals(BaseType.Type.PERSION)){
				query.addCriteria(Criteria.where("personActivityId").is(forderActivity.getPersonActivityId()));
				
			}
			//2如果是其他图片
			
			else{
				query.addCriteria(Criteria.where("forderActivityId").is(forderActivity.getId()));
			}
			List<Resource> listres = this.resourceService.find(query, Resource.class);
			
			for(Resource res:listres){
				this.resourceService.remove(res);
			}
			
			
			//删除活动
			this.forderActivityService.remove(forderActivity);
			
			
		}
		
		
		
		
		
		
		
		
		
		return modelAndView;

	}
	
	@RequestMapping("/findCompanyType")
	@ResponseBody
	public BasicDataResult findCompanyType(String boundCompany){
		
		if(Common.isEmpty(boundCompany)){
			return BasicDataResult.build(203, "请先选择活动所属学校", null);
		}
		
		AdminCompany adminCompany = this.adminCompanyService.findOneById(boundCompany, AdminCompany.class);
		
		if(adminCompany == null){
			return BasicDataResult.build(203, "未能找到学校的信息，请尝试刷新页面", null);
		}
		
		return BasicDataResult.build(200, "获取成功", adminCompany.getNature());
	}
	
	
	
	
	
	

}
