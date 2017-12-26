package org.app.admin.photo.action;

import org.apache.commons.lang.StringUtils;
import org.app.admin.annotation.SystemControllerLog;
import org.app.admin.annotation.SystemErrorLog;
import org.app.admin.pojo.*;
import org.app.admin.service.FavoritesService;
import org.app.admin.service.ForderActivityService;
import org.app.admin.service.LabelService;
import org.app.admin.service.ResourceService;
import org.app.admin.util.*;
import org.app.admin.util.BaseType.Type;
import org.app.admin.util.basetreetime.BaseTreeTime;
import org.app.admin.util.basetreetime.LayerAdmonCompany;
import org.app.admin.util.executor.SingletionThreadPoolExecutor;
import org.app.admin.util.executor.Task;
import org.app.framework.action.GeneralAction;
import org.app.framework.util.CommonEnum;
import org.app.framework.util.Pagination;
import org.app.framework.util.ZipCompress;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

@Controller
@RequestMapping("/photoMessageAction")
public class PhotoMessageAction extends GeneralAction<ForderActivity> {

    private static final Logger log = LoggerFactory
            .getLogger(PhotoMessageAction.class);

    @Autowired
    private ForderActivityService forderActivityService;
    @Autowired
    private LabelService labelService;//标签
    @Autowired
    private ResourceService resourceService;//资源（图片）
    @Autowired
    private org.app.admin.service.AdminCompanyService AdminCompanyService;
    @Autowired
    private FavoritesService favoritesService;


    /**
     * 查找图片页面
     *
     * @param session
     * @param type
     * @param activityIndexId
     * @return
     */
    @RequestMapping("/index/{type}")
    public ModelAndView index(HttpSession session,
                              @PathVariable("type") String type,
                              String activityIndexId) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/photo-gallery/photoMessage/list");
        //检查类型
        if (!BaseType.checkType(type)) return null;
        modelAndView.addObject("webType", type);
        AdminUser adminUser = (AdminUser) session.getAttribute(CommonEnum.USERSESSION);

        //TODO 根据type类型，加载不同类型的一级文件夹，然后按时间轴，进行分类。

        Query querylistFA = super.craeteQueryWhere("parentId", "0", "type", type);

        List<ForderActivity> listFA = this.forderActivityService.find(querylistFA, ForderActivity.class);
        //如果用户是 BASEUTIS

        if (type.equals(BaseType.Type.BASEUTIS.toString())) {

            List<PhotoTime> lpt = PhotoTime.getPhotoTime(listFA, null);
            //加载所有的企业
            List<AdminCompany> lac = this.AdminCompanyService.find(new Query(), AdminCompany.class);

            modelAndView.addObject("listAdminCompany",lac);

            List<LayerAdmonCompany> llac = LayerAdmonCompany.LayerAdmonCompany(lac, lpt);
            List<BaseTreeTime> lbpt = BaseTreeTime.getBaseTreeTime(llac);
            log.info(lbpt.toString());
            modelAndView.addObject("basePhotoTimeList", lbpt);

        }else if(type.equals(BaseType.Type.PERSION.toString())){
        	  modelAndView.addObject("photoTimeList",
                      getPhotoTimeListByPersionId(BaseType.Type.PERSION.toString(), null,adminUser.getId()));
        }else {
            // 按日期进行分类,并且中当前菜单
            modelAndView.addObject("photoTimeList", PhotoTime.getPhotoTime(listFA, null));
        }
         
        
        
        //TODO 如果 type 是 基本层单位，（中学，小学，幼儿园）
        //标签
        modelAndView.addObject("lableList", labelService.find(new Query(), Label.class));
        //删除当前活动session
        session.removeAttribute("checkActivityId");

        session.setAttribute("", type);

