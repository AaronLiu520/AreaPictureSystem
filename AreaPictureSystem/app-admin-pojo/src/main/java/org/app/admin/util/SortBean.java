package org.app.admin.util;


/**
 * @描述：所有排行的基类
 * @author chrealcool
 * 
 */

public class SortBean implements Comparable<SortBean> {
    
    public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSortnum() {
		return sortnum;
	}

	public void setSortnum(int sortnum) {
		this.sortnum = sortnum;
	}

	public int getUploadnum() {
		return uploadnum;
	}

	public void setUploadnum(int uploadnum) {
		this.uploadnum = uploadnum;
	}

	@Override
	public String toString() {
		return "SortBean [name=" + name + ", sortnum=" + sortnum + ", uploadnum=" + uploadnum + "]";
	}

	private String name;
    private int sortnum;
    private int uploadnum;
    
	@Override
	public int compareTo(SortBean o) {
		return this.uploadnum-o.uploadnum;
	}

}
