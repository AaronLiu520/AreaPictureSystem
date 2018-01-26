/**   
* @Title: Type.java 
* @Package org.app.admin.pojo 
* @Description: TODO(用一句话描述该文件做什么) 
* @author fliay
* @date 2018年1月10日 下午4:25:35 
* @version V1.0   
*/
package org.app.admin.pojo;

import org.app.admin.util.BaseType;
import org.app.framework.pojo.GeneralBean;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

/** 
* @ClassName: Type 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author fliay
* @date 2018年1月10日 下午4:25:35 
*  
*/
/*@Document*/
public class Type extends GeneralBean{
	
	
	/** 
	* @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
	*/ 
	private static final long serialVersionUID = -997114984789869876L;
	
	private BaseType.Type type;

	public BaseType.Type getType() {
		return type;
	}

	public void setType(BaseType.Type type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Type [type=" + type + "]";
	}
	
	

}
