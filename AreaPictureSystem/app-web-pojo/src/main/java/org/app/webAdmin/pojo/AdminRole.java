package org.app.webAdmin.pojo;

import java.util.List;

import org.app.framework.pojo.GeneralBean;
import org.app.webAdmin.util.BaseType;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * 角色
 * @author mac
 *
 */
@Document(collection = "WebAdminRole")
public class AdminRole extends GeneralBean {
	
	/** 
	* @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
	*/ 
	private static final long serialVersionUID = -6079184717132774355L;
	private String name;//名称
	private String reamrk;//备注
	@DBRef
	private List<AdminMenu> listMenu;//角色的菜单；
	
	private BaseType.UserType userType;

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

	public BaseType.UserType getUserType() {
		return userType;
	}

	public void setUserType(BaseType.UserType userType) {
		this.userType = userType;
	}
	
		

	
	

}
