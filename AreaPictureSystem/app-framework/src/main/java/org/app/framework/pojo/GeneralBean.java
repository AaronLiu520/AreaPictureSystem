package org.app.framework.pojo;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.data.annotation.Id;

/**
 * 通用的Bean, 所有POJO实体类务必实现些类
 * 
 * @author aaron
 *
 */
@SuppressWarnings("serial")
public class GeneralBean implements Serializable {

	@Id
	private String id;	//mongodb的唯一标识ID.
	private Boolean isDelete; // 是否删除(默认为：false)
	private Date createTime; // 创建时间（详细时间）
	private String createDate;// 创建日期

	public GeneralBean() {

		this.createTime = new Date();// 创建时间
		this.isDelete = false; //
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		this.createDate = sdf.format(new Date());// 创建日期

	}
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	/**
	 * 是否删除(默认为：false)
	 * 
	 * @return
	 */
	public Boolean getIsDelete() {
		return isDelete;
	}

	/**
	 * 是否删除(默认为：false)
	 * 
	 * @param isDelete
	 */
	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}

	/**
	 * 创建时间
	 * 
	 * @return
	 */
	public Date getCreateTime() {
		return createTime;
	}

	/**
	 * 创建时间
	 * 
	 * @param createTime
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCreateDate() {
		return createDate;
	}

	@Override
	public String toString() {
		return "GeneralBean [id=" + id + ", isDelete=" + isDelete
				+ ", createTime=" + createTime + ", createDate=" + createDate
				+ "]";
	}

}
