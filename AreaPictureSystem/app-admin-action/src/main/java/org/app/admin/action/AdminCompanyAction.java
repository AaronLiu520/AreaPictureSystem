package org.app.admin.action;

import javax.servlet.http.HttpSession;

import org.app.admin.pojo.AdminCompany;
import org.app.admin.pojo.AdminRole;
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

@Controller
@RequestMapping("/adminCompany/")
public class AdminCompanyAction extends GeneralAction<AdminCompany> {

	private static final Logger log = LoggerFactory.getLogger(AdminCompanyAction.class);

	@Autowired
	private AdminCompanyService AdminCompanyService;
	@Autowired
	private AdminRoleService adminRoleService;

	
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
	 * @param adminRoleId
	 * @param adminAreaId
	 * @return
	 */
	@RequestMapping("/createOrUpdateToFind")
	public ModelAndView list(HttpSession session, AdminCompany adminCompany, String adminRoleId) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/adminCompany/list");
		// 加载角色(产品功能)
		AdminRole ar = this.adminRoleService.findOneById(adminRoleId, AdminRole.class);
		adminCompany.setAdminRole(ar);
		try {
			// 将(公司简称)转化拼间
			PinyinTool pt = new PinyinTool();
			adminCompany.setNamePingYing(pt.toPinYin(adminCompany.getShorts()));
			
			if (adminCompany != null) {
				if (adminCompany.getId() == null) {
					// 添加用户时，检用户帐号是否已经存在
					if (this.AdminCompanyService.findCountByQuery(
							super.craeteQueryWhere("shorts", adminCompany.getShorts()), AdminCompany.class) > 0) {
						session.setAttribute("error", "添加失败，您添加的帐号信息已经存在。");
					} else {
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
			}
			// 加载角色信息
			modelAndView.addObject("role", this.adminRoleService.find(new Query(), AdminRole.class));
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
	
	//产品功能配置
	
	/**
	 * 产品管理
	 * 
	 * @param session
	 * @param id
	 * @return
	 */
	@RequestMapping("/productManage")
	public ModelAndView productManage(HttpSession session, String id,String areaId) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/app-admin/company/productMessage");
		try {
			// 加载所有(区域ID功能)
			//List<AdminProduct> listMenu = this.adminAreaService.findOneById(areaId,AdminArea.class).getAdminProduct();
			//modelAndView.addObject("list", listMenu);
			// 加载当前的-公司的产品功能
			//AdminCompany aa = this.AdminCompanyService.findOneById(id,AdminCompany.class);
			// 加载角色已有菜单的(ID)
			//String ids = getAdminProductId(aa.getAdminProduct());
			// 加载数据信息
			//modelAndView.addObject("aa", aa);
			//List<LayerAdminProduct> listlap = getCheckAdminProduct(listMenu, ids);
			//log.info("数据长度：" + listlap.size());
			//modelAndView.addObject("listlap", listlap);

		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return modelAndView;// 返回
	}
	
	
	
	
	
	/**
	 * 更新   产品功能
	 * 
	 * @param id
	 * @param session
	 * @param check_box
	 * @return
	 */
	@RequestMapping("/updateAdminProduct")
	public ModelAndView updateAdminProduct(
			@RequestParam(value = "id", defaultValue = "0") String id,String areaId,
			HttpSession session, String check_box) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/adminCompany/list");
		// 加载公司所有的 产品
		/**
			AdminCompany ac = this.AdminCompanyService.findOneById(id,AdminCompany.class);

			// //加载所有菜单
			List<AdminProduct> listMenu = this.adminAreaService.findOneById(areaId,AdminArea.class).getAdminProduct();
			if (ac.getAdminProduct() == null) {
				ac.setAdminProduct(new ArrayList<AdminProduct>());
			}
			// 获取已有的权限 更新权限
			ac.setAdminProduct(getHaveAdminProduct(listMenu, check_box));

			this.AdminCompanyService.save(ac);// 更新区域信息
		 **/

		return modelAndView;
	}
	
	// 获取有已有的菜单
	/**
		public List<AdminProduct> getHaveAdminProduct(List<AdminProduct> listap, String ids) {

			List<AdminProduct> list = new ArrayList<AdminProduct>();// 返回的数据信息
			for (AdminProduct lm : listap) {
				if (ids != null) {
					if (lm != null && ids.indexOf(lm.getId()) != -1) {
						list.add(lm);// 添加父菜单
					}
				}
			}
			log.info("数据长度：" + list.size());
			return list;
		}
	
	
	// 获取当前菜单有哪些角色
	public String getAdminProductId(List<AdminProduct> listaa) {
		if (listaa == null)
			return null;
		StringBuffer id = new StringBuffer();
		for (AdminProduct ap : listaa) {
			if(ap!=null){//当菜单是否为空
				id.append(ap.getId() + ",");
			}
		}
		return id.toString();
	}
	
	// 标识菜单，为 check
	public List<LayerAdminProduct> getCheckAdminProduct(List<AdminProduct> listap, String ids) {

		List<LayerAdminProduct> list = new ArrayList<LayerAdminProduct>();// 返回的数据信息
		for (AdminProduct lap : listap) {
			LayerAdminProduct layerAdminProduct = new LayerAdminProduct();
			if (ids != null) {
				if (lap != null && ids.indexOf(lap.getId()) != -1) {
					layerAdminProduct.setCheck("check");
				}
			}
			layerAdminProduct.setAdminProduct(lap);
			list.add(layerAdminProduct);// 添加父菜单
		}
		log.info("数据长度：" + list.size());
		return list;
	}
	 **/

}
