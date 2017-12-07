package org.app.admin.pojo;

import java.util.List;

import org.app.admin.util.BaseType;
import org.app.framework.pojo.GeneralBean;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

/**4
 * 
* @ClassName: ForderActivity 
* @Description: TODO(创建文件夹，创建活动类) 
* @author fliay
* @date 2017年11月20日 下午2:26:10 
*
 */
@Document
public class ForderActivity extends GeneralBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5309184221590630053L;

	
/*	表名：文件夹/活动表  ForderActivity  								
	字段名称		属性		类型		备注		
	唯一id		id		String				
	命名		forderActivityName		String				
	地址		address		String				
	图片数量		sumPotoCount		int				
	公司或个人ID		boundId		String		绑定对象Id(公司，个人)		
	区域，直属，个人		type		Enum		界面统计		
	描述		description		String				
	活动时间		activityTime		Date				
	创建时间		createTime		Date				
	文件夹大小		folderSize		String				
	资源集合		List<Resource>		String				
	创建者		creatUser		String		创建者Id		*/


	
	public String getForderActivityName() {
		return forderActivityName;
	}
	public void setForderActivityName(String forderActivityName) {
		this.forderActivityName = forderActivityName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSumPotoCount() {
		return sumPotoCount;
	}
	public void setSumPotoCount(String sumPotoCount) {
		this.sumPotoCount = sumPotoCount;
	}
	public String getBoundId() {
		return boundId;
	}
	public void setBoundId(String boundId) {
		this.boundId = boundId;
	}


	public BaseType.Type getType() {
		return type;
	}

	public void setType(BaseType.Type type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getActivityTime() {
		return activityTime;
	}
	public void setActivityTime(String activityTime) {
		this.activityTime = activityTime;
	}
	public Long getFolderSize() {
		return folderSize;
	}
	public void setFolderSize(Long folderSize) {
		this.folderSize = folderSize;
	}
	public List<Resource> getResource() {
		return resource;
	}
	public void setResource(List<Resource> resource) {
		this.resource = resource;
	}
	public AdminUser getCreatUser() {
		return creatUser;
	}
	public void setCreatUser(AdminUser creatUser) {
		this.creatUser = creatUser;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	

	private String forderActivityName;// 文件夹名称、活动名称
	private String address;// 活动地址
	private String sumPotoCount;// 图片数量
	private String boundId;// 绑定对象Id(公司、个人)
	private BaseType.Type type; // 区域，直属单位，个人（用于统计）
	private String description; // 描述
	private String activityTime; // 活动时间
/*	private Date createTime; // 创建时间
*/	private Long folderSize; // 文件夹大小
	private List<Resource> resource;// 资源集合
	@DBRef
	private AdminUser creatUser;//创建者
	private String parentId;// 付文件夹Id




}
