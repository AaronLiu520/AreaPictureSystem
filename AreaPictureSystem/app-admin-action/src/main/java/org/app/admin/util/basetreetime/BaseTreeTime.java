package org.app.admin.util.basetreetime;

import org.app.admin.pojo.AdminCompany;

import java.util.ArrayList;
import java.util.List;

public class BaseTreeTime {

    private String name;

    private List<LayerAdmonCompany> layerAdmonCompanyList;

    public String getName() {
        return name;
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


    public static List<BaseTreeTime> getBaseTreeTime(List<LayerAdmonCompany> lac){
        List<BaseTreeTime> list = new ArrayList<BaseTreeTime>();

        for(int i=0;i<str.length;i++){
            BaseTreeTime btt=new BaseTreeTime();
            btt.setName(str[i]);
            for(LayerAdmonCompany layerAdmonCompany:lac){
                if(layerAdmonCompany.getId().equals(btt.getName())){
                    if(btt.getLayerAdmonCompanyList()==null)
                        btt.setLayerAdmonCompanyList(new ArrayList<LayerAdmonCompany>());
                    btt.getLayerAdmonCompanyList().add(layerAdmonCompany);
                }
            }
            list.add(btt);
        }
        return list;
    }


}
