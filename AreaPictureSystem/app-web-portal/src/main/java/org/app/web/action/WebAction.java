package org.app.web.action;

import org.app.framework.action.GeneralAction;
import org.app.web.pojo.WebPortal;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * Company class
 * 
 * @author Lau Aaron
 */
@Controller
@RequestMapping("/web")
public class WebAction extends GeneralAction<WebPortal> {

	private static final Logger log = LoggerFactory.getLogger(WebAction.class);


	/**
	 * 网站首页
	 * @return
	 */
	@RequestMapping("/index")
	public ModelAndView index(HttpSession session) {
		session.setAttribute("checkMenu","index");

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("web/index");
		return modelAndView;// 返回
	}

	/**
	 * 网站_摄影作品
	 * @return
	 */
	@RequestMapping("/listPhotography")
	public ModelAndView listPhotography(HttpSession session) {
		session.setAttribute("checkMenu","listPhotography");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("web/list_photography");
		return modelAndView;// 返回
	}


	/**
	 * 网站_新闻_listNews
	 * @return
	 */
	@RequestMapping("/listNews")
	public ModelAndView listNews(HttpSession session) {
		session.setAttribute("checkMenu","listNews");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("web/list_news");
		return modelAndView;// 返回
	}


	/**
	 * 网站_图片相册_page
	 * @return
	 */
	@RequestMapping("/listGallery")
	public ModelAndView listGallery(HttpSession session) {
		session.setAttribute("checkMenu","listGallery");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("web/list_gallery");
		return modelAndView;// 返回
	}

	/**
	 * 网站_比赛_listGame
	 * @return
	 */
	@RequestMapping("/listGame")
	public ModelAndView listGame(HttpSession session) {
		session.setAttribute("checkMenu","listGame");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("web/list_game");
		return modelAndView;// 返回
	}


	/**
	 * 网站_关于我们_about
	 * @return
	 */
	@RequestMapping("/about")
	public ModelAndView about(HttpSession session) {
		session.setAttribute("checkMenu","about");

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("web/about");
		return modelAndView;// 返回
	}


	/**
	 * 网站_详细页面_page
	 * @return
	 */
	@RequestMapping("/page")
	public ModelAndView page() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("web/page");
		return modelAndView;// 返回
	}
	
	
}
