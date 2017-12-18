package org.app.admin.photo.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.app.admin.pojo.AdminCompany;
import org.app.admin.pojo.AdminUser;
import org.app.admin.pojo.Favorites;
import org.app.admin.pojo.ForderActivity;
import org.app.admin.pojo.Label;
import org.app.admin.pojo.Resource;
import org.app.admin.service.FavoritesService;
import org.app.admin.service.ForderActivityService;
import org.app.admin.service.LabelService;
import org.app.admin.service.ResourceService;
import org.app.admin.util.BaseType;
import org.app.admin.util.EditorImgBean;
import org.app.admin.util.FileOperateUtil;
import org.app.admin.util.FileType;
import org.app.admin.util.PhotoTime;
import org.app.admin.util.basetreetime.BaseTreeTime;
import org.app.admin.util.basetreetime.LayerAdmonCompany;
import org.app.admin.util.executor.SingletionThreadPoolExecutor;
import org.app.admin.util.executor.Task;
import org.app.framework.action.GeneralAction;
import org.app.framework.util.CommonEnum;
import org.app.framework.util.Pagination;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
     *  查找图片页面
     * @param session
     * @param type
     * @param activityIndexId
     * @return
     */
    @RequestMapping("/index/{type}")
    public ModelAndView index(HttpSession session,
                              @PathVariable("type")String type,
                              String activityIndexId) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/photo-gallery/photoMessage/list");
        //检查类型
        if(!BaseType.checkType(type))return null;
        modelAndView.addObject("webType",type);


        //TODO 根据type类型，加载不同类型的一级文件夹，然后按时间轴，进行分类。

        Query querylistFA=super.craeteQueryWhere("parentId","0","type",type);

        List<ForderActivity> listFA = this.forderActivityService.find(querylistFA, ForderActivity.class);
        //如果用户是 BASEUTIS

        if(type.equals(BaseType.Type.BASEUTIS.toString())){

            List<PhotoTime> lpt=PhotoTime.getPhotoTime(listFA,null);
            //加载所有的企业
            List<AdminCompany> lac=this.AdminCompanyService.find(new Query(),AdminCompany.class);
            List<LayerAdmonCompany> llac= LayerAdmonCompany.LayerAdmonCompany(lac,lpt);
            List<BaseTreeTime> lbpt= BaseTreeTime.getBaseTreeTime(llac);
            log.info(lbpt.toString());
            modelAndView.addObject("basePhotoTimeList", lbpt);

        }else{
            // 按日期进行分类,并且中当前菜单
            modelAndView.addObject("photoTimeList", PhotoTime.getPhotoTime(listFA,null));
        }
         
        
        
        //TODO 如果 type 是 基本层单位，（中学，小学，幼儿园）
        //标签
        modelAndView.addObject("lableList", labelService.find(new Query(), Label.class));
        //删除当前活动session
        session.removeAttribute("checkActivityId");

        session.setAttribute("",type);

        return modelAndView;// 返回
    }


    /**
     * 选择中对应的主题活动
     * @param pageNo
     * @param pageSize
     * @param session
     * @param checkId
     * @return
     */
    @RequestMapping("/checkActivity/{type}")
    public ModelAndView checkActivity(
            @PathVariable("type")String type,
            @RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
            @RequestParam(value = "pageSize", defaultValue = "12") Integer pageSize,
            @RequestParam(value = "sort", defaultValue = "DESC") String sort,
            @RequestParam(value = "mfregex", defaultValue = "") String mfregex
            ,HttpSession session,String checkId) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/photo-gallery/photoMessage/list");
        //检查类型
        if(!BaseType.checkType(type))return null;
        modelAndView.addObject("webType",type);
        //模糊匹配
         try {
			mfregex=new String(mfregex.getBytes("iso-8859-1"),"utf8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
        log.info("mfregex:"+mfregex);
        Pattern pattern = Pattern.compile(".*?" + mfregex + ".*", Pattern.CASE_INSENSITIVE);
        //查询活动信息
        ForderActivity fa =this.forderActivityService.findOneById(checkId,ForderActivity.class);

        if(checkId!=null) session.setAttribute("checkActivityId",checkId);


        Query querylistFA=super.craeteQueryWhere("parentId","0","type",type);
        List<ForderActivity> listFA = this.forderActivityService.find(querylistFA, ForderActivity.class);


        if(type.equals(BaseType.Type.BASEUTIS.toString())){

            List<PhotoTime> lpt=PhotoTime.getPhotoTime(listFA,fa.getActivityTime());
            //加载所有的企业
            List<AdminCompany> lac=this.AdminCompanyService.find(new Query(),AdminCompany.class);
            List<LayerAdmonCompany> llac= LayerAdmonCompany.LayerAdmonCompany(lac,lpt);
            List<BaseTreeTime> lbpt= BaseTreeTime.getBaseTreeTime(llac);
            log.info(lbpt.toString());
            modelAndView.addObject("basePhotoTimeList", lbpt);

        }else
        {
            // 按日期进行分类,并且中当前菜单
            modelAndView.addObject("photoTimeList", PhotoTime.getPhotoTime(listFA,fa.getActivityTime()));
        }
        
        



        //TODO 如果 type 是 基本层单位，（中学，小学，幼儿园）
        //标签
        modelAndView.addObject("lableList", labelService.find(new Query(), Label.class));


        try {
           
        	Pagination<Resource> pageList = new Pagination<Resource>();
           
        	Query query = new Query();
           
        	if(StringUtils.isNotEmpty(mfregex)){
              query = Query.query(Criteria.where("originalName").regex(pattern));
        	}
        	query.addCriteria(Criteria.where("forderActivityId").is(checkId));
            query.with(new Sort((sort.equals(String.valueOf("DESC")))?Sort.Direction.DESC:Sort.Direction.ASC, "createTime"));
            pageList=this.resourceService.findPaginationByQuery(query, pageNo, pageSize, Resource.class);
            modelAndView.addObject("listPhoto",pageList);
            
             
            
            
            //获取当前用户收藏的图片
            //start
            AdminUser adminUser = (AdminUser) session.getAttribute(CommonEnum.USERSESSION);
            
            if(adminUser != null){
            	
            	Favorites favorites = this.favoritesService.findFavoritesById(adminUser.getId());
            	
            	if(favorites != null && favorites.getResource() != null){
            		
            		 modelAndView.addObject("listFavorites",favorites.getResource());
            	}
            	
            	
            }
            
            //end 
            
            
            
            
            
            
        } catch (Exception e) {
            log.info(e.toString());
        }
        modelAndView.addObject("fa",fa);

        return modelAndView;
    }

  
    

    /**
     *资料上传
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
            HttpSession session,String forderActivityId,
            @RequestParam(value = "file[]", required = false) MultipartFile[] multipartFiles)
            throws IOException {
        //session
        AdminUser au=(AdminUser) session.getAttribute(CommonEnum.USERSESSION);
        SingletionThreadPoolExecutor pool= SingletionThreadPoolExecutor.getInstance();
        log.info("活动ID ："+forderActivityId);

        List<Resource> myfilesList;
        //检查之前是否上传过数据。
        if(session.getAttribute("fileList")!=null){
            myfilesList=(List<Resource>) session.getAttribute("fileList");
        }else{
            myfilesList = new ArrayList<Resource>();// 文件集合
        }



        String fileContainsType = "";// 资源包含的类型

        log.info("上传图片");
        log.info(multipartFiles.toString());
        for (MultipartFile mpfile : multipartFiles) {
            Resource rf = new Resource();// 文件集合


            CommonsMultipartFile cf = (CommonsMultipartFile) mpfile;
            DiskFileItem fi = (DiskFileItem) cf.getFileItem();
            // 获取文件（真实）后缀名
            String prefix = FileOperateUtil.getFilePrefix(mpfile
                    .getOriginalFilename());
            // 获取原文件（真实）的名字
            String originalFileName = mpfile.getOriginalFilename();
            // 创建文件的新名字(当前的时间＋后缀)
            String newFileName = new Date().getTime() + prefix;
            // TODO 保存文件的新地址
            StringBuffer path = new StringBuffer(request.getSession()
                    .getServletContext().getRealPath(File.separator))
                    .append("WEB-INF")
                    .append(File.separator)
                    .append("uploadmr").append(File.separator);


            // 保存上传的文件到新地址
            FileOutputStream fos = FileUtils.openOutputStream(new File(
                    path + newFileName));
            IOUtils.copy(mpfile.getInputStream(), fos);


            rf.setUploadPerson(au.getName());   // 1 上传者
            rf.setBoundId(au.getId());  // 2 绑定公司或个人Id
            rf.setForderActivityId(forderActivityId);   // 3 文件夹Id或活动Id
            rf.setOriginalName(mpfile.getOriginalFilename());// 4 原名
            rf.setOriginalPath(path.toString());// 5 路径

            rf.setExtensionName(prefix);// 7 扩展名
            rf.setGenerateName(newFileName);// 8  生成的文件名

            log.info("后缀名:"+prefix);
            if (FileType.picture.toLowerCase().indexOf(prefix.toLowerCase()) !=-1) {
                rf.setFileType(FileType.picture);// 7 文件类型
            }else if(FileType.video.toLowerCase().toLowerCase().indexOf(prefix.toLowerCase()) !=-1) {
                //TODO video
            }else if(FileType.music.toLowerCase().indexOf(prefix.toLowerCase()) !=-1) {
                //TODO music 音乐
            }else if(FileType.document.toLowerCase().indexOf(prefix.toLowerCase()) !=-1) {
                //TODO  document 文档
            }else if(FileType.compression.toLowerCase().indexOf(prefix.toLowerCase()) !=-1) {
                //TODO compression 压缩
            }else{
                //TODO other 其他
            }

            log.info("文件信息:" + rf.toString());
            // 更新到数据库
            this.resourceService.insert(rf);
            pool.getPool().execute(new Task(rf.getGenerateName(),this.resourceService));

        }

        //返回当前活动的ID
        printWriter.write(forderActivityId);
        printWriter.flush();
        printWriter.close();

    }


    /**
     *  更新  资源描述
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
            @PathVariable("type")String type,
            String activityId, String id,String resourceName,String person,String photographer
    ,String resourceAddress,String description) {
        ModelAndView modelAndView = new ModelAndView();

        if(id!=null){
            Resource r=this.resourceService.findOneById(id,Resource.class);
            if(r.getEditorImgInfo()==null) r.setEditorImgInfo(new EditorImgBean());
                r.getEditorImgInfo().setResourceName(resourceName);
                r.getEditorImgInfo().setPerson(person);
                r.getEditorImgInfo().setPhotographer(photographer);
                r.getEditorImgInfo().setResourceAddress(resourceAddress);
                r.getEditorImgInfo().setDescription(description);
            this.resourceService.save(r);
        }
        modelAndView.setViewName("redirect:/photoMessageAction/checkActivity/"+type+"?checkId="+activityId);

        return modelAndView;
    }


    /**
     * 删除资源
     * @param activityId
     * @param id
     * @param ids
     * @return
     */
    @RequestMapping("/delete/{type}")
    public ModelAndView delete(String activityId,@PathVariable("type")String type,
                               @RequestParam(value = "id", defaultValue = "0") String id,
                               @RequestParam(value = "ids", defaultValue = "0") String ids) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("redirect:/photoMessageAction/checkActivity/"+type+"?checkId="+activityId);
        try {
        	String deleteId[] = id.split(",");
        	for(int i =0;i<deleteId.length;i++){
        		  if (!deleteId[i].isEmpty() && !deleteId[i].equals("0")) {// 删除
                      resourceService.remove(resourceService.findOneById(deleteId[i],Resource.class));
              }
        	}
          
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return modelAndView;
    }

    /**
     * 创建活动
     * @param session
     * @param fa
     * @return
     */
    @RequestMapping("/createActivity/{type}")
    public ModelAndView createActivity( @PathVariable("type")String type,
                                        HttpSession session,ForderActivity fa){
        ModelAndView modelAndView = new ModelAndView();

        AdminUser au=(AdminUser) session.getAttribute(CommonEnum.USERSESSION);
        if(au==null)return null;else fa.setCreatUser(au);
        this.forderActivityService.insert(fa);

        Query query=super.craeteQueryWhere("forderActivityName",fa.getForderActivityName());
        ForderActivity forderActivity=this.forderActivityService.findOneByQuery(query,ForderActivity.class);


        modelAndView.setViewName("redirect:/photoMessageAction/checkActivity/"+type+"?checkId="+forderActivity.getId());

        return modelAndView;
    }

    
    /**
     * 
    * @Title: toMyFavorties 
    * @Description: TODO(将资源放入收藏夹) 
    * @param @param resourceId
    * @param @param session
    * @param @return    设定文件 
    * @return List<Resource>    返回类型 
    * @throws
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
     * 
    * @Title: cancelMyFavorties 
    * @Description: TODO(将资源从收藏夹删除) 
    * @param @param resourceId
    * @param @param session
    * @param @return    设定文件 
    * @return List<Resource>    返回类型 
    * @throws
     */
    @RequestMapping("/cancelMyFavorties")
    @ResponseBody
    public List<Resource>  cancelMyFavorties(@RequestParam(defaultValue="",value="resourceId")String resourceId,HttpSession session){
    	
    	AdminUser adminUser = (AdminUser) session.getAttribute(CommonEnum.USERSESSION);
    	
    	List<Resource> listResource = this.favoritesService.getResource(resourceId);
    	
    
    	boolean flag = this.favoritesService.cancelFavorites(adminUser, listResource);
    	
    	if(flag){

        	return listResource;
    	}
    	return null;
    	
    	
    	
    }
    
    
    
    
    
    
}
