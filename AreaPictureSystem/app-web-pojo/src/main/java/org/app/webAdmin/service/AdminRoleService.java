package org.app.webAdmin.service;

import org.app.framework.service.GeneralServiceImpl;
import org.app.webAdmin.pojo.AdminRole;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

/**
 * 后台用户管理
 * @author aaronlau
 *
 */
@Repository("adminRoleService")
public class AdminRoleService extends GeneralServiceImpl<AdminRole> {
	
	
	/**
	 * 
	* @Title: findUserTypeBy 
	* @Description: TODO(通过用户类型来查询角色。) 
	* @param @param userType
	* @param @return    设定文件 
	* @return adminRole    返回类型 
	* @throws
	 */
	public AdminRole findUserTypeBy(String userType){
		
		Query query = new Query();

		query.addCriteria(Criteria.where("userType").is(userType));
		
		AdminRole adminRole =  this.findOneByQuery(query, AdminRole.class);
		
		if(adminRole!=null){
			return adminRole;
		}else{
			return null;
		}
	}
	
	
	
	
	
	
	
	
	
	
	
		
}
