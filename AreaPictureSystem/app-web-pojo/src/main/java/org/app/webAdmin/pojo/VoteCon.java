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
 * @Description: TODO(投票记录表)
 * @author fliay
 * @date 2018年1月4日 下午3:58:27
 * 
 */

@Document
public class VoteCon extends GeneralBean {

	/**
	 * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	 */

	private static final long serialVersionUID = -6828955706048052227L;

	private String usersUploadsId; // 被投票信息id
	private UsersUploads usersUploads;// 被投票的信息
	private String ip; // 投票ip
	private Users users;// 投票的用户
	private String contestId;// 投票的比赛id
	private Contest contest;// 投票的比赛信息

	public String getUsersUploadsId() {
		return usersUploadsId;
	}

	public void setUsersUploadsId(String usersUploadsId) {
		this.usersUploadsId = usersUploadsId;
	}

	public UsersUploads getUsersUploads() {
		return usersUploads;
	}

	public void setUsersUploads(UsersUploads usersUploads) {
		this.usersUploads = usersUploads;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public String getContestId() {
		return contestId;
	}

	public void setContestId(String contestId) {
		this.contestId = contestId;
	}

	public Contest getContest() {
		return contest;
	}

	public void setContest(Contest contest) {
		this.contest = contest;
	}

	@Override
	public String toString() {
		return "VoteCon [usersUploadsId=" + usersUploadsId + ", usersUploads=" + usersUploads + ", ip=" + ip
				+ ", users=" + users + ", contestId=" + contestId + ", contest=" + contest + "]";
	}

}
