/**   
* @Title: StatisticsService.java 
* @Package org.app.admin.service 
* @Description: TODO(用一句话描述该文件做什么) 
* @author fliay
* @date 2017年12月19日 下午1:50:22 
* @version V1.0   
*/
package org.app.admin.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.app.admin.pojo.AdminCompany;
import org.app.admin.pojo.Resource;
import org.app.admin.util.SortBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

/** 
* @ClassName: StatisticsService 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author fliay
* @date 2017年12月19日 下午1:50:22 
	* 1.图片上传总量
	* 2.学校上传排行
	* 3.个人上传排行
*/
@Repository
public class StatisticsService {

	@Autowired
	private ResourceService resourceService;// 资源（图片）
	
	@Autowired
	private AdminCompanyService adminComanyService;
	
	@Autowired
	private AdminUserService adminUserService;
	//listCompay  获取所有的企业
	/**
	 * 
	* @Title: getUploadFileNum 
	* @Description: TODO(获取企业上传图片的数量) 
	* @param @return    设定文件 
	* @return int    返回类型 
	* @throws
	 */
	public int getUploadFileNum(String companyId){
		
		List<Resource> list = this.resourceService.findListResourceByCompanyId(companyId);
		
		if(list!=null)
			
			return list.size();
		else
			return 0;
		
	}
	
	
	/**
	 * 
	* @Title: sortUpload 
	* @Description: TODO(根据上传数量排行) 
	* @param @return    设定文件 
	* @return List<uploadStatistics>    返回类型 
	* @throws
	 */
	public <T extends  SortBean > List<T> sortupload(String acompanyId,String bs){
		List<T> lus=new ArrayList<>();
		Query query=new Query();
		//区域
		if(bs.equals("area")){
		    query.addCriteria(Criteria.where("adminCompanyId").is(acompanyId)); 
		    List<Resource> lrs=resourceService.find(query, Resource.class);
		    List<String> boundIdList=this.IdList(lrs,"boundid");
		 Map<String, Integer> map=new HashMap<String, Integer>();
		 for (String string : boundIdList) {
			  map.put(string, numByBoundIdnum(boundIdList, string));
		    }
		for (String key : map.keySet()) {
			    T t=(T) new SortBean();
			    t.setName(adminUserService.findAdminUserById(key).getName());
			    t.setUploadnum(map.get(key));
			    lus.add(t);
			}  
		}
		//Company排行
		else{
			 List<Resource> lrs=resourceService.find(query, Resource.class);
			List<String> companyIdList=this.IdList(lrs,"companyid");
			 Map<String, Integer> map=new HashMap<String, Integer>();
			 for (String string :companyIdList) {
				  map.put(string, numByBoundIdnum(companyIdList, string));
			    }
			for (String key : map.keySet()) {
				    T t=(T) new SortBean();
				    if(key!=null){
				    t.setName(adminComanyService.findAdminCompanyById(key).getName());
				    t.setUploadnum(map.get(key));
				    lus.add(t);
				    }
				    }  
			} 
		return sort(lus);
	}
	
	
     /***
      * 前十排行
     * @param <T>
      * @param lup
      * @return
      */
	public <T extends  SortBean >List<T> sort(List<T> lup){
		Collections.sort(lup);
		if(lup.size()>=10){
			lup=lup.subList(0,10);
		}
		int num=1;
		for (T t : lup) {
		  t.setSortnum(num);
		  num++;
		}
		return lup;
	}
	
	
	
	/**
	 * 
	 * @param lrs
	 * @return 返回Resource中boundId的List(可重复)
	 */
	public List<String> IdList(List<Resource> lrs, String bs) {
		List<String> lbd = new ArrayList<>();
		if (bs.equals("boundid")) {
			for (Resource r : lrs) {
				lbd.add(r.getBoundId());
			}
		} else {
			for (Resource r : lrs) {
				lbd.add(r.getAdminCompanyId());
			}
		}
		return lbd;
	}
	/**
	 * 
	 * @param lbd
	 * @param boundId
	 * @return 返回数组中重复值
	 */
	public int numByBoundIdnum(List<String> lbd,String boundId){
		int num=0;
		for (int i = 0; i < lbd.size(); i++) {
			if(lbd.get(i)!=null&&(lbd.get(i).equals(boundId))){
				num++;
			}
		}
		 return num;
	}
	
	
}
