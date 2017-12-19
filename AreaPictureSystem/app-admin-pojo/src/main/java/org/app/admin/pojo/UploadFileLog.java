package org.app.admin.pojo;

public class UploadFileLog {
   private String date;
   private String name;
   private Double imgSize;
   private String place ;
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public Double getImgSize() {
	return imgSize;
}
public void setImgSize(Double imgSize) {
	this.imgSize = imgSize;
}
public String getPlace() {
	return place;
}
public void setPlace(String place) {
	this.place = place;
}
@Override
public String toString() {
	return "UploadFileLog [date=" + date + ", name=" + name + ", imgSize=" + imgSize + ", place=" + place + "]";
}

}
