package org.app.webAdmin.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.app.framework.service.GeneralServiceImpl;
import org.app.framework.util.Common;
import org.app.framework.util.FileOperateUtil;
import org.app.webAdmin.pojo.Setting;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("settingService")
public class SettingService extends GeneralServiceImpl<Setting> {

	@Autowired
	private FileOperateUtil operateUtil;

/*	*//**
	 * 
	 * @Title: uploadImg @Description: TODO(上传图片) @param @param
	 * request @param @return 设定文件 @return Setting 返回类型 @throws
	 *//*
	public Setting uploadImg(HttpServletRequest request) {
		Setting setting = new Setting();
		try {
			String[] filetype = new String[] { "png", "jpeg", "gif", "jpg" };

			String UPLOADDIR = File.separator + "FileUpload" + File.separator + "Img" + File.separator;
			
			List<Map<String, Object>> result = operateUtil.upload(request, UPLOADDIR, filetype);
			
			Boolean hasfile = (Boolean) result.get(0).get("nofile");

			if (!hasfile) {

				boolean has = (Boolean) result.get(0).get("hassuffix");
				// 如果上传文件符合要求
				if (has != false) {

					String img = (String) result.get(0).get("servletPath");
					if (Common.isNotEmpty(img)) {
						setting.setIcon(img);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return setting;

	}*/

	/**
	 * 
	 * @Title: SaveSetting @Description: TODO(保存用户设置) @param 设定文件 @return void
	 * 返回类型 @throws
	 */
	public void SaveOrUpdateSetting(Setting setting,String editid) {

		if (setting != null) {

			if (Common.isNotEmpty(editid)) {
				// 执行修改
				Setting getSetting = this.findOneById(editid, Setting.class);

				if (getSetting == null)
					getSetting = new Setting();

				getSetting.setCopyRight(setting.getCopyRight());
				if(Common.isNotEmpty(setting.getIcon())){
					getSetting.setIcon(setting.getIcon().replaceAll("\\\\", "/"));
				}else{
					getSetting.setIcon("");
				}
				getSetting.setTitle(setting.getTitle());
				getSetting.setWebName(setting.getWebName());
				this.save(getSetting);
			} else {
				
				setting.setIcon(setting.getIcon().replaceAll("\\\\", "/"));
				// 执行添加
				this.insert(setting);
			}

		}

	}

}
