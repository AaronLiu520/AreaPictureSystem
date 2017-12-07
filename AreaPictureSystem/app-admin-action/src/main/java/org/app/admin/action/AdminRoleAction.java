package org.app.admin.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.app.admin.pojo.AdminMenu;
import org.app.admin.pojo.AdminRole;
import org.app.admin.service.AdminMenuService;
import org.app.admin.service.AdminRoleService;
import org.app.admin.util.LayerMenu;
import org.app.framework.action.GeneralAction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/adminRole")
public class AdminRoleAction extends GeneralAction<AdminRole> {
	private static final Logger log = LoggerFactory
			.getLogger(AdminRoleAction.class);
	@Autowired
	private AdminRoleService adminRoleService;
	@Autowired
	private AdminMenuService adminMenuService;

	/**
	 * 查询数据
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/list")
	public ModelAndView list(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/app-admin/role/list");
		try {
			modelAndView.addObject("pageList",
					this.adminRoleService.find(new Query(), AdminRole.class));
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

		// 操作提示session.setAttribute("error", "无法删除，因为该菜单存大子菜单。请先删除子菜单");
		modelAndView.addObject("error", session.getAttribute("error"));
		modelAndView.addObject("success", session.getAttribute("success"));
		session.removeAttribute("error");
		session.removeAttribute("success");
		return modelAndView;// 返回
	}

	/**
	 * 添加 或 更新
	 * 
	 * @param session
	 * @param adminRole
	 * @return
	 */
	@RequestMapping("/createOrUpdateToFind")
	public ModelAndView list(HttpSession session, AdminRole adminRole) {
		log.info("createOrUpdateToFind");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/adminRole/list");
		try {
			if (adminRole != null) {
				if (adminRole.getId() == null)
					this.adminRoleService.insert(adminRole);
				else{
					AdminRole updateAR=this.adminRoleService.findOneById(adminRole.getId(),AdminRole.class);
					updateAR.setName(adminRole.getName());
					updateAR.setReamrk(adminRole.getReamrk());
					updateAR.setUserType(adminRole.getUserType());
					this.adminRoleService.save(updateAR);

				}

			}
			log.info(adminRole.toString());
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
		modelAndView.setViewName("admin/app-admin/role/editor");
		try {
			if (id != null && id != "") {
				modelAndView.addObject("bean",
						this.adminRoleService.findOneById(id, AdminRole.class));
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
	public ModelAndView delete(HttpSession session,
			@RequestParam(value = "id", defaultValue = "0") String id,
			@RequestParam(value = "ids", defaultValue = "0") String ids) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/adminRole/list");
		try {
			if (!id.isEmpty() && !id.equals("0")) {// 删除
				AdminRole ar = this.adminRoleService.findOneById(id,
						AdminRole.class);
				// 删除前检查一下，是否有子菜单。如果有（刚不能删除）

				int count = this.adminRoleService.findCountByQuery(
						super.craeteQueryWhere("pid", ar.getId()),
						AdminRole.class);
				if (count > 0) {
					// 错误信息
					session.setAttribute("error", "无法删除，因为该菜单存大子菜单。请先删除子菜单");
				} else {
					adminRoleService.remove(ar);
				}

			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return modelAndView;
	}

	/**
	 * 权限管理 （查找）
	 * 
	 * @param session
	 * @param id
	 * @return
	 */
	@RequestMapping("/updateRolefind")
	public ModelAndView updateRolefind(HttpSession session, String id) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/app-admin/role/role");
		try {

			Query query =new Query();
			query.with(new Sort(Sort.Direction.ASC, "orderby"));

			// 加载所有的菜单信息
			List<AdminMenu> listMenu = this.adminMenuService.find(query,
					AdminMenu.class);
			modelAndView.addObject("list", listMenu);
			// 加载当前的角色信息
			AdminRole ar = this.adminRoleService.findOneById(id,
					AdminRole.class);
			// 加载角色已有菜单的(ID)
			String ids = getRoleMenuId(ar.getListMenu());
			// 加载数据信息

			modelAndView.addObject("ar", ar);
			List<LayerMenu> listar = getCheckMenu(listMenu, ids);

			log.info("数据长度：" + listar.size());
			modelAndView.addObject("listar", listar);

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return modelAndView;// 返回
	}

	/**
	 * 更新 权限 操作
	 * 
	 * @param id
	 * @param session
	 * @param check_box
	 * @return
	 */
	@RequestMapping("/updateRole")
	public ModelAndView updateRole(
			@RequestParam(value = "id", defaultValue = "0") String id,
			HttpSession session, String check_box) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/adminRole/list");
		// //查找当前角色.
		AdminRole ar = this.adminRoleService.findOneById(id, AdminRole.class);
		// //加载所有菜单
		Query query =new Query();
		query.with(new Sort(Sort.Direction.ASC, "orderby"));
		List<AdminMenu> listMenu = this.adminMenuService.find(query,
				AdminMenu.class);
		if (ar.getListMenu() == null) {
			ar.setListMenu(new ArrayList<AdminMenu>());
		}
		// 获取已有的权限 更新权限
		ar.setListMenu(getHaveMenu(listMenu, check_box));

		this.adminRoleService.save(ar);// 理新用户角色

		return modelAndView;
	}

	// 获取当前菜单有哪些角色
	public String getRoleMenuId(List<AdminMenu> listar) {
		if (listar == null)
			return null;
		StringBuffer id = new StringBuffer();
		for (AdminMenu adminMenu : listar) {
			if(adminMenu!=null){//当菜单是否为空
				id.append(adminMenu.getId() + ",");
			}
		}
		return id.toString();
	}

	// 标识菜单，为 check
	public List<LayerMenu> getCheckMenu(List<AdminMenu> listar, String ids) {

		List<LayerMenu> list = new ArrayList<LayerMenu>();// 返回的数据信息
		for (AdminMenu lm : listar) {
			LayerMenu layerMenu = new LayerMenu();
			if (ids != null) {
				if (lm != null && ids.indexOf(lm.getId()) != -1) {
					layerMenu.setCheck("check");
				}
			}
			layerMenu.setAdminMenu(lm);
			list.add(layerMenu);// 添加父菜单
		}
		log.info("数据长度：" + list.size());
		return list;
	}

	// 获取有已有的菜单
	public List<AdminMenu> getHaveMenu(List<AdminMenu> listar, String ids) {

		List<AdminMenu> list = new ArrayList<AdminMenu>();// 返回的数据信息
		for (AdminMenu lm : listar) {
			if (ids != null) {
				if (lm != null && ids.indexOf(lm.getId()) != -1) {
					list.add(lm);// 添加父菜单
				}
			}
		}
		log.info("数据长度：" + list.size());
		return list;
	}

}
