package org.app.admin.action;

import java.util.List;
import java.util.Map;

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
import org.app.admin.service.StatisticsService;
import org.app.admin.util.BaseType;
import org.app.admin.util.BaseType.UserType;
import org.app.admin.util.SortBean;
import org.app.framework.action.GeneralAction;
import org.app.framework.util.BasicDataResult;
import org.app.framework.util.Common;
import org.app.framework.util.CommonEnum;
import org.app.framework.util.Pagination;
import org.bson.types.ObjectId;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 用户管理
 */
@Controller
@RequestMapping("/adminUser")
public class AdminUserAction extends GeneralAction<AdminUser> {
	private static final Logger log = LoggerFactory.getLogger(AdminUserAction.class);

	@Autowired
	private AdminUserService adminUserService;
	@Autowired
	private AdminRoleService adminRoleService;
	@Autowired
	private AdminCompanyService AdminCompanyService;

	@Autowired
	private ResourceService resourceService;// 资源（图片）
	@Autowired
	private ForderActivityService forderActivityService;

	@Autowired
	private StatisticsService statisticsService;

	@Autowired
	private FavoritesService favoritesService;

	/**
	 * 用户查询
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/list")
	@SystemErrorLog(description = "查询用户信息出错")
	@SystemControllerLog(description = "查询所有用户信息")
	public ModelAndView list(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/app-admin/user/list");
		Query query = new Query();
		try {
			AdminUser adminUser = (AdminUser) session.getAttribute(CommonEnum.USERSESSION);
			if (UserType.SCHOOLADMIN.equals(adminUser.getUserType())
					|| adminUser.getAdminRole().getUserType().equals(UserType.SCHOOLADMIN)) {
				query.addCriteria(Criteria.where("adminCompany").is(adminUser.getAdminCompany()));
			}
			modelAndView.addObject("pageList", this.adminUserService.find(query, AdminUser.class));
		} catch (Exception e) {
			log.error("select 'AdminUser' table error ");
		}
		return modelAndView;// 返回
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
		modelAndView.setViewName("admin/app-admin/user/editor");
		try {
			if (id != null && id != "") {
				log.info("come!");
				modelAndView.addObject("bean", this.adminUserService.findOneById(id, AdminUser.class));
			}
			// 加载所有的角色信息
			modelAndView.addObject("role", this.adminRoleService.find(new Query(), AdminRole.class));
			// 加载单位信息
			modelAndView.addObject("company", this.AdminCompanyService.find(new Query(), AdminCompany.class));
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return modelAndView;// 返回
	}

	@SystemErrorLog(description = "添加或修改用户信息出错")
	@SystemControllerLog(description = "添加或修改用户信息")
	@RequestMapping("/createOrUpdateToFind")
	public ModelAndView list(HttpSession session, AdminUser adminUser, String roleId, String companyId) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/adminUser/list");
		// git AdminRole and AdminCompany
		if (roleId != null)
			adminUser.setAdminRole(this.adminRoleService.findOneById(roleId, AdminRole.class));
		if (companyId != null)
			adminUser.setAdminCompany(this.AdminCompanyService.findOneById(companyId, AdminCompany.class));
		try {
			if (adminUser != null) {
				if (adminUser.getId() == null) {// create or update
					// check AdminUser.userName
					if (this.adminUserService.findCountByQuery(
							super.craeteQueryWhere("userName", adminUser.getUserName()), AdminUser.class) > 0) {
						session.setAttribute("error", "添加失败，您添加的帐号信息已经存在。");
					} else {
						this.adminUserService.insert(adminUser);
					}
				} else
					this.adminUserService.save(adminUser);
			}
			log.info(adminUser.toString());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return modelAndView;// 返回
	}

	/**
	 * 后台登录
	 * 
	 * @return
	 */

	@RequestMapping("/login")
	public ModelAndView login() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/login");// 登录页面
		return modelAndView;// 返回
	}

	/**
	 * 后台登录
	 * 
	 * @param session
	 * @return ModelAndView
	 */
	@SystemErrorLog(description = "用户登录出错")
	@SystemControllerLog(description = "用户登录")
	@RequestMapping("/checkLogin")
	@ResponseBody
	public BasicDataResult checkLogin(HttpSession session, String username, String password) {
		
		Query query = new Query();
		
		query.addCriteria(Criteria.where("userName").is(username)).addCriteria(Criteria.where("password").is(password));
		
		// 检查帐号登录
		AdminUser au = this.adminUserService.findOneByQuery(
				super.craeteQueryWhere("userName", username, "password", password), AdminUser.class);
		if (au != null) {// 不等于空,保存用户帐号信息
			// 加载权限
			session.setAttribute("listMenu", au.getAdminRole().getListMenu());
			session.setAttribute(CommonEnum.USERSESSION, au);
			return BasicDataResult.build(200, "登录成功", true);
		}
		
		return BasicDataResult.build(203, "用户名或密码错误", false);
	}
