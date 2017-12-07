package org.app.admin.util;

public class BaseType {

    /**
     *
     * @ClassName: Type
     * @Description: TODO( 创建枚举类 AREA 表示区域级 DIRECTLYUTIS 直属 BASEUTIS 基层 PERSION 个人 )
     * @author fliay
     * @date 2017年11月20日 下午2:26:46
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
}
