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
import org.app.webAdmin.pojo.AdminUser;
import org.app.webAdmin.pojo.News;
import org.app.webAdmin.service.NewsService;
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
@RequestMapping("/news")
public class NewsAction extends GeneralAction<News> {
	
	
	@Autowired
	private NewsService newsService;
	
	@Autowired
	private FileOperateUtil operateUtil;

	@RequestMapping("/listNews")
	public ModelAndView setting() {
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("pageList", this.newsService.find(new Query(), News.class));
		

		modelAndView.setViewName("admin/app-admin/news/list");

		return modelAndView;

	}

	@RequestMapping("/editor")
	public ModelAndView editor(@RequestParam(defaultValue="",value="id")String id) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("admin/app-admin/news/editor");
		
		
		News news = Common.isNotEmpty(id)?this.newsService.findOneById(id, News.class):null;
		
		modelAndView.addObject("news", news);
		

		return modelAndView;

	}
/*
	@RequestMapping("/editImgUpload")
	@ResponseBody
	public BasicDataResult editImgUpload(@RequestParam(value = "file", required = true) MultipartFile multipartFiles,
			HttpServletRequest request) {

		BasicDataResult basic = new BasicDataResult();

		if (multipartFiles.isEmpty()) {
			basic.setMsg("上传图片为空");
			basic.setStatus(CommonEnum.WRONG);
			return basic;
		}

		String targetFileName = fileUpload(multipartFiles, request);

		// 返回一个网络路径http://localhost:8080/app-web-portal/file/aa.jpg
		// 不应该返回一个网络路径，应该是项目路径 ：/file/aa.jpg
 		StringBuffer reponsePath = new StringBuffer(File.separator).append(CommonEnum.NEWSFILE)
				.append(File.separator).append(targetFileName);
		basic.setData(reponsePath);
		basic.setStatus(CommonEnum.SUCCESS);
		basic.setMsg("图片上传成功");

 		return basic;
	}

	
	
	private String fileUpload(MultipartFile multipartFiles, HttpServletRequest request) {
		String fileName = multipartFiles.getOriginalFilename();
		// 重命名当前的文件名
		String targetName = RandomUtil.getUUID();
		String extensionName = PathUtil.getExtension(fileName);
		String targetFileName = targetName.concat(extensionName);
		// 上传到项目的files目录下面
		StringBuffer absoultePath = new StringBuffer(request.getSession().getServletContext().getRealPath(""))
				.append(File.separator).append("WEB-INF").append(File.separator).append(CommonEnum.NEWSFILE)
				.append(File.separator);

		
		
		File f = new File(absoultePath.toString());
		if(!f.exists()){
			f.mkdirs();
		}		
				
		absoultePath.append(targetFileName);
		try {
			File targetFile = new File(absoultePath.toString());
			if (!targetFile.exists()) {
				targetFile.createNewFile();
			}
			multipartFiles.transferTo(targetFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return targetFileName;
	}
	
	
	
	
	@RequestMapping("/createOrUpdateToFind")
	public ModelAndView createOrUpdateToFind(HttpSession session,
			HttpServletRequest request,
			@ModelAttribute("news") News news,
			@RequestParam(defaultValue="",value="editid")String editid){
		ModelAndView modelAndView = new ModelAndView();
		
		String img = this.operateUtil.uploadImg(request);
		
		//上传图片
		if(Common.isNotEmpty(img)){
			
			news.setPicture(img);
		}
		//删除图片
		if(Common.isEmpty(img)&&Common.isEmpty(news.getPicture())){
			news.setPicture(news.getPicture());
		}
		
		
		this.newsService.SaveOrUpdateNews(news,editid);
		

		modelAndView.setViewName("redirect:/news/listNews");

		return modelAndView;
	}*/
	
	
	
	
	
	@RequestMapping("/delete")
	public ModelAndView delete(@RequestParam(defaultValue = "", value = "id") String id) {

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("redirect:/news/listNews");

		String delIds[] = id.split(",");

		for (int i = 0; i < delIds.length; i++) {
			if (Common.isNotEmpty(delIds[i])) {

				News news = this.newsService.findOneById(delIds[i], News.class);

				if (news != null) {

					this.newsService.remove(news);

				}
			}

		}

		return modelAndView;

	}
	
	
	
	
	
	
	
	
	
	

}
