/**   
* @Title: WebAdminAction.java 
* @Package org.app.webAdmin.action 
* @Description: TODO(用一句话描述该文件做什么) 
* @author fliay
* @date 2018年1月4日 下午3:42:09 
* @version V1.0   
*/
package org.app.webAdmin.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.app.framework.action.GeneralAction;
import org.app.framework.util.FileOperateUtil;
import org.app.webAdmin.pojo.AboutUs;
import org.app.webAdmin.service.AboutUsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 * @ClassName: WebAdminAction
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author fliay
 * @date 2018年1月4日 下午3:42:09
 * 
 */

@Controller
@RequestMapping("/aboutUs")
public class AboutUsAction extends GeneralAction<AboutUs> {

	@Autowired
	private AboutUsService aboutUsService;
	
	@Autowired
	private FileOperateUtil operateUtil;



	@RequestMapping("/saveAboutUs")
	public ModelAndView saveAboutUs(HttpSession session,HttpServletRequest request,
			@ModelAttribute("aboutUs") AboutUs aboutUs,
			@RequestParam(defaultValue="",value="editid")String editid,
			@RequestParam MultipartFile[] file,
			@RequestParam MultipartFile[] bananaImg
			) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("redirect:/aboutUs/list");
		
		this.aboutUsService.SaveOrUpdateSetting(aboutUs, editid, file, bananaImg, request);
		
	
		
		return modelAndView;

	}

	/**
	 * 
	 * @Title: setting @Description: TODO(网站配置) @param @return 设定文件 @return
	 * ModelAndView 返回类型 @throws
	 */
	@RequestMapping("/list")
	public ModelAndView list() {
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("admin/app-admin/aboutUs/aboutUs");
		
		
		List<AboutUs> aboutUs = this.aboutUsService.find(new Query(), AboutUs.class);
		
		if(aboutUs.size()>0){
			
			modelAndView.addObject("aboutUs", aboutUs.get(0));
		
		}

		return modelAndView;

	}
	
	@RequestMapping("/delete")
	public ModelAndView delete(
			@RequestParam(defaultValue="",value="id")String id,
			@RequestParam(defaultValue="",value="editId")String editId
			){
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("redirect:/aboutUs/list");
		
		this.aboutUsService.delete(id, editId);
		
		
		return modelAndView;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
