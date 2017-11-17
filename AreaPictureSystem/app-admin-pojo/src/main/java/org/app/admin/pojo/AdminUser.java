package org.app.admin.pojo;

import org.app.framework.pojo.GeneralBean;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * 后台用户管理
 * 
 * @author aaronlau
 *
 */
@Document(collection = "AdminUser")
public class AdminUser extends GeneralBean {

	private String name;
	@Indexed
	private String userName;
	@Indexed
	private String password;
	private String sex;
	private String address;
	private String tel;
	private String headImage;
	private String reamrk;

	private String commpanyId;// 单位ID（表示用户属于哪个客户下的ID）

	private String spaceSize;// 个人空间大小

	private String adminRoleId;// 角色ID

	private AdminRole adminRole;

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

	public String getAdminRoleId() {
		return adminRoleId;
	}

	public void setAdminRoleId(String adminRoleId) {
		this.adminRoleId = adminRoleId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getCommpanyId() {
		return commpanyId;
	}

	public void setCommpanyId(String commpanyId) {
		this.commpanyId = commpanyId;
	}

	public String getSpaceSize() {
		return spaceSize;
	}

	public void setSpaceSize(String spaceSize) {
		this.spaceSize = spaceSize;
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

	public AdminRole getAdminRole() {
		return adminRole;
	}

	public void setAdminRole(AdminRole adminRole) {
		this.adminRole = adminRole;
	}

	@Override
	public String toString() {
		return "AdminUser [name=" + name + ", userName=" + userName + ", password=" + password + ", sex=" + sex
				+ ", address=" + address + ", tel=" + tel + ", commpanyId=" + commpanyId + ", spaceSize=" + spaceSize
				+ ", adminRoleId=" + adminRoleId + "]";
	}

}
