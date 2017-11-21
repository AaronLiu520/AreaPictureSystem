/**   
* @Title: ForderActivityService.java 
* @Package org.app.admin.service 
* @Description: TODO(用一句话描述该文件做什么) 
* @author fliay
* @date 2017年11月20日 下午3:44:49 
* @version V1.0   
*/
package org.app.admin.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.app.admin.pojo.AdminUser;
import org.app.admin.pojo.ForderActivity;
import org.app.admin.pojo.Resource;
import org.app.framework.service.GeneralServiceImpl;
import org.app.framework.util.Common;
import org.app.framework.util.CommonEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * @ClassName: ForderActivityService
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author fliay
 * @date 2017年11月20日 下午3:44:49
 * 
 */
@Repository
public class ForderActivityService extends GeneralServiceImpl<ForderActivity> {
	
	@Autowired
	private AdminUserService adminUserService;
	
	
	//TODO
	public String createForder(ForderActivity forderActivity, String enumtype,HttpSession session) {

		if(Common.isEmpty(forderActivity.getForderActivityName())){
			
			return "添加的文件夹/活动不能为空";
			
		}else{
			//获取用户Session
			AdminUser adminUser =  (AdminUser) session.getAttribute(CommonEnum.USERSESSION);
			AdminUser newAdminUser = null;
			if(adminUser != null){
				newAdminUser = this.adminUserService.findAdminUserById(adminUser.getId());
			}
			
			if (enumtype.equals("QUYU")) {
				forderActivity.setType(Type.QUYU);
			} else if (enumtype.equals("ZHISHU")) {
				forderActivity.setType(Type.ZHISHU);
			} else if (enumtype.equals("GEREN")) {
				forderActivity.setType(Type.GEREN);
			}
			
			if(Common.isEmpty(forderActivity.getParentId())){
				forderActivity.setParentId(null);
			}

			//1.parentId=null Id=null   创建父文件夹
			if (Common.isEmpty(forderActivity.getParentId()) && Common.isEmpty(forderActivity.getId())) {
				forderActivity.setResource(new ArrayList<Resource>());
				forderActivity.setCreatUser(newAdminUser);
				// 新建文件夹
				this.insert(forderActivity);

				
				
				
				//2.parentId=null Id!=null  修改父文件夹
			}else if( Common.isEmpty(forderActivity.getParentId()) && Common.isNotEmpty(forderActivity.getId())){
				
				
				
				
				
				//3.parentId!=null Id=null 创建子文件夹
			}else if(Common.isNotEmpty(forderActivity.getParentId()) && Common.isEmpty(forderActivity.getId())){
				
				
				
				
				//4.parentId!=null Id!=null 修改子文件夹
			}else if(Common.isNotEmpty(forderActivity.getParentId()) && Common.isNotEmpty(forderActivity.getId())){
				
			}
			
		}
		
		
		
		
		
		
		return null;
	}

	/**
	 * 
	 * @ClassName: Type
	 * @Description: TODO( 创建枚举类 QUYU表示区域级 ZHISHU 直属 GEREN 个人 )
	 * @author fliay
	 * @date 2017年11月20日 下午2:26:46
	 *
	 */
	static enum Type {
		QUYU, ZHISHU, GEREN
	}

}
