package org.app.admin.pojo;

import java.util.List;

import org.app.admin.pojo.AdminUser.UserType;
import org.app.framework.pojo.GeneralBean;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * 角色
 * @author mac
 *
 */
@Document(collection = "AdminRole")
public class AdminRole extends GeneralBean {
	
	private String name;//名称
	private String reamrk;//备注
	@DBRef
	private List<AdminMenu> listMenu;//角色的菜单；
	
	private UserType userType;
	
		
	public UserType getUserType() {
		return userType;
	}
	public void setUserType(UserType userType) {
		this.userType = userType;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getReamrk() {
		return reamrk;
	}
	public void setReamrk(String reamrk) {
		this.reamrk = reamrk;
	}
	public List<AdminMenu> getListMenu() {
		return listMenu;
	}
	public void setListMenu(List<AdminMenu> listMenu) {
		this.listMenu = listMenu;
	}
	
	

}
