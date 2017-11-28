package org.app.admin.util;

import org.app.admin.pojo.ForderActivity;

import java.util.ArrayList;
import java.util.List;

public class PhotoTime {

    private String time;

    private List<ForderActivity> list;

    private boolean istree;


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
    public static  List<PhotoTime> getPhotoTime(List<ForderActivity> listFA,String checkDate){
        List<PhotoTime> list=new ArrayList<PhotoTime>();

        for (ForderActivity fa:listFA) {
            PhotoTime pt=new PhotoTime();
            boolean check=false;

            for (PhotoTime pts:list) {
                if(fa.getActivityTime().equals(pts.getTime())){
                    check=true;
                    pts.getList().add(fa);
                    break;
                }

            }
            //添加时间
            if(check==false){
                pt.setTime(fa.getActivityTime());
                if(pt.getList()==null){
                    pt.setList(new ArrayList<ForderActivity>());
                }
                pt.getList().add(fa);
            }
            //检查是否需要选择中菜单
            if(checkDate!=null){
                if(pt.getTime().equals(checkDate)){
                    pt.setIstree(true);
                }
            }

            list.add(pt);
        }
        return list;
    }




}
