package org.app.framework.action;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.logging.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

/**
 * 所有的Action extends 录前的 action
 * @author mac
 *
 * @param <E>
 */
public abstract class CopyOfGeneralAction<E> {
	// #MessageRepository (信息化资源库)
	 protected String personalPath="/Flash/MR/";
	 protected String picture=".jpg.jpeg.png.bmp.PNG";
	
	

	
	public String superStyle;
	public String subStyle;
	
	
	
	
	protected List<E> listForm;
	
	protected E infoForm;
	

	public List<E> getListForm() {
		return listForm;
	}

	public void setListForm(List<E> listForm) {
		this.listForm = listForm;
	}

	public E getInfoForm() {
		return infoForm;
	}

	public void setInfoForm(E infoForm) {
		this.infoForm = infoForm;
	}
	
	
	/**
	 * 返回一个带有学校参数据，Query()
	 * @param schoolId
	 * @return
	 */
	public Query getQueryForSchool(String param,String schoolId){
		Query query = new Query();
		query.addCriteria(Criteria.where(param).is(schoolId.trim()));
		return query;
	}
	
	
	//以当前的学校性质，确认用户可以创建哪些年份的学期信息
		public List<Integer> loadSemester(Integer listsize){
			List<Integer> list=new ArrayList<Integer>();
			
			Calendar cal = Calendar.getInstance(); 
			int gradeInt=cal.get(Calendar.YEAR);
			for(int i=0;i<listsize;i++){
				list.add(gradeInt-i-1);
			}
			return list;
		}

		public String getSuperStyle() {
			return superStyle;
		}

		public void setSuperStyle(String superStyle) {
			this.superStyle = superStyle;
		}

		public String getSubStyle() {
			return subStyle;
		}

		public void setSubStyle(String subStyle) {
			this.subStyle = subStyle;
		}
		
		
		
		/**
		 * 添加Query条件。参数支持传无限个，前者为：key,后者为：value
		 * 示例数据：craeteQueryWhere("username","jack","password","123456")
		 * @param keyValue
		 * @return
		 */
		public Query craeteQueryWhere(String ... keyValue){
			Query query =new Query();
			if(keyValue!=null){
				for(int i=0;i<keyValue.length;i++){
					query.addCriteria(Criteria.where(keyValue[i]).is(keyValue[i+1]));
					i++;
				}
			}
			return query;
			
		}
}
