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
import org.app.webAdmin.pojo.Index;
import org.app.webAdmin.pojo.Setting;
import org.app.webAdmin.service.IndexService;
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
@RequestMapping("/index")
public class IndexAction extends GeneralAction<Index> {

	@Autowired
	private IndexService indexService;
	
	@Autowired
	private FileOperateUtil operateUtil;



	@RequestMapping("/saveIndex")
	public ModelAndView saveIndex(HttpSession session,
			HttpServletRequest request,
			@RequestParam MultipartFile[] bananaImg,
			@RequestParam MultipartFile[] newsbananaImg,
			@RequestParam MultipartFile[] photographybananaImg,
			@RequestParam MultipartFile[] contestbananaImg,
			@RequestParam MultipartFile[] aboutUsbananaImg,
			@ModelAttribute("index") Index index,
			@RequestParam(defaultValue="",value="editid")String editid) {
		ModelAndView modelAndView = new ModelAndView();
/*		if(Common.isEmpty(index.getBanana())){
			String img = this.operateUtil.uploadImg(request);
			if(Common.isNotEmpty(img)){
				index.setBanana(img);
			}
		}
		*/
		this.indexService.SaveOrUpdateSetting(index,editid,bananaImg,request,newsbananaImg,photographybananaImg,contestbananaImg,aboutUsbananaImg);
		
		session.removeAttribute(CommonEnum.WEBINDEXBANANA);

		modelAndView.setViewName("redirect:/index/list");

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

		modelAndView.setViewName("admin/app-admin/index/index");

		Index index = this.indexService.findOneByQuery(new Query(), Index.class);

		modelAndView.addObject("index", index);

		return modelAndView;

	}
	
	
	@RequestMapping("/delete")
	public ModelAndView delete(String type) {
		ModelAndView modelAndView = new ModelAndView();
		
		if(Common.isNotEmpty(type)){
			
			Index index = this.indexService.findOneByQuery(new Query(), Index.class);
			
			if(index !=null){
				if("banana".equals(type)){
					index.setBanana("");
				}
				if("newsbanana".equals(type)){
					index.setNewsbanana("");
				}
				if("photographybanana".equals(type)){
					index.setPhotographybanana("");
				}
				if("contestbanana".equals(type)){
					index.setContestbanana("");
				}
				if("aboutUsbanana".equals(type)){
					index.setAboutUsbanana("");
				}
			this.indexService.save(index);	
			}
		}
		
		
		modelAndView.setViewName("redirect:/index/list");
		
		return modelAndView;
		
	}

}
