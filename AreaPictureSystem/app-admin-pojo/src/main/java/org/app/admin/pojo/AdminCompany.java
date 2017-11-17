package org.app.admin.pojo;

import java.util.List;

import org.app.framework.pojo.GeneralBean;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * 公司单位（ 企业单位、学校 ）
 * 
 * @author aaron
 *
 */
@Document(collection = "AdminCompany")
public class AdminCompany extends GeneralBean {

	private String name;// 企业名称
	private String shorts;// 简称
	private String address;// 地址
	private String contacts;// 联系人
	private String telPhone;// 电话
	private String email;// 邮箱
	private String remark;// 备注
	@Indexed
	private String namePingYing;// ping ying
	@Indexed
	private String userName;// 用户名
	@Indexed
	private String password;// 密码
	@DBRef
	private AdminRole adminRole;// 权限

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getShorts() {
		return shorts;
	}

	public void setShorts(String shorts) {
		this.shorts = shorts;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	public String getTelPhone() {
		return telPhone;
	}

	public void setTelPhone(String telPhone) {
		this.telPhone = telPhone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public AdminRole getAdminRole() {
		return adminRole;
	}

	public void setAdminRole(AdminRole adminRole) {
		this.adminRole = adminRole;
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

	public String getNamePingYing() {
		return namePingYing;
	}

	public void setNamePingYing(String namePingYing) {
		this.namePingYing = namePingYing;
	}

	@Override
	public String toString() {
		return "AdminCompany [name=" + name + ", shorts=" + shorts + ", address=" + address + ", contacts=" + contacts
				+ ", telPhone=" + telPhone + ", email=" + email + ", remark=" + remark + ", namePingYing="
				+ namePingYing + ", userName=" + userName + ", password=" + password
				+ ", adminRole=" + adminRole + "]";
	}

	

}
