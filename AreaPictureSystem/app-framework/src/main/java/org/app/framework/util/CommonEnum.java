package org.app.framework.util;

import java.io.File;

/**
 * 常量信息（用户名session、上传文件地址等等。）
 * @author mac
 *
 */
public interface CommonEnum {

	/**
	 *  文件管理，上传路径
	 */
	public  final String UPLOADFILES="uploadFiles";
	public  final String OK="ok";
	public  final String ERROR="error";
	
	public final int SUCCESS =200;
	public final int WRONG = 0;		
	
	
	public final String NEWSFILE = "FileUpload"+File.separator+"news";
	
	/**
	 * session 常量管理。
	 */
	public  final String USERSESSION="userSession";//管理后台（session)

	public  final String WEBSESSION="webSession";//应用前台（session)

	public  final String WECHARSESSION="weCharSession";//微信（session)

	public final String WEBMENUSESSION="webMenuSession";//菜单管理选择中状态。
	
	//项目地址
	public final String PROJECTADDRESS="projectAddress";//不同区域、不公司的项目地址。

	
	public final String WEBMENUS="webmenus";//前台菜单
	
	
	public final String WEBSETTING = "websetting";//网站配置

}
