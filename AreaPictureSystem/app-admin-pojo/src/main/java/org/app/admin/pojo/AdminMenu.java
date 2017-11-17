package org.app.admin.pojo;

import org.app.framework.pojo.GeneralBean;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * 后台菜单
 * 
 * @author aaronlau
 *
 */
@Document(collection = "AdminMenu")
public class AdminMenu extends GeneralBean {

	private String pid;// 子菜单对应的父菜单id , pid=0表示一线菜单.

	private String name;// 菜单名
	private MenuType type;// 菜单的类型.
	private String icon;// 图片
	private String url;// 访问的地址
	private float orderby;// 排序
	private String remark;// 备注
	
	

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

	enum MenuType {
		HaveMenu, NoMenu
	}

	@Override
	public String toString() {
		return "AdminMenu [pid=" + pid + ", name=" + name + ", type=" + type
				+ ", icon=" + icon + ", url=" + url + ", orderby=" + orderby
				+ ", remark=" + remark + "]";
	}

}
