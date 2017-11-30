package org.app.admin.action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.app.admin.pojo.AdminRole;
import org.app.admin.pojo.AdminUser;
import org.app.admin.pojo.CompanyType;
import org.app.admin.pojo.Label;
import org.app.admin.service.CompanyTypeService;
import org.app.framework.action.GeneralAction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/companyType")
public class CompanyTypeAction extends GeneralAction<CompanyType>{
	private static final Logger log = LoggerFactory
			.getLogger(CompanyTypeAction.class);
   
	@Autowired
    private CompanyTypeService companyTypeService;
	
	
	 
	 /**
	  * @描述：获得性质列表
	  * @参数：无
	  * @返回值：
	  */
	@RequestMapping("/list")
	public ModelAndView getLabellist(){
		ModelAndView modelAndView = new ModelAndView();
		log.info("访问list");
		modelAndView.setViewName("admin/app-admin/schoolnature/list");
		Query query=new Query();
		List<CompanyType> ctList=companyTypeService.find(query, CompanyType.class);
		modelAndView.addObject("ctList", ctList);
		return modelAndView;
	}
	
	/**s
	 * @描述：编辑或添加
	 * @param Label b
	 * @return modelAndView(msg)
	 */
	@RequestMapping("/editor")
	public ModelAndView editorCompanyType(String id){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/app-admin/schoolnature/scneditor");
        if(id!=null && id!=""){
        	modelAndView.addObject("bean",this.companyTypeService.findOneById(id, CompanyType.class));
        }
        
//		Boolean B=labelService.addorupdate(b);
//		modelAndView.addObject("addmsg",B?"添加成功":"标签重复");
		return modelAndView;
	}
	
	/**
	 * @描述: 添加或是修改
	 * @param session
	 * @param Label label
	 * @return
	 */
	@RequestMapping("/createOrUpdateToFind")
	public ModelAndView list(HttpSession session,  CompanyType companyType) {
		log.info("createOrUpdateToFind"+companyType.toString());
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/companyType/list");
		companyTypeService.addorupdate(companyType);
		return modelAndView;// 返回
	}
	
	
	@RequestMapping("/delete")
	public ModelAndView deleteLabel(@RequestParam(value = "id", defaultValue = "0")String id){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/companyType/list");
		log.info(id);
		companyTypeService.remove(id);
		return modelAndView;
	}
}
