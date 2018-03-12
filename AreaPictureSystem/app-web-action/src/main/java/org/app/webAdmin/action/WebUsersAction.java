package org.app.webAdmin.action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.app.framework.action.GeneralAction;
import org.app.framework.util.BasicDataResult;
import org.app.framework.util.Common;
import org.app.webAdmin.pojo.ContestImages;
import org.app.webAdmin.pojo.Users;
import org.app.webAdmin.pojo.UsersUploads;
import org.app.webAdmin.service.ContestImagesService;
import org.app.webAdmin.service.UsersService;
import org.app.webAdmin.service.UsersUploadsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 用户管理
 */
@Controller
@RequestMapping("/webUsers")
public class WebUsersAction extends GeneralAction<Users> {
	private static final Logger log = LoggerFactory.getLogger(WebUsersAction.class);

	@Autowired
	private UsersService usersService;

	@Autowired
	private UsersUploadsService usersUploadsService;
	
	@Autowired
	private ContestImagesService contestImagesService;

	/**
	 * 用户查询
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/list")
	public ModelAndView list(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/app-admin/webUsers/list");
		Query query = new Query();
		try {
			modelAndView.addObject("pageList", this.usersService.find(query, Users.class));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelAndView;// 返回
	}

	/**
	 * 
	 * @Title: delete @Description: TODO(删除) @param @param id @param @return
	 *         设定文件 @return ModelAndView 返回类型 @throws
	 */
	@RequestMapping("/delete")
	public ModelAndView delete(@RequestParam(defaultValue = "", value = "id") String id) {

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("redirect:/webUsers/list");
		if (Common.isNotEmpty(id)) {

			Users users = this.usersService.findOneById(id, Users.class);

			// 先删除投稿

			List<UsersUploads> up = this.usersUploadsService.findUsersByUsersId(users.getId(),null);
			
			for (UsersUploads u : up) {
				this.usersUploadsService.remove(u);
			}
			//用户上传的资源 
			
			List<ContestImages> ci = this.contestImagesService.listContestImages(users.getId(),null);
			for(ContestImages c:ci){
				this.contestImagesService.remove(c);
			}

			if (users != null)
				this.usersService.remove(users);

		}

		return modelAndView;
	}

	@RequestMapping("/checkStatus")
	@ResponseBody
	public BasicDataResult checkStatus(@RequestParam(defaultValue = "", value = "id") String id) {

		if (Common.isEmpty(id)) {

			return BasicDataResult.build(203, "未能匹配到有效的用户信息，请刷新页面后再试！", null);

		}

		Users users = this.usersService.findOneById(id, Users.class);

		if (users == null) {
			return BasicDataResult.build(203, "该用户已经不存在，请刷新页面后再试", null);
		}

		String msg = "";
		if (users.isStatus() == true) {
			users.setStatus(false);
			msg = "该用户已禁用！";
		} else {
			users.setStatus(true);
			msg = "该用户已取消禁用！";
		}
		this.usersService.save(users);

		Users u = new Users();
		u.setStatus(users.isStatus());

		return BasicDataResult.build(200, msg, u);
	}

}
