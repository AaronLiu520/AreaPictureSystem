package org.app.webAdmin.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.app.framework.service.GeneralServiceImpl;
import org.app.framework.util.BasicDataResult;
import org.app.framework.util.Common;
import org.app.framework.util.CommonEnum;
import org.app.webAdmin.pojo.Contest;
import org.app.webAdmin.pojo.ContestImages;
import org.app.webAdmin.pojo.Users;
import org.app.webAdmin.pojo.UsersUploads;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

/**
 * 
 * @ClassName: UsersService
 * @Description: TODO(用户参加比赛创建参加信息)
 * @author fliay
 * @date 2018年1月17日 下午2:13:41
 *
 */
@Repository
public class UsersUploadsService extends GeneralServiceImpl<UsersUploads> {

	@Autowired
	private ContestService contestService;
	
	@Autowired
	private ContestImagesService contestImagesService;
	
	
	
	
	/*
	 * 用户投稿
	 */
	public BasicDataResult addUsersUploads(UsersUploads usersUploads,String editId,Users users){
		Contest contest = new Contest();
		if(Common.isEmpty(usersUploads.getContestId())){
			return BasicDataResult.build(203, "未能匹配到比赛信息，请尝试刷新网页", null);
		}
		Query query = new Query();
		
		query.addCriteria(Criteria.where("_id").is(usersUploads.getContestId())).addCriteria(Criteria.where("status").is(true));
		
		contest = this.contestService.findOneByQuery(query, Contest.class); 
		
		if(contest==null){
			return BasicDataResult.build(410, "未能找到当前的比赛信息，或已经被删除", null);
		}
		
		try{
			if(Common.isNotEmpty(editId)){
				//执行修改
				UsersUploads u = this.findOneById(editId, UsersUploads.class);
				
				if(u==null)
					u=new UsersUploads();
				u.setIntroduce(usersUploads.getIntroduce());
				u.setTheme(usersUploads.getTheme());
				u.setContest(contest);
				u.setContestId(usersUploads.getContestId());
				u.setUsers(users);
				this.save(u);
				return BasicDataResult.build(200, "修改投稿信息成功！", u);
			}else{
				usersUploads.setContest(contest);
				usersUploads.setUsers(users);
				this.insert(usersUploads);
				return BasicDataResult.build(200, "创建投稿信息成功！", usersUploads);
			}
		}catch(Exception e){
			e.printStackTrace();
			return BasicDataResult.build(203, "创建投稿过程中出现异常，请与管理员联系！", null);
		}
		
		
		
	}
	
	
	/**
	 * 
	* @Title: findOneByContestId 
	* @Description: TODO(根据比赛信息获取投稿) 
	* @param @param contestId
	* @param @return    设定文件 
	* @return BasicDataResult    返回类型 
	* @throws
	 */
	public BasicDataResult findOneByContestId(String contestId,HttpSession session){
		
		Users users = (Users) session.getAttribute(CommonEnum.WEBUSERSESSION);
		
		if(users==null){
			return BasicDataResult.build(401, "当前用户登录已经过期，请重新登录", null);
		}

		Query query = new Query();
		
		query.addCriteria(Criteria.where("contestId").is(contestId)).addCriteria(Criteria.where("users.$id").is(new ObjectId(users.getId())));
		
		UsersUploads up = this.findOneByQuery(query, UsersUploads.class);
		
	
		
		List<ContestImages> list = this.contestImagesService.find(query, ContestImages.class);
		
		if(list.size()>0){
		
		up.setNowNum(list.size());
		
		}
		
		
		
		
		
		
		
		
		
		return BasicDataResult.build(200, "",up);
	}
	
	
	
	

}
