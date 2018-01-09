package org.app.admin.service;

import java.util.List;

import org.app.admin.annotation.SystemErrorLog;
import org.app.admin.pojo.AdminUser;
import org.app.admin.util.BaseType;
import org.app.framework.service.GeneralServiceImpl;
import org.app.framework.util.Common;
import org.bson.types.ObjectId;
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
	@SystemErrorLog(description="根据Id查询用户")
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
	@SystemErrorLog(description="根据手机号查询用户")
	public AdminUser findAdminUserByTelPhone(String telPhone){
		
		Query query = new Query();
		
		query.addCriteria(Criteria.where("tel").is(telPhone));
		
		AdminUser adminUser = this.findOneByQuery(query, AdminUser.class);
		
		if(adminUser!= null)
			return adminUser;
		else
			return null;
		
		
	}
	
	
	
	/**
	 * 
	* @Title: listUsers 
	* @Description: TODO(查询为学校管理员，老师 的用户) 
	* @param @return    设定文件 
	* @return List<AdminUser>    返回类型 
	* @throws
	 */
	public List<AdminUser> listUsers(String companyId){
		
		Query query = new Query();
		
		//获取所有用户类型为老师跟管理员的用户
		query.addCriteria(Criteria.where("userType").in(BaseType.UserType.SCHOOLADMIN, BaseType.UserType.TEACHER));
		
		//如果企业ID不为空则查询该企业下的所有用户
		if(Common.isNotEmpty(companyId)){
			query.addCriteria(Criteria.where("adminCompany.$id").is(new ObjectId(companyId)));
		}
		
		List<AdminUser> list = this.find(query, AdminUser.class);
		
		return list.size()>0?list:null;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
		
}
