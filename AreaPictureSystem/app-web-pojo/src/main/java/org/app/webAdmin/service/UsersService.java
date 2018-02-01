package org.app.webAdmin.service;

import org.app.framework.service.GeneralServiceImpl;
import org.app.framework.util.Common;
import org.app.webAdmin.pojo.Users;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

/**
 * 
 * @ClassName: UsersService
 * @Description: TODO(新闻)
 * @author fliay
 * @date 2018年1月17日 下午2:13:41
 *
 */
@Repository
public class UsersService extends GeneralServiceImpl<Users> {

	public void SaveOrUpdateNews(Users users, String editid) {

		if (users != null) {

			if (Common.isNotEmpty(editid)) {
				// 执行修改
				Users eusers = this.findOneById(editid, Users.class);

				if (eusers == null)
					eusers = new Users();
				eusers.setEmail(users.getEmail());
				eusers.setName(users.getName());
				eusers.setPassword(users.getPassword());
				eusers.setSchool(users.getSchool());
				this.save(eusers);
			} else {

				// 执行添加
				this.insert(users);
			}

		}

	}
	
	
	/**
	 * 
	* @Title: findUsersByEmail 
	* @Description: TODO(通过用户的邮箱地址查询用户信息) 
	* @param @return    设定文件 
	* @return Users    返回类型 
	* @throws
	 */
	public Users findUsersByEmail(String email){
		
		Query query = new Query();
		
		query.addCriteria(Criteria.where("email").is(email));
		
		Users users = this.findOneByQuery(query, Users.class);
		
		return users;
		
	}
	
	
	
	
	
	
	
	
	
	

}
