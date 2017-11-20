/**   
* @Title: Source.java 
* @Package org.app.FileSystem.pojo 
* @Description: TODO(用一句话描述该文件做什么) 
* @author fliay
* @date 2017年11月20日 下午2:37:36 
* @version V1.0   
*/
package org.app.admin.pojo;

import org.app.framework.pojo.GeneralBean;
import org.springframework.data.mongodb.core.mapping.Document;

/** 
* @ClassName: Source 
* @Description: TODO(存放二进制流) 
* @author fliay
* @date 2017年11月20日 下午2:37:36 
*  
*/
@Document
public class Source extends GeneralBean {

	/** 
	* @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
	*/ 
	private static final long serialVersionUID = -6672111951879647285L;

	
	private String sourceFile;//文件流  二进制


	public String getSourceFile() {
		return sourceFile;
	}


	public void setSourceFile(String sourceFile) {
		this.sourceFile = sourceFile;
	}
	
	
	
	
}
