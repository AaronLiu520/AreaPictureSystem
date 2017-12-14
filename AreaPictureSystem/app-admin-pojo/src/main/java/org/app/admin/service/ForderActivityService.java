/**   
* @Title: ForderActivityService.java 
* @Package org.app.admin.service 
* @Description: TODO(用一句话描述该文件做什么) 
* @author fliay
* @date 2017年11月20日 下午3:44:49 
* @version V1.0   
*/
package org.app.admin.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.app.admin.annotation.SystemErrorLog;
import org.app.admin.pojo.AdminUser;
import org.app.admin.pojo.ForderActivity;
import org.app.admin.pojo.Resource;
import org.app.admin.util.BaseType;
import org.app.admin.util.BaseType.CompanyNature;
import org.app.admin.util.BaseType.UserType;
import org.app.framework.service.GeneralServiceImpl;
import org.app.framework.util.Common;
import org.app.framework.util.CommonEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

/**
 * @ClassName: ForderActivityService
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author fliay
 * @date 2017年11月20日 下午3:44:49
 * 
 */
@Repository
public class ForderActivityService extends GeneralServiceImpl<ForderActivity> {

	@Autowired
	private AdminUserService adminUserService;

	/**
	 * 
	 * @Title: listForderActivity @Description:
	 *         TODO(根据parentId查询所有文件夹) @param @param parentId @param @return
	 *         设定文件 @return List<ForderActivity> 返回类型 @throws
	 */
	public List<ForderActivity> listForderActivity(String parentId, String id) {
		Query query = new Query();
		// 如果parentId 为 0 id不为空
		if (parentId.equals("0") && Common.isNotEmpty(id)) {
			query.addCriteria(Criteria.where("parentId").is(id));
		} else if (Common.isNotEmpty(parentId) && Common.isNotEmpty(id)) {
			// 获取该parentId所有的目录 id为该parentId
			query.addCriteria(Criteria.where("parentId").is(id));
		} else if (Common.isEmpty(id) && Common.isEmpty(parentId)) {
			// 如果parentId跟id同时为空那么查询根目录
			query.addCriteria(Criteria.where("parentId").is("0"));
		} else if (Common.isEmpty(id) && Common.isNotEmpty(parentId)) {
			query.addCriteria(Criteria.where("parentId").is(parentId));
		}

		List<ForderActivity> listForderActivity = this.find(query, ForderActivity.class);

		if (listForderActivity.size() > 0) {

			return listForderActivity;

		}

		return null;
	}

	/**
	 * 
	 * @Title: findForderById @Description: TODO(根据Id查询文件夹信息) @param @param
	 *         id @param @return 设定文件 @return ForderActivity 返回类型 @throws
	 */
	public ForderActivity findForderById(String id) {

		ForderActivity forderActivity = null;

		if (Common.isNotEmpty(id)) {

			forderActivity = this.findOneById(id, ForderActivity.class);

		}
		if (forderActivity != null)

			return forderActivity;

		return null;
	}

	/**
	 * 
	 * @Title: findForderByParentId @Description:
	 *         TODO(根据parentId查询) @param @param parentId @param @return
	 *         设定文件 @return List<ForderActivity> 返回类型 @throws
	 */
	public List<ForderActivity> findForderListByParentId(String parentId) {

		List<ForderActivity> forderActivitylist = null;

		Query query = new Query();

		if (Common.isNotEmpty(parentId)) {

			query.addCriteria(Criteria.where("parentId").is(parentId));

			forderActivitylist = this.find(query, ForderActivity.class);
		}

		if (forderActivitylist != null)

			return forderActivitylist;

		return null;

	}

