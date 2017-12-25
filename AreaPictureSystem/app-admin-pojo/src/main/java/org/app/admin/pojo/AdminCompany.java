package org.app.admin.pojo;

import org.app.admin.util.BaseType;
import org.app.framework.pojo.GeneralBean;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * 公司单位（ 企业单位、学校 ）
 *
 * @author Lau Aaron
 */
@Document(collection = "AdminCompany")
public class AdminCompany extends GeneralBean {

	/**
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	 */
	private static final long serialVersionUID = -5925749092147783467L;
	private String name;
	// 企业名称
	private String shorts;// 简称
	private String address;// 地址
	private String contacts;// 联系人
	private String telPhone;// 电话
	private String email;// 邮箱
	private String remark;// 备注
	// TODO 修改基本类
	private BaseType.CompanyNature nature;// 类型（基层单位、直属单位）
	// TODO 修改基本类
	private String type;// 性质（中学、小学、幼儿园、中小学、高中、九年制）
	@DBRef
	private AdminUser adminUser;// 权限

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
	public BaseType.CompanyNature getNature() {
		return nature;
	}
	public void setNature(BaseType.CompanyNature nature) {
		this.nature = nature;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public AdminUser getAdminUser() {
		return adminUser;
	}
	public void setAdminUser(AdminUser adminUser) {
		this.adminUser = adminUser;
	}

	

}
