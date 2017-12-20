/**   
* @Title: Statistics.java 
* @Package org.app.admin.action 
* @Description: TODO(用一句话描述该文件做什么) 
* @author fliay
* @date 2017年11月29日 上午9:53:44 
* @version V1.0   
*/
package org.app.admin.action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.app.admin.pojo.AdminUser;
import org.app.admin.service.StatisticsService;
import org.app.admin.util.CompanyBean;
import org.app.admin.util.uploadStatistics;
import org.app.framework.util.CommonEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @ClassName: Statistics
 * @Description: TODO(统计)
 * @author fliay
 * @date 2017年11月29日 上午9:53:44
 * 
 * 1.老师用户 
 * 		1）根据自己的ID查看自己的上传记录
 *      2）老师可以查看自己学校上传图片的排行
 * 
 * 2.学校管理员用户
 * 		1）学校管理员可以查看自己的个人上传记录
 * 		2）学校管理员可以查看自己学习所有老师的上传情况（）
 * 3.超级管理员用户
 * 
 * 
 * 
 */
@Controller
@RequestMapping("/statistics")
public class StatisticsAction {

	@Autowired
	private StatisticsService statisticsService;

	/**
	 * 
	* @Title: arealist 
	* @Description: TODO(区域图片上传统计) 
	* @param @return    设定文件 
	* @return ModelAndView    返回类型 
	* @throws
	*/
	@RequestMapping("/arealist")
	public ModelAndView  arealist(HttpSession session){
		ModelAndView modelAndView  = new ModelAndView();
		modelAndView.setViewName("admin/app-admin/statistics/arealist");
		AdminUser adminUser = (AdminUser) session.getAttribute(CommonEnum.USERSESSION);
		List<uploadStatistics> list = this.statisticsService.sortupload(adminUser.getAdminCompany().getId(),"area");
		System.out.println(list.size());
		modelAndView.addObject("list", list);
		return modelAndView;
	}
	
	
	/**
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/companylist")
	public ModelAndView  companylist(HttpSession session){
		AdminUser adminUser = (AdminUser) session.getAttribute(CommonEnum.USERSESSION);
		ModelAndView modelAndView  = new ModelAndView();
  		modelAndView.setViewName("admin/app-admin/statistics/companylist");
  		List<CompanyBean> list = this.statisticsService.sortupload(adminUser.getAdminCompany().getId(),"company");		
		modelAndView.addObject("list", list);
		return modelAndView;
	}
	
	
	
	

}
