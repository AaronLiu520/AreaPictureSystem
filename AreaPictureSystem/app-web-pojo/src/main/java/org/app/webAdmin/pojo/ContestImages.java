/**   
* @Title: ContestImages.java 
* @Package org.app.webAdmin.pojo 
* @Description: TODO(用一句话描述该文件做什么) 
* @author fliay
* @date 2018年1月24日 下午3:12:55 
* @version V1.0   
*/
package org.app.webAdmin.pojo;

import org.app.framework.pojo.GeneralBean;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

/** 
* @ClassName: ContestImages 
* @Description: TODO(参赛图片) 
* @author fliay
* @date 2018年1月24日 下午3:12:55 
*  
*/

@Document
public class ContestImages  extends GeneralBean{

	   	/** 
	* @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
	*/ 
	private static final long serialVersionUID = -383705638427041003L;
		private String uploadUsersId;        // 参赛者ID
	    private String originalName;        // 原名
	    private String originalPath;        //  路径
	    private String extensionName;       //  扩展名
	    private String generateName;        //  生成名（新名字）
	    private String savePath;			//保存路径
	    @DBRef
	    private Users users;        		//用户Id
	    private String contestId;			//比赛id
	    @DBRef
	    private Contest contest;			//关联比赛信息	
	    @DBRef
	    private UsersUploads usersUploads;
	    private String usersUploadsId;      //关联图片描述信息 
	    
	    private String belongTo;		//图片所属
	    
	    
	    
		public String getBelongTo() {
			return belongTo;
		}
		public void setBelongTo(String belongTo) {
			this.belongTo = belongTo;
		}
		public String getUsersUploadsId() {
			return usersUploadsId;
		}
		public void setUsersUploadsId(String usersUploadsId) {
			this.usersUploadsId = usersUploadsId;
		}
		public String getUploadUsersId() {
			return uploadUsersId;
		}
		public void setUploadUsersId(String uploadUsersId) {
			this.uploadUsersId = uploadUsersId;
		}
		public String getOriginalName() {
			return originalName;
		}
		public void setOriginalName(String originalName) {
			this.originalName = originalName;
		}
		public String getOriginalPath() {
			return originalPath;
		}
		public void setOriginalPath(String originalPath) {
			this.originalPath = originalPath;
		}
		public String getExtensionName() {
			return extensionName;
		}
		public void setExtensionName(String extensionName) {
			this.extensionName = extensionName;
		}
		public String getGenerateName() {
			return generateName;
		}
		public void setGenerateName(String generateName) {
			this.generateName = generateName;
		}
		public Users getUsers() {
			return users;
		}
		public void setUsers(Users users) {
			this.users = users;
		}
		public String getContestId() {
			return contestId;
		}
		public void setContestId(String contestId) {
			this.contestId = contestId;
		}
		public Contest getContest() {
			return contest;
		}
		public void setContest(Contest contest) {
			this.contest = contest;
		}
		public String getSavePath() {
			return savePath;
		}
		public void setSavePath(String savePath) {
			this.savePath = savePath;
		}
		public UsersUploads getUsersUploads() {
			return usersUploads;
		}
		public void setUsersUploads(UsersUploads usersUploads) {
			this.usersUploads = usersUploads;
		}
		@Override
		public String toString() {
			return "ContestImages [uploadUsersId=" + uploadUsersId + ", originalName=" + originalName
					+ ", originalPath=" + originalPath + ", extensionName=" + extensionName + ", generateName="
					+ generateName + ", savePath=" + savePath + ", users=" + users + ", contestId=" + contestId
					+ ", contest=" + contest + ", usersUploads=" + usersUploads + ", usersUploadsId=" + usersUploadsId
					+ "]";
		}
		
	    
	    
	    
}
