/**   
* @Title: ResourceService.java 
* @Package org.app.admin.service 
* @Description: TODO(用一句话描述该文件做什么) 
* @author fliay
* @date 2017年11月20日 下午3:45:50 
* @version V1.0   
*/
package org.app.admin.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.LinkedList;
import java.util.List;

import org.app.admin.pojo.ForderActivity;
import org.app.admin.pojo.Resource;
import org.app.admin.pojo.UploadFileLog;
import org.app.admin.util.BaseType;
import org.app.framework.service.GeneralServiceImpl;
import org.app.framework.util.Common;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

/**
 * @ClassName: ResourceService
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author fliay
 * @date 2017年11月20日 下午3:45:50
 * 
 */
@Repository
public class ResourceService extends GeneralServiceImpl<Resource> {

	@Autowired
	private ForderActivityService forderActivityService;

	public Resource findResourceByResourceId(String resourceId) {

		Resource resource = this.findOneById(resourceId, Resource.class);
		if (resource != null)
			return resource;
		else
			return null;

	}

	/**
	 * 获取上传记录
	 * 
	 * @param boundId
	 * @return
	 */
	public List<UploadFileLog> findUploadFileLogByBoundId(String boundId) {
		Query query = Query.query(Criteria.where("boundId").is(boundId));
		List<Resource> lrs = this.find(query, Resource.class);
		List<UploadFileLog> lufl = new LinkedList<>();
		for (Resource resource : lrs) {
			ForderActivity f = forderActivityService.findForderById(resource.getForderActivityId());
			if (f != null) {
				UploadFileLog ufl = new UploadFileLog();
				ufl.setDate(resource.getCreateDate());
				ufl.setImgSize(resource.getImgInfoBean().getImgSize());
				ufl.setName(resource.getOriginalName());
				ufl.setPlace(returnUploadType(f.getType().toString()));
				lufl.add(ufl);
			}
		}
		return lufl;
	}

	/**
	 * 返回上传位置
	 * 
	 * @param type
	 * @return
	 */
	public String returnUploadType(String type) {
		String result = null;
		switch (type) {
		case "AREA":
			result = "区域上传";
			break;
		case "PERSION":
			result = "个人上传";
			break;
		case "BASEUTIS":
			result = "基层上传";
			break;
		case "DIRECTLYUTIS":
			result = "直属上传";
			break;
		default:
			result = "have no idea!";
			break;
		}
		return result;
	}

	/**
	 * 
	 * @Title: maxUploadThisMonth @Description: TODO(获取本月上传文件最大的) @param @return
	 *         设定文件 @return int 返回类型 @throws
	 */
	// public int maxUploadThisMonthForDay(String date, String boundId) {
	//
	// Query query = new Query();
	//
	// if (Common.isNotEmpty(boundId)) {
	//
	// query.addCriteria(Criteria.where("boundId").is(boundId));
	// }
	//
	// if (Common.isNotEmpty(date)) {
	//
	// query.addCriteria(Criteria.where("createDate").is(date));
	// }
	//
	// List<Resource> list = this.find(query, Resource.class);
	//
	// if (list.size() > 0){
	//
	// return list.size();
	// }
	// else
	// return 0;
	// }

	/**
	 * @Title: maxUploadThisMonth @Description: TODO(获取本月上传文件最大的) @param @return
	 *         设定文件 @return int 返回类型 @throws
	 */
	public int maxUploadThisMonthForDay(String date, List<String> forderActivityList) {
		Query query = new Query();
		if (Common.isNotEmpty(date)) {
			query.addCriteria(Criteria.where("createDate").is(date));
		}
		query.addCriteria(Criteria.where("forderActivityId").in(forderActivityList));
		List<Resource> lr = this.find(query, Resource.class);
		if (lr.size() > 0)
			return lr.size();
		return 0;
	}

	public int maxUploadThisMonthForDay(String date, List<String> forderActivityList, String id) {
		Query query = new Query();
		if (Common.isNotEmpty(date)) {
			query.addCriteria(Criteria.where("createDate").is(date));
		}
		query.addCriteria(Criteria.where("forderActivityId").in(forderActivityList).and("boundId").is(id));
		List<Resource> lr = this.find(query, Resource.class);
		if (lr.size() > 0)
			return lr.size();
		return 0;
	}

