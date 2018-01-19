/**   
* @Title: News.java 
* @Package org.app.webAdmin.pojo 
* @Description: TODO(用一句话描述该文件做什么) 
* @author fliay
* @date 2018年1月17日 下午1:22:44 
* @version V1.0   
*/
package org.app.webAdmin.pojo;

import java.util.List;

import org.app.framework.pojo.GeneralBean;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * @ClassName: News
 * @Description: TODO(新闻)
 * @author fliay
 * @date 2018年1月17日 下午1:22:44
 * 
 */
@Document
public class News extends GeneralBean {

	/**
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	 */
	private static final long serialVersionUID = 1349752425199773321L;
	private String newsTitle;// 新闻标题
	private String author; // 作者
	private int visit; // 访问量
	private String sort; // 排序
	private String picture; // 新闻图片
	private String content; // 新闻内容
	private String newsDate;//新闻时间
	private boolean status;//状态
	public String getNewsTitle() {
		return newsTitle;
	}
	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getVisit() {
		return visit;
	}
	public void setVisit(int visit) {
		this.visit = visit;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getNewsDate() {
		return newsDate;
	}
	public void setNewsDate(String newsDate) {
		this.newsDate = newsDate;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	
	
}
