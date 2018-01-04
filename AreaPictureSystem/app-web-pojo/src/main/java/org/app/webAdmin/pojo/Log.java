/**   
* @Title: Log.java 
* @Package org.app.admin.pojo 
* @Description: TODO(用一句话描述该文件做什么) 
* @author fliay
* @date 2017年12月4日 下午5:05:36 
* @version V1.0   
*/
package org.app.webAdmin.pojo;

import org.app.framework.pojo.GeneralBean;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

/** 
* @ClassName: Log 
* @Description: TODO(系统日志类) 
* @author fliay
* @date 2017年12月4日 下午5:05:36 
*  
*/
@Document
public class Log extends GeneralBean {

	/** 
	* @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
	*/ 
	private static final long serialVersionUID = 4369450368479758292L;

	
	private String description;//描述
	private String method;//拦截方法
	private String type;//类别
	private String requestIp;//请求IP
	private String exceptionCode;//错误代号
	private String exceptionDetail;//错误信息
	private String createBy;//操作人
	private String params;
	@DBRef
	private AdminUser adminUser;//用户资料
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRequestIp() {
		return requestIp;
	}
	public void setRequestIp(String requestIp) {
		this.requestIp = requestIp;
	}
	public String getExceptionCode() {
		return exceptionCode;
	}
	public void setExceptionCode(String exceptionCode) {
		this.exceptionCode = exceptionCode;
	}
	public String getExceptionDetail() {
		return exceptionDetail;
	}
	public void setExceptionDetail(String exceptionDetail) {
		this.exceptionDetail = exceptionDetail;
	}
	public String getCreateBy() {
		return createBy;
	}
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	public AdminUser getAdminUser() {
		return adminUser;
	}
	public void setAdminUser(AdminUser adminUser) {
		this.adminUser = adminUser;
	}
	public String getParams() {
		return params;
	}
	public void setParams(String params) {
		this.params = params;
	}
	@Override
	public String toString() {
		return "Log [description=" + description + ", method=" + method + ", type=" + type + ", requestIp=" + requestIp
				+ ", exceptionCode=" + exceptionCode + ", exceptionDetail=" + exceptionDetail + ", createBy=" + createBy
				+  ", params=" + params + ", adminUser=" + adminUser + "]";
	}
	
	
	
	
	
	
	
	
}
