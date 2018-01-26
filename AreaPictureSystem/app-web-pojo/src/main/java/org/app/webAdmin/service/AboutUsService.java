package org.app.webAdmin.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.app.framework.service.GeneralServiceImpl;
import org.app.framework.util.Common;
import org.app.framework.util.CommonEnum;
import org.app.framework.util.FileOperateUtil;
import org.app.webAdmin.pojo.AboutUs;
import org.app.webAdmin.pojo.ContestImages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
public class AboutUsService extends GeneralServiceImpl<AboutUs> {

	@Autowired
	private FileOperateUtil operateUtil;
	@Autowired
	private ContestImagesService contestImagesService;

	public void SaveOrUpdateSetting(AboutUs aboutUs, String editid, MultipartFile[] file, MultipartFile[] bananaImg,
			HttpServletRequest request) {
		List<ContestImages> list = new ArrayList<ContestImages>();

		if (aboutUs != null) {

			if(bananaImg[0].getOriginalFilename()!=null){
				// 上传aboutUs 图片
				List<Map<String, Object>> listMap = this.operateUtil.uploadImgs(bananaImg, request);

				for (Map<String, Object> map : listMap) {

					aboutUs.setAboutUsPic(map.get("servletPath").toString().replaceAll("\\\\", "/"));
				}
			}
			if(file!=null){
				
				List<Map<String, Object>> listMap2 = this.operateUtil.uploadImgs(file, request);

				for (Map<String, Object> map : listMap2) {

					ContestImages c = new ContestImages();
					c.setExtensionName(map.get("extension").toString());// 获取后缀名
					c.setGenerateName(map.get("reName").toString());
					c.setOriginalName(map.get("fileName").toString());
					c.setOriginalPath(map.get("servletPath").toString().replaceAll("\\\\", "/"));
					c.setSavePath(map.get("savepath").toString().replaceAll("\\\\", "/"));
					c.setBelongTo(CommonEnum.ABOUTUS);
					this.contestImagesService.insert(c);
					list.add(c);
				}
			}
			if (Common.isNotEmpty(editid)) {
				// 执行修改
				AboutUs getAboutUs = this.findOneById(editid, AboutUs.class);

				if (getAboutUs == null)
					getAboutUs = new AboutUs();
				
				getAboutUs.setAboutUsContent(aboutUs.getAboutUsContent());
				getAboutUs.setAboutUsPic(aboutUs.getAboutUsPic());
				if(list.size()>0){
					getAboutUs.setListTeachers(list);
				}
				this.save(getAboutUs);
			} else {
				if(list.size()>0){
					aboutUs.setListTeachers(list);
				}
				// 执行添加
				this.insert(aboutUs);
			}

		}

	}
	
	
	//删除图片
	public void delete(String id,String editId){
		
		if(Common.isNotEmpty(id)){
			
			//1删除关于我们中该图片的记录
			
			AboutUs getAboutUs = this.findOneById(editId, AboutUs.class);
			
			List<ContestImages> list = new ArrayList<ContestImages>();
			
			if(getAboutUs!=null){
				
				List<ContestImages> getList =getAboutUs.getListTeachers();
				
				if(getList.size()>0){
					
					for(ContestImages ci:getList){
						
						if(!ci.getId().equals(id)){
							list.add(ci);
						}
					}
					
				}
				getAboutUs.setListTeachers(list);
				
				this.save(getAboutUs);
			}
			
			//2删除图片表中的记录
			
			ContestImages contest = this.contestImagesService.findOneById(id, ContestImages.class);
			
			if(contest!=null){
				
				this.contestImagesService.remove(contest);
			}
			
		}
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
