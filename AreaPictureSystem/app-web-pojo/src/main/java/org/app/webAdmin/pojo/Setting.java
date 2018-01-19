/**   
* @Title: Setting.java 
* @Package org.app.webAdmin.pojo 
* @Description: TODO(用一句话描述该文件做什么) 
* @author fliay
* @date 2018年1月4日 下午3:58:27 
* @version V1.0   
*/
package org.app.webAdmin.pojo;

import org.app.framework.pojo.GeneralBean;
import org.springframework.data.mongodb.core.mapping.Document;

/** 
* @ClassName: Setting 
* @Description: TODO(网站配置) 
* @author fliay
* @date 2018年1月4日 下午3:58:27 
*  
*/

@Document
public class Setting  extends GeneralBean{
	
	
	/** 
	* @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
	*/ 
	private static final long serialVersionUID = -3122029372055311545L;
	private String webName;//网站名称
	private String title;//网站title
	private String copyRight ;//版权
	private String icon;//图标
	
	
	public String getWebName() {
		return webName;
	}
	public void setWebName(String webName) {
		this.webName = webName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCopyRight() {
		return copyRight;
	}
	public void setCopyRight(String copyRight) {
		this.copyRight = copyRight;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	@Override
	public String toString() {
		return "Setting [webName=" + webName + ", title=" + title + ", copyRight=" + copyRight + ", icon=" + icon + "]";
	}
	
	
	
	

}
