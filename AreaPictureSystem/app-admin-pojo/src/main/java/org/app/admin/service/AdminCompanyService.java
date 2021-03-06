package org.app.admin.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.app.admin.annotation.SystemErrorLog;
import org.app.admin.pojo.AdminCompany;
import org.app.admin.pojo.AdminRole;
import org.app.admin.pojo.AdminUser;
import org.app.admin.util.BaseType;
import org.app.admin.util.BaseType.UserType;
import org.app.framework.service.GeneralServiceImpl;
import org.app.framework.util.Common;
import org.app.framework.util.ExcelReadUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

/**
 * 后台 企业单位管理
 * 
 * @author aaronlau
 *
 */
@Repository("adminCompanyService")
public class AdminCompanyService extends GeneralServiceImpl<AdminCompany> {

	private static final Logger log = LoggerFactory.getLogger(AdminCompanyService.class);

	@Autowired
	private ExcelReadUtil excelReadUtil;

	@Autowired
	private AdminRoleService adminRoleService;

	@Autowired
	private AdminUserService adminUserService;

	/**
	 * 获取所有的企业 @Title: listCompay @Description:
	 * TODO(这里用一句话描述这个方法的作用) @param @return 设定文件 @return List<Company>
	 * 返回类型 @throws
	 */
	public List<AdminCompany> listCompay() {

		Query query = new Query();

		List<AdminCompany> listAdminCompany = this.find(query, AdminCompany.class);

		if(listAdminCompany.size()>0)
			return listAdminCompany;
		else return null;
	}

	
	/**
	 * 
	* @Title: findAdminCompanyById 
	* @Description: TODO(根据id查询企业信息) 
	* @param @param id
	* @param @return    设定文件 
	* @return AdminCompany    返回类型 
	* @throws
	 */
	public AdminCompany findAdminCompanyById(String id){
		
		AdminCompany adminCompany = this.findOneById(id, AdminCompany.class);
		if(adminCompany !=null)
			return adminCompany;
		else
			return null;
	}
	
