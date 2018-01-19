package org.app.webAdmin.action;

import javax.servlet.http.HttpSession;

import org.app.framework.action.GeneralAction;
import org.app.framework.util.CommonEnum;
import org.app.webAdmin.pojo.AdminMenu;
import org.app.webAdmin.service.AdminMenuService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/webMenu")
public class WebMenuAction extends GeneralAction<AdminMenu> {
	private static final Logger log = LoggerFactory
			.getLogger(WebMenuAction.class);
	@Autowired
	private AdminMenuService adminMenuService;
	/**
	 * 查询数据
	 * @param session
	 * @return
	 */
	@RequestMapping("/list")
	public ModelAndView list(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/app-admin/menu/list");
		try {
			Query query =new Query();
			query.with(new Sort(Sort.Direction.ASC, "orderby"));
			//获取所有的网站目录
			query.addCriteria(Criteria.where("isWebMenu").is(true));
			modelAndView.addObject("pageList",this.adminMenuService.find(query, AdminMenu.class));
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		//操作提示session.setAttribute("error", "无法删除，因为该菜单存大子菜单。请先删除子菜单");
		modelAndView.addObject("error", session.getAttribute("error"));
		modelAndView.addObject("success", session.getAttribute("success"));
		session.removeAttribute("error");
		session.removeAttribute("success");
		modelAndView.addObject("isWebMenu", true);
		return modelAndView;// 返回
	}
	
	/**
	 * 添加  或  更新
	 * @param session
	 * @param adminMenu
	 * @return
	 */
	@RequestMapping("/createOrUpdateToFind")
	public ModelAndView list(HttpSession session, AdminMenu adminMenu) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/webMenu/list");
		
		adminMenu.setWebMenu(true);
		
		try {
			if(adminMenu!=null){
				if(adminMenu.getId()==null)
					this.adminMenuService.insert(adminMenu);
				else
					this.adminMenuService.save(adminMenu);
			}
			log.info(adminMenu.toString());
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		session.removeAttribute(CommonEnum.WEBMENUS);
		session.removeAttribute(CommonEnum.WEBMENUSESSION);
		return modelAndView;// 返回
	}
	
/*	*//**
	 * 编缉  或   添加
	 * @param session
	 * @param id
	 * @return
	 *//*
	@RequestMapping("/editor")
	public ModelAndView editor(HttpSession session,String id) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/app-admin/menu/editor");
		try {
			if(id!=null && id!=""){
				modelAndView.addObject("bean",this.adminMenuService.findOneById(id, AdminMenu.class));
			}
		} catch (Exception e) {
		}
		return modelAndView;// 返回
	}
	*/
	/**
	 * 删除与批量删除
	 * 
	 * @param id
	 * @param ids
	 * @return
	 */
	@RequestMapping("/delete")
	public ModelAndView delete(HttpSession session,@RequestParam(value = "id", defaultValue = "0") String id,
							   @RequestParam(value = "ids", defaultValue = "0") String ids) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/webMenu/list");
		try {
			if (!id.isEmpty() && !id.equals("0")) {// 删除
				AdminMenu am = this.adminMenuService.findOneById(id, AdminMenu.class);
				//删除前检查一下，是否有子菜单。如果有（刚不能删除）
				
				int count=this.adminMenuService.findCountByQuery(super.craeteQueryWhere("pid",am.getId()), AdminMenu.class);
				if(count>0){
					//错误信息
					session.setAttribute("error", "无法删除，因为该菜单存大子菜单。请先删除子菜单");
				}else{
					adminMenuService.remove(am);
				}

			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
		}
		session.removeAttribute(CommonEnum.WEBMENUS);
		session.removeAttribute(CommonEnum.WEBMENUSESSION);
		return modelAndView;
	}

	

	
	

}
