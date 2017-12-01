package org.app.admin.action;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.app.admin.pojo.AdminCompany;
import org.app.admin.pojo.AdminRole;
import org.app.admin.pojo.AdminUser;
import org.app.admin.service.AdminCompanyService;
import org.app.admin.service.AdminRoleService;

import org.app.framework.action.GeneralAction;
import org.app.framework.util.FileOperateUtil;
import org.app.framework.util.PinyinTool;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Company class
 * @author Lau Aaron
 */
@Controller
@RequestMapping("/adminCompany/")
public class AdminCompanyAction extends GeneralAction<AdminCompany> {

	private static final Logger log = LoggerFactory.getLogger(AdminCompanyAction.class);

	@Autowired
	private AdminCompanyService AdminCompanyService;
	
	/**
	 * 查询数据
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/list")
	public ModelAndView list(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/app-admin/company/list");
		session.removeAttribute("error");
		try {
			Query query =new Query();
			modelAndView.addObject("pageList", this.AdminCompanyService.find(query, AdminCompany.class));
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

		return modelAndView;// 返回
	}

	/**
	 * create or update method
	 * @author Aaron Lau
	 * @param session
	 * @param adminCompany
	 * @return
	 */
	@RequestMapping("/createOrUpdateToFind")
	public ModelAndView list(HttpSession session, AdminCompany adminCompany) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/adminCompany/list");
		try {
			if (adminCompany != null) {
				if (adminCompany.getId() == null) {
					// 添加用户时，检用户帐号是否已经存在
					int checkEmail=this.AdminCompanyService.findCountByQuery(
							super.craeteQueryWhere("email", adminCompany.getEmail()), AdminCompany.class);
					if (checkEmail>0)
						session.setAttribute("error", "添加失败，您添加的帐号信息已经存在。");
					else {
						//添加用户信息
						//TODO
						this.AdminCompanyService.insert(adminCompany);
					}
				} else
					this.AdminCompanyService.save(adminCompany);
			}
			log.info(adminCompany.toString());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return modelAndView;// 返回
	}

	/**
	 * 编缉 或 添加
	 *
	 * @param session
	 * @param id
	 * @return
	 */
	@RequestMapping("/editor")
	public ModelAndView editor(HttpSession session, String id) {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/app-admin/company/editor");
		try {
			if (id != null && id != "") {
				modelAndView.addObject("bean", this.AdminCompanyService.findOneById(id, AdminCompany.class));
				//TODO 查询企业性质、企业类型。
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return modelAndView;// 返回
	}

	/**
	 * 删除与批量删除
	 *
	 * @param id
	 * @param ids
	 * @return
	 */
	@RequestMapping("/delete")
	public ModelAndView delete(HttpSession session, @RequestParam(value = "id", defaultValue = "0") String id,
			@RequestParam(value = "ids", defaultValue = "0") String ids) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/adminCompany/list");
		try {
			if (!id.isEmpty() && !id.equals("0")) {// 删除
				AdminCompany am = this.AdminCompanyService.findOneById(id, AdminCompany.class);
				AdminCompanyService.remove(am);

			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return modelAndView;
	}


	
	
	
	
	
	
	
	
	/***
	 * 文件上传
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "static-access", "unused" })
	@RequestMapping(value = "upload")  
    public ModelAndView upload(AdminCompany adminCompany,HttpServletRequest request,HttpSession session,RedirectAttributes attr) {  
		System.out.println("上传文件");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/adminCompany/list");
		String error="";
        try{
		Map<String, Object> map = new HashMap<String, Object>();  
        // 别名  
        String upname="WEB-INF"+File.separator+"FileUpload"+File.separator+"company";
        //可以上传的文件格式
       log.info("准备上传企业单位数据");
        String filetype[]={"xls,xlsx"};
        List<Map<String, Object>> result = FileOperateUtil.upload(request,upname,filetype);  
       log.info("上传文件成功");
        boolean has= (Boolean) result.get(0).get("hassuffix");
        
        if(has!=false){
          	//获得上传的xls文件路径
            String path=(String) result.get(0).get("savepath");
            	File file=new File(path);
            	//知道导入返回导入结果
            	 error =this.AdminCompanyService.BatchImport(file, 1);
            	 
     		       attr.addFlashAttribute("error",error);
          //  map.put("result", result);  
           return new ModelAndView("redirect:/adminCompany/list"); 
     		     //  return modelAndView;
        }
        }catch(Exception e){
        	modelAndView.addObject("error", e);
        	 return new ModelAndView("redirect:/adminCompany/list"); 
        	
        }
        
        
        return modelAndView;
      
    }  
	
	/**
	 * 文件下载
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
    @RequestMapping(value = "download")  
    public ModelAndView download(HttpServletRequest request,HttpServletResponse response) throws Exception {  
        String storeName = "企业信息导入模版.xlsx";  
        String contentType = "application/octet-stream";  
        String UPLOAD="WEB-INF/Template/company/";
        FileOperateUtil.download(request, response, storeName, contentType,UPLOAD);  
  
        return null;  
    }  
	
    
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
