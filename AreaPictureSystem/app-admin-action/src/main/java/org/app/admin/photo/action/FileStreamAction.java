package org.app.admin.photo.action;


import org.apache.commons.lang.StringUtils;
import org.app.admin.annotation.SystemControllerLog;
import org.app.admin.annotation.SystemErrorLog;
import org.app.admin.pojo.Resource;
import org.app.admin.service.ResourceService;
import org.app.admin.util.ConfigFileUtil;
import org.app.admin.util.FileType;
import org.app.admin.util.ResponseTools;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.UnsupportedEncodingException;

@Controller
@RequestMapping("/file")
public class FileStreamAction {
    private static final Logger log = LoggerFactory
            .getLogger(FileStreamAction.class);

    @Autowired
    private ResourceService resourceService;//资源（图片）


    /**
     * 取當前的缩略图片
     *
     * @param id
     * @param response
     */
	@SystemErrorLog(description="获取缩略图出错")
//	@SystemControllerLog(description = "获取缩略图")
    @RequestMapping("/getImg/{id}")
    public void getThumbnailsImage(@PathVariable(value = "id")  String id , String type,
                                   HttpServletResponse response, HttpServletRequest request) {


            Resource r = resourceService.findOneById(id, Resource.class);

            if (r == null )  return;

                if (FileType.picture.toLowerCase().indexOf(r.getExtensionName()) != -1) {

                    StringBuffer buffer;

                    try {
                        if (r.getImgCompressionBean() != null && r.getImgCompressionBean().getMin_generateName()!="") {
                            //获取不同图片的大小
                            if (type.equals("min")) {
                                buffer = new StringBuffer(r.getOriginalPath() + r.getImgCompressionBean().getMin_generateName());
                            } else if (type.equals("middle")) {
                                buffer = new StringBuffer(r.getOriginalPath() + r.getImgCompressionBean().getMiddle_generateName());
                            } else if (type.equals("max")) {
                                buffer = new StringBuffer(r.getOriginalPath() + r.getImgCompressionBean().getMax_generateName());
                            } else {
                                buffer = new StringBuffer(r.getOriginalPath() + r.getGenerateName());
                            }
                        }else {
                            //原图
                            buffer = new StringBuffer(r.getOriginalPath() + r.getGenerateName());
                        }
                    }catch (Exception e){
                            buffer = new StringBuffer(r.getOriginalPath() + r.getGenerateName());
                    }

                    try {
                        log.info("访问缩略图片的路径：{}", buffer.toString());
                        File file = new File(buffer.toString());
                        FileInputStream is = new FileInputStream(file);
                        ResponseTools.responsePicture(response, is);
                    } catch (Exception e) {
                        log.error(e.toString());
                    }


            }



    }
}
