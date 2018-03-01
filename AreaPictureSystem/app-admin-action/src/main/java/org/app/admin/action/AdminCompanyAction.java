package org.app.admin.action;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.app.admin.annotation.SystemControllerLog;
import org.app.admin.annotation.SystemErrorLog;
import org.app.admin.pojo.AdminCompany;
import org.app.admin.pojo.AdminRole;
import org.app.admin.pojo.AdminUser;
import org.app.admin.pojo.Favorites;
import org.app.admin.pojo.ForderActivity;
import org.app.admin.pojo.Resource;
import org.app.admin.service.AdminCompanyService;
import org.app.admin.service.AdminRoleService;

import org.app.admin.service.AdminUserService;
import org.app.admin.service.FavoritesService;
import org.app.admin.service.ForderActivityService;
import org.app.admin.service.ResourceService;
import org.app.admin.util.BaseType;
import org.app.framework.action.GeneralAction;
import org.app.framework.util.CommonEnum;
import org.app.framework.util.FileOperateUtil;
import org.app.framework.util.PinyinTool;
import org.bson.types.ObjectId;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Company class
 * 
 * @author Lau Aaron
 */
@Controller
@RequestMapping("/adminCompany/")
public class AdminCompanyAction extends GeneralAction<AdminCompany> {

	private static final Logger log = LoggerFactory.getLogger(AdminCompanyAction.class);

	@Autowired
	private AdminCompanyService adminCompanyService;

	@Autowired
	private AdminUserService adminUserService;

	@Autowired
	private AdminRoleService adminRoleService;
	
	@Autowired
	private FavoritesService favoritesService;
	
	@Autowired
	private ResourceService resourceService;
	
	@Autowired
	private ForderActivityService forderActivityService;
	
	


	/**
	 * 查询数据
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/list")
	@SystemErrorLog(description="查询企业信息出错")
	@SystemControllerLog(description = "查询企业信息")
	public ModelAndView list(HttpSession session) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/app-admin/company/list");
		session.removeAttribute("error");
		try {
			Query query = new Query();
			modelAndView.addObject("pageList", this.adminCompanyService.find(query, AdminCompany.class));
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

		return modelAndView;// 返回
	}

	/**
	 * create or update method
	 * 
	 * @author Aaron Lau
	 * @param session
	 * @param adminCompany
	 * @return
	 */
	@RequestMapping("/createOrUpdateToFind")
	@SystemErrorLog(description="添加企业信息出错")
	@SystemControllerLog(description = "添加企业信息")
	public ModelAndView list(HttpSession session, AdminCompany adminCompany) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/adminCompany/list");
		try {
			if (adminCompany != null) {
				if (adminCompany.getId() == null) {
					// 添加用户时，检用户帐号是否已经存在
					int checkphone = this.adminCompanyService.findCountByQuery(
							super.craeteQueryWhere("telPhone", adminCompany.getTelPhone()), AdminCompany.class);
					if (checkphone > 0) {
						session.setAttribute("error", "添加失败，您添加的帐号信息已经存在。");
					}else {
						//添加企业信息成功后，创建一个企业管理员帐号。
						this.adminCompanyService.insert(adminCompany);
						AdminUser au=createSuperAdminUser(adminCompany);
						
						adminCompany.setAdminUser(au);
						this.adminCompanyService.save(adminCompany);//重新更新。
					}
				} else
					this.adminCompanyService.save(adminCompany);
			}
			log.info(adminCompany.toString());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return modelAndView;// 返回
	}



	public AdminUser createSuperAdminUser(AdminCompany adminCompany){
		// 添加用户信息
		AdminUser superAdminUser=new AdminUser();
		superAdminUser.setName(adminCompany.getName()+"管理员");
		superAdminUser.setUserName(adminCompany.getTelPhone());
		superAdminUser.setPassword(adminCompany.getTelPhone());
		superAdminUser.setTel(adminCompany.getTelPhone());
		superAdminUser.setEmail(adminCompany.getEmail());
		superAdminUser.setUserType(BaseType.UserType.SCHOOLADMIN);//学校管理员
		// 获取管理员ROLE
		AdminRole ac=this.adminRoleService.findOneByQuery(
				super.craeteQueryWhere("userType", BaseType.UserType.SCHOOLADMIN.toString()), AdminRole.class);
		superAdminUser.setAdminRole(ac);
		superAdminUser.setAdminCompany(adminCompany);//企业信息
		this.adminUserService.save(superAdminUser);

		return superAdminUser;
	}



