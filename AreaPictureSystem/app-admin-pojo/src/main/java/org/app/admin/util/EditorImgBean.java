package org.app.admin.util;

public class EditorImgBean {

    private String resourceName;      // 3 资源名称
    private String person;              // 3 被拍摄者
    private String photographer;        // 3 拍摄者

    private String resourceAddress;     // 3 资源地址
    private String description;         // 3 描述

	private int sort;// 图片自定义排序

	public int getSort() {
		return sort;
	}

	public void setSort(int sort) {
		this.sort = sort;
	}

    
    public String getResourceName() {
        return resourceName;
    }

    public void setResourceName(String resourceName) {
        this.resourceName = resourceName;
    }

    public String getPerson() {
        return person;
    }

    public void setPerson(String person) {
        this.person = person;
    }

    public String getPhotographer() {
        return photographer;
    }

    public void setPhotographer(String photographer) {
        this.photographer = photographer;
    }

    public String getResourceAddress() {
        return resourceAddress;
    }

    public void setResourceAddress(String resourceAddress) {
        this.resourceAddress = resourceAddress;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "EditorImgBean{" +
                "resourceName='" + resourceName + '\'' +
                ", person='" + person + '\'' +
                ", photographer='" + photographer + '\'' +
                ", resourceAddress='" + resourceAddress + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
