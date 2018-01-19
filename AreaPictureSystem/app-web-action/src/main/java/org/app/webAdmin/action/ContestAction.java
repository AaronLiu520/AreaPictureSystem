/**   
* @Title: WebAdminAction.java 
* @Package org.app.webAdmin.action 
* @Description: TODO(用一句话描述该文件做什么) 
* @author fliay
* @date 2018年1月4日 下午3:42:09 
* @version V1.0   
*/
package org.app.webAdmin.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.app.framework.action.GeneralAction;
import org.app.framework.util.BasicDataResult;
import org.app.framework.util.Common;
import org.app.framework.util.CommonEnum;
import org.app.framework.util.FileOperateUtil;
import org.app.framework.util.PathUtil;
import org.app.framework.util.RandomUtil;
import org.app.webAdmin.pojo.Contest;
import org.app.webAdmin.pojo.News;
import org.app.webAdmin.service.ContestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
@RequestMapping("/contest")
public class ContestAction extends GeneralAction<Contest> {
	
	
	@Autowired
	private ContestService contestService;
	
	@Autowired
	private FileOperateUtil operateUtil;



	@RequestMapping("/listContest")
	public ModelAndView setting() {
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("pageList", this.contestService.find(new Query(), Contest.class));
		

		modelAndView.setViewName("admin/app-admin/contest/list");

		return modelAndView;

	}

	@RequestMapping("/editor")
	public ModelAndView editor(@RequestParam(defaultValue="",value="id")String id) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("admin/app-admin/contest/editor");
		
		
		Contest contest = Common.isNotEmpty(id)?this.contestService.findOneById(id, Contest.class):null;
		
		modelAndView.addObject("contest", contest);

		return modelAndView;

	}

 	
	
	@RequestMapping("/createOrUpdateToFind")
	public ModelAndView createOrUpdateToFind(HttpSession session,
			HttpServletRequest request,
			@ModelAttribute("contest") Contest contest,
			@RequestParam(defaultValue="",value="editid")String editid){
		ModelAndView modelAndView = new ModelAndView();
		
		
		this.contestService.SaveOrUpdateContest(contest,editid);
		

		modelAndView.setViewName("redirect:/contest/listContest");

		return modelAndView;
	}
	
	
	
	
	
	@RequestMapping("/delete")
	public ModelAndView delete(@RequestParam(defaultValue = "", value = "id") String id) {

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("redirect:/contest/listContest");

		String delIds[] = id.split(",");

		for (int i = 0; i < delIds.length; i++) {
			if (Common.isNotEmpty(delIds[i])) {

				Contest contest = this.contestService.findOneById(delIds[i], Contest.class);

				if (contest != null) {

					this.contestService.remove(contest);

				}
			}

		}

		return modelAndView;

	}
	
	
	
	
	
	
	
	
	
	

}
