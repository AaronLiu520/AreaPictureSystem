/**   
* @Title: Contest.java 
* @Package org.app.webAdmin.pojo 
* @Description: TODO(用一句话描述该文件做什么) 
* @author fliay
* @date 2018年1月18日 下午3:18:09 
* @version V1.0   
*/
package org.app.webAdmin.pojo;

import org.app.framework.pojo.GeneralBean;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * @ClassName: Contest
 * @Description: TODO(摄影比赛)
 * @author fliay
 * @date 2018年1月18日 下午3:18:09
 * 
 */
@Document
public class Contest extends GeneralBean {

	/**
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	 */
	private static final long serialVersionUID = 3998072402346854365L;
	private String contestName;// 比赛主题
	private String startTime;// 比赛开始时间
	private String endTime;// 比赛结束时间
	private String voteStartTime;// 投票开始时间
	private String voteEndTime;// 投票结束时间
	private String content;// 比赛内容
	private String publisher;// 比赛发布人
	private String publisherPhone;// 比赛发布人联系电话
	private String minPictureNum;// 比赛至少上传图片数量
	private String maxPictureNum;// 比赛可上传最大图片数
	private boolean status; // 状态
	private String sort; // 排序
	private String participants;// 参赛人数上线
	private boolean contestType;// 比赛类别（区域，内部）
	private boolean openVote; // 开启投票功能
	private boolean openPublicVote;// 开启公开投票（如果不开启公开投票需要登录-通过图片库系统中导入老师的帐号密码判断）
	private boolean announcements;//发布公告
	private String intro;//投票规则
	
	
	public String getContestName() {
		return contestName;
	}

	public void setContestName(String contestName) {
		this.contestName = contestName;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getPublisherPhone() {
		return publisherPhone;
	}

	public void setPublisherPhone(String publisherPhone) {
		this.publisherPhone = publisherPhone;
	}

	public String getMinPictureNum() {
		return minPictureNum;
	}

	public void setMinPictureNum(String minPictureNum) {
		this.minPictureNum = minPictureNum;
	}

	public String getMaxPictureNum() {
		return maxPictureNum;
	}

	public void setMaxPictureNum(String maxPictureNum) {
		this.maxPictureNum = maxPictureNum;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getParticipants() {
		return participants;
	}

	public void setParticipants(String participants) {
		this.participants = participants;
	}

	public boolean isContestType() {
		return contestType;
	}

	public void setContestType(boolean contestType) {
		this.contestType = contestType;
	}

	public boolean isOpenVote() {
		return openVote;
	}

	public void setOpenVote(boolean openVote) {
		this.openVote = openVote;
	}

	public boolean isOpenPublicVote() {
		return openPublicVote;
	}

	public void setOpenPublicVote(boolean openPublicVote) {
		this.openPublicVote = openPublicVote;
	}

	public String getVoteStartTime() {
		return voteStartTime;
	}

	public void setVoteStartTime(String voteStartTime) {
		this.voteStartTime = voteStartTime;
	}

	public String getVoteEndTime() {
		return voteEndTime;
	}

	public void setVoteEndTime(String voteEndTime) {
		this.voteEndTime = voteEndTime;
	}

	public boolean isAnnouncements() {
		return announcements;
	}

	public void setAnnouncements(boolean announcements) {
		this.announcements = announcements;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}
	
	
	

}
