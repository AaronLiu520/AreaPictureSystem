package org.app.admin.util.basetreetime;

import org.app.admin.pojo.AdminCompany;
import org.app.admin.util.BaseType;
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

  


}
