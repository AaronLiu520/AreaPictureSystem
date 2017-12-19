package org.app.admin.pojo;


public  class  uploadStatistics implements Comparable<uploadStatistics>{
	
	private String companyName;//单位名称
	private int no;	//上传排行
	private int num;//上传图片的数量
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	/* (非 Javadoc) 
	* <p>Title: compareTo</p> 
	* <p>Description: </p> 
	* @param o
	* @return 
	* @see java.lang.Comparable#compareTo(java.lang.Object) 
	*/
	public int compareTo(uploadStatistics o) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
