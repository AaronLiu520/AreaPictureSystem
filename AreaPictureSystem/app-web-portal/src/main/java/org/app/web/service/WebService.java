/**   
* @Title: WebService.java 
* @Package org.app.web.service 
* @Description: TODO(用一句话描述该文件做什么) 
* @author fliay
* @date 2018年1月4日 下午2:01:07 
* @version V1.0   
*/
package org.app.web.service;

import java.util.List;

import org.app.framework.service.GeneralServiceImpl;
import org.app.web.pojo.WebPortal;
import org.app.webAdmin.pojo.AdminMenu;
import org.app.webAdmin.pojo.AdminUser;
import org.app.webAdmin.service.AdminMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

/** 
* @ClassName: WebService 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author fliay
* @date 2018年1月4日 下午2:01:07 
*  
*/
@SuppressWarnings("rawtypes")
@Repository
public class WebService extends GeneralServiceImpl  {
	
	@Autowired
	private AdminMenuService adminMenuService;
	
	/**
	 * 
	* @Title: findAllWebMenu 
	* @Description: TODO(获取所有的web菜单) 
	* @param @return    设定文件 
	* @return List<adminMenu>    返回类型 
	* @throws
	 */
	public List<AdminMenu> findAllWebMenu(){
		
		Query query = new Query();
		//获取所有属于前台的菜单
		query.addCriteria(Criteria.where("isWebMenu").is(true)).addCriteria(Criteria.where("pid").ne("0"));
		query.with(new Sort(Sort.Direction.ASC, "orderby"));
		List<AdminMenu> list = this.find(query, AdminMenu.class);
		
		return list.size()>0?list:null;
		
	}
	
	
	

}