	/**
	 * @throws IOException
	 * 
	 * @Title: BatchImport @Description: TODO(批量导入) @param @param
	 * file @param @param row @param @return 设定文件 @return String 返回类型 @throws
	 */
	@SystemErrorLog(description = "企业信息批量导入")
	public String BatchImport(File file, int row, HttpSession session) throws IOException {

		String error = "";
		String[][] resultexcel;

		resultexcel = excelReadUtil.readExcel(file, row);
		int rowLength = resultexcel.length;
		ProcessInfo pri = new ProcessInfo();
		pri.allnum = rowLength;
		for (int i = 0; i < rowLength; i++) {
			Query query = new Query();
			AdminCompany importAdminCompany = new AdminCompany();

			pri.nownum = i;
			pri.lastnum = rowLength - i;
			session.setAttribute("proInfo", pri);

			int j = 0;
			try {
				importAdminCompany.setName(resultexcel[i][j]);
				importAdminCompany.setShorts(resultexcel[i][j + 1]);
				importAdminCompany.setAddress(resultexcel[i][j + 2]);
				importAdminCompany.setContacts(resultexcel[i][j + 3]);
				importAdminCompany.setTelPhone(resultexcel[i][j + 4]);
				importAdminCompany.setEmail(resultexcel[i][j + 5]);
				String nature = resultexcel[i][j + 6];
				
				if (nature.toString().equals("直属单位")) {
					importAdminCompany.setNature(BaseType.CompanyNature.ZHISHU);
				}else {
					importAdminCompany.setNature(BaseType.CompanyNature.JICHENG);
				}

				importAdminCompany.setType(resultexcel[i][j + 7]);
				importAdminCompany.setRemark(resultexcel[i][j + 8]);

				String telPhone = importAdminCompany.getTelPhone();
				// 判断导入的手机号是否为空，如果为空的话添加error信息
				log.info("绑定人手机号" + telPhone);
				if (Common.isEmpty(telPhone)) {
					error += "导入文件过程中出现错误第<b>&nbsp&nbsp" + (i + 2)
							+ "&nbsp&nbsp</b>行出现错误内容为<b>&nbsp&nbsp导入企业的联系人手机号不能为空&nbsp&nbsp</b></br>";
					continue;
				}

				log.info(telPhone);
				query.addCriteria(Criteria.where("telPhone").is(telPhone));
				// 通过用户的手机号查询是否存在该信息
				AdminCompany adminCompany = this.findOneByQuery(query, AdminCompany.class);
				
				//2018年2月2日 15:54:36  修改后的导入企业
				if(adminCompany !=null){
					
					error += "导入文件过程中出现已经存在的手机号码，第<b>&nbsp&nbsp" + (i + 2)
							+ "&nbsp&nbsp</b>行出现重复内容为<b>&nbsp&nbsp导入企业的联系人手机号:"+telPhone+"请手动去修改该条信息！&nbsp&nbsp</b></br>";
					continue;
				}
				
				
				
				//2018年2月2日 15:50:13  修改 导入企业如果出现重复的手机号则不让他导入，反馈到页面并且提示
				/*// 如果存在该企业的信息
				if (adminCompany != null) {
					if (adminCompany.getTelPhone().equals(telPhone)) {
						adminCompany.setAddress(importAdminCompany.getAddress());
						adminCompany.setAdminUser(adminCompany.getAdminUser());
						adminCompany.setContacts(importAdminCompany.getContacts());
						adminCompany.setEmail(importAdminCompany.getEmail());
						adminCompany.setName(importAdminCompany.getName());
						adminCompany.setNature(importAdminCompany.getNature());
						adminCompany.setRemark(importAdminCompany.getRemark());
						adminCompany.setShorts(importAdminCompany.getShorts());
						adminCompany.setTelPhone(importAdminCompany.getTelPhone());
						adminCompany.setType(importAdminCompany.getType());

						// 执行更新操作。
						this.save(adminCompany);
					}
				}*/

				if (adminCompany == null) {
					// 通过手机号判断是否存在该用户的帐号
					AdminUser findAdminUser = this.adminUserService
							.findAdminUserByTelPhone(importAdminCompany.getTelPhone());
					// 获取SCHOOLADMIN的角色权限
					AdminRole adminRole = this.adminRoleService.findUserTypeBy(UserType.SCHOOLADMIN.toString());
					// 如果通过手机号查询的用户不为空则执行更新操作
					if (findAdminUser != null) {
						// importAdminCompany.setAdminUser(findAdminUser);
						// //创建企业信息
						// this.insert(importAdminCompany);
						// findAdminUser.setAdminCompany(importAdminCompany);
						// this.adminUserService.save(findAdminUser);

						error += "导入文件过程中出现错误第<b>&nbsp&nbsp" + (i + 2)
								+ "&nbsp&nbsp</b>行出现错误内容为<b>&nbsp&nbsp导入企业的联系人手机号在用户中已经存在,请核实后再添加！&nbsp&nbsp</b></br>";
						continue;

					} else {

						// 初始化帐号
						AdminUser adminUser = new AdminUser();
						adminUser.setUserName(importAdminCompany.getTelPhone());// 默认账户绑定手机
						// TODO 后面需要对密码进修加密操作
						adminUser.setPassword(importAdminCompany.getTelPhone());// 默认密码为手机号
						adminUser.setEmail(importAdminCompany.getEmail());
						adminUser.setName(importAdminCompany.getContacts());
						adminUser.setTel(importAdminCompany.getTelPhone());
						adminUser.setUserType(UserType.SCHOOLADMIN);
						adminUser.setSpaceSize("30");// 设置默认控件大小
						// 创建adminRole的引用
						adminUser.setAdminRole(adminRole);
						this.adminUserService.insert(adminUser);


						importAdminCompany.setAdminUser(adminUser);
						// 创建企业信息
						this.insert(importAdminCompany);

						// 获取adminUser的id进行查询并且更新绑定企业信息
						AdminUser adminUserUp = this.adminUserService.findOneById(adminUser.getId(), AdminUser.class);
						adminUserUp.setAdminCompany(importAdminCompany);
						this.adminUserService.save(adminUserUp);
					}
				}
				// 捕捉批量导入过程中遇到的错误，记录错误行数继续执行下去
			} catch (Exception e) {
				log.debug("导入文件过程中出现错误第" + (i + 2) + "行出现错误" + e);
				String aa = e.getLocalizedMessage();
				String b = aa.substring(aa.indexOf(":") + 1, aa.length()).replaceAll("\"", "");

				error += "导入文件过程中出现错误第<b>&nbsp&nbsp" + (i + 2) + "&nbsp&nbsp</b>行出现错误内容为<b>&nbsp&nbsp" + b
						+ "&nbsp&nbsp</b></br>";
				if ((i + 1) < rowLength) {
					continue;
				}

			}
		}
		log.info(error);

		return error;
	}

	
	
	/**
	 * 
	* @Title: findtelPhone 
	* @Description: TODO(根据手机号判断是否重复) 
	* @param @param telPhone
	* @param @return    设定文件 
	* @return boolean    返回类型 
	* @throws
	 */
	public boolean findtelPhone(String telPhone){
		
		Query query = new Query();
		
		query.addCriteria(Criteria.where("telPhone").is(telPhone));
		
		List<AdminCompany> list = this.find(query, AdminCompany.class);
			
		if(list.size()>0)
			return true;
		else
			return false;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 
	 * @Title: findproInfo @Description: TODO(获取上传进度) @param @param
	 * request @param @return 设定文件 @return ProcessInfo 返回类型 @throws
	 */
	public ProcessInfo findproInfo(HttpServletRequest request) {

		return (ProcessInfo) request.getSession().getAttribute("proInfo");

	}

	class ProcessInfo {
		public long allnum = 0;// 导入数据总数
		public long nownum = 0;// 当前导入第几条
		public long lastnum = 0;// 还剩几条数据
	}

	
	
	
}
