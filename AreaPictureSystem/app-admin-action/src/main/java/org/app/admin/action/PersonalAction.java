package org.app.admin.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.app.admin.annotation.SystemControllerLog;
import org.app.admin.annotation.SystemErrorLog;
import org.app.admin.pojo.AdminCompany;
import org.app.admin.pojo.AdminRole;
import org.app.admin.pojo.AdminUser;
import org.app.admin.service.AdminCompanyService;
import org.app.admin.service.AdminRoleService;
import org.app.admin.service.AdminUserService;
import org.app.admin.util.FileOperateUtil;
import org.app.admin.util.ResponseTools;
import org.app.framework.action.GeneralAction;
import org.app.framework.util.CommonEnum;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user")
public class PersonalAction extends GeneralAction<AdminUser> {
	private static final Logger log = LoggerFactory.getLogger(PersonalAction.class);

	@Autowired
	private AdminUserService adminUserService;
	@Autowired
	private AdminRoleService adminRoleService;
	@Autowired
	private AdminCompanyService AdminCompanyService;

	@RequestMapping("/editor")
	public ModelAndView profile(String id) {
		log.info("editor~~~~~~" + id);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/app-admin/personal/profile");
		log.info("profile");
		return modelAndView;
	}

	@SystemErrorLog(description="修改用户个人信息出错")
	@SystemControllerLog(description = "修改用户个人信息")
	@RequestMapping("/update")
	public ModelAndView update(AdminUser adminUser, String roleId, String companyId, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		if (roleId != null)
			adminUser.setAdminRole(this.adminRoleService.findOneById(roleId, AdminRole.class));
		if (companyId != null)
			adminUser.setAdminCompany(this.AdminCompanyService.findOneById(companyId, AdminCompany.class));
		try {
			if (adminUser != null) {
				this.adminUserService.save(adminUser);
				modelAndView.setViewName("redirect:/adminUser/list");
				session.setAttribute(CommonEnum.USERSESSION, adminUser);
			}
			log.info(adminUser.toString());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		log.info("id" + roleId);
		log.info("adminuser" + companyId);
		return modelAndView;
	}

	/**
	 * 
	 * @return
	 */
	@SystemErrorLog(description="修改用户个人信息出错")
	@SystemControllerLog(description = "修改用户个人信息")
	@RequestMapping("/change")
	public ModelAndView change(HttpServletRequest request, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/adminUser/index");
		AdminUser user = (AdminUser) session.getAttribute(CommonEnum.USERSESSION);
		String[] filetype = new String[] { "png", "jpeg", "gif", "jpg" };
		String UPLOADDIR = File.separator + "FileUpload" + File.separator + "Img" + File.separator;
		String path = request.getSession().getServletContext().getRealPath("/WEB-INF");
		String wzpath = path + UPLOADDIR + user.getHeadImage();
		// 删除上个头像
		try {
			if (user.getHeadImage() != null) {
				File deleteFile = new File(wzpath);
				if (!deleteFile.isFile()) {
					log.info("无该文件：" + deleteFile.getAbsolutePath() + ",删除失败");
				} else {
					deleteFile.delete();
				}
			}
			List<Map<String, Object>> result = FileOperateUtil.upload(request, UPLOADDIR, filetype);
			Boolean hasfile = (Boolean) result.get(0).get("nofile");
			if (!hasfile) {
				boolean has = (Boolean) result.get(0).get("hassuffix");
				// 如果上传文件符合要求
				if (has != false) {
					String rname = (String) result.get(0).get("reName");
					user.setHeadImage(rname);
					adminUserService.save(user);
					log.info("user:" + user.toString());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelAndView;
	}

	/**
	 * 取當前的缩略图片
	 *
	 * @param id
	 * @param response
	 */
	@RequestMapping("/getImg")
	public void getThumbnailsImage(HttpSession session, HttpServletResponse response, HttpServletRequest request) {

		String path = request.getSession().getServletContext().getRealPath("/WEB-INF");
		String UPLOADDIR = File.separator + "FileUpload" + File.separator + "Img" + File.separator;
		AdminUser user = (AdminUser) session.getAttribute(CommonEnum.USERSESSION);
		String wzpath = path + UPLOADDIR + user.getHeadImage();
		log.info("访问缩略图片的路径：{}", wzpath.toString());
		File file = new File(wzpath.toString());
		FileInputStream is = null;
		if (file.exists()) {
			try {
				is = new FileInputStream(file);
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
		} else {
			try {
				String defaultfile=path+"/assets/admin/img/profile_small.jpg";
				defaultfile=defaultfile.replace("\\", "/");
				is = new FileInputStream(new File(defaultfile));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
		}
		ResponseTools.responsePicture(response, is);
	}

}


