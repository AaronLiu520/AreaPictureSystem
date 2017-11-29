package org.app.admin.pojo;

import java.util.Date;
import java.util.List;

import org.app.framework.pojo.GeneralBean;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;


/**
 * @author fliay
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


    private String resourceName;      // 3 资源名称
    private String person;              // 3 被拍摄者
    private String photographer;        // 3 拍摄者
    private String uploadPerson;        // 1 上传者
    private Date resourceTime;          // 2 文件日期
    private String resourceAddress;     // 3 资源地址
    private String description;         // 3 描述
    private String boundId;             // 1 绑定公司或个人Id
    private String forderActivityId;    // 1 文件夹Id或活动Id
    private String originalName;        // 1 资源原名
    private String originalPath;        // 1 资源路径
    private String extensionName;       // 1 资源扩展名
    private String fileType;            // 1 文件类型
    private Long resourceSize;          // 2 文件大小
    private String generateName;        // 1 生成名
    private String min_generateName;    // 1 缩略图（小）
    private String middle_generateName; // 1 缩略图（中）
    private String max_generateName;    // 1 缩略图（大）
    @DBRef
    private AdminUser adminuser;        //用户Id
    @DBRef
    private List<Source> source;        //资源流


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

    public String getUploadPerson() {
        return uploadPerson;
    }

    public void setUploadPerson(String uploadPerson) {
        this.uploadPerson = uploadPerson;
    }

    public Date getResourceTime() {
        return resourceTime;
    }

    public void setResourceTime(Date resourceTime) {
        this.resourceTime = resourceTime;
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

    /*	public String getCreateDate() {
            return createDate;
        }
        public void setCreateDate(String createDate) {
            this.createDate = createDate;
        }*/
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

    public Long getResourceSize() {
        return resourceSize;
    }

    public void setResourceSize(Long resourceSize) {
        this.resourceSize = resourceSize;
    }

    public String getGenerateName() {
        return generateName;
    }

    public void setGenerateName(String generateName) {
        this.generateName = generateName;
    }

    public String getMin_generateName() {
        return min_generateName;
    }

    public void setMin_generateName(String min_generateName) {
        this.min_generateName = min_generateName;
    }

    public String getMiddle_generateName() {
        return middle_generateName;
    }

    public void setMiddle_generateName(String middle_generateName) {
        this.middle_generateName = middle_generateName;
    }

    public String getMax_generateName() {
        return max_generateName;
    }

    public void setMax_generateName(String max_generateName) {
        this.max_generateName = max_generateName;
    }

    public AdminUser getAdminuser() {
        return adminuser;
    }

    public void setAdminuser(AdminUser adminuser) {
        this.adminuser = adminuser;
    }

    public List<Source> getSource() {
        return source;
    }

    public void setSource(List<Source> source) {
        this.source = source;
    }


}

