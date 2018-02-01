package org.app.webAdmin.service;

import javax.servlet.http.HttpServletRequest;

import org.app.framework.service.GeneralServiceImpl;
import org.app.framework.util.BasicDataResult;
import org.app.framework.util.Common;
import org.app.webAdmin.pojo.Contest;
import org.app.webAdmin.pojo.UsersUploads;
import org.app.webAdmin.pojo.VoteCon;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Repository;

@Repository
public class VoteConService extends GeneralServiceImpl<VoteCon> {
	
	@Autowired
	private ContestService contestService;
	
	@Autowired
	private UsersUploadsService usersUploadsService;
	/**
	 * 
	* @Title: findUsersUploads 
	* @Description: TODO(根据IP地址，以及比赛的id来判断是否有相同的IP投票) 
	* @param @param request
	* @param @param contestId
	* @param @return    设定文件 
	* @return BasicDataResult    返回类型 
	* @throws
	 */
	public boolean findUsersUploads(HttpServletRequest request,String contestId){
		
		Query query = new Query();
		
		String Ip = request.getRemoteAddr();
		
		query.addCriteria(Criteria.where("contestId").is(contestId)).addCriteria(Criteria.where("ip").is(Ip));
				
		boolean flag = this.exists(query, VoteCon.class);
		
		return flag;
		
		
	}
	
	/**
	 * 
	* @Title: addVoteCon 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param request
	* @param @param usersUploadsId
	* @param @param userId
	* @param @param contestId
	* @param @return    设定文件 
	* @return BasicDataResult    返回类型 
	* @throws
	 */
	public BasicDataResult addVoteCon(HttpServletRequest request,String usersUploadsId,String userId,String contestId){
		
		if(Common.isEmpty(contestId)){
			return BasicDataResult.build(203, "未能找到匹配的比赛信息id", null);
		}
		
		if(Common.isEmpty(usersUploadsId)){
			return BasicDataResult.build(203, "未能找到比赛报名信息id", null);
		}
		
		Query query = new Query();
		
		String now = Common.fromDateH();//获取当前时间
		
		query.addCriteria(Criteria.where("voteStartTime").lte(now));
		
		query.addCriteria(Criteria.where("voteEndTime").gte(now));
		
		query.addCriteria(Criteria.where("status").is(true));
		
		query.addCriteria(Criteria.where("openVote").is(true));
		
		Contest contest = this.contestService.findOneByQuery(query, Contest.class);
		if(contest==null){
			return BasicDataResult.build(203, "未找到比赛信息，或投票已经结束", contest);
		}
		
		UsersUploads usersUploads = this.usersUploadsService.findOneById(usersUploadsId, UsersUploads.class);
		
		if(usersUploads==null){
			return BasicDataResult.build(203, "未能找到比赛报名信息", null);
		}
		
		
		VoteCon voteCon = new VoteCon();
		
		String Ip = request.getRemoteAddr();
		
		voteCon.setContest(contest);
		voteCon.setContestId(contestId);
		voteCon.setIp(Ip);
		//voteCon.setUsers(users);
		voteCon.setUsersUploads(usersUploads);
		voteCon.setUsersUploadsId(usersUploadsId);
		this.insert(voteCon);
		
		
		return BasicDataResult.build(200, "投票成功", voteCon);
	}
	
	
	

}
