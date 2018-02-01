/**   
* @Title: Statistics.java 
* @Package org.app.webAdmin.pojo 
* @Description: TODO(用一句话描述该文件做什么) 
* @author fliay
* @date 2018年1月30日 下午4:06:04 
* @version V1.0   
*/
package org.app.webAdmin.pojo;

import java.util.List;

/**
 * @ClassName: Statistics
 * @Description: TODO(统计 零时类)
 * @author fliay
 * @date 2018年1月30日 下午4:06:04
 * 
 */
public class Statistics {

	private Contest contest;
	private List<UsersUploads> usersUploads;
	private int polls;// 参加投票人数

	public Contest getContest() {
		return contest;
	}

	public void setContest(Contest contest) {
		this.contest = contest;
	}

	public List<UsersUploads> getUsersUploads() {
		return usersUploads;
	}

	public void setUsersUploads(List<UsersUploads> usersUploads) {
		this.usersUploads = usersUploads;
	}

	public int getPolls() {
		return polls;
	}

	public void setPolls(int polls) {
		this.polls = polls;
	}

}
