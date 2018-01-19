package org.app.webAdmin.service;

import org.app.framework.service.GeneralServiceImpl;
import org.app.framework.util.Common;
import org.app.webAdmin.pojo.Contest;
import org.app.webAdmin.pojo.News;
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
				this.save(edit);
			} else {
			// 执行添加
				this.insert(contest);
			}

		}

	}

}
