package org.app.webAdmin.service;

import org.app.framework.service.GeneralServiceImpl;
import org.app.framework.util.Common;
import org.app.webAdmin.pojo.Users;
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

}
