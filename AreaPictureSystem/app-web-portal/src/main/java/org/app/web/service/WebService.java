/**   
* @Title: WebService.java 
* @Package org.app.web.service 
* @Description: TODO(用一句话描述该文件做什么) 
* @author fliay
* @date 2018年1月4日 下午2:01:07 
* @version V1.0   
*/
package org.app.web.service;

import java.util.List;

import org.app.framework.service.GeneralServiceImpl;
import org.app.framework.util.BasicDataResult;
import org.app.framework.util.Common;
import org.app.webAdmin.pojo.AdminMenu;
import org.app.webAdmin.pojo.Users;
import org.app.webAdmin.service.AdminMenuService;
import org.app.webAdmin.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

/** 
* @ClassName: WebService 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author fliay
* @date 2018年1月4日 下午2:01:07 
*  
*/
@SuppressWarnings("rawtypes")
@Repository
public class WebService extends GeneralServiceImpl  {
	
	@Autowired
	private AdminMenuService adminMenuService;
	
	@Autowired
	private UsersService  usersService;
	
	/**
	 * 
	* @Title: findAllWebMenu 
	* @Description: TODO(获取所有的web菜单) 
	* @param @return    设定文件 
	* @return List<adminMenu>    返回类型 
	* @throws
	 */
	public List<AdminMenu> findAllWebMenu(){
		
		Query query = new Query();
		//获取所有属于前台的菜单
		query.addCriteria(Criteria.where("isWebMenu").is(true)).addCriteria(Criteria.where("pid").ne("0"));
		query.with(new Sort(Sort.Direction.ASC, "orderby"));
		List<AdminMenu> list = this.find(query, AdminMenu.class);
		
		return list.size()>0?list:null;
		
	}
	
	
	
	/**
	 * 
	* @Title: findUserByPhone_Email_AccountName 
	* @Description: TODO(通过有些) 
	* @param @return    设定文件 
	* @return boolean    返回类型 
	* @throws
	 */
	public BasicDataResult findUserByPhone_Email_AccountName(String phone,String email,String accountName){
		
		Query query = new Query();
		//Criteria cr = new Criteria();
		//query.addCriteria(cr.orOperator(Criteria.where("phone").is(phone),Criteria.where("email").is(email),Criteria.where("accountName").is(accountName)));
		if(Common.isNotEmpty(phone)){
			query.addCriteria(Criteria.where("phone").is(phone));
			Boolean b = this.usersService.exists(query, Users.class);
			if(b){
				return BasicDataResult.build(203, "输入的手机号已经被使用过", null);
			}
		}
		if(Common.isNotEmpty(email)){
			query.addCriteria(Criteria.where("email").is(email));
			Boolean b = this.usersService.exists(query, Users.class);
			if(b){
				return BasicDataResult.build(203, "输入的邮箱地址已经被使用过", null);
			}
		}
		if(Common.isNotEmpty(accountName)){
			query.addCriteria(Criteria.where("accountName").is(accountName));
			Boolean b = this.usersService.exists(query, Users.class);
			if(b){
				return BasicDataResult.build(203, "输入的帐号已经被注册", null);
			}
		}
		
		return BasicDataResult.ok();
	}	
	
	
	
	/**
	 * 
	* @Title: addUser 
	* @Description: TODO(添加用户) 
	* @param @param user
	* @param @return    设定文件 
	* @return BasicDataResult    返回类型 
	* @throws
	 */
	public BasicDataResult addUser(Users users){
		
		if(Common.isEmpty(users.getAccountName())){
			return BasicDataResult.build(202, "帐号不能为空", null);
		}
		
		if(Common.isEmpty(users.getEmail())){
			return BasicDataResult.build(202, "邮箱地址不能为空", null);
		}
		
		if(Common.isEmpty(users.getName())){
			return BasicDataResult.build(202, "姓名不能为空", null);
		}
		
		if(Common.isEmpty(users.getPassword())){
			return BasicDataResult.build(202, "密码不能为空", null);
		}
		
		if(Common.isEmpty(users.getSchool())){
			return BasicDataResult.build(202, "所属学校不能为空", null);
		}
		try{
			users.setStatus(true);
			this.usersService.save(users);
		}catch(Exception e){
			e.printStackTrace();
			return BasicDataResult.build(400, "添加用户失败，请与管理员联系", null);
		}
		
		return BasicDataResult.build(200, "注册成功，请妥善保管帐号密码！", null);
	}
	
	
	
	
	/**
	 * 
	* @Title: userLogin 
	* @Description: TODO(投稿用户登录) 
	* @param @return    设定文件 
	* @return BasicDataResult    返回类型 
	* @throws
	 */
	@SuppressWarnings("unused")
	public BasicDataResult userLogin(Users users){
		
		
		if(Common.isEmpty(users.getAccountName())){
			return BasicDataResult.build(203, "登录的帐号不能为空", null);
		}
		if(Common.isEmpty(users.getPassword())){
			return BasicDataResult.build(203, "登录的密码不能为空", null);
		}
		
		Query query = new Query();
	
		query.addCriteria(Criteria.where("accountName").is(users.getAccountName())).addCriteria(Criteria.where("password").is(users.getPassword()));
		
		Users u  = this.usersService.findOneByQuery(query, Users.class);
		
		if(u == null){
			return BasicDataResult.build(400, "登录失败，用户名或密码错误！", null);
		}
		
		
		if(u.isStatus()==false){
			return BasicDataResult.build(203, "您登录的帐号已经被禁用，请与管理员联系", null);
		}
		
		if(u!=null){
			return BasicDataResult.build(200, "登录成功",u);
		}
		
		return BasicDataResult.build(400, "登录失败，用户名或密码错误！", null);
		
	}
	
	
	
	
	
	
	
	
	

}
