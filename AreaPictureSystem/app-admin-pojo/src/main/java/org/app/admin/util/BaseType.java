package org.app.admin.util;

public class BaseType {

    /**
     *
     *文件，活动在用。
     *
     */
    public enum  Type{
        AREA,BASEUTIS,DIRECTLYUTIS,PERSION
    }

    public static Boolean checkType(String str) {

        if(str.toUpperCase().equals(Type.AREA.name())){
            return true;
        }else if(str.toUpperCase().equals(Type.BASEUTIS.name())){
            return true;
        }else if(str.toUpperCase().equals(Type.DIRECTLYUTIS.name())){
            return true;
        }else if(str.toUpperCase().equals(Type.PERSION.name())){
            return true;
        }
        return false;
    }
    
    
   
    
    /**
     * 
    * @ClassName: UserType 
    * @Description: TODO（用户类型枚举） 
    * @author fliay
    * @date 2017年12月12日 下午1:44:28 
    *
     */
    public enum UserType {
        ADMINISTRATORS, SCHOOLADMIN, TEACHER
    }
    
    
    public enum CompanyNature{
    	ZHISHU,JICHENG,MANAGER
    	
    }
    
    
    
}
