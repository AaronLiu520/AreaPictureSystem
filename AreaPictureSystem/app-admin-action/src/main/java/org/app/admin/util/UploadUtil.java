package org.app.admin.util;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.app.admin.pojo.AdminUser;
import org.app.admin.pojo.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;

public class UploadUtil {

    private static final Logger log = LoggerFactory
            .getLogger(UploadUtil.class);
    static Configure ec= Configure.getInstance();


    /**
     * 资源加载处理
     * @param mpfile
     * @param au
     * @param forderActivityId
     * @return
     */
    public static Resource processResource(MultipartFile mpfile,AdminUser au,String forderActivityId){
        Resource rf = new Resource();//  资源

        CommonsMultipartFile cf = (CommonsMultipartFile) mpfile;
       // DiskFileItem fi = (DiskFileItem) cf.getFileItem();
        // 获取文件（真实）后缀名
        String prefix = FileOperateUtil.getFilePrefix(mpfile.getOriginalFilename());
        // 创建文件的新名字(当前的时间＋后缀)
        String newFileName = new Date().getTime() + prefix;
        // 保存文件的新地址
        StringBuffer path = new StringBuffer(ec.getValueString("resourcesPath"));

        File file= new File(path + newFileName);


        File fileParent = file.getParentFile();
        if(!fileParent.exists()){
            fileParent.mkdirs();
        }

        // 保存上传的文件到新地址
        try {
            FileOutputStream fos = FileUtils.openOutputStream(file);
            IOUtils.copy(mpfile.getInputStream(), fos);
        } catch (IOException e) {
            log.error("上传文件失败,检查文件目录是否存在:"+e.toString());
        }

        rf.setUploadPerson(au.getName());   // 1 上传者
        rf.setBoundId(au.getId());  // 2 绑定公司或个人Id
        rf.setForderActivityId(forderActivityId);   // 3 文件夹Id或活动Id
        rf.setOriginalName(mpfile.getOriginalFilename());// 4 获取原文件（真实）的名字
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
        return rf;
    }
}
