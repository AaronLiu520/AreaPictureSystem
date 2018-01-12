/**   
* @Title: Type.java 
* @Package org.app.admin.pojo 
* @Description: TODO(用一句话描述该文件做什么) 
* @author fliay
* @date 2018年1月10日 下午4:25:35 
* @version V1.0   
*/
package org.app.admin.pojo;

import java.util.ArrayList;
import java.util.List;

import org.app.framework.pojo.GeneralBean;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * @ClassName: Type
 * @Description: TODO(图片描述信息库)
 * @author fliay
 * @date 2018年1月10日 下午4:25:35
 * 
 */
@Document
public class InformationRegister extends GeneralBean {

	private static final long serialVersionUID = 4706472829635316068L;

	private List resourceNameList; // 名称

	private List personList; // 人物

	private List photographerList; // 拍摄者

	private List resourceAddressList; // 地址

	public List getResourceNameList() {
		return resourceNameList;
	}

	public void setResourceNameList(List resourceNameList) {
		this.resourceNameList = resourceNameList;
	}

	public List getPersonList() {
		return personList;
	}

	public void setPersonList(List personList) {
		this.personList = personList;
	}

	public List getPhotographerList() {
		return photographerList;
	}

	public void setPhotographerList(List photographerList) {
		this.photographerList = photographerList;
	}

	public List getResourceAddressList() {
		return resourceAddressList;
	}

	public void setResourceAddressList(List resourceAddressList) {
		this.resourceAddressList = resourceAddressList;
	}

}
