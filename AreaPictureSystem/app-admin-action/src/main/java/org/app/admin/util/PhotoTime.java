package org.app.admin.util;

import org.app.admin.pojo.ForderActivity;
import org.app.framework.util.Common;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpSession;

public class PhotoTime  implements Comparable<PhotoTime>{
	// 新添加的字段
	private String year;

	private String month;

	private String day;

	private List<PhotoTime> listPhotoTime;

	public List<PhotoTime> getListPhotoTime() {
		return listPhotoTime;
	}

	public void setListPhotoTime(List<PhotoTime> listPhotoTime) {
		this.listPhotoTime = listPhotoTime;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	// ---------------------
	private String id;// 文件夹活动，哪于哪个公司，

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
		return "PhotoTime [year=" + year + ", month=" + month + ", day=" + day + ", listPhotoTime=" + listPhotoTime
				+ ", id=" + id + ", time=" + time + ", list=" + list + ", istree=" + istree + "]";
	}

	/**
	 *
	 * 图片时间轴
	 * 
	 * @param listFA
	 *            文件夹集合
	 * @param isBase
	 *            属于基层单位
	 * @return 前台展示队列
	 * 
	 * @return
	 */
	public static List<PhotoTime> getPhotoTime(List<ForderActivity> listFA, HttpSession session) {

		List<PhotoTime> list = new ArrayList<PhotoTime>();
		TreeSet<String> year = new TreeSet<String>();//解决年份排序
		List<String> listyear = new ArrayList<String>();
		//Set<String> year = new HashSet<String>();
		for (ForderActivity f : listFA) {
			year.add(f.getYear());
		} // 1
		
		for(String y :year){
			listyear.add(y);
		}

		Collections.reverse(listyear);
		
		for (String y : listyear) {
			// 遍历已经过滤过的年份
			PhotoTime py = new PhotoTime();
			py.setYear(y);
			List<PhotoTime> listY = new ArrayList<PhotoTime>();
			// 获取月
			Set<String> month = new HashSet<String>();
			for (ForderActivity fm : listFA) {
				// 判断活动所属年份
				if (y.equals(fm.getYear())) {
					month.add(fm.getMonth());
				}
			}
			for (String m : month) {
				// 遍历已经过滤过的月份
				PhotoTime pm = new PhotoTime();
				pm.setMonth(m);

				List<PhotoTime> listM = new ArrayList<PhotoTime>();
				// 获取日
				Set<String> day = new HashSet<String>();
				for (ForderActivity fd : listFA) {
					// 判断活动的年份月份
					if (y.equals(fd.getYear()) && m.equals(fd.getMonth())) {
						day.add(fd.getDay());
					}
				}
				for (String d : day) {
					PhotoTime pd = new PhotoTime();
					pd.setDay(d);
					List<ForderActivity> listF = new ArrayList<ForderActivity>();
					for (ForderActivity f : listFA) {
						if (y.equals(f.getYear()) && m.equals(f.getMonth()) && d.equals(f.getDay())) {
							listF.add(f);
						}
					}
					pm.setListPhotoTime(listM);
					pd.setList(listF);
					String dayId = (String) session.getAttribute("dayId");
					if (Common.isEmpty(dayId)) {
						dayId = graphicRandom();
						pd.setId(dayId);
					}
					listM.add(pd);
				}
				Collections.sort(listM);
				pm.setListPhotoTime(listM);
				String monthId = (String) session.getAttribute("monthId");
				if (Common.isEmpty(monthId)) {
					monthId = graphicRandom();
					pm.setId(monthId);
				}
				listY.add(pm);
			}
			// 添加子集
			Collections.sort(listY);
			py.setListPhotoTime(listY);
			String yearId = (String) session.getAttribute("yearId");
			if (Common.isEmpty(yearId)) {
				yearId =graphicRandom();
				py.setId(yearId);
			}
			list.add(py);

		}

		return list;
	}

	public static  String graphicRandom() {

		int code = (int) (Math.random() * (400000000 - 100000000)) + 100000000; // 产生1000-9999之间的一个随机数
		String codestr = String.valueOf(code);
		return codestr;
	}

	/* (非 Javadoc) 
	* <p>Title: compareTo</p> 
	* <p>Description: </p> 
	* @param o
	* @return 
	* @see java.lang.Comparable#compareTo(java.lang.Object) 
	*/
	@Override
	public int compareTo(PhotoTime o) {
		
		if(o.getDay()!=null){
			if(Integer.valueOf(this.day) > Integer.valueOf(o.getDay())){
				return -1;
			}
			if(Integer.valueOf(this.day) < Integer.valueOf(o.getDay())){
				return 1;
			}
		}
		
		
		if(o.getMonth()!=null){
			if(Integer.valueOf(this.month) > Integer.valueOf(o.getMonth())){
				return -1;
			}
			if(Integer.valueOf(this.month) < Integer.valueOf(o.getMonth())){
				return 1;
			}
		}
		
		
		if(o.getYear()!=null){
			if(Integer.valueOf(this.year) > Integer.valueOf(o.getYear())){
				return -1;
			}
			if(Integer.valueOf(this.year) < Integer.valueOf(o.getYear())){
				return 1;
			}
		}
		
		return 0;
		
	}

	// public static List<PhotoTime> getPhotoTime(List<ForderActivity>
	// listFA,String checkDate,boolean iscompany){
	// List<PhotoTime> list=new ArrayList<PhotoTime>();
	//
	// for (ForderActivity fa:listFA) {
	// PhotoTime pt=new PhotoTime();
	// boolean check=false;
	//
	// for (PhotoTime pts:list) {
	// //区域 与 基本层单 有冲突，需要使用 isCompany检查
	// if(iscompany){
	// if(fa.getActivityTime().equals(pts.getTime())){
	// check=true;
	// pts.getList().add(fa);
	// break;
	// }
	// }else{
	// if(fa.getActivityTime().equals(pts.getTime()) &&
	// fa.getBoundCompany().equals(pts.getId())){
	// check=true;
	// pts.getList().add(fa);
	// break;
	// }
	// }
	// }
	//
	// //添加时间
	// if(check==false){
	// pt.setTime(fa.getActivityTime());
	// pt.setId(fa.getBoundCompany());//企业ID
	// if(pt.getList()==null){
	// pt.setList(new ArrayList<ForderActivity>());
	// }
	// pt.getList().add(fa);
	// }
	// //检查是否需要选择中菜单
	// if(checkDate!=null && pt.getTime()!=null){
	// if(pt.getTime().equals(checkDate)){
	// pt.setIstree(true);
	// }
	// }
	// //检查pt.gettime
	// if(pt.getTime()!=null){
	// list.add(pt);
	// }
	//
	//
	// }
	// return list;
	// }

	
	public static void main(String[] args) {
		TreeSet<String> t = new TreeSet<String>();
		
		t.add("2018");
		t.add("2017");
		t.add("2016");
		t.add("2020");
		t.add("2017");
		t.add("2015");
		t.add("2019");
		List listyear = new ArrayList();
		
		for (String y : t) {
			
			listyear.add(y);
		}

		Collections.reverse(listyear);
		
		for(int i=0;i<listyear.size();i++){
			System.out.println(listyear.get(i));
		}
		
		
	}
 	
	
}
