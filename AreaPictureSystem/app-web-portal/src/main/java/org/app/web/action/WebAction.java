package org.app.web.action;

import java.util.Collections;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.app.framework.action.GeneralAction;
import org.app.framework.util.BasicDataResult;
import org.app.framework.util.Common;
import org.app.framework.util.CommonEnum;
import org.app.framework.util.Pagination;
import org.app.web.pojo.WebPortal;
import org.app.web.service.WebService;
import org.app.webAdmin.pojo.AboutUs;
import org.app.webAdmin.pojo.Contest;
import org.app.webAdmin.pojo.Email;
import org.app.webAdmin.pojo.Index;
import org.app.webAdmin.pojo.News;
import org.app.webAdmin.pojo.Users;
import org.app.webAdmin.pojo.UsersUploads;
import org.app.webAdmin.service.AboutUsService;
import org.app.webAdmin.service.ContestImagesService;
import org.app.webAdmin.service.ContestService;
import org.app.webAdmin.service.EmailService;
import org.app.webAdmin.service.IndexService;
import org.app.webAdmin.service.NewsService;
import org.app.webAdmin.service.UsersService;
import org.app.webAdmin.service.UsersUploadsService;
import org.app.webAdmin.service.VoteConService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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

	@Autowired
	private AboutUsService aboutUsSercice;

	@Autowired
	private VoteConService voteConService;

	@Autowired
	private EmailService emailService;

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
		// 获取发布公告的比赛
		query.addCriteria(Criteria.where("announcements").is(true));
		// 按照比赛开始日期进行排序
		query.with(new Sort(Sort.Direction.ASC, "startTime"));

		// 获取当前时间
		String now = Common.fromDateH();

		modelAndView.addObject("now", now);

		List<Contest> listContest = this.contestService.find(query, Contest.class);

		if (listContest.size() > 0) {

			modelAndView.addObject("contest", listContest.get(0));
		}

		// 获取投票第一名的图片

		query = new Query();

		query.with(new Sort(Sort.Direction.DESC, "createDate"));

		query.with(new Sort(Sort.Direction.DESC, "poll"));

		List<UsersUploads> list = this.usersUploadsService.find(query, UsersUploads.class);
		if (list.size() > 0) {

			modelAndView.addObject("usersUploads", list.get(0));

		}

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
			@RequestParam(value = "type", defaultValue = "") String type,
			@RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
			@RequestParam(value = "pageSize", defaultValue = "5	") int pageSize) {
		session.setAttribute("checkMenu", Common.isNotEmpty(type) ? type : null);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("web/list_photography");

		Query query = new Query();

		query.with(new Sort(Sort.Direction.DESC, "createDate"));

		query.with(new Sort(Sort.Direction.DESC, "poll"));

		Pagination<UsersUploads> pagination = this.usersUploadsService.findPaginationByQuery(query, pageNo, pageSize,
				UsersUploads.class);

		modelAndView.addObject("pageList", pagination);

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
	public ModelAndView listGallery(HttpSession session, @RequestParam(value = "type", defaultValue = "") String type,
			@RequestParam(value = "id", defaultValue = "") String id) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("web/list_gallery");

		UsersUploads usersUploads = this.usersUploadsService.findOneById(id, UsersUploads.class);

		modelAndView.addObject("usersUploads", usersUploads);

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
			@ModelAttribute("status") String status, @ModelAttribute("msg") String msg) {

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
			@RequestParam(value = "id", defaultValue = "") String id, @ModelAttribute("contestId") String contestId,
			@ModelAttribute("checkMenu") String checkMenu) {
		if (Common.isNotEmpty(contestId)) {
			id = contestId;
		}
		if (Common.isNotEmpty(checkMenu)) {
			type = checkMenu;
		}
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

		List<AboutUs> aboutus = this.aboutUsSercice.find(new Query(), AboutUs.class);

		if (aboutus.size() > 0) {
			modelAndView.addObject("aboutus", aboutus.get(0));
		}

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
			@RequestParam(defaultValue = "", value = "contestId") String contestId, UsersUploads uploads,
			@RequestParam MultipartFile[] file, RedirectAttributes model, HttpServletRequest request,
			@RequestParam(defaultValue = "", value = "type") String type) {

		session.setAttribute("checkMenu", Common.isNotEmpty(type) ? type : null);

		Users users = (Users) session.getAttribute(CommonEnum.WEBUSERSESSION);

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("redirect:/web/toApply");

		if (users != null) {

			BasicDataResult result = this.usersUploadsService.SaveOrUpdateSetting(request, uploads, editId, users,
					file);
			model.addFlashAttribute("status", result.getMsg());
		} else {

			model.addFlashAttribute("status", "未能找到登录的用户信息！");
		}
		// 获取当前时间
		String now = Common.fromDateH();

		model.addFlashAttribute("recontestId", contestId);
		model.addFlashAttribute("retype", type);

		model.addFlashAttribute("now", now);

		return modelAndView;// 返回

	}

	/*
	 * @RequestMapping("/getUsersUpload")
	 * 
	 * @ResponseBody public BasicDataResult getUsersUpload(HttpServletRequest
	 * request, HttpSession session,
	 * 
	 * @RequestParam(defaultValue = "", value = "contestId") String contestId) {
	 * 
	 * BasicDataResult result =
	 * this.usersUploadsService.findOneByContestId(contestId, session);
	 * 
	 * return result; }
	 */

	@RequestMapping("/toMyApply")
	public ModelAndView toMyApply() {

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("/web/myApply");

		return modelAndView;

	}

	/**
	 * 
	 * @return
	 */
	// TODO
	@RequestMapping("/toApply")
	public ModelAndView toApply(@RequestParam(defaultValue = "", value = "contestId") String contestId,
			HttpSession session, RedirectAttributes model, @RequestParam(value = "type", defaultValue = "") String type,
			@ModelAttribute("retype") String retype, @ModelAttribute("status") String status,
			@ModelAttribute("recontestId") String recontestId) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/web/toApply");
		Users users = (Users) session.getAttribute(CommonEnum.WEBUSERSESSION);

		if (Common.isNotEmpty(recontestId)) {
			contestId = recontestId;
		}
		if (Common.isNotEmpty(retype)) {
			type = retype;
		}
		session.setAttribute("checkMenu", Common.isNotEmpty(type) ? type : null);
		if (users == null) {
			modelAndView.setViewName("redirect:/web/apply");
			model.addFlashAttribute("contestId", contestId);
			model.addFlashAttribute("checkMenu", type);
			return modelAndView;
		}
		// 通过比赛id查询,userid查询数据

		Contest contest = this.contestService.findContestByUsersIdContestId(contestId);

		modelAndView.addObject("contest", contest);

		// 通过contestId与用户id查询
		UsersUploads uploads = (UsersUploads) this.usersUploadsService.findOneByContestId(contestId, session).getData();

		if (uploads != null) {
			modelAndView.addObject("usersUploads", uploads);

		}
		modelAndView.addObject("status", status);
		modelAndView.addObject("contestId", contestId);
		return modelAndView;

	}

	@RequestMapping("/delete")
	public ModelAndView delete(@RequestParam(defaultValue = "", value = "id") String id,
			@RequestParam(defaultValue = "", value = "editId") String editId,
			@RequestParam(defaultValue = "", value = "type") String type,
			@RequestParam(defaultValue = "", value = "contestId") String contestId, RedirectAttributes model) {

		ModelAndView modelAndView = new ModelAndView();

		model.addFlashAttribute("recontestId", contestId);
		model.addFlashAttribute("retype", type);

		modelAndView.setViewName("redirect:/web/toApply");

		this.usersUploadsService.delete(id, editId);

		return modelAndView;

	}

	/**
	 * 
	 * @Title: votelist @Description: TODO(显示该比赛的所有参赛投稿) @param @param
	 *         contestId @param @param pageNo @param @param
	 *         pageSize @param @return 设定文件 @return ModelAndView 返回类型 @throws
	 */
	@RequestMapping("/votelist")
	public ModelAndView votelist(@RequestParam(defaultValue = "", value = "contestId") String contestId,
			@RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
			@RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {

		ModelAndView modelAndView = new ModelAndView();

		Query query = new Query();
		query.addCriteria(Criteria.where("contestId").is(contestId));

		Pagination<UsersUploads> pagination = this.usersUploadsService.findPaginationByQuery(query, pageNo, pageSize,
				UsersUploads.class);

		modelAndView.addObject("pageList", pagination);

		modelAndView.setViewName("/web/votelist");

		return modelAndView;
	}

	@RequestMapping("/voteDetail")
	public ModelAndView voteDetail(@RequestParam(defaultValue = "", value = "id") String id) {
		ModelAndView modelAndView = new ModelAndView();

		UsersUploads up = this.usersUploadsService.findOneById(id, UsersUploads.class);

		modelAndView.addObject("usersUploads", up);

		modelAndView.setViewName("/web/voteDetail");

		return modelAndView;
	}

	/**
	 * 
	 * @Title: VoteCon @Description: TODO(投票) @param @return 设定文件 @return
	 *         BasicDataResult 返回类型 @throws
	 */
	@RequestMapping("/voteCon")
	@ResponseBody
	public BasicDataResult VoteCon(HttpServletRequest request, String contestId, String usersUploadsId) {

		Boolean b = this.voteConService.findUsersUploads(request, contestId);

		if (b) {
			return BasicDataResult.build(200, "您已经投过票了，请不要重复投票！", null);
		}

		BasicDataResult result = this.voteConService.addVoteCon(request, usersUploadsId, null, contestId);
		// 更新投票记录
		this.usersUploadsService.findUsersUploadsToSortByContestId(contestId);

		return result;

	}

	/**
	 * 
	 * @Title: voteResult @Description: TODO(查看投票结果) @param @param
	 *         request @param @param contestId @param @return 设定文件 @return
	 *         ModelAndView 返回类型 @throws
	 */
	@RequestMapping("/voteResult")
	public ModelAndView voteResult(HttpServletRequest request,
			@RequestParam(defaultValue = "", value = "contestId") String contestId) {

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("/web/voteResult");

		// 根据contestId获取所有的投稿人
		List<UsersUploads> listUsersUploads = this.usersUploadsService.findUsersUploadsToSortByContestId(contestId);

		Collections.sort(listUsersUploads);

		modelAndView.addObject("listUsersUploads", listUsersUploads);

		return modelAndView;

	}
	
	/*
	 * @Value("${mail.host}") private String host;// 读取配置文件中host
	 * 
	 * @Value("${mail.username}") private String userName;// 读取配置文件中的邮箱帐号
	 * 
	 * @Value("${mail.password}") private String password; // 读取配置文件中的密码
	 */
	@Value("${mail.nick}")
	 private String nick;
	@Value("${mail.username}")
	private String username;
	
	@Autowired
	private UsersService usersService;
	
	
	
	

	@RequestMapping("/checkCode")
	@ResponseBody
	public BasicDataResult checkCode(String code,HttpSession session) {
		
		String sessionCode = (String) session.getAttribute("code");
		
		
		
		if(sessionCode.equals(code)){
			return BasicDataResult.build(200, "验证码正确", null);
		}
		
		return BasicDataResult.build(203, "验证码错误", null);
		
		
	}
	
	
	@RequestMapping("/ChangePassword")
	@ResponseBody
	public BasicDataResult ChangePassword(String id,String password,HttpSession session) {
		try{
			if(Common.isEmpty(id)){
				return BasicDataResult.build(203, "未能匹配到用户信息，请先验证邮箱", null);
			}
			if(Common.isEmpty(password)){
				return BasicDataResult.build(203, "请输入修改的密码", null);
			}
			
			Users users = this.usersService.findOneById(id, Users.class);
			
			if(users == null){
				return BasicDataResult.build(203, "未能找到用户信息，请与管理员联系", null);
			}
				users.setPassword(password);
				this.usersService.save(users);
			
			return BasicDataResult.build(200, "修改密码成功", users);
		}catch(Exception e){
			e.printStackTrace();
			return BasicDataResult.build(400, "修改密码过程中发生位置错误，请与管理员联系！", null);
		}
		
		
	}
	
	
	
	
	@RequestMapping("/email")
	@ResponseBody
	public BasicDataResult sendEmail(String emailPath,HttpSession session) {
		try {
		//通过邮箱地址获取用户信息
		Users users = this.usersService.findUsersByEmail(emailPath);
		if(Common.isEmpty(users.getEmail())){
			return BasicDataResult.build(200, "您输入的邮箱地址未被注册！", null);
		}
		String code = Common.getCharAndNumr(6);
		session.setAttribute("code", code);
		Email email = new Email();
		email.setNick(nick);
		email.setFromAddress(username);
		email.setSubject("您正在使用教职工摄影网进行修改密码操作");
		email.setToAddress(emailPath);
		email.setContent("您的验证码是："+code+"，验证码有效期为30分钟，为了您帐号的安全，请不要将验证码给他人。。"+Common.fromDateH());
		
		this.emailService.sendMail(email);
		
		Users user = new Users();
		user.setId(users.getId());
		
		return BasicDataResult.build(200, "信息发送成功，请查看邮件（如果未收到请查看垃圾箱）", user);
		} catch (Exception e) {
			e.printStackTrace();
			return BasicDataResult.build(200, "发送邮件失败，请与管理员联系！", null);
		}
	}
	
	
	
	
	
	/**
	 * 
	* @Title: sendEmail 
	* @Description: TODO(用户注册发送邮件) 
	* @param @param emailPath
	* @param @param session
	* @param @return    设定文件 
	* @return BasicDataResult    返回类型 
	* @throws
	 */
	@RequestMapping("/registerEmail")
	@ResponseBody
	public BasicDataResult registerEmail(String emailPath,HttpSession session) {
		try {
			//通过邮箱地址获取用户信息
			Users users = this.usersService.findUsersByEmail(emailPath);
			if(users!=null){
				return BasicDataResult.build(203, "您输入的邮箱地址已被注册！", null);
			}
			String code = Common.getCharAndNumr(6);
			session.setAttribute("code", code);
			Email email = new Email();
			email.setNick(nick);
			email.setFromAddress(username);
			email.setSubject("您正在使用教职工摄影网进行注册帐号操作");
			email.setToAddress(emailPath);
			email.setContent("您的验证码是："+code+"，验证码有效期为30分钟，为了您帐号的安全，请不要将验证码给他人。。"+Common.fromDateH());
			this.emailService.sendMail(email);
			return BasicDataResult.build(200, "信息发送成功，请查看邮件（如果未收到请查看垃圾箱）", null);
		} catch (Exception e) {
			e.printStackTrace();
			return BasicDataResult.build(200, "发送邮件失败，请与管理员联系！", null);
		}
	}

}
