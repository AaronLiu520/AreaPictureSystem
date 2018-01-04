/**   
* @Title: LogAction.java 
* @Package org.app.admin.action 
* @Description: TODO(用一句话描述该文件做什么) 
* @author fliay
* @date 2017年12月5日 上午10:53:25 
* @version V1.0   
*/
package org.app.webAdmin.action;

import javax.servlet.http.HttpSession;

import org.app.framework.action.GeneralAction;
import org.app.framework.util.Pagination;
import org.app.webAdmin.pojo.Log;
import org.app.webAdmin.service.LogService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * @ClassName: LogAction
 * @Description: TODO(日志action)
 * @author fliay
 * @date 2017年12月5日 上午10:53:25
 * 
 */

@Controller
@RequestMapping("/log")
public class LogAction extends GeneralAction<Log> {

	private static final Logger logger = LoggerFactory.getLogger(LogAction.class);

	@Autowired
	private LogService logService;

	/**
	 * 查询数据
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/list")
	public ModelAndView list(@RequestParam(value = "pageNo0", defaultValue = "1") Integer pageNo0,
			@RequestParam(value = "pageSize0", defaultValue = "10") Integer pageSize0,
			@RequestParam(value = "pageNo1", defaultValue = "1") Integer pageNo1,
			@RequestParam(value = "pageSize1", defaultValue = "10") Integer pageSize1,
			@RequestParam(value = "type", defaultValue = "") String type, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/app-admin/log/list");

		try {
			// 如果type为空查询所有
			Pagination<Log> pagination0 = this.logService.findPaginationByQuery(this.logService.findAllLogbyQuery("0"),
					pageNo0, pageSize0,Log.class);
			if (pagination0 != null)
				modelAndView.addObject("pageList0", pagination0);
			Pagination<Log> pagination1 = this.logService.findPaginationByQuery(this.logService.findAllLogbyQuery("1"),
					pageNo1, pageSize1,Log.class);
			if (pagination1 != null)
				modelAndView.addObject("pageList1", pagination1);

			if (type.equals("0")) {
				// 查询所有操作日志
				modelAndView.addObject("click",
						"<script type='text/javascript'>$(function(){$('#a').trigger('click')})</script>");

			} else if (type.equals("1")) {
				modelAndView.addObject("click",
						"<script type='text/javascript'>$(function(){$('#b').trigger('click')})</script>");
			}

			modelAndView.addObject("pageno0", pageNo0);
			modelAndView.addObject("pageno1", pageNo1);

		} catch (Exception e) {
			logger.info("查询所有的日志信息失败" + e);
			e.printStackTrace();
		}

		return modelAndView;// 返回
	}

}
