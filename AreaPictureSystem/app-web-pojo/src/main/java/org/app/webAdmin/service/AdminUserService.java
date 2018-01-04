package org.app.webAdmin.service;

import org.app.framework.service.GeneralServiceImpl;
import org.app.webAdmin.pojo.AdminUser;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

/**
 * 后台用户管理
 * @author aaronlau
 *
 */
@Repository("adminUserService")
public class AdminUserService extends GeneralServiceImpl<AdminUser> {
	
	
	
	/**
	 * 
	* @Title: findAdminUserById 
	* @Description: TODO(根据用户的Id获取用户的信息。) 
	* @param @param id
	* @param @return    设定文件 
	* @return AdminUser    返回类型 
	* @throws
	 */
	public AdminUser findAdminUserById(String id){
		
		AdminUser adminUser = this.findOneById(id, AdminUser.class);
		
		if(adminUser!=null){
			return adminUser;
		}
		return null;
		
	}
	
	
	/**
	 * 
	* @Title: findAdminUserByTelPhone 
	* @Description: TODO(通过用户的手机号查询是否存在该用户) 
	* @param @param telPhone
	* @param @return    设定文件 
	* @return AdminUser    返回类型 
	* @throws
	 */
	public AdminUser findAdminUserByTelPhone(String telPhone){
		
		Query query = new Query();
		
		query.addCriteria(Criteria.where("tel").is(telPhone));
		
		AdminUser adminUser = this.findOneByQuery(query, AdminUser.class);
		
		if(adminUser!= null)
			return adminUser;
		else
			return null;
		
		
	}
	
		
}
