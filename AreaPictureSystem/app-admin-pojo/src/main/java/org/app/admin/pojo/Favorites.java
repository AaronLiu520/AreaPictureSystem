package org.app.admin.pojo;

import java.util.List;

import org.app.framework.pojo.GeneralBean;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "favorites")
public class Favorites extends GeneralBean {

	/**
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	 */
	private static final long serialVersionUID = 4317971822321825231L;

	
	private String userId;
	
	@DBRef
	private AdminUser adminUser;

	@DBRef
	private List<Resource> resource;

	public AdminUser getAdminUser() {
		return adminUser;
	}

	public void setAdminUser(AdminUser adminUser) {
		this.adminUser = adminUser;
	}

	public List<Resource> getResource() {
		return resource;
	}

	public void setResource(List<Resource> resource) {
		this.resource = resource;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Favorites [userId=" + userId + ", adminUser=" + adminUser + ", resource=" + resource + "]";
	}

	
}
