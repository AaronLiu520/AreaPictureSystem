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
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.app.framework.action.GeneralAction;
import org.app.framework.util.Common;
import org.app.framework.util.CommonEnum;
import org.app.framework.util.FileOperateUtil;
import org.app.webAdmin.pojo.Setting;
import org.app.webAdmin.service.SettingService;
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
@RequestMapping("/setting")
public class SettingAction extends GeneralAction<Setting> {

	@Autowired
	private SettingService settingService;
	
	@Autowired
	private FileOperateUtil operateUtil;


	/**
	 * @throws IOException
	 * 			@throws IllegalStateException
	 * 
	 * @Title: setting @Description: TODO(网站配置) @param @return 设定文件 @return
	 *         ModelAndView 返回类型 @throws
	 */
	// @RequestMapping("/toupload")
	@ResponseBody
	public Map<String, Object> setting(MultipartFile iconFile) throws IllegalStateException, IOException {
		// 原始名称
		String oldFileName = iconFile.getOriginalFilename(); // 获取上传文件的原名
		// System.out.println(oldFileName);
		// 存储图片的虚拟本地路径（这里需要配置tomcat的web模块路径，双击猫进行配置）
		String saveFilePath = "d://picture";
		// 上传图片
		if (iconFile != null && oldFileName != null && oldFileName.length() > 0) {
			// 新的图片名称
			String newFileName = UUID.randomUUID() + oldFileName.substring(oldFileName.lastIndexOf("."));
			// 新图片
			File newFile = new File(saveFilePath + "\\" + newFileName);
			// 将内存中的数据写入磁盘
			iconFile.transferTo(newFile);
			// 将新图片名称返回到前端
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("success", "成功啦");
			map.put("url", newFileName);
			return map;
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("error", "图片不合法");
			return map;
		}
	}

	@RequestMapping("/saveSetting")
	public ModelAndView saveSetting(HttpSession session,HttpServletRequest request, @ModelAttribute("setting") Setting setting,
			@RequestParam(defaultValue="",value="editid")String editid) {
		ModelAndView modelAndView = new ModelAndView();
		
		String img = this.operateUtil.uploadImg(request);
		if(Common.isNotEmpty(img)){
			setting.setIcon(img);
		}
		this.settingService.SaveOrUpdateSetting(setting,editid);
		
		session.removeAttribute(CommonEnum.WEBSETTING);//清空网站配置

		modelAndView.setViewName("redirect:/setting/list");

		return modelAndView;

	}

	/**
	 * 
	 * @Title: setting @Description: TODO(网站配置) @param @return 设定文件 @return
	 * ModelAndView 返回类型 @throws
	 */
	@RequestMapping("/list")
	public ModelAndView setting() {
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("admin/app-admin/setting/setting");

		Setting setting = this.settingService.findOneByQuery(new Query(), Setting.class);

		if (setting != null)
			setting.setIcon(setting.getIcon());
		modelAndView.addObject("setting", setting);

		return modelAndView;

	}

}
