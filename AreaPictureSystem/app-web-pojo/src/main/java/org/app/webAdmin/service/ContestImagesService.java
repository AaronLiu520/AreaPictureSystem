package org.app.webAdmin.service;

import java.util.HashMap;
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
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

/**
 * 
 * @ClassName: ContestImagesService
 * @Description: TODO(上传比赛图片)
 * @author fliay
 * @date 2018年1月17日 下午2:13:41
 *
 */
@Repository
public class ContestImagesService extends GeneralServiceImpl<ContestImages> {

	@Autowired
	private FileOperateUtil operateUtil;

	@Autowired
	private ContestService contestService; // 比赛service

	@Autowired
	private UsersUploadsService usersUploadsService;
	

	/**
	 * 
	 * @Title: uploadImages @Description: TODO(上传图片) @param @param
	 * request @param @param session @param @param contestId @param @return
	 * 设定文件 @return BasicDataResult 返回类型 @throws
	 */
	public BasicDataResult uploadImages(MultipartFile[] file, HttpServletRequest request, String contestId, Users users,
			String usersUploadsId) {

		Contest contest = null;
		Query query = new Query();
		query.addCriteria(Criteria.where("_id").is(contestId)).addCriteria(Criteria.where("status").is(true));

		// 根据contestId查询所有数据
		contest = this.contestService.findOneById(contestId, Contest.class);
		if (contest == null) {
			return BasicDataResult.build(403, "未能找到比赛信息！", null);
		}
		UsersUploads usersUploads = this.usersUploadsService.findOneById(usersUploadsId, UsersUploads.class);

		if (usersUploads == null) {
			return BasicDataResult.build(403, "请先添加主题与介绍信息！", null);
		}

		// 获取listMap
		List<Map<String, Object>> listMap = this.operateUtil.uploadImgs(file, request);

		for (Map<String, Object> map : listMap) {
			try {
				ContestImages c = new ContestImages();
				c.setContest(contest);
				c.setContestId(contestId);
				c.setExtensionName(map.get("extension").toString());// 获取后缀名
				c.setGenerateName(map.get("reName").toString());
				c.setOriginalName(map.get("fileName").toString());
				c.setOriginalPath(map.get("servletPath").toString().replaceAll("\\\\", "/"));
				c.setSavePath(map.get("savepath").toString().replaceAll("\\\\", "/"));
				c.setUploadUsersId(users.getId());
				c.setUsers(users);
				c.setUploadUsersId(usersUploadsId);
				c.setUsersUploads(usersUploads);
				this.insert(c);

			} catch (Exception e) {
				e.printStackTrace();
				return BasicDataResult.build(500, "上传图片过程中发生了错误", null);
			}

		}
		return BasicDataResult.build(200, "上传图片成功", null);

	}
	
	
	
	
	/**
	 * 
	* @Title: listContestImages 
	* @Description: TODO(根据用户id查询所有用户资源) 
	* @param @param usersId
	* @param @return    设定文件 
	* @return List<ContestImages>    返回类型 
	* @throws
	 */
	public List<ContestImages> listContestImages(String usersId,String contestId) {

		Query query = new Query();
		
		if(Common.isNotEmpty(usersId)){
			
			query.addCriteria(Criteria.where("users.$id").is(new ObjectId(usersId)));
		}
		else if(Common.isNotEmpty(contestId)){
			
			query.addCriteria(Criteria.where("contest.$id").is(new ObjectId(contestId)));
			
		}
		
		List<ContestImages> list = this.find(query, ContestImages.class);
		
		if(list!=null)
			return list;
		else 
			return null;
		
		
	}
	
	
	
	
	
	
	
	

}
