package org.app.webAdmin.service;

import javax.servlet.http.HttpSession;

import org.app.framework.service.GeneralServiceImpl;
import org.app.framework.util.Common;
import org.app.webAdmin.pojo.Contest;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

/**
 * 
 * @ClassName: NewsService
 * @Description: TODO(新闻)
 * @author fliay
 * @date 2018年1月17日 下午2:13:41
 *
 */
@Repository
public class ContestService extends GeneralServiceImpl<Contest> {

	
	
	
	
	
	/**
	 * 
	* @Title: SaveOrUpdateContest 
	* @Description: TODO(添加或删除比赛) 
	* @param @param contest
	* @param @param editid    设定文件 
	* @return void    返回类型 
	* @throws
	 */
	public void SaveOrUpdateContest(Contest contest, String editid) {

		if (contest != null) {

			if (Common.isNotEmpty(editid)) {
				// 执行修改
				Contest edit = this.findOneById(editid, Contest.class);

				if (edit == null)
					edit = new Contest();
				edit.setContent(contest.getContent());
				edit.setContestName(contest.getContestName());
				edit.setContestType(contest.isContestType());
				edit.setEndTime(contest.getEndTime());
				edit.setMaxPictureNum(contest.getMaxPictureNum());
				edit.setMinPictureNum(contest.getMinPictureNum());
				edit.setOpenPublicVote(contest.isOpenPublicVote());
				edit.setOpenVote(contest.isOpenVote());
				edit.setParticipants(contest.getParticipants());
				edit.setPublisher(contest.getPublisher());
				edit.setSort(contest.getSort());
				edit.setStartTime(contest.getStartTime());
				edit.setStatus(contest.isStatus());
				edit.setVoteStartTime(contest.getVoteStartTime());
				edit.setVoteEndTime(contest.getVoteEndTime());
				edit.setAnnouncements(contest.isAnnouncements());
				edit.setPublisherPhone(contest.getPublisherPhone());
				edit.setIntro(contest.getIntro());
				this.save(edit);
			} else {
			// 执行添加
				this.insert(contest);
			}

		}

	}
	
	
	public Contest findContestByUsersIdContestId(String contestId){
		
		Query query = new Query();
		
		query.addCriteria(Criteria.where("_id").is(contestId));
		
		Contest contest =this.findOneById(contestId, Contest.class);
		
		return contest==null?null:contest;
		
	}
	
	

}
