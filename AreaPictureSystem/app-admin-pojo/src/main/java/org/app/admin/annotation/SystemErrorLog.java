/**   
* @Title: SystemServiceLog.java 
* @Package com.app.admin.annotation 
* @Description: TODO(用一句话描述该文件做什么) 
* @author fliay
* @date 2017年12月4日 下午4:56:36 
* @version V1.0   
*/
package org.app.admin.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/** 
* @ClassName: SystemServiceLog 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author fliay
* @date 2017年12月4日 下午4:56:36 
*  
*/
@Target({ ElementType.PARAMETER, ElementType.METHOD })  
@Retention(RetentionPolicy.RUNTIME)  
@Documented  
public @interface SystemErrorLog {

		String description() default "";
}
