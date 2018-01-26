/**   
* @Title: Setting.java 
* @Package org.app.webAdmin.pojo 
* @Description: TODO(用一句话描述该文件做什么) 
* @author fliay
* @date 2018年1月4日 下午3:58:27 
* @version V1.0   
*/
package org.app.webAdmin.pojo;

import java.util.List;

import org.app.framework.pojo.GeneralBean;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * @ClassName: Setting
 * @Description: TODO(网站首页)
 * @author fliay
 * @date 2018年1月4日 下午3:58:27
 * 
 */

@Document
public class AboutUs extends GeneralBean {

	/**
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	 */
	private static final long serialVersionUID = 392495408284790565L;
	private String aboutUsPic; // 关于我们图片
	private String aboutUsContent;// 关于我们内容
	@DBRef
	private List<ContestImages> listTeachers;// 教职工团队

	public String getAboutUsPic() {
		return aboutUsPic;
	}

	public void setAboutUsPic(String aboutUsPic) {
		this.aboutUsPic = aboutUsPic;
	}

	public String getAboutUsContent() {
		return aboutUsContent;
	}

	public void setAboutUsContent(String aboutUsContent) {
		this.aboutUsContent = aboutUsContent;
	}

	public List<ContestImages> getListTeachers() {
		return listTeachers;
	}

	public void setListTeachers(List<ContestImages> listTeachers) {
		this.listTeachers = listTeachers;
	}

}
