package org.app.admin.util;

public class ImgInfoBean {
	private String imgHeight;// 图片高度
	private String imgWidth;// 图片宽度
	private String dateTime;// 拍摄时间
	private String altitude;// 海拔
	private String latitude;// 纬度
	private String longitude;// 经度
	private Double imgSize; // 文件大小
	private String imgName; // 文件名称

	private String make;// 相机名 Canon
	private String model;// 相机型号 Canon EOS 5D
	private String flashMode; // 闪光模式：无闪光灯
	private String easyShooting;// 轻松拍摄模式：手动Manual

	private String cutimg;

	public Double getImgSize() {
		return imgSize;
	}

	public void setImgSize(Double imgSize) {
		this.imgSize = imgSize;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public String getImgHeight() {
		return imgHeight;
	}

	public void setImgHeight(String imgHeight) {
		this.imgHeight = imgHeight;
	}

	public String getImgWidth() {
		return imgWidth;
	}

	public void setImgWidth(String imgWidth) {
		this.imgWidth = imgWidth;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	public String getAltitude() {
		return altitude;
	}

	public void setAltitude(String altitude) {
		this.altitude = altitude;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getFlashMode() {
		return flashMode;
	}

	public void setFlashMode(String flashMode) {
		this.flashMode = flashMode;
	}

	public String getEasyShooting() {
		return easyShooting;
	}

	public void setEasyShooting(String easyShooting) {
		this.easyShooting = easyShooting;
	}

	public String getCutimg() {
		return cutimg;
	}

	public void setCutimg(String cutimg) {
		this.cutimg = cutimg;
	}

	@Override
	public String toString() {
		return "ImgInfoBean [imgHeight=" + imgHeight + ", imgWidth=" + imgWidth
				+ ", dateTime=" + dateTime + ", altitude=" + altitude
				+ ", latitude=" + latitude + ", longitude=" + longitude
				+ ", imgSize=" + imgSize + ", imgName=" + imgName + ", make="
				+ make + ", model=" + model + ", flashMode=" + flashMode
				+ ", easyShooting=" + easyShooting + "]";
	}

}
