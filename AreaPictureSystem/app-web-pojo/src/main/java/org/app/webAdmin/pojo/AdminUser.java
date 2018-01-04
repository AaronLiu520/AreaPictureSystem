package org.app.webAdmin.pojo;

import org.app.framework.pojo.GeneralBean;
import org.app.webAdmin.util.BaseType;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * 后台用户管理
 *
 * @author aaronlau
 */
@Document(collection = "WebAdminUser")
public class AdminUser extends GeneralBean {
	/**
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	 */
	private static final long serialVersionUID = 3564343269323650694L;
	private String name;
	@Indexed
	private String userName;
	@Indexed
	private String password;

	private String sex;
	private String address;
	private String tel;
	private String email;
	private String headImage;
	private String reamrk;

	private BaseType.UserType userType; // 超级管理员、网站管理员、普通用户

	private boolean isAssociator; // 是否是会员
	@DBRef
	private AdminRole adminRole; // 权限

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHeadImage() {
		return headImage;
	}

	public void setHeadImage(String headImage) {
		this.headImage = headImage;
	}

	public String getReamrk() {
		return reamrk;
	}

	public void setReamrk(String reamrk) {
		this.reamrk = reamrk;
	}

	public BaseType.UserType getUserType() {
		return userType;
	}

	public void setUserType(BaseType.UserType userType) {
		this.userType = userType;
	}

	public boolean isAssociator() {
		return isAssociator;
	}

	public void setAssociator(boolean isAssociator) {
		this.isAssociator = isAssociator;
	}

	public AdminRole getAdminRole() {
		return adminRole;
	}

	public void setAdminRole(AdminRole adminRole) {
		this.adminRole = adminRole;
	}

}
