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
		
}
