package org.app.admin.action;

import java.util.List;

import javax.servlet.http.HttpSession;
import org.app.admin.pojo.Label;
import org.app.admin.service.LabelService;
import org.app.framework.action.GeneralAction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/label")
public class LabelAction extends GeneralAction<Label>{
	private static final Logger log = LoggerFactory
			.getLogger(LabelAction.class);
   
	@Autowired
    private LabelService labelService;
	
	
	 
	 /**
	  * @描述：获得标签列表
	  * @参数：无
	  * @返回值：带labellist的modelandview
	  */
	@RequestMapping("/list")
	public ModelAndView getLabellist(){
		ModelAndView modelAndView = new ModelAndView();
		log.info("访问list");
		modelAndView.setViewName("admin/app-admin/label/list");
		Query query=new Query();
		List<Label> listlabel=labelService.find(query, Label.class);
		modelAndView.addObject("labelList", listlabel);
		return modelAndView;
	}
	
	/**
	 * @描述：编辑或添加
	 * @param Label b
	 * @return modelAndView(msg)
	 */
	@RequestMapping("/editor")
	public ModelAndView addLabel(String id){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/app-admin/label/labeleditor");
        if(id!=null && id!=""){
        	modelAndView.addObject("bean",this.labelService.findOneById(id, Label.class));
        }
        
//		Boolean B=labelService.addorupdate(b);
//		modelAndView.addObject("addmsg",B?"添加成功":"标签重复");
		return modelAndView;
	}
	
	/**
	 * @描述: 添加或是修改
	 * @param session
	 * @param Label label
	 * @return
	 */
	@RequestMapping("/createOrUpdateToFind")
	public ModelAndView list(HttpSession session, Label label) {
		log.info("createOrUpdateToFind");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/label/list");
		labelService.addorupdate(label);
		return modelAndView;// 返回
	}
	
	
	@RequestMapping("/delete")
	public ModelAndView deleteLabel(@RequestParam(value = "id", defaultValue = "0")String id){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/label/list");
		log.info(id);
		labelService.remove(id);
		return modelAndView;
	}
}
