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
import org.app.framework.util.Common;
import org.app.framework.util.FileOperateUtil;
import org.app.webAdmin.pojo.Contest;
import org.app.webAdmin.pojo.ContestImages;
import org.app.webAdmin.pojo.UsersUploads;
import org.app.webAdmin.service.ContestImagesService;
import org.app.webAdmin.service.ContestService;
import org.app.webAdmin.service.UsersUploadsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	@Autowired
	private UsersUploadsService usersUploadService;
	
	@Autowired
	private ContestImagesService contestImagesService;
	

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
				//删除比赛同时删除投稿的信息
				
				List<UsersUploads> list = this.usersUploadService.findUsersByUsersId(null, contest.getId());
				
				for(UsersUploads up:list){
					this.usersUploadService.remove(up);
				}
				
				List<ContestImages> ci = this.contestImagesService.listContestImages(null, contest.getId());

				for(ContestImages c:ci){
					this.contestImagesService.remove(c);
				}

				if (contest != null) {

					this.contestService.remove(contest);

				}
				
			}

		}

		return modelAndView;

	}
	
	
	
	
	
	
	/**
	 * 
	* @Title: manager 
	* @Description: TODO(比赛管理) 
	* @param @return    设定文件 
	* @return ModelAndView    返回类型 
	* @throws
	 */
	@RequestMapping("/manager")
	public ModelAndView manager(String id,@ModelAttribute("reContestId") String reContestId){
		
		if(Common.isNotEmpty(reContestId)){
			id=reContestId;
		}
		
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("admin/app-admin/contest/manager");
	
		if(Common.isNotEmpty(id)){
			Query query = new Query();
			
			query.addCriteria(Criteria.where("contestId").is(id));
			
			List<UsersUploads> list = this.usersUploadService.find(query, UsersUploads.class);
			
			modelAndView.addObject("pageList", list);
		}
		return modelAndView;
	}
	
	
	
	/**
	 * 
	* @Title: deleteUsersUploads 
	* @Description: TODO(删除投稿的信息) 
	* @param @param id
	* @param @param contestId
	* @param @param model
	* @param @return    设定文件 
	* @return ModelAndView    返回类型 
	* @throws
	 */
	@RequestMapping("/deleteUsersUploads")
	public ModelAndView deleteUsersUploads(String id,String contestId,RedirectAttributes model){
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("redirect:/contest/manager");
		
		model.addFlashAttribute("reContestId", contestId);

		if(Common.isNotEmpty(id)){
			
			UsersUploads usersUploads = this.usersUploadService.findOneById(id, UsersUploads.class);
			
			this.usersUploadService.remove(usersUploads);
			
		}
		
		return modelAndView;
	}
	
	
	@RequestMapping("/findImages")
	public ModelAndView findImages(@RequestParam(defaultValue="",value="id")String id,
			@ModelAttribute("reid") String reid){
		
		if(Common.isNotEmpty(reid)){
			id=reid;
		}
		
		ModelAndView modelAndView = new ModelAndView();
		
		UsersUploads usersUploads = this.usersUploadService.findOneById(id, UsersUploads.class);
		
		modelAndView.setViewName("admin/app-admin/contest/resource");
		
		modelAndView.addObject("usersUploads", usersUploads);
		
		
		return modelAndView;
		
	}
	
	
	/**
	 * 
	* @Title: deleteImages 
	* @Description: TODO(管理员删除图片) 
	* @param @param id
	* @param @param usersUploadsId
	* @param @param model
	* @param @return    设定文件 
	* @return ModelAndView    返回类型 
	* @throws
	 */
	@RequestMapping("/deleteImages")
	public ModelAndView deleteImages(@RequestParam(defaultValue="",value="id")String id,
			@RequestParam(defaultValue="",value="usersUploadsId")String usersUploadsId,
			RedirectAttributes model){
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("redirect:/contest/findImages");
		
		this.usersUploadService.delete(id, usersUploadsId);
		
		model.addFlashAttribute("reid", usersUploadsId);
		
		modelAndView.addObject("id", usersUploadsId);
	
		
		return modelAndView;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

}
