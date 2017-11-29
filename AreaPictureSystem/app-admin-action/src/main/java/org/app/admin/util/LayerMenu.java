package org.app.admin.util;

import org.app.admin.pojo.AdminMenu;
import org.app.admin.pojo.ForderActivity;

import java.util.ArrayList;

public class LayerMenu {

	private AdminMenu adminMenu;
	
	private String check;//用户是否已经有此菜单



	public AdminMenu getAdminMenu() {
		return adminMenu;
	}

	public void setAdminMenu(AdminMenu adminMenu) {
		this.adminMenu = adminMenu;
	}
	

	public String getCheck() {
		return check;
	}

	public void setCheck(String check) {
		this.check = check;
	}

	@Override
	public String toString() {
		return "LayerMenu [adminMenu=" + adminMenu + ", check=" + check + "]";
	}

	

}
