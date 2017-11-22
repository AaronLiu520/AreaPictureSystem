package org.app.admin.service;

import org.app.admin.pojo.AdminUser;
import org.app.framework.service.GeneralServiceImpl;
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
	
		
}