	/**
	 * 编缉 或 添加
	 *
	 * @param session
	 * @param id
	 * @return
	 */
	@RequestMapping("/editor")
	public ModelAndView editor(HttpSession session, String id) {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/app-admin/company/editor");
		try {
			if (id != null && id != "") {
				modelAndView.addObject("bean", this.adminCompanyService.findOneById(id, AdminCompany.class));
				// TODO 查询企业性质、企业类型。
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return modelAndView;// 返回
	}

	/**
	 * 删除与批量删除
	 *
	 * @param id
	 * @param ids
	 * @return
	 */
	@RequestMapping("/delete")
	@SystemErrorLog(description="删除企业信息出错")
	@SystemControllerLog(description = "删除企业信息")
	public ModelAndView delete(HttpSession session, @RequestParam(value = "id", defaultValue = "0") String id,
			@RequestParam(value = "ids", defaultValue = "0") String ids) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/adminCompany/list");
		try {
			if (!id.isEmpty() && !id.equals("0")) {// 删除
				AdminCompany am = this.adminCompanyService.findOneById(id, AdminCompany.class);
				//2018年2月2日 16:29:52 添加了删除企业对应的用户  start
				Query query = new Query();
				query.addCriteria(Criteria.where("adminCompany.$id").is(new ObjectId(am.getId())));
				
				List<AdminUser> listadminUsers = this.adminUserService.find(query, AdminUser.class);
				
				//获取所有的adminUser
				for(AdminUser adminUser:listadminUsers){
					 query = new Query();
					 query.addCriteria(Criteria.where("adminUser.$id").is(new ObjectId(adminUser.getId())));
					 //我的收藏
					 List<Favorites> listFavorites = this.favoritesService.find(query, Favorites.class);
					for(Favorites favorites :listFavorites){
						//删除我的收藏
						this.favoritesService.remove(favorites);
					}
		/*			//我的收藏
					List<Resource> listResource = this.resourceService.find(query, Resource.class);
					for(Resource resource :listResource){
						//删除我的收藏
						this.resourceService.remove(resource);
					}*/
					
					//删除企业所有的活动
					List<ForderActivity> listForderActivity = this.forderActivityService.find(query, ForderActivity.class);
					
					for(ForderActivity f:listForderActivity){
						//删除对应的活动
						this.forderActivityService.remove(f);
					}
					
					
					// 我的资源
					query = new Query();
					
					query.addCriteria(Criteria.where("boundId").is(adminUser.getId()));
					
					List<Resource> listResource = this.resourceService.find(query, Resource.class);
					for (Resource resource : listResource) {
						// 删除我的收藏
						this.resourceService.remove(resource);
					}
					
					this.adminUserService.remove(adminUser);
				}
				
				//end
				adminCompanyService.remove(am);

			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return modelAndView;
	}

	/***
	 * 文件上传
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "static-access", "unused" })
	@RequestMapping(value = "upload")
	@SystemErrorLog(description="批量导入企业信息出错")
	@SystemControllerLog(description = "批量导入企业信息")
	public ModelAndView upload(AdminCompany adminCompany, HttpServletRequest request, HttpSession session,
			RedirectAttributes attr) {
		log.info("开始上传文件");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/adminCompany/list");
		String error = "";
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			// 别名
			String upname = File.separator+"WEB-INF" + File.separator + "FileUpload" + File.separator + "company";

			// 可以上传的文件格式
			log.info("准备上传企业单位数据");
			String filetype[] = { "xls,xlsx" };
			List<Map<String, Object>> result = FileOperateUtil.upload(request, upname, filetype);
			log.info("上传文件成功");
			boolean has = (Boolean) result.get(0).get("hassuffix");

			if (has != false) {
				// 获得上传的xls文件路径
				String path = (String) result.get(0).get("savepath");
				File file = new File(path);
				// 知道导入返回导入结果
				error = this.adminCompanyService.BatchImport(file, 1, session);

				attr.addFlashAttribute("errorImport", error);
				// map.put("result", result);
				return new ModelAndView("redirect:/adminCompany/list");
				// return modelAndView;
			}
		} catch (Exception e) {
			modelAndView.addObject("errorImport", e);
			return new ModelAndView("redirect:/adminCompany/list");

		}

		return modelAndView;

	}

	/**
	 * 文件下载
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "download")
	@SystemErrorLog(description="下载导企业信息导入模版出错")
	@SystemControllerLog(description = "下载企业信息导入模版")
	public ModelAndView download(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String storeName = "企业信息导入模版.xlsx";
		String contentType = "application/octet-stream";
		String UPLOAD = "WEB-INF/Template/company/";
		FileOperateUtil.download(request, response, storeName, contentType, UPLOAD);

		return null;
	}

	/**
	 * process 获取进度
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "uploadprocess")
	@ResponseBody
	public Object process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return this.adminCompanyService.findproInfo(request);
	}

	
	
	
	
	/**
	 * 通过ajax获取相同目录下是否存在重复文件夹名称的信息
	 * 
	 * @param printWriter
	 * @param session
	 * @param response
	 */
	// TODO
	@RequestMapping(value = "/ajaxgetRepletes", method = RequestMethod.POST)
	@SystemErrorLog(description="查询重复手机号")
	@SystemControllerLog(description = "查询重复手机号")
	public void ajaxgetRepletes(
			@RequestParam(value = "telPhone", defaultValue = "") String telPhone,
			PrintWriter printWriter,
			HttpSession session, HttpServletResponse response) {
		
		boolean b =this.adminCompanyService.findtelPhone(telPhone);
		if(b){
			printWriter.write("true");
		}else{
			printWriter.write("false");
		}

		printWriter.flush();
		printWriter.close();

	}
	
	
	
}
