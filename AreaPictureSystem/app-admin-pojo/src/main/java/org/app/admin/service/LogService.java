/**   
* @Title: LogService.java 
* @Package org.app.admin.service 
* @Description: TODO(用一句话描述该文件做什么) 
* @author fliay
* @date 2017年12月4日 下午5:17:48 
* @version V1.0   
*/
package org.app.admin.service;

import java.util.List;

import org.app.admin.pojo.Log;
import org.app.framework.service.GeneralServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

/**
 * @ClassName: LogService
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author fliay
 * @date 2017年12月4日 下午5:17:48
 * 
 */
@Repository
public class LogService extends GeneralServiceImpl<Log> {

	private static final Logger log = LoggerFactory.getLogger(LogService.class);

	/***
	 * 时间倒叙查询所有的日志信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Log> findAllLog() throws Exception {
		Query query = new Query();
		query.with(new Sort(new Order(Direction.DESC, "createDate")));

		List<Log> loglist = this.find(query, Log.class);

		if (loglist == null)
			return null;
		else
			return loglist;
	}

	/**
	 * 
	 * @Title: findAllLogbyQuery @Description: TODO(查询所有日志) @param @param type
	 * 0为操作日志 1为异常日志 @param @return 设定文件 @return Query 返回类型 @throws
	 */
	public Query findAllLogbyQuery(String type) {

		Query query = new Query();
		query.addCriteria(Criteria.where("type").is(type));
		query.with(new Sort(new Order(Direction.DESC, "createDate")));
		return query;
	}

}
