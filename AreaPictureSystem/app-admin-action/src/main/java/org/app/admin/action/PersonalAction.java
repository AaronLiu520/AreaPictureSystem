package org.app.admin.action;

import javax.servlet.http.HttpSession;

import org.app.admin.pojo.AdminCompany;
import org.app.admin.pojo.AdminRole;
import org.app.admin.pojo.AdminUser;
import org.app.admin.service.AdminCompanyService;
import org.app.admin.service.AdminRoleService;
import org.app.admin.service.AdminUserService;
import org.app.framework.action.GeneralAction;
import org.app.framework.util.CommonEnum;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/user")
public class PersonalAction extends GeneralAction<AdminUser>  {
	private static final Logger log = LoggerFactory
			.getLogger(PersonalAction.class);

	@Autowired
	private AdminUserService adminUserService;
	@Autowired
	private AdminRoleService adminRoleService;
	@Autowired
	private AdminCompanyService AdminCompanyService;
	
	@RequestMapping("/editor")
	public ModelAndView profile(String id){
		log.info("editor~~~~~~"+id);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/app-admin/personal/profile");
		log.info("profile");
		return modelAndView;
	}
	
   	@RequestMapping("/update")
	public ModelAndView  update(AdminUser adminUser,String roleId,String companyId
			,HttpSession session){
   		ModelAndView modelAndView=new ModelAndView();
   		if(roleId!=null)
			adminUser.setAdminRole(this.adminRoleService.findOneById(roleId, AdminRole.class));
		if(companyId!=null)
			adminUser.setAdminCompany(this.AdminCompanyService.findOneById(companyId,AdminCompany.class));
		try {
			if (adminUser != null) {
					this.adminUserService.save(adminUser);
			        modelAndView.setViewName("redirect:/adminUser/list");
			        session.setAttribute(CommonEnum.USERSESSION, adminUser);
			}
			log.info(adminUser.toString());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
   		log.info("id"+roleId);
	   log.info("adminuser"+companyId);
	 return modelAndView;
   	}
}
