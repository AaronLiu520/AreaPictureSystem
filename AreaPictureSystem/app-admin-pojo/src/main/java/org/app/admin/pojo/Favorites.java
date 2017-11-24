package org.app.admin.pojo;

import org.app.framework.pojo.GeneralBean;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;


@Document(collection = "favorites")
public class Favorites extends GeneralBean{
     private String userId;//用户名
     private Enum  forderType;//文件夹类别，区域，个人，学校
     @DBRef
     private ForderActivity forderActivity;//收藏文件夹
     @DBRef
     private Resource resource;//收藏资源
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Enum getForderType() {
		return forderType;
	}
	public void setForderType(Enum forderType) {
		this.forderType = forderType;
	}
	public ForderActivity getForderActivity() {
		return forderActivity;
	}
	public void setForderActivity(ForderActivity forderActivity) {
		this.forderActivity = forderActivity;
	}
	public Resource getResource() {
		return resource;
	}
	public void setResource(Resource resource) {
		this.resource = resource;
	}
     
     
}