        return modelAndView;// 返回
    }

    

    public List<PhotoTime> getPhotoTimeListByPersionId(String type,String check,String boundId){

        Query query=super.craeteQueryWhere("type",type,"parentId", "0","boundId",boundId);
        List<ForderActivity> listFA = this.forderActivityService.find(query, ForderActivity.class);
        return PhotoTime.getPhotoTime(listFA,check);
    }
    

    /**
     * 选择中对应的主题活动
     *
     * @param pageNo
     * @param pageSize
     * @param session
     * @param checkId
     * @return
     */
    @RequestMapping("/checkActivity/{type}")
    public ModelAndView checkActivity(
            @PathVariable("type") String type,
            @RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
            @RequestParam(value = "pageSize", defaultValue = "12") Integer pageSize,
            @RequestParam(value = "sort", defaultValue = "DESC") String sort,
            @RequestParam(value = "mfregex", defaultValue = "") String mfregex
            , HttpSession session, String checkId) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/photo-gallery/photoMessage/list");
        //检查类型
        if (!BaseType.checkType(type)) return null;
        modelAndView.addObject("webType", type);
        AdminUser adminUser = (AdminUser) session.getAttribute(CommonEnum.USERSESSION);
        //模糊匹配
        try {
            mfregex = new String(mfregex.getBytes("iso-8859-1"), "utf8");
        } catch (UnsupportedEncodingException e1) {
            e1.printStackTrace();
        }
        log.info("mfregex:" + mfregex);
        Pattern pattern = Pattern.compile(".*?" + mfregex + ".*", Pattern.CASE_INSENSITIVE);
        //查询活动信息
        ForderActivity fa = this.forderActivityService.findOneById(checkId, ForderActivity.class);

        if (checkId != null) session.setAttribute("checkActivityId", checkId);
        Query querylistFA=new Query();
        //如果用户是个人
        if (type.equals(BaseType.Type.PERSION.toString())) {
        	querylistFA= super.craeteQueryWhere("parentId", "0", "type", type,"boundId",adminUser.getId());

        }else{
         querylistFA = super.craeteQueryWhere("parentId", "0", "type", type);
        }
        List<ForderActivity> listFA = this.forderActivityService.find(querylistFA, ForderActivity.class);




        //如果用户是 BASEUTIS

        if (type.equals(BaseType.Type.BASEUTIS.toString())) {


            List<PhotoTime> lpt = PhotoTime.getPhotoTime(listFA, fa.getActivityTime());
            //加载所有的企业
            List<AdminCompany> lac = this.AdminCompanyService.find(new Query(), AdminCompany.class);
            modelAndView.addObject("listAdminCompany",lac);
            List<LayerAdmonCompany> llac = LayerAdmonCompany.LayerAdmonCompany(lac, lpt);
            List<BaseTreeTime> lbpt = BaseTreeTime.getBaseTreeTime(llac);
            log.info(lbpt.toString());
            modelAndView.addObject("basePhotoTimeList", lbpt);

        } else {

            // 按日期进行分类,并且中当前菜单
            modelAndView.addObject("photoTimeList", PhotoTime.getPhotoTime(listFA, fa.getActivityTime()));
        }

        //TODO 如果 type 是 基本层单位，（中学，小学，幼儿园）
        //标签
        modelAndView.addObject("lableList", labelService.find(new Query(), Label.class));


        try {

            Pagination<Resource> pageList = new Pagination<Resource>();

            Query query = new Query();

            if (StringUtils.isNotEmpty(mfregex)) {
                query = Query.query(Criteria.where("originalName").regex(pattern));
                modelAndView.addObject("mfregex", mfregex);
            }
            query.addCriteria(Criteria.where("forderActivityId").is(checkId));
            query.with(new Sort((sort.equals(String.valueOf("DESC"))) ? Sort.Direction.DESC : Sort.Direction.ASC, "createTime"));
            pageList = this.resourceService.findPaginationByQuery(query, pageNo, pageSize, Resource.class);
            modelAndView.addObject("listPhoto", pageList);


            //获取当前用户收藏的图片
            //start

            if (adminUser != null) {

                Favorites favorites = this.favoritesService.findFavoritesById(adminUser.getId());

                if (favorites != null && favorites.getResource() != null) {

                    modelAndView.addObject("listFavorites", favorites.getResource());
                }


            }

            //end 


        } catch (Exception e) {
            log.info(e.toString());
        }
        modelAndView.addObject("fa", fa);

        return modelAndView;
    }
    /**
     * 资料上传
     *
     * @param request
     * @param printWriter
     * @param session
     * @param forderActivityId
     * @param multipartFiles
     * @throws IOException
     */
    @RequestMapping("/uploadFile")
    public void uploadFile(
            HttpServletRequest request,
            PrintWriter printWriter,
            HttpSession session, String forderActivityId,
            @RequestParam(value = "file[]", required = false) MultipartFile[] multipartFiles)
           {
        //获取 用户 session
        AdminUser au = (AdminUser) session.getAttribute(CommonEnum.USERSESSION);
        ForderActivity f=forderActivityService.findForderById(forderActivityId);
        String pd=null;
        if(f.getType()==BaseType.Type.PERSION) {
        	pd="PERSION";
        }

        log.info("上传图片+活动ID"+ forderActivityId);
        
        for (MultipartFile mpfile : multipartFiles) {
        	
            Resource rf = UploadUtil.processResource(mpfile, au, forderActivityId,pd);
            log.info("文件信息:" + rf.toString());
            // 更新到数据库
            this.resourceService.insert(rf);
            SingletionThreadPoolExecutor.getInstance()
                    .getPool().execute(new Task(rf.getGenerateName(), this.resourceService));
        }

        //返回当前活动的ID
        printWriter.write(forderActivityId);
        printWriter.flush();
        printWriter.close();

    }


    /**
     * 更新  资源描述
     *
     * @param activityId
     * @param id
     * @param resourceName
     * @param person
     * @param photographer
     * @param resourceAddress
     * @param description
     * @return
     */
    @RequestMapping("/update/{type}")
    public ModelAndView update(
            @PathVariable("type") String type,
            String activityId, String id, String resourceName, String person, String photographer
            , String resourceAddress, String description) {
        ModelAndView modelAndView = new ModelAndView();

        if (id != null) {
            Resource r = this.resourceService.findOneById(id, Resource.class);
            if (r.getEditorImgInfo() == null) r.setEditorImgInfo(new EditorImgBean());
            r.getEditorImgInfo().setResourceName(resourceName);
            r.getEditorImgInfo().setPerson(person);
            r.getEditorImgInfo().setPhotographer(photographer);
            r.getEditorImgInfo().setResourceAddress(resourceAddress);
            r.getEditorImgInfo().setDescription(description);
            this.resourceService.save(r);
        }
        modelAndView.setViewName("redirect:/photoMessageAction/checkActivity/" + type + "?checkId=" + activityId);

        return modelAndView;
    }


    /**
     * 删除资源
     *
     * @param activityId
     * @param id
     * @param ids
     * @return
     */
    @RequestMapping("/delete/{type}")
    public ModelAndView delete(String activityId, @PathVariable("type") String type,
                               @RequestParam(value = "id", defaultValue = "0") String id,
                               @RequestParam(value = "ids", defaultValue = "0") String ids) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("redirect:/photoMessageAction/checkActivity/" + type + "?checkId=" + activityId);
        try {
            String deleteId[] = id.split(",");
            for (int i = 0; i < deleteId.length; i++) {
                if (!deleteId[i].isEmpty() && !deleteId[i].equals("0")) {// 删除
                    resourceService.remove(resourceService.findOneById(deleteId[i], Resource.class));
                }
            }

        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return modelAndView;
    }

    /**
     * 创建活动
     *
     * @param session
     * @param fa
     * @return
     */
    @RequestMapping("/createActivity/{type}")
    public ModelAndView createActivity(@PathVariable("type") String type,
                                       HttpSession session, ForderActivity fa) {
        ModelAndView modelAndView = new ModelAndView();

        AdminUser au = (AdminUser) session.getAttribute(CommonEnum.USERSESSION);
        if (au == null) return null;
        else
        	fa.setCreatUser(au);
        if(au.getAdminCompany()!=null){
        	fa.setAdminCompany(au.getAdminCompany());
        }
        
        log.info(fa.getBoundId());
        this.forderActivityService.insert(fa);

        Query query = super.craeteQueryWhere("forderActivityName", fa.getForderActivityName());
        ForderActivity forderActivity = this.forderActivityService.findOneByQuery(query, ForderActivity.class);


        modelAndView.setViewName("redirect:/photoMessageAction/checkActivity/" + type + "?checkId=" + forderActivity.getId());

        return modelAndView;

    }


    /**
     * @param @param  resourceId
     * @param @param  session
     * @param @return 设定文件
     * @return List<Resource>    返回类型
     * @throws
     * @Title: toMyFavorties
     * @Description: TODO(将资源放入收藏夹)
     */

    @RequestMapping("/toMyFavorties")
    @ResponseBody
    public List<Resource> toMyFavorties(@RequestParam(defaultValue="",value="resourceId")String resourceId,HttpSession session){
    	
    	AdminUser adminUser = (AdminUser) session.getAttribute(CommonEnum.USERSESSION);
    	
    	List<Resource> listResource = this.favoritesService.getResource(resourceId);
    	
    	boolean flag = this.favoritesService.toSaveFavorites(adminUser, listResource);
    	
    	if(flag){

        	return listResource;
    	}
    	return null;
    }
    
 

    /**
     * @param @param  resourceId
     * @param @param  session
     * @param @return 设定文件
     * @return List<Resource>    返回类型
     * @throws
     * @Title: cancelMyFavorties
     * @Description: TODO(将资源从收藏夹删除)
     */
    @RequestMapping("/cancelMyFavorties")
    @ResponseBody
    public List<Resource> cancelMyFavorties(@RequestParam(defaultValue = "", value = "resourceId") String resourceId, HttpSession session) {

        AdminUser adminUser = (AdminUser) session.getAttribute(CommonEnum.USERSESSION);

        List<Resource> listResource = this.favoritesService.getResource(resourceId);


        boolean flag = this.favoritesService.cancelFavorites(adminUser, listResource);

        if (flag) {

            return listResource;
        }
        return null;


    }


    /**
     * 文件打包下载
     *
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "download")
    @SystemErrorLog(description = "图片打包下载出错")
    @SystemControllerLog(description = "图片打包下载")
    @Scope("singleto")
    public ModelAndView download(HttpServletRequest request, HttpServletResponse response, String id) throws Exception {

        //1.获取所有需要下载的图片id
        //2.将所有下载图片的路径转换成List<File>
        List<File> listFile = this.resourceService.getImageFile(id);

        String temporary = "WEB-INF" + File.separator + "Template" + File.separator + "Temporary" + File.separator;

        //3.创建服务器临时文件目录
        String UPLOAD = request.getSession().getServletContext().getRealPath("/");

        log.info("临时压缩包目录：" + UPLOAD + temporary);
        //获取临时压缩文件
        String storeName = ZipCompress.getZipFilename();
        log.info("压缩文件：" + storeName);

        File zipfile = new File(UPLOAD + temporary + storeName);

        ZipCompress.zipFile(listFile, zipfile);

        //4.执行打包操作并且下载
        String contentType = "application/octet-stream";

        try {
            FileOperateUtil.download(request, response, storeName, contentType, temporary);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            ZipCompress.deleteFile(zipfile);
        }
        return null;
    }
    
    
    
    
    
    @RequestMapping("/findMyFavorites")
    public ModelAndView findMyFavorites(HttpSession session,
            @RequestParam(value = "sort", defaultValue = "DESC") String sort,
            @RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
            @RequestParam(value = "pageSize", defaultValue = "28") Integer pageSize,
            @RequestParam(value = "mfregex", defaultValue = "") String mfregex){

    	ModelAndView modelAndView = new ModelAndView();
    	
    	 modelAndView.setViewName("admin/photo-gallery/photoMessage/myFavorites");
    	 
    	 AdminUser adminUser = (AdminUser) session.getAttribute(CommonEnum.USERSESSION);
    	 
    	 Favorites favorites = new Favorites();
    	 
    	 List<Resource> listfavorites = new ArrayList<Resource>();
    
    	 
    	 Pagination<Resource> pagination =null;
			
    	 
    	 if(adminUser!=null){
    		 //查询所有我收藏的资源
    		 favorites =this.favoritesService.findFavoritesById(adminUser.getId());
    		 
    		 if(favorites.getResource().size()>0){
    			 
    			 listfavorites = favorites.getResource();
    		 
    		 }
    		
    	 }
    	 if(pagination==null)
				pagination = new Pagination<Resource>(pageNo, pageSize, listfavorites.size());
    	 		List<Resource> list2=new ArrayList<Resource>();
    	 	int pN=0;
			int pS=0;
			if(pageNo==1){
				pN=0;
				pS=10;
			}else{
				pN=(pageNo-1)*10;
				pS=pageNo*pageSize;
			}
			for(int i=pN;i<pS;i++){
				if(i<listfavorites.size()){
					list2.add(listfavorites.get(i));
				}
				
				
			}
			pagination.setDatas(list2);
    	 
    	 
    	 modelAndView.addObject("pagination", pagination);
    	 
    	return modelAndView;
    	
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


}
