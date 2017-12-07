package org.app.admin.photo.action;

import org.app.admin.pojo.AdminCompany;
import org.app.admin.pojo.AdminUser;
import org.app.admin.pojo.ForderActivity;
import org.app.admin.service.ForderActivityService;
import org.app.admin.service.ResourceService;
import org.app.admin.util.PhotoTime;
import org.app.admin.util.basetreetime.BaseTreeTime;
import org.app.admin.util.basetreetime.LayerAdmonCompany;
import org.app.framework.action.GeneralAction;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/picture")
public class photoAction extends GeneralAction<AdminUser> {
    private static final Logger log = LoggerFactory
            .getLogger(photoAction.class);
    
    @Autowired
    private ResourceService resourceService;//资源（图片）
    @Autowired
    private ForderActivityService forderActivityService;
    @Autowired
    private org.app.admin.service.AdminCompanyService AdminCompanyService;

    @RequestMapping("/areaIndex")
    public ModelAndView areaIndex(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/photo-gallery/area/index");//登录页面
        //每日上传统计
        List list = this.resourceService.getMonthUploadNum();
        modelAndView.addObject("uploadList", list);
        //TODO 根据type类型，加载不同类型的一级文件夹，然后按时间轴，进行分类。

        // 按日期进行分类 创建枚举类 QUYU表示区域级 ZHISHU 直属 GEREN 个人
        modelAndView.addObject("photoTimeList",
                getPhotoTimeList(String.valueOf(ForderActivity.Type.QUYU),null));
        return modelAndView;// 返回
    }



    @RequestMapping("/directlyIndex")
    public ModelAndView directlyIndex(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/photo-gallery/directly/index");//登录页面


        // 按日期进行分类 创建枚举类 QUYU表示区域级 ZHISHU 直属  GEREN 个人
        modelAndView.addObject("photoTimeList",
                getPhotoTimeList(String.valueOf(ForderActivity.Type.ZHISHU),null));



        return modelAndView;// 返回
    }


    @RequestMapping("/basicLevelIndex")
    public ModelAndView basicLevelIndex(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/photo-gallery/basicLevel/index");//登录页面


        List<PhotoTime> lpt= getPhotoTimeList(String.valueOf(ForderActivity.Type.BASE),null);

        //加载所有的企业
        List<AdminCompany> lac=this.AdminCompanyService.find(new Query(),AdminCompany.class);

        List<LayerAdmonCompany> llac= LayerAdmonCompany.LayerAdmonCompany(lac,lpt);

        List<BaseTreeTime> lbpt= BaseTreeTime.getBaseTreeTime(llac);

        log.info(lbpt.toString());

        modelAndView.addObject("basePhotoTimeList", lbpt);


        return modelAndView;// 返回
    }


    @RequestMapping("/persionIndex")
    public ModelAndView persionIndex(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/photo-gallery/persion/index");//登录页面


        return modelAndView;// 返回
    }



    public List<PhotoTime> getPhotoTimeList(String type,String check){

        Query query=super.craeteQueryWhere("type",type,"parentId", "0");
        List<ForderActivity> listFA = this.forderActivityService.find(query, ForderActivity.class);

        return PhotoTime.getPhotoTime(listFA,check);
    }

}
