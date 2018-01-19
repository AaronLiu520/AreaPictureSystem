package org.app.web.action;

import javax.servlet.http.HttpSession;

import org.app.framework.action.GeneralAction;
import org.app.framework.util.Common;
import org.app.framework.util.Pagination;
import org.app.web.pojo.WebPortal;
import org.app.web.service.WebService;
import org.app.webAdmin.pojo.Contest;
import org.app.webAdmin.pojo.News;
import org.app.webAdmin.service.ContestService;
import org.app.webAdmin.service.NewsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Company class
 * 
 * @author Lau Aaron
 */
@Controller
@RequestMapping("/web")
public class WebAction extends GeneralAction<WebPortal> {

	private static final Logger log = LoggerFactory.getLogger(WebAction.class);

	@Autowired
	private WebService webService;

	@Autowired
	private NewsService newsService;

	@Autowired
	private ContestService contestService;

	/**
	 * 网站首页
	 * 
	 * @return
	 */
	@RequestMapping("/index")
	public ModelAndView index(HttpSession session, @RequestParam(value = "type", defaultValue = "") String type) {

		session.setAttribute("checkMenu", Common.isNotEmpty(type) ? type : null);

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("web/index");

		return modelAndView;// 返回
	}

	/**
	 * 网站_摄影作品
	 * 
	 * @return
	 */
	@RequestMapping("/listPhotography")
	public ModelAndView listPhotography(HttpSession session,
			@RequestParam(value = "type", defaultValue = "") String type) {
		session.setAttribute("checkMenu", Common.isNotEmpty(type) ? type : null);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("web/list_photography");
		return modelAndView;// 返回
	}

	/**
	 * 网站_新闻_listNews
	 * 
	 * @return
	 */
	@RequestMapping("/listNews")
	public ModelAndView listNews(HttpSession session, @RequestParam(value = "type", defaultValue = "") String type,
			@RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
			@RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
		session.setAttribute("checkMenu", Common.isNotEmpty(type) ? type : null);

		ModelAndView modelAndView = new ModelAndView();

		Query query = new Query();

		query.with(new Sort(Sort.Direction.ASC, "sort"));

		query.with(new Sort(Sort.Direction.ASC, "newsDate"));

		query.addCriteria(Criteria.where("status").is(false));

		Pagination<News> pagination = this.newsService.findPaginationByQuery(query, pageNo, pageSize, News.class);

		modelAndView.addObject("pageList", pagination);

		modelAndView.setViewName("web/list_news");

		return modelAndView;// 返回
	}

	/**
	 * 
	 * @Title: newsDetail @Description: TODO(新闻详细页面) @param @param
	 * session @param @param type @param @param pageNo @param @param
	 * pageSize @param @return 设定文件 @return ModelAndView 返回类型 @throws
	 */
	@RequestMapping("/newsDetail")
	public ModelAndView newsDetail(HttpSession session, @RequestParam(value = "id", defaultValue = "") String id) {
		ModelAndView modelAndView = new ModelAndView();

		Query query = new Query();

		query.addCriteria(Criteria.where("id").is(id));
		query.addCriteria(Criteria.where("status").is(true));

		News news = this.newsService.findOneByQuery(query, News.class);

		modelAndView.addObject("news", news);

		modelAndView.setViewName("web/page");

		return modelAndView;// 返回
	}

	/**
	 * 网站_图片相册_page
	 * 
	 * @return
	 */
	@RequestMapping("/listGallery")
	public ModelAndView listGallery(HttpSession session, @RequestParam(value = "type", defaultValue = "") String type) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("web/list_gallery");
		return modelAndView;// 返回
	}

	/**
	 * 网站_比赛_listGame
	 * 
	 * @return
	 */
	@RequestMapping("/listContest")
	public ModelAndView listGame(HttpSession session, @RequestParam(value = "type", defaultValue = "") String type,
			@RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
			@RequestParam(value = "pageSize", defaultValue = "5	") int pageSize) {
		session.setAttribute("checkMenu", Common.isNotEmpty(type) ? type : null);
		ModelAndView modelAndView = new ModelAndView();
		// 获取所有可用状态下的比赛
		Query query = new Query();
		// 获取所有启用状态下的比赛
		query.addCriteria(Criteria.where("status").is(true));
		// 按照比赛开始日期进行排序
		query.with(new Sort(Sort.Direction.ASC, "startTime"));
		// 根据序号排序
		query.with(new Sort(Sort.Direction.ASC, "sort"));
		
		
		//获取当前时间
		String now = Common.fromDateH();

		modelAndView.addObject("now", now);
		
		// 通过条件查询所有的比赛

		Pagination<Contest> pagination = this.contestService.findPaginationByQuery(query, pageNo, pageSize, Contest.class);

		modelAndView.addObject("pageList", pagination);

		modelAndView.setViewName("web/list_contest");

		return modelAndView;// 返回
	}
	
	
	/**
	 * 
	* @Title: apply 
	* @Description: TODO(跳转到该比赛的报名页面) 
	* @param @param session
	* @param @param type
	* @param @param id
	* @param @return    设定文件 
	* @return ModelAndView    返回类型 
	* @throws
	 */
	@RequestMapping("/apply")
	public ModelAndView apply(HttpSession session, @RequestParam(value = "type", defaultValue = "") String type,
			@RequestParam(value = "id", defaultValue = "") String id) {
		session.setAttribute("checkMenu", Common.isNotEmpty(type) ? type : null);
		
		ModelAndView modelAndView = new ModelAndView();
		
		Contest contest = this.contestService.findOneById(id, Contest.class);
		
		modelAndView.addObject("contest",contest);
		
		modelAndView.setViewName("web/apply");
		
		return modelAndView;// 返回
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 网站_关于我们_about
	 * 
	 * @return
	 */
	@RequestMapping("/about")
	public ModelAndView about(HttpSession session, @RequestParam(value = "type", defaultValue = "") String type) {
		session.setAttribute("checkMenu", Common.isNotEmpty(type) ? type : null);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("web/about");
		return modelAndView;// 返回
	}

}
