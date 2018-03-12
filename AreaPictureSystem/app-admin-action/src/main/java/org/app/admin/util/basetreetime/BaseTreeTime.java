package org.app.admin.util.basetreetime;

import org.app.admin.pojo.AdminCompany;
import org.app.framework.util.Common;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

public class BaseTreeTime {

    private String name;
    
    private String natureId;

    private List<LayerAdmonCompany> layerAdmonCompanyList;

    public String getName() {
        return name;
    }

    
    public String getNatureId() {
		return natureId;
	}


	public void setNatureId(String natureId) {
		this.natureId = natureId;
	}


	public void setName(String name) {
        this.name = name;
    }

    public List<LayerAdmonCompany> getLayerAdmonCompanyList() {
        return layerAdmonCompanyList;
    }

    public void setLayerAdmonCompanyList(List<LayerAdmonCompany> layerAdmonCompanyList) {
        this.layerAdmonCompanyList = layerAdmonCompanyList;
    }

    @Override
    public String toString() {
        return "BaseTreeTime{" +
                "name='" + name + '\'' +
                ", layerAdmonCompanyList=" + layerAdmonCompanyList +
                '}';
    }

    final static String[] str={"幼儿园","小学","中学","高中","九年制"};


    public static List<BaseTreeTime> getBaseTreeTime(List<LayerAdmonCompany> lac,HttpSession session){
         List<BaseTreeTime> list = new ArrayList<BaseTreeTime>();

        for(int i=0;i<str.length;i++){
            BaseTreeTime btt=new BaseTreeTime();
            btt.setName(str[i]);
            for(LayerAdmonCompany layerAdmonCompany:lac){
                if(layerAdmonCompany.getId().equals(btt.getName())){
                    if(btt.getLayerAdmonCompanyList()==null){
                        btt.setLayerAdmonCompanyList(new ArrayList<LayerAdmonCompany>());
                    }
                    
                    String natureId = (String) session.getAttribute("nature");
                    if(Common.isNotEmpty(natureId)){
                    	natureId =graphicRandom();
        				btt.setNatureId(natureId);
                    }
                    
                    
                    btt.getLayerAdmonCompanyList().add(layerAdmonCompany);
                }
            }
            list.add(btt);
        }
        return list;
    }
    public static  String graphicRandom() {

		int code = (int) (Math.random() * (400000000 - 100000000)) + 100000000; // 产生1000-9999之间的一个随机数
		String codestr = String.valueOf(code);
		return codestr;
	}

}
