package org.app.webAdmin.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.app.framework.service.GeneralServiceImpl;
import org.app.framework.util.BasicDataResult;
import org.app.framework.util.Common;
import org.app.framework.util.CommonEnum;
import org.app.framework.util.FileOperateUtil;
import org.app.webAdmin.pojo.Contest;
import org.app.webAdmin.pojo.ContestImages;
import org.app.webAdmin.pojo.Users;
import org.app.webAdmin.pojo.UsersUploads;
import org.app.webAdmin.pojo.VoteCon;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

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
	private FileOperateUtil operateUtil;
	@Autowired
	private ContestImagesService contestImagesService;

	@Autowired
	private VoteConService voteConService;

	/*
	 * 用户投稿
	 */
	public BasicDataResult SaveOrUpdateSetting(HttpServletRequest request, UsersUploads usersUploads, String editId,
			Users users, MultipartFile[] file) {
		Contest contest = new Contest();

		List<ContestImages> list = new ArrayList<ContestImages>();

		if (Common.isEmpty(usersUploads.getContestId())) {
			return BasicDataResult.build(410, "未能找到当前的比赛信息，或已经被删除", null);
		}

		Query query = new Query();

		query.addCriteria(Criteria.where("_id").is(usersUploads.getContestId()))
				.addCriteria(Criteria.where("status").is(true));

		contest = this.contestService.findOneByQuery(query, Contest.class);

		if (contest == null) {
			return BasicDataResult.build(410, "未能找到当前的比赛信息，或已经被删除", null);
		}

		if (file != null) {
			List<Map<String, Object>> listMap = this.operateUtil.uploadImgs(file, request);
			for (Map<String, Object> map : listMap) {
				ContestImages c = new ContestImages();
				c.setExtensionName(map.get("extension").toString());// 获取后缀名
				c.setGenerateName(map.get("reName").toString());
				c.setOriginalName(map.get("fileName").toString());
				c.setOriginalPath(map.get("servletPath").toString().replaceAll("\\\\", "/"));
				c.setSavePath(map.get("savepath").toString().replaceAll("\\\\", "/"));
				c.setUploadUsersId(users.getId());
				c.setUsers(users);
				c.setContest(contest);
				c.setContestId(contest.getId());
				this.contestImagesService.insert(c);
				list.add(c);
			}

		}

		if (Common.isNotEmpty(editId)) {

			UsersUploads up = this.findOneById(editId, UsersUploads.class);

			if (up == null)
				up = new UsersUploads();

			up.setContest(contest);
			up.setContestId(contest.getId());
			if (list.size() > 0) {
				up.getListContestImages().addAll(list);
			}
			up.setTheme(usersUploads.getTheme());
			up.setUsers(users);
			up.setIntroduce(usersUploads.getIntroduce());
			this.save(up);
			return BasicDataResult.build(200, "修改信息成功", up);
		} else {
			if (list.size() > 0) {
				usersUploads.setListContestImages(list);
			} else {
				usersUploads.setListContestImages(new ArrayList());
			}
			usersUploads.setUsers(users);
			usersUploads.setContest(contest);
			this.insert(usersUploads);
			return BasicDataResult.build(200, "添加信息成功", usersUploads);
		}

	}

	/**
	 * 
	 * @Title: findOneByContestId @Description: TODO(根据比赛信息获取投稿) @param @param
	 *         contestId @param @return 设定文件 @return BasicDataResult
	 *         返回类型 @throws
	 */
	public BasicDataResult findOneByContestId(String contestId, HttpSession session) {

		Users users = (Users) session.getAttribute(CommonEnum.WEBUSERSESSION);

		if (users == null) {
			return BasicDataResult.build(401, "当前用户登录已经过期，请重新登录", null);
		}

		Query query = new Query();

		query.addCriteria(Criteria.where("contestId").is(contestId))
				.addCriteria(Criteria.where("users.$id").is(new ObjectId(users.getId())));

		UsersUploads up = this.findOneByQuery(query, UsersUploads.class);

		List<ContestImages> list = this.contestImagesService.find(query, ContestImages.class);

		/*
		 * if (list.size() > 0&& list !=null) {
		 * 
		 * up.setNowNum(list.size());
		 * 
		 * }
		 */
		return BasicDataResult.build(200, "", up);
	}

	// 删除图片
	public void delete(String id, String editId) {

		if (Common.isNotEmpty(id)) {

			// 1删除关于我们中该图片的记录

			UsersUploads del = this.findOneById(editId, UsersUploads.class);

			List<ContestImages> list = new ArrayList<ContestImages>();

			if (del != null) {

				List<ContestImages> getList = del.getListContestImages();

				if (getList.size() > 0) {

					for (ContestImages ci : getList) {

						if (!ci.getId().equals(id)) {
							list.add(ci);
						}
					}

				}
				del.setListContestImages(list);

				this.save(del);
			}

			// 2删除图片表中的记录

			ContestImages contest = this.contestImagesService.findOneById(id, ContestImages.class);

			if (contest != null) {

				this.contestImagesService.remove(contest);
			}

		}

	}

	/**
	 * 
	 * @Title: findUsersUploadsByContestId @Description:
	 *         TODO(根据比赛id查询改比赛下的所有报名情况) @param @param contestId @param @return
	 *         设定文件 @return List<UsersUploads> 返回类型 @throws
	 */
	public List<UsersUploads> findUsersUploadsToSortByContestId(String contestId) {

		Query query = new Query();

		query.addCriteria(Criteria.where("contestId").is(contestId));

		List<UsersUploads> list = this.find(query, UsersUploads.class);

		List<UsersUploads> relist = new ArrayList<UsersUploads>();

		for (UsersUploads users : list) {

			query = new Query();

			query.addCriteria(Criteria.where("contestId").is(contestId));

			query.addCriteria(Criteria.where("usersUploadsId").is(users.getId()));

			List<VoteCon> listVote = this.voteConService.find(query, VoteCon.class);

			if (listVote.size() > 0) {
				users.setPoll(listVote.size());
			} else {
				users.setPoll(0);
			}
			this.save(users);
			relist.add(users);
		}

		return relist;

	}

	/**
	 * 
	* @Title: findUsersByUsersId 
	* @Description: TODO(根据用户id查询) 
	* @param @param usersId
	* @param @return    设定文件 
	* @return List<UsersUploads>    返回类型 
	* @throws
	 */
	public List<UsersUploads> findUsersByUsersId(String usersId,String contestId) {

		Query query = new Query();
		
		if(Common.isNotEmpty(usersId)){
			
			query.addCriteria(Criteria.where("users.$id").is(new ObjectId(usersId)));
		}
		else if(Common.isNotEmpty(contestId)){
			
			query.addCriteria(Criteria.where("contest.$id").is(new ObjectId(contestId)));
			
		}
		
		List<UsersUploads> list = this.find(query, UsersUploads.class);

		if (list != null)
			return list;
		else
			return null;
	}

}