	/**
	 * 
	 * @Title: createForder @Description: TODO(创建文件夹，子文件夹等) @param @param
	 *         forderActivity @param @param enumtype @param @param
	 *         session @param @return 设定文件 @return String 返回类型 @throws
	 */
	// TODO
	public String createForder(ForderActivity forderActivity, String enumtype, HttpSession session, String editid) {

		if (Common.isEmpty(forderActivity.getForderActivityName())) {

			return "添加的文件夹/活动不能为空";

		} else {
			// 获取用户Session
			AdminUser adminUser = (AdminUser) session.getAttribute(CommonEnum.USERSESSION);
			AdminUser newAdminUser = null;
			if (adminUser != null) {
				newAdminUser = this.adminUserService.findAdminUserById(adminUser.getId());
			}

			// 获取前台传递给后台的值，并且通过枚举类型赋值
			if (enumtype.equals(BaseType.Type.AREA)) {
				forderActivity.setType(BaseType.Type.AREA);
			} else if (enumtype.equals(BaseType.Type.DIRECTLYUTIS)) {
				forderActivity.setType(BaseType.Type.DIRECTLYUTIS);
			} else if (enumtype.equals(BaseType.Type.PERSION)) {
				forderActivity.setType(BaseType.Type.PERSION);
			} else {
				forderActivity.setType(BaseType.Type.DIRECTLYUTIS);
			}

			/*
			 * if (Common.isEmpty(forderActivity.getParentId())) {
			 * forderActivity.setParentId(null); }
			 */
			// 1.parentId=null Id=null 创建父文件夹||3.parentId!=null Id=null 创建子文件夹
			if ((Common.isEmpty(forderActivity.getParentId()) && Common.isEmpty(editid))
					|| (Common.isNotEmpty(forderActivity.getParentId()) && Common.isEmpty(editid))) {
				if (Common.isEmpty(forderActivity.getParentId())) {
					forderActivity.setParentId("0");
				}
				forderActivity.setResource(new ArrayList<Resource>());
				forderActivity.setCreatUser(newAdminUser);
				forderActivity.setFolderSize(0l);
				// 新建文件夹
				this.insert(forderActivity);

				// 2.parentId=null Id!=null 修改父文件夹||4.parentId!=null Id!=null
				// 修改子文件夹
			} else if ((Common.isEmpty(forderActivity.getParentId()) && Common.isNotEmpty(editid))
					|| (Common.isNotEmpty(forderActivity.getParentId()) && Common.isNotEmpty(editid))) {
				// 根据文件夹的ID进行查询
				ForderActivity editForderActivity = this.findOneById(editid, ForderActivity.class);
				if (editForderActivity == null)
					editForderActivity = new ForderActivity();
				editForderActivity.setActivityTime(forderActivity.getActivityTime());
				editForderActivity.setAddress(forderActivity.getAddress());
				editForderActivity.setBoundId(forderActivity.getBoundId());
				editForderActivity.setDescription(forderActivity.getDescription());
				editForderActivity.setForderActivityName(forderActivity.getForderActivityName());
				editForderActivity.setType(forderActivity.getType());
				this.save(editForderActivity);
			}
		}

		return null;
	}

	/**
	 * 
	 * @Title: delete @Description: TODO(调用删除操作) @param @param id @param @return
	 *         设定文件 @return String 返回类型 @throws
	 */
	public String delete(String id) {

		String[] strids = id.split(",");
		for (String delids : strids) {

			recursion(delids);
		}

		return "删除成功";
	}

	/**
	 * 
	 * @Title: recursion @Description: TODO(递归删除) @param @param id 设定文件 @return
	 *         void 返回类型 @throws
	 */
	public void recursion(String id) {

		// 根据ID查询parentId，如果存在则在查出该parentId的id进行递归查询

		List<ForderActivity> listForderActivity = this.findForderListByParentId(id);

		for (ForderActivity forderActivity : listForderActivity) {

			ForderActivity forder = this.findForderById(forderActivity.getId());

			if (Common.isNotEmpty(forder.getId())) {
				recursion(forder.getId());
			}

		}
		ForderActivity delforder = this.findForderById(id);

		this.remove(delforder);

	}

	/**
	 * 
	 * @Title: findForderActivityByName @Description:
	 *         TODO(这里用一句话描述这个方法的作用) @param @param forderActivityName
	 *         活动名称 @param @param userId 用户id @param @param boundId
	 *         绑定id @param @return 设定文件 @return boolean 返回类型 @throws
	 */
	public boolean findForderActivityByName(String forderActivityName, String userId, String parentId) {

		Query query = new Query();

		if (Common.isNotEmpty(forderActivityName)) {
			query.addCriteria(Criteria.where("forderActivityName").is(forderActivityName));
		} else if (Common.isNotEmpty(userId)) {
			query.addCriteria(Criteria.where("creatUser.id").is(userId));
		}
		query.addCriteria(Criteria.where("parentId").is(parentId));

		List<ForderActivity> list = this.find(query, ForderActivity.class);

		if (list.size() > 0)
			return true;
		else
			return false;

	}
	

