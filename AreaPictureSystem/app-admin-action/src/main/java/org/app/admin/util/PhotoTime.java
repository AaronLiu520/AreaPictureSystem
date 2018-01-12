package org.app.admin.util;

import org.app.admin.pojo.ForderActivity;

import java.util.ArrayList;
import java.util.List;

public class PhotoTime {

    private String id;//文件夹活动，哪于哪个公司，

    private String time;

    private List<ForderActivity> list;

    private boolean istree;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public PhotoTime() {
        this.istree = false;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public List<ForderActivity> getList() {
        return list;
    }

    public void setList(List<ForderActivity> list) {
        this.list = list;
    }

    public boolean isIstree() {
        return istree;
    }

    public void setIstree(boolean istree) {
        this.istree = istree;
    }

    @Override
    public String toString() {
        return "PhotoTime{" +
                "time='" + time + '\'' +
                ", list=" + list +
                ", istree=" + istree +
                '}';
    }

    /**
     *
     * 图片时间轴
     * @param listFA 文件夹集合
     * @return 前台展示队列
     * @return
     */
    public static  List<PhotoTime> getPhotoTime(List<ForderActivity> listFA,String checkDate,boolean iscompany){
        List<PhotoTime> list=new ArrayList<PhotoTime>();

        for (ForderActivity fa:listFA) {
            PhotoTime pt=new PhotoTime();
            boolean check=false;

            for (PhotoTime pts:list) {
                //区域  与  基本层单  有冲突，需要使用 isCompany检查
                if(iscompany){
                    if(fa.getActivityTime().equals(pts.getTime())){
                        check=true;
                        pts.getList().add(fa);
                        break;
                    }
                }else{
                    if(fa.getActivityTime().equals(pts.getTime()) && fa.getBoundCompany().equals(pts.getId())){
                        check=true;
                        pts.getList().add(fa);
                        break;
                    }
                }
            }

            //添加时间
            if(check==false){
                pt.setTime(fa.getActivityTime());
                pt.setId(fa.getBoundCompany());//企业ID
                if(pt.getList()==null){
                    pt.setList(new ArrayList<ForderActivity>());
                }
                pt.getList().add(fa);
            }
            //检查是否需要选择中菜单
            if(checkDate!=null && pt.getTime()!=null){
                if(pt.getTime().equals(checkDate)){
                    pt.setIstree(true);
                }
            }
            //检查pt.gettime
            if(pt.getTime()!=null){
                list.add(pt);
            }


        }
        return list;
    }


}
