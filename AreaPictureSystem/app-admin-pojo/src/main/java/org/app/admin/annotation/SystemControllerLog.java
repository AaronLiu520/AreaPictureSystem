package org.app.admin.annotation;
import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
/** 
* @ClassName: SystemControllerLog 
* @Description: TODO(自定义Controller注解针对Controller层的拦截) 
* @author fliay
* @date 2017年12月4日 下午4:37:17 
*  
*/
/*@Target({ElementType.METHOD,ElementType.PARAMETER})//设置注解作用的目标
@Retention(RetentionPolicy.RUNTIME)//注解在Class字节码文件中存在，通过反射可以获取到
//@Inherited//子类继承父类的注解	
@Documented

*/
@Target({ ElementType.PARAMETER, ElementType.METHOD })  
@Retention(RetentionPolicy.RUNTIME)  
@Documented  
public @interface SystemControllerLog {
	
	//使用注解
	 String description()  default ""; 
	 
	
}
