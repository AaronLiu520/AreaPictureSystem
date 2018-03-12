package org.app.admin.photo.action;

import org.apache.commons.lang.StringUtils;
import org.app.admin.annotation.SystemControllerLog;
import org.app.admin.annotation.SystemErrorLog;
import org.app.admin.interceptor.LoginInterceptor;
import org.app.admin.pojo.AdminCompany;
import org.app.admin.pojo.AdminUser;
import org.app.admin.util.BaseType;
import org.app.admin.util.BasesultBean;
import org.app.admin.pojo.ForderActivity;
import org.app.admin.pojo.UploadFileLog;
import org.app.admin.service.ForderActivityService;
import org.app.admin.service.ResourceService;
import org.app.admin.service.StatisticsService;
import org.app.admin.util.PhotoTime;
import org.app.admin.util.uploadStatistics;
import org.app.admin.util.basetreetime.BaseTreeTime;
import org.app.admin.util.basetreetime.LayerAdmonCompany;
import org.app.framework.action.GeneralAction;
import org.app.framework.util.CommonEnum;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/picture")
public class photoAction extends GeneralAction<AdminUser> {
    private static final Logger log = LoggerFactory
            .getLogger(photoAction.class);
    
    
	@Autowired
	private StatisticsService statisticsService;
    @Autowired
    private ResourceService resourceService;//资源（图片）
    @Autowired
    private ForderActivityService forderActivityService;
    @Autowired
    private org.app.admin.service.AdminCompanyService AdminCompanyService;
    
    
	@SystemErrorLog(description="区域图片库出错")
    @RequestMapping("/areaIndex")
    public ModelAndView areaIndex(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/photo-gallery/area/index");//登录页面
        //每日上传统计
        List<String> forderActivityList=this.getforderActivityList(BaseType.Type.AREA.toString(),null);
        List list = this.resourceService.getMonthUploadNum(forderActivityList,null);
        modelAndView.addObject("uploadList", list);
        //TODO 根据type类型，加载不同类型的一级文件夹，然后按时间轴，进行分类。
        // 按日期进行分类 创建枚举类 QUYU表示区域级 ZHISHU 直属 GEREN 个人
        modelAndView.addObject("photoTimeList",  getPhotoTimeList(BaseType.Type.AREA.toString(),null,true,session));
        return modelAndView;// 返回
    }
    
    /**
     * 个人图片库
     * @param session
     * @return
     */
	@SystemErrorLog(description="个人图片库出错")
    @RequestMapping("/gerenIndex")
    public ModelAndView gerenIndex(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/photo-gallery/persion/index");//登录页面
        //每日上传统计
        AdminUser adminUser = (AdminUser) session.getAttribute(CommonEnum.USERSESSION);
        List<String> forderActivityList=this.getforderActivityList(BaseType.Type.PERSION.toString(),adminUser.getId());
        List list = this.resourceService.getMonthUploadNum(forderActivityList,null);
        modelAndView.addObject("uploadList1", list);
        //TODO 根据type类型，加载不同类型的一级文件夹，然后按时间轴，进行分类。
        // 按日期进行分类 创建枚举类 QUYU表示区域级 ZHISHU 直属 GEREN 个人
        modelAndView.addObject("photoTimeList1",getPhotoTimeListByPersionId(BaseType.Type.PERSION.toString(), null,adminUser.getId(),false,session));
        return modelAndView;// 返回
    }
    
   /**
    * 获取Type和boundId的文件夹ID的集合
    * 
    * @return List<String>
    */
   
	@SystemErrorLog(description="查询所有活动")
    public List<String>  getforderActivityList(String type,String boundId){
    	 Query query=new Query();
    	 //判断是个人则查询条件为boundId
    	 if(StringUtils.isNotEmpty(type)&&type==BaseType.Type.PERSION.toString()) {
    	 if(StringUtils.isNotEmpty(boundId)){
    		 query.addCriteria(Criteria.where("boundId").is(boundId));
    	  }
    	 }
    	//判断是直属则查询条件为boundId
    	 if(StringUtils.isNotEmpty(type)&&type==BaseType.Type.DIRECTLYUTIS.toString()) {
    	 if(StringUtils.isNotEmpty(boundId)){
    		 query.addCriteria(Criteria.where("boundCompany").is(boundId));
    	  }
    	 }
    	
         query.addCriteria(Criteria.where("listType.type").is(type));
         List<ForderActivity> lf=forderActivityService.find(query, ForderActivity.class);
         List<String> forderActivityList=new ArrayList<String>();
         for (ForderActivity forderActivity : lf) {
			forderActivityList.add(forderActivity.getId());
		}
          return forderActivityList;
    }

