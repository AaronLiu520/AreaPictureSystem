package org.app.admin.pojo;

import org.app.framework.pojo.GeneralBean;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.List;

/**
 * 后台用户管理
 *
 * @author aaronlau
 */
@Document(collection = "AdminUser")
public class AdminUser extends GeneralBean {
    /** 
	* @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么) 
	*/ 
	private static final long serialVersionUID = 3564343269323650694L;
	private String name;
    @Indexed
    private String userName;
    @Indexed
    private String password;

    private String sex;
    private String address;
    private String tel;
    private String email;
    private String spaceSize;// 个人空间大小
    private String headImage;
    private String reamrk;

    private UserType userType; //超级管理员、学校管理、老师
    @DBRef
    private AdminCompany adminCompany;// 单位ID（表示用户属于哪个客户下的ID
    @DBRef
    private AdminRole adminRole; //权限
    @DBRef
    private List<Favorites> listFavorites;//收藏夹




    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSpaceSize() {
        return spaceSize;
    }

    public void setSpaceSize(String spaceSize) {
        this.spaceSize = spaceSize;
    }

    public String getHeadImage() {
        return headImage;
    }

    public void setHeadImage(String headImage) {
        this.headImage = headImage;
    }

    public String getReamrk() {
        return reamrk;
    }

    public void setReamrk(String reamrk) {
        this.reamrk = reamrk;
    }

    public UserType getUserType() {
        return userType;
    }

    public void setUserType(UserType userType) {
        this.userType = userType;
    }

    public AdminCompany getAdminCompany() {
        return adminCompany;
    }

    public void setAdminCompany(AdminCompany adminCompany) {
        this.adminCompany = adminCompany;
    }

    public AdminRole getAdminRole() {
        return adminRole;
    }

    public void setAdminRole(AdminRole adminRole) {
        this.adminRole = adminRole;
    }

    public List<Favorites> getListFavorites() {
        return listFavorites;
    }

    public void setListFavorites(List<Favorites> listFavorites) {
        this.listFavorites = listFavorites;
    }

    @Override
    public String toString() {
        return "AdminUser{" +
                "name='" + name + '\'' +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", sex='" + sex + '\'' +
                ", address='" + address + '\'' +
                ", tel='" + tel + '\'' +
                ", email='" + email + '\'' +
                ", spaceSize='" + spaceSize + '\'' +
                ", headImage='" + headImage + '\'' +
                ", reamrk='" + reamrk + '\'' +
                ", userType=" + userType +
                ", adminCompany=" + adminCompany +
                ", adminRole=" + adminRole +
                ", listFavorites=" + listFavorites +
                '}';
    }

    public enum UserType {
        ADMINISTRATORS, SCHOOLADMIN, TEACHER
    }

}
