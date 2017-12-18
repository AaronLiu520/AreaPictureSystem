package org.app.admin.util.basetreetime;

import org.app.admin.pojo.AdminCompany;
import org.app.admin.util.PhotoTime;

import java.util.ArrayList;
import java.util.List;

public class LayerAdmonCompany {

    private String id;//企业性质。

    private String name;

    private List<PhotoTime> timeList;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<PhotoTime> getTimeList() {
        return timeList;
    }

    public void setTimeList(List<PhotoTime> timeList) {
        this.timeList = timeList;
    }


    @Override
    public String toString() {
        return "LayerAdmonCompany{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", timeList=" + timeList +
                '}';
    }

    public static List<LayerAdmonCompany> LayerAdmonCompany(List<AdminCompany> lac, List<PhotoTime> lpt){
        List<LayerAdmonCompany> list=new ArrayList<LayerAdmonCompany>();

        for(AdminCompany ac:lac){
            LayerAdmonCompany layerAdmonCompany=new LayerAdmonCompany();

            layerAdmonCompany.setId(ac.getType().toString());//性质  //2017年12月12日 14:36:40 添加了.toString
            layerAdmonCompany.setName(ac.getName());//名称

            for(PhotoTime pt:lpt){
                if(ac.getId().equals(pt.getId())){//这个活动，属于当前单位。
                    if(layerAdmonCompany.getTimeList()==null)
                        layerAdmonCompany.setTimeList(new ArrayList<PhotoTime>());

                    layerAdmonCompany.getTimeList().add(pt);
                }
            }
            list.add(layerAdmonCompany);
        }

        return list;
    }


}