/*	public ModelAndView checkLogin(HttpSession session, String username, String password) {
		ModelAndView modelAndView = new ModelAndView();
		// modelAndView.setViewName("redirect:/adminUser/index");
		modelAndView.setViewName("redirect:/adminUser/index");
		// 清除菜单
		session.removeAttribute(CommonEnum.WEBMENUSESSION);
		try {
			// 检查帐号登录
			AdminUser au = this.adminUserService.findOneByQuery(
					super.craeteQueryWhere("userName", username, "password", password), AdminUser.class);
			if (au != null) {// 不等于空,保存用户帐号信息
				// 加载权限
				session.setAttribute("listMenu", au.getAdminRole().getListMenu());
				session.setAttribute(CommonEnum.USERSESSION, au);

			} else {
				// 返回到登录。对应跟目录地址
				modelAndView.setViewName("redirect:/adminUser/login");
			}
		} catch (Exception e) {
			log.error("用户登录异常：" + e.toString());
		}
		return modelAndView;// 返回
	}*/

	/**
	 * 登录成功后，重定向
	 * 
	 * @return
	 */
	@SystemErrorLog(description = "访问登录出错")
	@RequestMapping(value = "/index", produces = MediaType.TEXT_PLAIN_VALUE + ";charset=utf-8")
	public ModelAndView index(HttpSession session,
			@RequestParam(value = "companyName", defaultValue = "") String companyName,
			@RequestParam(value = "forderActivityName", defaultValue = "") String forderActivityName,
			@RequestParam(value = "month", defaultValue = "") String month,
			@RequestParam(value = "start", defaultValue = "") String start,
			@RequestParam(value = "end", defaultValue = "") String end,
			@RequestParam(value = "type", defaultValue = "") String type) {

		ModelAndView modelAndView = new ModelAndView();

		// 查询条件反馈给页面
		if (Common.isNotEmpty(companyName)) {
			modelAndView.addObject("companyId", companyName);
		}
		if (Common.isNotEmpty(forderActivityName)) {
			modelAndView.addObject("forderActivityName", forderActivityName);
		}
		if (Common.isNotEmpty(month)) {
			modelAndView.addObject("month", month);
		}
		if (Common.isNotEmpty(start)) {
			modelAndView.addObject("start", start);
		}
		if (Common.isNotEmpty(end)) {
			modelAndView.addObject("end", end);
		}
		if (type.equals("1")) {
			modelAndView.addObject("triggerClick", "<script>$(function(){$('#b').trigger('click');})</script>");
		}

		modelAndView.setViewName("admin/index");

		// 加载所有的企业
		List<AdminCompany> lac = this.AdminCompanyService.find(new Query(), AdminCompany.class);

		modelAndView.addObject("companyList", lac);

		// 获取所有的图片信息
		Query query = new Query();

		query.addCriteria(Criteria.where("listType.type").in(BaseType.Type.AREA, BaseType.Type.BASEUTIS,
				BaseType.Type.DIRECTLYUTIS));

		Pagination<ForderActivity> pagination = this.forderActivityService.findPaginationByQuery(query, 1, 12,
				ForderActivity.class);

		modelAndView.addObject("forderActivityList", pagination);

		// 获取所有的统计
		Map<AdminUser, Integer> statisticsList = this.statisticsService.findUserUploadsNum(companyName,
				forderActivityName, start, end, month);

		List<SortBean> listsort = null;
		if (statisticsList != null) {
			listsort = this.statisticsService.sortfindUserUploadsNum(statisticsList);
		}
		modelAndView.addObject("listsort", listsort);

		return modelAndView;// 返回
	}

	/**
	 * 
	 * @Title: findPicturesofActivity @Description:
	 *         TODO(根据文件夹的id查询该文件夹下的图片) @param @return 设定文件 @return ModeAndView
	 *         返回类型 @throws
	 */
	@RequestMapping("/findPictures/{id}")
	public ModelAndView findPicturesofActivity(@PathVariable String id,
			@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
			@RequestParam(value = "pageSize", defaultValue = "21") Integer pageSize) {

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("admin/index");

		Pagination<Resource> pagination = null;
		if (Common.isNotEmpty(id)) {

			Query query = new Query();

			query.addCriteria(Criteria.where("forderActivityId").is(id));

			pagination = this.resourceService.findPaginationByQuery(query, pageNo, pageSize, Resource.class);
		}

		modelAndView.addObject("resourcelist", pagination);
		modelAndView.addObject("id", id);

		return modelAndView;
	}

	/**
	 * 注销
	 * 
	 * @param session
	 * @return
	 */
	@SystemErrorLog(description = "退出登录出错")
	@SystemControllerLog(description = "退出")
	@RequestMapping("/loginOut")
	public ModelAndView loginOut(HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();
		
		
		session.removeAttribute("areaphotoTimeList");
		session.removeAttribute("directlyphotoTimeList");
		session.removeAttribute("basePhotoTimeList");
		session.removeAttribute("photoTimeList");
		session.removeAttribute("yearId");
		session.removeAttribute("monthId");
		session.removeAttribute("dayId");
		session.removeAttribute("companyName");
		session.removeAttribute("nature");
		
		// 重定向到登录页面。
		modelAndView.setViewName("redirect:/adminUser/login");
		// 注销session(后台登录）
		session.removeAttribute(CommonEnum.USERSESSION);

		return modelAndView;// 返回
	}

	/***
	 * 
	 * @Title: delete @Description: TODO(删除用户) @param @param id @param @return
	 *         设定文件 @return ModelAndView 返回类型 @throws
	 */
	@SystemErrorLog(description = "删除用户出错")
	@SystemControllerLog(description = "删除用户")
	@RequestMapping("/delete")
	public ModelAndView delete(@RequestParam(defaultValue = "", value = "id") String id) {

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("redirect:/adminUser/list");

		String delIds[] = id.split(",");

		for (int i = 0; i < delIds.length; i++) {
			if (Common.isNotEmpty(delIds[i])) {

				AdminUser adminUser = this.adminUserService.findOneById(delIds[i], AdminUser.class);

				if (adminUser != null) {

					Query query = new Query();
					
					query.addCriteria(Criteria.where("adminUser.$id").is(new ObjectId(adminUser.getId())));
					// 我的收藏
					List<Favorites> listFavorites = this.favoritesService.find(query, Favorites.class);
					for (Favorites favorites : listFavorites) {
						// 删除我的收藏
						this.favoritesService.remove(favorites);
					}
					
					
					
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
			}

		}

		return modelAndView;

	}

	/**
	 * 
	 * @Title: checkPassword @Description: TODO(这里用一句话描述这个方法的作用) @param @return
	 *         设定文件 @return BasicDataResult 返回类型 @throws
	 */

	@RequestMapping("/checkPassword")
	@ResponseBody
	public BasicDataResult checkPassword(@RequestParam(defaultValue = "", value = "password") String password,
			HttpSession session) {
		BasicDataResult result = this.adminUserService.passwordByUserId(session, password);
		return result;

	}

	@RequestMapping("/updatePassword")
	@ResponseBody
	public BasicDataResult updatePassword(HttpSession session,
			@RequestParam(defaultValue = "", value = "password") String password) {

		BasicDataResult result = this.adminUserService.updatePassword(session, password);

		if (result.getStatus().equals(200)) {
			// 注销session(后台登录）
			session.removeAttribute(CommonEnum.USERSESSION);
		}
		return result;

	}

	@RequestMapping("/checkUserName")
	@ResponseBody
	public BasicDataResult checkUserName(HttpSession session,
			@RequestParam(defaultValue = "", value = "userName") String userName,
			@RequestParam(defaultValue = "", value = "hidUserName") String hidUserName) {
		
		if(!hidUserName.trim().equals(userName.trim())){
			if (Common.isEmpty(userName)) {
				return BasicDataResult.build(203, "请先添加用户名", null);
			}

			Query query = new Query();

			query.addCriteria(Criteria.where("userName").is(userName));

			Boolean b = this.adminUserService.exists(query, AdminUser.class);

			if (b) {
				return BasicDataResult.build(200, "用户名已经存在", true);
			}

		}
		return BasicDataResult.build(200, "", false);
		

	}

}