	/**
	 * 
	 * @Title: getMonthUploadNum @Description: TODO(获取当前月的上传记录) @param @param
	 *         year @param @param month @param @param day @param @return
	 *         设定文件 @return List 返回类型 @throws
	 */
	// public List getMonthUploadNum(String idtype) {
	//
	// LinkedList list = new LinkedList();
	//
	// Calendar now = Calendar.getInstance();
	//
	// int year = now.get(Calendar.YEAR);
	//
	// int month = now.get(Calendar.MONTH) + 1;
	//
	// // int day = now.get(Calendar.DAY_OF_MONTH);
	// int day = getMaxDayByYearMonth(year, month);
	//
	// for (int i = 1; i <= day; i++) {
	// String day_ = "";
	// if (i < 10) {
	// day_ = "0" + i;
	// } else {
	// day_ = String.valueOf(i);
	// }
	// int num=this.maxUploadThisMonthForDay(year + "-" + month + "-" + day_,
	// idtype);
	// list.add("[" + i + "," + num + "]");
	//
	// }
	//
	// return list;
	// }

	/**
	 * 
	 * @Title: 重载getMonthUploadNum @Description: TODO(获取当前月的上传记录) @param @param
	 *         year @param @param month @param @param day @param @return
	 *         设定文件 @return List 返回类型 @throws
	 */
	public List getMonthUploadNum(List<String> forderActivityList, String id) {

		LinkedList list = new LinkedList();

		Calendar now = Calendar.getInstance();

		int year = now.get(Calendar.YEAR);

		int month = now.get(Calendar.MONTH) + 1;

		// int day = now.get(Calendar.DAY_OF_MONTH);
		int day = getMaxDayByYearMonth(year, month);

		for (int i = 1; i <= day; i++) {
			String day_ = "";
			if (i < 10) {
				day_ = "0" + i;
			} else {
				day_ = String.valueOf(i);
			}
			int num = 0;
			if (id != null) {
				num = this.maxUploadThisMonthForDay(year + "-" + month + "-" + day_, forderActivityList, id);
			} else {
				num = this.maxUploadThisMonthForDay(year + "-" + month + "-" + day_, forderActivityList);
			}
			list.add("[" + i + "," + num + "]");

		}

		return list;
	}

	/**
	 * 获得某个月最大天数
	 *
	 * @param year
	 *            年份
	 * @param month
	 *            月份 (1-12)
	 * @return 某个月最大天数
	 */
	public int getMaxDayByYearMonth(int year, int month) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.YEAR, year - 1);
		calendar.set(Calendar.MONTH, month);
		return calendar.getActualMaximum(Calendar.DATE);
	}

	public static void main(String[] args) {

		LinkedList list = new LinkedList();
		String aa[] = new String[] {};
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH) + 1;
		int day = now.get(Calendar.DAY_OF_MONTH);
		for (int i = 1; i < day; i++) {

			list.add("[" + i + "," + 2 + "]");

		}

	}

	/**
	 * 
	 * @Title: getImageFile @Description: TODO(获取图片的路径并且转换成File) @param @param
	 * id @param @return 设定文件 @return List<File> 返回类型 @throws
	 */
	public List<File> getImageFile(String id) {
		List<File> listFile = new ArrayList();

		if (Common.isNotEmpty(id)) {

			String[] ids = id.split(",");

			for (int i = 0; i < ids.length; i++) {

				Resource rs = this.findResourceByResourceId(ids[i]);

				if (rs != null) {

					String imgPath = rs.getOriginalPath() + rs.getImgCompressionBean().getMax_generateName();

					File file = new File(imgPath);

					listFile.add(file);

				}

			}
		}

		return listFile;

	}

	public List<Resource> findListResourceByCompanyId(String adminComanyId) {

		Query query = new Query();

		query.addCriteria(Criteria.where("adminCompanyId").is(adminComanyId));

		List<Resource> list = this.find(query, Resource.class);

		if (list.size() > 0)
			return list;
		else
			return null;

	}

	/**
	 * 
	 * @Title: findResourceByResourceNameAndForderActivityId @Description:
	 * TODO(收藏的时候查询是否已经存在该数据) @param @param boundId @param @param
	 * forderActivityId @param @param generateName @param @return 设定文件 @return
	 * List<Resource> 返回类型 @throws
	 */
	public Resource findResourceByResourceNameAndForderActivityId(String boundId, String forderActivityId,
			String generateName) {

		Query query = new Query();

		query.addCriteria(Criteria.where("boundId").is(boundId))
				.addCriteria(Criteria.where("forderActivityId").is(forderActivityId))
				.addCriteria(Criteria.where("generateName").is(generateName))
				.addCriteria(Criteria.where("adminCompanyId").is(""));

		Resource res = this.findOneByQuery(query, Resource.class);

		return res;

	}
	
	
	
	
	
	
	

}
