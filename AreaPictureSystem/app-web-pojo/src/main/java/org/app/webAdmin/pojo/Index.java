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
import org.springframework.data.mongodb.core.mapping.Document;

/** 
* @ClassName: Setting 
* @Description: TODO(网站首页) 
* @author fliay
* @date 2018年1月4日 下午3:58:27 
*  
*/

@Document
public class Index  extends GeneralBean{
	
	/** 
	* @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
	*/ 
	private static final long serialVersionUID = -8017808548772584305L;
	private String banana;//首页banana
	private String bananaTitle;//banana中的描述
	private String bananaContent;//banana中显示的内容
	private String toPublic;//公告
	private List<ContestImages> goodContestImages;//优秀作品
	
	private String newsbanana;
	private String photographybanana;
	private String contestbanana;
	private String aboutUsbanana;
	
	
	
	
	public String getNewsbanana() {
		return newsbanana;
	}
	public void setNewsbanana(String newsbanana) {
		this.newsbanana = newsbanana;
	}
	
	
	public String getPhotographybanana() {
		return photographybanana;
	}
	public void setPhotographybanana(String photographybanana) {
		this.photographybanana = photographybanana;
	}
	public String getContestbanana() {
		return contestbanana;
	}
	public void setContestbanana(String contestbanana) {
		this.contestbanana = contestbanana;
	}
	public String getAboutUsbanana() {
		return aboutUsbanana;
	}
	public void setAboutUsbanana(String aboutUsbanana) {
		this.aboutUsbanana = aboutUsbanana;
	}
	public String getBanana() {
		return banana;
	}
	public void setBanana(String banana) {
		this.banana = banana;
	}
	public String getBananaTitle() {
		return bananaTitle;
	}
	public void setBananaTitle(String bananaTitle) {
		this.bananaTitle = bananaTitle;
	}
	public String getBananaContent() {
		return bananaContent;
	}
	public void setBananaContent(String bananaContent) {
		this.bananaContent = bananaContent;
	}
	public String getToPublic() {
		return toPublic;
	}
	public void setToPublic(String toPublic) {
		this.toPublic = toPublic;
	}
	public List<ContestImages> getGoodContestImages() {
		return goodContestImages;
	}
	public void setGoodContestImages(List<ContestImages> goodContestImages) {
		this.goodContestImages = goodContestImages;
	}
	
	

}
