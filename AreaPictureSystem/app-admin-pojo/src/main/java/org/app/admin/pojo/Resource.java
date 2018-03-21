package org.app.admin.pojo;

import java.util.Date;

import org.app.admin.util.EditorImgBean;
import org.app.admin.util.ImgCompressionBean;
import org.app.admin.util.ImgInfoBean;
import org.app.framework.pojo.GeneralBean;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * @author aaron
 * @ClassName: Resource
 * @Description: TODO(文件资源类)
 * @date 2017年11月20日 下午3:43:42
 */
@Document
public class Resource extends GeneralBean {

	/**
	 * @Fields serialVersionUID : TODO(序列号)
	 */
	private static final long serialVersionUID = -6185701038252677452L;

	private String uploadPerson; // 1 上传者
	private String boundId; // 1 个人Id
	private String forderActivityId; // 1 文件夹Id或活动Id
	private String originalName; // 1 原名
	private String originalPath; // 1 路径
	private String extensionName; // 1 扩展名
	private String fileType; // 1 文件类型
	private String generateName; // 1 生成名（新名字）

	@DBRef
	private AdminUser adminUser; // 用户Id
	@DBRef
	private Source source; // 资源流

	private ImgInfoBean imgInfoBean; // 图片信息

	private EditorImgBean editorImgInfo;// 用户修改信息

	private ImgCompressionBean imgCompressionBean;// 加工图片

	private String adminCompanyId;// 企业ID

	private String personActivityId;// 个人活动的ID

	private String baseutisActivityId;// 直属活动的ID

	public String getUploadPerson() {
		return uploadPerson;
	}

	public void setUploadPerson(String uploadPerson) {
		this.uploadPerson = uploadPerson;
	}

	public String getBoundId() {
		return boundId;
	}

	public void setBoundId(String boundId) {
		this.boundId = boundId;
	}

	public String getForderActivityId() {
		return forderActivityId;
	}

	public void setForderActivityId(String forderActivityId) {
		this.forderActivityId = forderActivityId;
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

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getGenerateName() {
		return generateName;
	}

	public void setGenerateName(String generateName) {
		this.generateName = generateName;
	}

	public AdminUser getAdminUser() {
		return adminUser;
	}

	public void setAdminUser(AdminUser adminUser) {
		this.adminUser = adminUser;
	}

	public Source getSource() {
		return source;
	}

	public void setSource(Source source) {
		this.source = source;
	}

	public ImgInfoBean getImgInfoBean() {
		return imgInfoBean;
	}

	public void setImgInfoBean(ImgInfoBean imgInfoBean) {
		this.imgInfoBean = imgInfoBean;
	}

	public EditorImgBean getEditorImgInfo() {
		return editorImgInfo;
	}

	public void setEditorImgInfo(EditorImgBean editorImgInfo) {
		this.editorImgInfo = editorImgInfo;
	}

	public ImgCompressionBean getImgCompressionBean() {
		return imgCompressionBean;
	}

	public void setImgCompressionBean(ImgCompressionBean imgCompressionBean) {
		this.imgCompressionBean = imgCompressionBean;
	}

	public String getAdminCompanyId() {
		return adminCompanyId;
	}

	public void setAdminCompanyId(String adminCompanyId) {
		this.adminCompanyId = adminCompanyId;
	}

	public String getPersonActivityId() {
		return personActivityId;
	}

	public void setPersonActivityId(String personActivityId) {
		this.personActivityId = personActivityId;
	}

	public String getBaseutisActivityId() {
		return baseutisActivityId;
	}

	public void setBaseutisActivityId(String baseutisActivityId) {
		this.baseutisActivityId = baseutisActivityId;
	}

	@Override
	public String toString() {
		return "Resource [uploadPerson=" + uploadPerson + ", boundId=" + boundId + ", forderActivityId="
				+ forderActivityId + ", originalName=" + originalName + ", originalPath=" + originalPath
				+ ", extensionName=" + extensionName + ", fileType=" + fileType + ", generateName=" + generateName
				+ ", adminUser=" + adminUser + ", source=" + source + ", imgInfoBean=" + imgInfoBean
				+ ", editorImgInfo=" + editorImgInfo + ", imgCompressionBean=" + imgCompressionBean
				+ ", adminCompanyId=" + adminCompanyId + ", personActivityId=" + personActivityId
				+ ", baseutisActivityId=" + baseutisActivityId + "]";
	}

}
