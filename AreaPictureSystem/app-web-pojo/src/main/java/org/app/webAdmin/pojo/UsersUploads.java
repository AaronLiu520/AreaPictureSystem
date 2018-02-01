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
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * @ClassName: Users
 * @Description: TODO(投稿用户管理)
 * @author fliay
 * @date 2018年1月17日 下午1:22:44
 * 
 */
@Document
public class UsersUploads extends GeneralBean implements Comparable<UsersUploads>{

	/** 
	* @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
	*/ 
	private static final long serialVersionUID = 5732803520749656370L;

	private String theme;// 主题

	private String introduce;
	@DBRef
	private Users users; // 绑定上传用户
	@DBRef
	private Contest contest;// 绑定活动

	private String contestId;// 活动id
	
	private int maxNum; //最大图片数量
	
	private int nowNum; //目前数量
	
	private String images;//反馈图片
	@DBRef
	private List<ContestImages> listContestImages;
	
	private int  poll; //最新票数
	
	private boolean goodPhotography;//优秀作品
	

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Contest getContest() {
		return contest;
	}

	public void setContest(Contest contest) {
		this.contest = contest;
	}

	public String getContestId() {
		return contestId;
	}

	public void setContestId(String contestId) {
		this.contestId = contestId;
	}

	@Override
	public String toString() {
		return "UsersUploads [theme=" + theme + ", introduce=" + introduce + ", users=" + users + ", contest=" + contest
				+ ", contestId=" + contestId + "]";
	}


	public int getMaxNum() {
		return maxNum;
	}

	public void setMaxNum(int maxNum) {
		this.maxNum = maxNum;
	}

	public int getNowNum() {
		return nowNum;
	}

	public void setNowNum(int nowNum) {
		this.nowNum = nowNum;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	public List<ContestImages> getListContestImages() {
		return listContestImages;
	}

	public void setListContestImages(List<ContestImages> listContestImages) {
		this.listContestImages = listContestImages;
	}

	public int getPoll() {
		return poll;
	}

	public void setPoll(int poll) {
		this.poll = poll;
	}

	
	
	
	
	
	public boolean isGoodPhotography() {
		return goodPhotography;
	}

	public void setGoodPhotography(boolean goodPhotography) {
		this.goodPhotography = goodPhotography;
	}

	/* (非 Javadoc) 
	* <p>Title: compareTo</p> 
	* <p>Description: </p> 
	* @param o
	* @return 
	* @see java.lang.Comparable#compareTo(java.lang.Object) 
	*/
	public int compareTo(UsersUploads o) {
		if(this.poll<o.getPoll()){
			return 1;
		}else if(this.poll>o.getPoll()){
			return -1;
		}else{
			return 0;
		}
		
		
	}


}
