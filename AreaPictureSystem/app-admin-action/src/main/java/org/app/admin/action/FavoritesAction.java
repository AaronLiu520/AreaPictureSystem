package org.app.admin.action;

import java.util.List;

import org.app.admin.annotation.SystemControllerLog;
import org.app.admin.annotation.SystemErrorLog;
import org.app.admin.pojo.Favorites;
import org.app.admin.pojo.Label;
import org.app.admin.service.FavoritesService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/favorites/")
public class FavoritesAction {
	private static final Logger log = LoggerFactory
			.getLogger(LabelAction.class);
   
	@Autowired
    private FavoritesService favoritesService;
	
	
	@SystemErrorLog(description="查询所有收藏出错")
	@SystemControllerLog(description = "查询所有收藏")
	@RequestMapping("/list")
    public ModelAndView list(){
    	ModelAndView modelAndView = new ModelAndView();
		log.info("访问Favoriteslist");
		modelAndView.setViewName("admin/app-admin/label/list");
		Query query=new Query();
		List<Favorites> Favoriteslist=favoritesService.find(query, Favorites.class);
		modelAndView.addObject("Flist", Favoriteslist);
		return modelAndView;
    }


}
