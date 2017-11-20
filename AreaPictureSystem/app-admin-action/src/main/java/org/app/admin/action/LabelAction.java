package org.app.admin.action;

import java.util.List;

import org.app.admin.pojo.Label;
import org.app.admin.service.LabelService;
import org.app.framework.action.GeneralAction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/label")
public class LabelAction extends GeneralAction<Label>{
	private static final Logger log = LoggerFactory
			.getLogger(LabelAction.class);
   
	@Autowired
    private LabelService labelService;
	
	
	@RequestMapping("/list")
	public ModelAndView getLabellist(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/app-admin/");
		Query query=new Query();
		List<Label> listbabel=labelService.find(query, Label.class);
		return modelAndView;
	}
	@RequestMapping("/add")
	public ModelAndView addLabel(Label b){
		ModelAndView modelAndView = new ModelAndView();
		Query query=new Query();
		labelService.insert(b);
		return modelAndView;
	}
	@RequestMapping("/editor")
	public ModelAndView updateLabel(Label b){
		ModelAndView modelAndView = new ModelAndView();
		Query query=new Query();
		labelService.insert(b);
		return modelAndView;
	}
	@RequestMapping("/delete")
	public ModelAndView deleteLabel(Label b){
		ModelAndView modelAndView = new ModelAndView();
		Query query=new Query();
		labelService.remove(b);
		return modelAndView;
	}
}
