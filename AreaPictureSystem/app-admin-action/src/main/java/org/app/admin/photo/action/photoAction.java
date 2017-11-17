package org.app.admin.photo.action;

import org.app.admin.pojo.AdminUser;
import org.app.framework.action.GeneralAction;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/picture")
public class photoAction extends GeneralAction<AdminUser> {
    private static final Logger log = LoggerFactory
            .getLogger(org.app.admin.action.AdminUserAction.class);


    @RequestMapping("/areaIndex")
    public ModelAndView areaIndex(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/photo-gallery/area/index");//登录页面

        return modelAndView;// 返回
    }

    @RequestMapping("/basicLevelIndex")
    public ModelAndView basicLevelIndex(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/photo-gallery/basicLevel/index");//登录页面

        return modelAndView;// 返回
    }

    @RequestMapping("/directlyIndex")
    public ModelAndView directlyIndex(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/photo-gallery/directly/index");//登录页面

        return modelAndView;// 返回
    }

    @RequestMapping("/persionIndex")
    public ModelAndView persionIndex(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/photo-gallery/persion/index");//登录页面

        return modelAndView;// 返回
    }
}
