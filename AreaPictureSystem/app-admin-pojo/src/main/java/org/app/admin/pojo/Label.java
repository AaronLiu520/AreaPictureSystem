package org.app.admin.pojo;

import org.app.framework.pojo.GeneralBean;
import org.springframework.data.mongodb.core.mapping.Document;

/*
 * @author ch
 * 标签类
 */


@Document(collection = "label")
public class Label extends GeneralBean {
	 private String labelName;//标签名字
     private String userid;//创建老师
     private String companyid;//单位Id
	public String getLabelName() {
		return labelName;
	}
	public void setLabelName(String labelName) {
		this.labelName = labelName;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getCompanyid() {
		return companyid;
	}
	public void setCompanyid(String companyid) {
		this.companyid = companyid;
	}
	@Override
	public String toString() {
		return "Label [labelName=" + labelName + ", userid=" + userid + ", companyid=" + companyid + "]";
	}
     
}
