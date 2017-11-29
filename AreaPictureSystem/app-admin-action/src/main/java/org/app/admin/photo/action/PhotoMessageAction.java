package org.app.admin.photo.action;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.app.admin.pojo.*;
import org.app.admin.service.ForderActivityService;
import org.app.admin.service.LabelService;
import org.app.admin.service.ResourceService;
import org.app.admin.util.FileOperateUtil;
import org.app.admin.util.FileType;
import org.app.admin.util.ImageTool;
import org.app.admin.util.PhotoTime;
import org.app.framework.action.GeneralAction;
import org.app.framework.util.CommonEnum;
import org.app.framework.util.Pagination;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

    /**
     *
     * @param session
     * @param type
     * @param activityIndexId
     * @return
     */
    @RequestMapping("/index")
    public ModelAndView index(HttpSession session, String type,String activityIndexId) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/photo-gallery/photoMessage/list");
        //TODO 根据type类型，加载不同类型的一级文件夹，然后按时间轴，进行分类。

        List<ForderActivity> listFA = this.forderActivityService.find(
                super.craeteQueryWhere("parentId", "0"), ForderActivity.class);
        // 按日期进行分类
        modelAndView.addObject("photoTimeList", PhotoTime.getPhotoTime(listFA,null));
        //TODO 如果 type 是 基本层单位，（中学，小学，幼儿园）
        //标签
        modelAndView.addObject("lableList", labelService.find(new Query(), Label.class));

        //删除当前活动session
        session.removeAttribute("checkActivityId");


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
    @RequestMapping("/checkActivity")
    public ModelAndView checkActivity(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
                                       @RequestParam(value = "pageSize", defaultValue = "12") Integer pageSize,
                                       HttpSession session,String checkId) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/photo-gallery/photoMessage/list");
        //查询活动信息
        ForderActivity fa =this.forderActivityService.findOneById(checkId,ForderActivity.class);



        if(checkId!=null)
            session.setAttribute("checkActivityId",checkId);

        List<ForderActivity> listFA = this.forderActivityService.find(
                super.craeteQueryWhere("parentId", "0"), ForderActivity.class);
        // 按日期进行分类,并且中当前菜单
        modelAndView.addObject("photoTimeList", PhotoTime.getPhotoTime(listFA,fa.getActivityTime()));
        //TODO 如果 type 是 基本层单位，（中学，小学，幼儿园）
        //标签
        modelAndView.addObject("lableList", labelService.find(new Query(), Label.class));




        try {
            Pagination<Resource> pageList = new Pagination<Resource>();
            Query query = new Query();
            query.addCriteria(Criteria.where("forderActivityId").is(checkId));
            pageList=this.resourceService.findPaginationByQuery(query, pageNo, pageSize, Resource.class);
            modelAndView.addObject("listPhoto",pageList);
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
            // 保存文件的新地址
            StringBuffer path = new StringBuffer(request.getSession()
                    .getServletContext().getRealPath(File.separator))
                    .append("WEB-INF")
                    .append(File.separator)
                    .append("uploadmr").append(File.separator);

            String NewFilepath = path + newFileName;

            // 保存上传的文件到新地址
            FileOutputStream fos = FileUtils.openOutputStream(new File(
                    NewFilepath));
            IOUtils.copy(mpfile.getInputStream(), fos);

            rf.setId(String.valueOf(new Date().getTime()));//ID
            rf.setUploadPerson(au.getName());   // 1 上传者
            rf.setBoundId(au.getId());  // 1 绑定公司或个人Id
            rf.setForderActivityId(forderActivityId);   // 1 文件夹Id或活动Id

            rf.setOriginalName(mpfile.getOriginalFilename());// 1 资源原名
            rf.setGenerateName(newFileName);// 1  生成的文件名
            rf.setOriginalPath(NewFilepath);// 1 资源路径
            rf.setExtensionName(prefix);// 文件扩展名

            rf.setResourceName(mpfile.getOriginalFilename());//同步一下：3 资源名称

            // 如果是图片，压缩它
            log.info("后缀名:"+prefix);
            if (FileType.picture.toLowerCase().indexOf(prefix.toLowerCase()) !=-1) {
                log.info("图片压缩");
                ImageTool tool = new ImageTool();
                log.info("图片原地址："+path.toString());
                rf.setFileType(FileType.picture);

                // 创建缩略图片
                // compressPic(大图片路径,生成小图片路径,大图片文件名,生成小图片文名,生成小图片宽度,
                // 生成小图片高度,是否等比缩放(默认为true))
                boolean min_imgupdate=tool.compressPic(path.toString(), path.toString(), newFileName,
                        "min_" + newFileName, 200, 200, true);
                boolean middle_imgupdate=tool.compressPic(path.toString(), path.toString(), newFileName,
                        "middle_" + newFileName, 500, 300, true);

                if(min_imgupdate){
                    rf.setMin_generateName(path + "min_"+ newFileName);// 小图
                }else if(middle_imgupdate){
                    rf.setMin_generateName(path + "min_"+ newFileName);// 中图
                }
                rf.setMax_generateName(path + newFileName);// 原图
                rf.setFileType("picture");// 文件夹，图片，文档等
                fileContainsType=FileOperateUtil.fileTypeScreening(fileContainsType,"picture");//父类的图片类型集合

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
        }

        //返回当前活动的ID
        printWriter.write(forderActivityId);
        printWriter.flush();
        printWriter.close();

    }


    /**
     *  更新
     * @param activityId
     * @param id
     * @param resourceName
     * @param person
     * @param photographer
     * @param resourceAddress
     * @param description
     * @return
     */
    @RequestMapping("/update")
    public ModelAndView update(String activityId, String id,String resourceName,String person,String photographer
    ,String resourceAddress,String description) {
        ModelAndView modelAndView = new ModelAndView();

        if(id!=null){
            Resource r=this.resourceService.findOneById(id,Resource.class);
            r.setResourceName(resourceName);
            r.setPerson(person);
            r.setPhotographer(photographer);
            r.setResourceAddress(resourceAddress);
            r.setDescription(description);
            this.resourceService.save(r);
        }
        modelAndView.setViewName("redirect:/photoMessageAction/checkActivity?checkId="+activityId);

        return modelAndView;
    }


    /**
     * 删除资源
     * @param session
     * @param activityId
     * @param id
     * @param ids
     * @return
     */
    @RequestMapping("/delete")
    public ModelAndView delete(String activityId,
                               @RequestParam(value = "id", defaultValue = "0") String id,
                               @RequestParam(value = "ids", defaultValue = "0") String ids) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("redirect:/photoMessageAction/checkActivity?checkId="+activityId);
        try {
            if (!id.isEmpty() && !id.equals("0")) {// 删除
                    resourceService.remove(resourceService.findOneById(id,Resource.class));
            }
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return modelAndView;
    }




}
