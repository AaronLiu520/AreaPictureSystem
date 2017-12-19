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
import java.util.List;

import org.app.admin.pojo.AdminCompany;
import org.app.admin.pojo.Resource;
import org.app.admin.pojo.uploadStatistics;
import org.springframework.beans.factory.annotation.Autowired;
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
	* @Title: companyUpload 
	* @Description: TODO(根据企业上传排行) 
	* @param @return    设定文件 
	* @return List<uploadStatistics>    返回类型 
	* @throws
	 */
	public List<uploadStatistics> companyUpload(){
		
		List<AdminCompany> listCompany = this.adminComanyService.listCompay();
		
		
		
		ArrayList<uploadStatistics> listuploadStatistics = new ArrayList<uploadStatistics>();
		
		for(AdminCompany adminCompany:listCompany){
			uploadStatistics up = new uploadStatistics();
			up.setNum(this.getUploadFileNum(adminCompany.getId()));
			up.setCompanyName(adminCompany.getName());
			listuploadStatistics.add(up);
		}
		
		Collections.sort(listuploadStatistics);
		
		return listuploadStatistics;
		
	}
	
	
	
	
}
