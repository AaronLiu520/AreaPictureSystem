package org.app.admin.action;

import javax.servlet.http.HttpSession;

import org.app.admin.pojo.AdminCompany;
import org.app.admin.pojo.AdminRole;
import org.app.admin.pojo.AdminUser;
import org.app.admin.service.AdminCompanyService;
import org.app.admin.service.AdminRoleService;

import org.app.framework.action.GeneralAction;
import org.app.framework.util.PinyinTool;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Company class
 * @author Lau Aaron
 */
@Controller
@RequestMapping("/adminCompany/")
public class AdminCompanyAction extends GeneralAction<AdminCompany> {

	private static final Logger log = LoggerFactory.getLogger(AdminCompanyAction.class);

	@Autowired
	private AdminCompanyService AdminCompanyService;
	
	/**
	 * 查询数据
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/list")
	public ModelAndView list(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/app-admin/company/list");
		session.removeAttribute("error");
		try {
			Query query =new Query();
			modelAndView.addObject("pageList", this.AdminCompanyService.find(query, AdminCompany.class));
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

		return modelAndView;// 返回
	}

	/**
	 * create or update method
	 * @author Aaron Lau
	 * @param session
	 * @param adminCompany
	 * @return
	 */
	@RequestMapping("/createOrUpdateToFind")
	public ModelAndView list(HttpSession session, AdminCompany adminCompany) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/adminCompany/list");
		try {
			if (adminCompany != null) {
				if (adminCompany.getId() == null) {
					// 添加用户时，检用户帐号是否已经存在
					int checkEmail=this.AdminCompanyService.findCountByQuery(
							super.craeteQueryWhere("email", adminCompany.getEmail()), AdminCompany.class);
					if (checkEmail>0)
						session.setAttribute("error", "添加失败，您添加的帐号信息已经存在。");
					else {
						//添加用户信息
						//TODO
						this.AdminCompanyService.insert(adminCompany);
					}
				} else
					this.AdminCompanyService.save(adminCompany);
			}
			log.info(adminCompany.toString());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
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
		modelAndView.setViewName("admin/app-admin/company/editor");
		try {
			if (id != null && id != "") {
				modelAndView.addObject("bean", this.AdminCompanyService.findOneById(id, AdminCompany.class));
				//TODO 查询企业性质、企业类型。
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
	public ModelAndView delete(HttpSession session, @RequestParam(value = "id", defaultValue = "0") String id,
			@RequestParam(value = "ids", defaultValue = "0") String ids) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/adminCompany/list");
		try {
			if (!id.isEmpty() && !id.equals("0")) {// 删除
				AdminCompany am = this.AdminCompanyService.findOneById(id, AdminCompany.class);
				AdminCompanyService.remove(am);

			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return modelAndView;
	}



}
