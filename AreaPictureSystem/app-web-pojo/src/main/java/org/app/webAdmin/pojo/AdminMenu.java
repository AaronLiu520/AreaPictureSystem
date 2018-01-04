package org.app.webAdmin.pojo;

import org.app.framework.pojo.GeneralBean;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * 
* @ClassName: AdminMenu 
* @Description: TODO(创建菜单) 
* @author fliay
* @date 2018年1月3日 下午3:03:31 
*
 */
@Document(collection = "WebAdminMenu")
public class AdminMenu extends GeneralBean {

	/** 
	* @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
	*/ 
	private static final long serialVersionUID = -7157405222094559344L;

	private String pid;// 子菜单对应的父菜单id , pid=0表示一线菜单.

	private String name;// 菜单名
	private MenuType type;// 菜单的类型.
	private String icon;// 图片
	private String url;// 访问的地址
	private String webUrl;//前台访问地址
	private float orderby;// 排序
	private String remark;// 备注
	private String key; //权限key
	private boolean isWebMenu;//是否是网站菜单
	



	public String getPid() {
		return pid;
	}




	public void setPid(String pid) {
		this.pid = pid;
	}




	public String getName() {
		return name;
	}




	public void setName(String name) {
		this.name = name;
	}




	public MenuType getType() {
		return type;
	}




	public void setType(MenuType type) {
		this.type = type;
	}




	public String getIcon() {
		return icon;
	}




	public void setIcon(String icon) {
		this.icon = icon;
	}




	public String getUrl() {
		return url;
	}




	public void setUrl(String url) {
		this.url = url;
	}




	public String getWebUrl() {
		return webUrl;
	}




	public void setWebUrl(String webUrl) {
		this.webUrl = webUrl;
	}




	public float getOrderby() {
		return orderby;
	}




	public void setOrderby(float orderby) {
		this.orderby = orderby;
	}




	public String getRemark() {
		return remark;
	}




	public void setRemark(String remark) {
		this.remark = remark;
	}




	public String getKey() {
		return key;
	}




	public void setKey(String key) {
		this.key = key;
	}




	public boolean isWebMenu() {
		return isWebMenu;
	}




	public void setWebMenu(boolean isWebMenu) {
		this.isWebMenu = isWebMenu;
	}




	enum MenuType {
		HaveMenu, NoMenu
	}





}
