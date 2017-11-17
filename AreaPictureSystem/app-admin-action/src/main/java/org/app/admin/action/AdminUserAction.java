package org.app.admin.action;

import javax.servlet.http.HttpSession;

import org.app.admin.pojo.AdminRole;
import org.app.admin.pojo.AdminUser;
import org.app.admin.service.AdminRoleService;
import org.app.admin.service.AdminUserService;
import org.app.framework.action.GeneralAction;
import org.app.framework.util.CommonEnum;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 用户管理
 */
@Controller
@RequestMapping("/adminUser")
public class AdminUserAction extends GeneralAction<AdminUser> {
	private static final Logger log = LoggerFactory
			.getLogger(AdminUserAction.class);
	
	@Autowired
	private AdminUserService adminUserService;
	@Autowired
	private AdminRoleService adminRoleService;
	
	
	
	/**
	 * 用户查询
	 * @param session
	 * @return
	 */
	@RequestMapping("/list")
	public ModelAndView list(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/app-admin/user/list");
		try {
			
		} catch (Exception e) {
		}
		return modelAndView;// 返回
	}
	
	/**
	 * 编缉  或   添加
	 * @param session
	 * @param id
	 * @return
	 */
	@RequestMapping("/editor")
	public ModelAndView editor(HttpSession session,String id) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/app-admin/user/editor");
		try {
			if(id!=null && id!=""){
				modelAndView.addObject("bean",this.adminUserService.findOneById(id, AdminUser.class));
			}
			//加载角色信息
			modelAndView.addObject("role",this.adminRoleService.find(new Query(), AdminRole.class));
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		return modelAndView;// 返回
	}
	
	
	
	
	
	

	/**
	 * 后台登录
	 * @return
	 */
	@RequestMapping("/login")
	public ModelAndView login() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/login");//登录页面
		return modelAndView;// 返回
	}
	
	
	
	/**
	 * 后台登录
	 * @param session
	 * @return ModelAndView
	 */
	@RequestMapping("/checkLogin")
	public ModelAndView checkLogin(HttpSession session,String username,String password) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/index");
		try {
			//检查帐号登录
			//AdminUser au=this.adminUserService.findOneByQuery(super.craeteQueryWhere("username",username,"password",password), AdminUser.class);
			//if(au!=null){//不等于空,保存用户帐号信息
				//session.setAttribute(CommonEnum.USERSESSION, au);
				//加载  帐号登录角色（菜单）
				//session.setAttribute("listMenu", au.getAdminRole().getListMenu());
				//加载权限
				AdminRole ar=this.adminRoleService.findOneById("595c93f777c8267be0b18969",AdminRole.class);
				session.setAttribute("listMenu",ar.getListMenu());
				modelAndView.addObject("listMenu",ar.getListMenu());
			//}else{
				//返回到登录。对应跟目录地址
				//modelAndView.setViewName("redirect:/adminUser/login");
			//}
		}catch (Exception e) {
			log.error("用户登录异常："+e.toString());
		}
		return modelAndView;// 返回
	}
	
	
	/**
	 * 注销
	 * @param session
	 * @return
	 */
	@RequestMapping("/loginOut")
	public ModelAndView loginOut(HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();
		//重定向到登录页面。
		modelAndView.setViewName("redirect:/userAdmin/login");
		//注销session(后台登录）
		session.removeAttribute(CommonEnum.USERSESSION);

		return modelAndView;// 返回
	}
	


}
