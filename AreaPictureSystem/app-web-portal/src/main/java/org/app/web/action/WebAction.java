package org.app.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.app.framework.action.GeneralAction;
import org.app.framework.util.BasicDataResult;
import org.app.framework.util.Common;
import org.app.framework.util.CommonEnum;
import org.app.framework.util.Pagination;
import org.app.web.pojo.WebPortal;
import org.app.web.service.WebService;
import org.app.webAdmin.pojo.Contest;
import org.app.webAdmin.pojo.Index;
import org.app.webAdmin.pojo.News;
import org.app.webAdmin.pojo.Users;
import org.app.webAdmin.pojo.UsersUploads;
import org.app.webAdmin.service.ContestImagesService;
import org.app.webAdmin.service.ContestService;
import org.app.webAdmin.service.IndexService;
import org.app.webAdmin.service.NewsService;
import org.app.webAdmin.service.UsersUploadsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	@Autowired
	private UsersUploadsService usersUploadsService;

	@Autowired
	private ContestImagesService contestImagesService;
	
	@Autowired
	private IndexService indexService;

	/**
	 * 网站首页
	 * 
	 * @return
	 */
	@RequestMapping("/index")
	public ModelAndView index(HttpSession session, @RequestParam(value = "type", defaultValue = "") String type) {

		session.setAttribute("checkMenu", Common.isNotEmpty(type) ? type : null);

		ModelAndView modelAndView = new ModelAndView();
		
		Index index = this.indexService.findOneByQuery(new Query(), Index.class);
		
		modelAndView.addObject("index", index);
		
		
		// 获取所有可用状态下的比赛
		Query query = new Query();
		// 获取所有启用状态下的比赛
		query.addCriteria(Criteria.where("status").is(true));
		//获取发布公告的比赛
		query.addCriteria(Criteria.where("announcements").is(true));
		// 按照比赛开始日期进行排序
		query.with(new Sort(Sort.Direction.ASC, "startTime"));

		// 获取当前时间
		String now = Common.fromDateH();

		modelAndView.addObject("now", now);

		List<Contest> listContest = this.contestService.find(query, Contest.class);
		
		modelAndView.addObject("contest", listContest.get(0));
		

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
	 *         session @param @param type @param @param pageNo @param @param
	 *         pageSize @param @return 设定文件 @return ModelAndView 返回类型 @throws
	 */
	@RequestMapping("/newsDetail")
	public ModelAndView newsDetail(HttpSession session, @RequestParam(value = "id", defaultValue = "") String id) {
		ModelAndView modelAndView = new ModelAndView();

		Query query = new Query();

		query.addCriteria(Criteria.where("id").is(id));
		query.addCriteria(Criteria.where("status").is(false));

		News news = this.newsService.findOneByQuery(query, News.class);

		modelAndView.addObject("news", news);

		modelAndView.setViewName("web/list_news_detail");

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
			@RequestParam(value = "pageSize", defaultValue = "5	") int pageSize,
			@ModelAttribute("status") String status,
			@ModelAttribute("msg") String msg) {
		

		
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

		// 获取当前时间
		String now = Common.fromDateH();

		modelAndView.addObject("now", now);

		// 通过条件查询所有的比赛

		Pagination<Contest> pagination = this.contestService.findPaginationByQuery(query, pageNo, pageSize,
				Contest.class);

		modelAndView.addObject("pageList", pagination);
		modelAndView.addObject("status", status);
		modelAndView.addObject("msg", msg);

		modelAndView.setViewName("web/list_contest");

		return modelAndView;// 返回
	}

	/**
	 * 
	 * @Title: apply @Description: TODO(跳转到该比赛的报名页面) @param @param
	 *         session @param @param type @param @param id @param @return
	 *         设定文件 @return ModelAndView 返回类型 @throws
	 */
	@RequestMapping("/apply")
	public ModelAndView apply(HttpSession session, @RequestParam(value = "type", defaultValue = "") String type,
			@RequestParam(value = "id", defaultValue = "") String id) {

		session.setAttribute("checkMenu", Common.isNotEmpty(type) ? type : null);

		ModelAndView modelAndView = new ModelAndView();

		Contest contest = this.contestService.findOneById(id, Contest.class);

		modelAndView.addObject("contest", contest);

		modelAndView.setViewName("web/apply");

		// 获取当前时间
		String now = Common.fromDateH();
		modelAndView.addObject("now", now);

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

	@RequestMapping("/register")
	@ResponseBody
	public BasicDataResult addUser(Users users) {

		// 判断是否已经被注册
		BasicDataResult checkResult = this.webService.findUserByPhone_Email_AccountName(users.getPhone(),
				users.getEmail(), users.getAccountName());

		if (checkResult.getStatus() == 203) {
			return checkResult;
		}

		// 添加用户
		BasicDataResult addUserResult = this.webService.addUser(users);

		return addUserResult;
	}

	@RequestMapping("/checkAccountName")
	@ResponseBody
	public BasicDataResult checkAccountName(
			@RequestParam(defaultValue = "", value = "accountName") String accountName) {

		BasicDataResult result = this.webService.findUserByPhone_Email_AccountName("", "", accountName);

		return result;
	}

	@RequestMapping("/checkPhone")
	@ResponseBody
	public BasicDataResult checkPhone(String phone) {

		BasicDataResult result = this.webService.findUserByPhone_Email_AccountName(phone, "", "");

		return result;
	}

	@RequestMapping("/checkEmail")
	@ResponseBody
	public BasicDataResult checkEmail(String email) {

		BasicDataResult result = this.webService.findUserByPhone_Email_AccountName("", email, "");

		return result;
	}

	@RequestMapping("/userLogin")
	@ResponseBody
	public BasicDataResult userLogin(Users users, HttpSession session) {

		BasicDataResult result = this.webService.userLogin(users);

		if (result.getStatus().equals(200)) {

			session.setAttribute(CommonEnum.WEBUSERSESSION, result.getData());
		}

		return result;
	}

	@RequestMapping("/loginOut")
	@ResponseBody
	public ModelAndView loginOut(HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("redirect:/web/listContest");

		session.removeAttribute(CommonEnum.WEBUSERSESSION);

		return modelAndView;// 返回

	}

	/**
	 * 
	 * @Title: addUsersUpload @Description: TODO(添加比赛信息) @param @param
	 *         session @param @param uploads @param @param editId @param @param
	 *         request @param @return 设定文件 @return BasicDataResult 返回类型 @throws
	 */
	@RequestMapping("/addUsersUpload")
	public ModelAndView addUsersUpload(HttpSession session,
			@RequestParam(defaultValue = "", value = "editId") String editId,
			@RequestParam(defaultValue = "", value = "contestId") String contestId,
			@RequestParam(defaultValue = "", value = "theme") String theme,
			@RequestParam(defaultValue = "", value = "introduce") String introduce, @RequestParam MultipartFile[] file,
			RedirectAttributes model, @RequestParam(value = "newType", defaultValue = "") String newType,
			HttpServletRequest request) {

		UsersUploads uploads = new UsersUploads();
		uploads.setTheme(theme);
		uploads.setIntroduce(introduce);
		uploads.setContestId(contestId);

		Users users = (Users) session.getAttribute(CommonEnum.WEBUSERSESSION);

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("redirect:/web/listContest");

		if (users != null) {

			// 添加用户投稿的信息
			BasicDataResult usersUploads = this.usersUploadsService.addUsersUploads(uploads, editId, users);

			BasicDataResult result = this.contestImagesService.uploadImages(file, request, contestId, users, editId);

			model.addFlashAttribute("status", result.getStatus());
			model.addFlashAttribute("msg", result.getMsg());

		}
		// 获取当前时间
		String now = Common.fromDateH();

		model.addFlashAttribute("now", now);

		return modelAndView;// 返回

	}

	/**
	 * 
	 * @Title: uploadImgs @Description: TODO(上传图片) @param @param
	 *         request @param @param session @param @param
	 *         contestId @param @param usersUploadsId @param @return
	 *         设定文件 @return BasicDataResult 返回类型 @throws
	 */
	/*
	 * @RequestMapping("/uploadImgs")
	 * 
	 * @ResponseBody public BasicDataResult uploadImgs(HttpServletRequest
	 * request, HttpSession session,
	 * 
	 * @RequestParam(defaultValue = "", value = "contestId") String contestId,
	 * 
	 * @RequestParam(defaultValue = "", value = "usersUploadsId") String
	 * usersUploadsId) { // 通过usersUploadsIdid查询该记录，如果id为空则反馈给界面提示先添加投稿信息再上传图片
	 * if (Common.isEmpty(usersUploadsId)) { return BasicDataResult.build(403,
	 * "请先添加主题与介绍信息！", null); } //
	 * 通过usersUploadsIdid查询该记录，如果id为空则反馈给界面提示先添加投稿信息再上传图片 if
	 * (Common.isEmpty(contestId)) { return BasicDataResult.build(403,
	 * "未能找到该比赛信息！", null); }
	 * 
	 * Users users = (Users) session.getAttribute(CommonEnum.WEBUSERSESSION);
	 * 
	 * BasicDataResult result = null; if (users != null) { result =
	 * this.contestImagesService.uploadImages(request, contestId, users,
	 * usersUploadsId); } else { return BasicDataResult.build(401,
	 * "当前用户登录已经过期，请重新登录", null); }
	 * 
	 * return result; }
	 */

	@RequestMapping("/getUsersUpload")
	@ResponseBody
	public BasicDataResult getUsersUpload(HttpServletRequest request, HttpSession session,
			@RequestParam(defaultValue = "", value = "contestId") String contestId) {

		BasicDataResult result = this.usersUploadsService.findOneByContestId(contestId, session);

		return result;
	}

}