    /**
     * 个人上传记录
     * @param session
     * @return
     */
	@SystemErrorLog(description="查询个人上传记录出错")
    @RequestMapping("/uploadfilelog")
    public ModelAndView upLoadFileLog(HttpSession session) {
    	ModelAndView modelAndView = new ModelAndView();
        log.info("uploadfilelog");
        AdminUser adminUser = (AdminUser) session.getAttribute(CommonEnum.USERSESSION);
        List<UploadFileLog> lufl=resourceService.findUploadFileLogByBoundId(adminUser.getId());
    	modelAndView.addObject("uploadLogList", lufl);
        modelAndView.setViewName("admin/app-admin/user/uploadfilelog");
    	return modelAndView;
    }
    
    
	@SystemErrorLog(description="查询直属出错")
    @RequestMapping("/directlyIndex")
    public ModelAndView directlyIndex(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/photo-gallery/directly/index");//登录页面
        // 按日期进行分类 创建枚举类 QUYU表示区域级 ZHISHU 直属  GEREN 个人
        AdminUser adminUser = (AdminUser) session.getAttribute(CommonEnum.USERSESSION);
        //直属按照活动文件夹的DIRECTLYUTIS的Type和所属adminCompany的id进行判断.
        List<String> forderActivityList=this.getforderActivityList(BaseType.Type.DIRECTLYUTIS.toString(),adminUser.getAdminCompany().getId());
        List list = this.resourceService.getMonthUploadNum(forderActivityList,null);
        modelAndView.addObject("uploadList1", list);
        modelAndView.addObject("photoTimeList",getPhotoTimeList(BaseType.Type.DIRECTLYUTIS.toString(),null,true,session));
        return modelAndView;// 返回
    }

	@SystemErrorLog(description="查询基层出错")
    @RequestMapping("/basicLevelIndex")
    public ModelAndView basicLevelIndex(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/photo-gallery/basicLevel/index");//登录页面
//        AdminUser adminUser = (AdminUser) session.getAttribute(CommonEnum.USERSESSION);
        List<PhotoTime> lpt= getPhotoTimeList(String.valueOf(BaseType.Type.BASEUTIS.toString()),null,false,session);
        //加载所有的企业
        List<AdminCompany> lac=this.AdminCompanyService.find(new Query(),AdminCompany.class);
        LoginInterceptor  lo = new LoginInterceptor();
        List<LayerAdmonCompany> llac= lo.LayerAdmonCompany(lac,session,"");
        List<BaseTreeTime> lbpt= BaseTreeTime.getBaseTreeTime(llac,session);
        List<BasesultBean> list = this.statisticsService.sortupload(null,BaseType.Type.BASEUTIS.toString());
        Random random=new Random();
        for (BasesultBean basesultBean : list) {
        	basesultBean.setStr(random.nextInt(10)+","+random.nextInt(10)+","
        			+random.nextInt(10)+","+random.nextInt(10)+","+random.nextInt(10)+","+random.nextInt(10)
        			);
		}
        modelAndView.addObject("basePhotoTimeList", lbpt);
        modelAndView.addObject("list", list);
        return modelAndView;// 返回
    }

    @RequestMapping("/tubiao")
    public ModelAndView tubiao(HttpSession session) {
    	ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/photo-gallery/tubiao/index");
        AdminUser adminUser = (AdminUser) session.getAttribute(CommonEnum.USERSESSION);
        //区域
        List<String> forderActivityListarea=this.getforderActivityList(BaseType.Type.AREA.toString(),null);
        List listarea = this.resourceService.getMonthUploadNum(forderActivityListarea,null);
        //个人
        List<String> forderActivityListgeren=this.getforderActivityList(BaseType.Type.PERSION.toString(),adminUser.getId());
        List listgeren = this.resourceService.getMonthUploadNum(forderActivityListgeren,null);
        //直属
        List<String> forderActivityListdirect=this.getforderActivityList(BaseType.Type.DIRECTLYUTIS.toString(),adminUser.getAdminCompany().getId());
        List listdirect = this.resourceService.getMonthUploadNum(forderActivityListdirect,null);
        //基层
        List<String> forderActivityListbase=this.getforderActivityList(BaseType.Type.BASEUTIS.toString(),null);
        List listbase = this.resourceService.getMonthUploadNum(forderActivityListbase,adminUser.getId());
        
        modelAndView.addObject("uploadListbase", listbase);
        modelAndView.addObject("uploadListdirect", listdirect);
        modelAndView.addObject("uploadListarea", listarea);
        modelAndView.addObject("uploadListgeren", listgeren);
        return modelAndView;
    }
    
    
  
    
    
    @RequestMapping("/persionIndex")
    public ModelAndView persionIndex(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/photo-gallery/persion/index");//登录页面

        return modelAndView;// 返回
    }
    
   


    public List<PhotoTime> getPhotoTimeList(String type,String check,boolean flag,HttpSession session){
        Query query=super.craeteQueryWhere("listType.type",type,"parentId", "0");
        List<ForderActivity> listFA = this.forderActivityService.find(query, ForderActivity.class);
        //todo
        return PhotoTime.getPhotoTime(listFA,session);
    }
    
/*    public List<PhotoTime> getPhotoTimeList1(String type,String check){
        Query query=super.craeteQueryWhere("listType.type",type,"parentId", "0");
        List<ForderActivity> listFA = this.forderActivityService.find(query, ForderActivity.class);
        return PhotoTime.getPhotoTime(listFA,check);
    }*/
    
  /**
   * @描述  个人图片库的时间轴绑定个人Id   
   * @param type
   * @param check
   * @param boundId
   * @return  
   */
    public List<PhotoTime> getPhotoTimeListByPersionId(String type,String check,String boundId,boolean flag,HttpSession session){
        Query query=super.craeteQueryWhere("listType.type",type,"parentId", "0","boundId",boundId);
        List<ForderActivity> listFA = this.forderActivityService.find(query, ForderActivity.class);
        //TODO
        return PhotoTime.getPhotoTime(listFA,session);
    }

}
