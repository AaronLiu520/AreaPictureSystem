package org.app.admin.service;

import java.io.File;
import java.io.IOException;

import org.app.admin.pojo.AdminCompany;
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
 * @author aaronlau
 *
 */
@Repository("adminCompanyService")
public class AdminCompanyService extends GeneralServiceImpl<AdminCompany> {
	
	private static final Logger log = LoggerFactory.getLogger(AdminCompanyService.class);
	
	@Autowired
	private ExcelReadUtil excelReadUtil;
	
	
	/**
	 * @throws IOException 
	 * 
	* @Title: BatchImport 
	* @Description: TODO(批量导入) 
	* @param @param file
	* @param @param row
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	public String BatchImport(File file,int row) throws IOException{
		Query query = new Query();
		AdminCompany importAdminCompany = new AdminCompany();
		String error = "";
		  String[][] resultexcel;
		  
	       resultexcel = excelReadUtil.readExcel(file,row);
		       int rowLength = resultexcel.length;
	/*	      ProcessInfo pri = new ProcessInfo();  
		     pri.allnum=rowLength;*/
		       for(int i=0;i<rowLength;i++) {
/*    		    	  pri.nownum=i;
     		     pri.lastnum=rowLength-i;
     		     session.setAttribute("proInfo",pri);
     		     System.out.println("当前导入"+pri.nownum);
     		     System.out.println("当前导入"+pri.nownum);*/  
		    	   int j=0;
		    	   try{
		    		   importAdminCompany.setName(resultexcel[i][j]);
		    		   importAdminCompany.setShorts(resultexcel[i][j+1]);
		    		   importAdminCompany.setContacts(resultexcel[i][j+2]);
		    		   importAdminCompany.setTelPhone(resultexcel[i][j+3]);
		    		   importAdminCompany.setRemark(resultexcel[i][j+4]);
		    		   importAdminCompany.setNature(resultexcel[i][j+5]);
		    		   importAdminCompany.setType(resultexcel[i][j+6]);
		
		              //判断导入的手机号是否为空，如果为空的话添加error信息
		              if(Common.isNotEmpty(importAdminCompany.getTelPhone())){
		            	 error+="导入文件过程中出现错误第<b>&nbsp&nbsp"+(i+2)+"&nbsp&nbsp</b>行出现错误内容为<b>&nbsp&nbsp导入企业的联系人手机号不能为空&nbsp&nbsp</b></br>";
     		            continue;
		              }
		              //通过用户的手机号查询是否存在该信息
		              AdminCompany adminCompany = this.findOneByQuery(query.addCriteria(Criteria.where("telPhone").is(importAdminCompany.getTelPhone())), AdminCompany.class);
		              
		              //如果存在该企业的信息
		             if(adminCompany!=null){
		            	 if(adminCompany.getTelPhone().equals(importAdminCompany.getTelPhone())){
		            		 //执行更新操作。
		            		 this.save(importAdminCompany);
		            	 }
		             }
		             
		              if(adminCompany==null){
		            	  
  		   				this.insert(importAdminCompany);
		    	   }
		              	//捕捉批量导入过程中遇到的错误，记录错误行数继续执行下去
		              }catch(Exception e){
		            	 log.debug("导入文件过程中出现错误第"+(i+2)+"行出现错误"+e);
		            	String aa=e.getLocalizedMessage();
		            	String b=aa.substring(aa.indexOf(":")+1,aa.length()).replaceAll("\"", "");
		            	 
		            	error+="导入文件过程中出现错误第<b>&nbsp&nbsp"+(i+2)+"&nbsp&nbsp</b>行出现错误内容为<b>&nbsp&nbsp"+b+"&nbsp&nbsp</b></br>";
		            	 if((i+1)<rowLength){
		            		 continue;
		            	 }
		            	
		              }
		       		}
		       log.info(error);
		
		
		
		return error;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
}