	/**
	 * 
	 * @Title: findForderActivityByUserType @Description:
	 * TODO(通过用户帐号的类别来判断) @param @param adminUser @param @return 设定文件 @return
	 * List<ForderActivity> 返回类型 @throws
	 * 
	 */
	public List<ForderActivity> findForderActivityByUserType(String forderActivityName,AdminUser adminUser) {

		if (adminUser.getAdminCompany() != null) {
			UserType getuserType = adminUser.getUserType();
			// 企业ID
			String companyId = adminUser.getAdminCompany().getId();
			// 用户ID
			String userId = adminUser.getId();
			List<ForderActivity> listForderActivity = new ArrayList();

			Query query = new Query();
			/**
			 * 获取活动 1.超级管理员登录 可查询所有的活动
			 *  2.学校管理员登录 可查询学校的活动 
			 *  3.老师帐号登录 可查询个人的活动
			 */
				query.addCriteria(Criteria.where("parentId").is("0"));//获取所有父活动
				//如果forderActivityName不为空查询该信息
			if(Common.isNotEmpty(forderActivityName)){
				query.addCriteria(Criteria.where("forderActivityName").is(forderActivityName));
				
			} else if (getuserType.equals(UserType.SCHOOLADMIN)) {
			
				// 获取绑定区域的所有活动
				query.addCriteria(Criteria.where("boundId").is(companyId));

			} else if (getuserType.equals(UserType.TEACHER)) {
				

				query.addCriteria(Criteria.where("boundId").is(userId));
			}

			listForderActivity = this.find(query, ForderActivity.class);

			if (listForderActivity.size() > 0)
				return listForderActivity;
			else
				return null;
		} else {
			return null;
		}

	}
	
	
	
	
	
	
	
	
	
	
	/**
	 * 
	* @Title: createActivity 
	* @Description: TODO(创建活动) 
	* @param @param forderActivity
	* @param @param adminUser    设定文件 
	* @return void    返回类型 
	* @throws
	 */
	public void creatOrEditActivity(ForderActivity forderActivity,AdminUser adminUser,String id){
		
		//超级管理员创建区域级别的图片库
		
		//直属单位的创建直属单位的图片库
		
		//基层单位的创建基层单位的图片库
		
		//判断用户的session是否存在
		if(adminUser!=null){
			
			UserType usertype = adminUser.getUserType();
			
			//获取当前用户的企业性质
			CompanyNature nature = adminUser.getAdminCompany().getNature();
			
			
			
			if(Common.isNotEmpty(id)){
				//执行修改
				ForderActivity editActivity = this.findForderById(id);
				
				if(editActivity!=null){
					editActivity.setActivityTime(forderActivity.getActivityTime());
					editActivity.setAddress(forderActivity.getAddress());
					editActivity.setBoundId(editActivity.getBoundId());
					editActivity.setDescription(forderActivity.getDescription());
					editActivity.setFolderSize(forderActivity.getFolderSize());
					editActivity.setForderActivityName(forderActivity.getForderActivityName());
					editActivity.setResource(editActivity.getResource());
					editActivity.setSumPotoCount(forderActivity.getSumPotoCount());
					
					if(usertype.equals(UserType.ADMINISTRATORS)){
						
							editActivity.setType(BaseType.Type.AREA);
						
					}else if(usertype.equals(UserType.SCHOOLADMIN)){
						
						if(nature.equals(CompanyNature.JICHENG)){
							
							editActivity.setType(BaseType.Type.BASEUTIS);
							
						}else if(nature.equals(CompanyNature.ZHISHU)){
							
							editActivity.setType(BaseType.Type.DIRECTLYUTIS);
						}
						
					}else if(usertype.equals(UserType.TEACHER)){
						
						editActivity.setType(BaseType.Type.PERSION);
						
					}
					
					editActivity.setCreatUser(editActivity.getCreatUser());

					this.save(editActivity);
				}
				
				
			}else{
				//执行添加
				if(usertype.equals(UserType.ADMINISTRATORS)){
					
					forderActivity.setType(BaseType.Type.AREA);
				
			}else if(usertype.equals(UserType.SCHOOLADMIN)){
				
				if(nature.equals(CompanyNature.JICHENG)){
					
					forderActivity.setType(BaseType.Type.BASEUTIS);
					
				}else if(nature.equals(CompanyNature.ZHISHU)){
					
					forderActivity.setType(BaseType.Type.DIRECTLYUTIS);
				}
				//绑定id
				forderActivity.setBoundId(adminUser.getAdminCompany().getId());
				
			}else if(usertype.equals(UserType.TEACHER)){
				//绑定id
				forderActivity.setBoundId(adminUser.getId());
				forderActivity.setType(BaseType.Type.PERSION);
				
			}
				
				forderActivity.setCreatUser(adminUser);
				forderActivity.setParentId("0");
				this.insert(forderActivity);
				
			}
			
		}
		
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
}
