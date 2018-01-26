package org.app.admin.service;

import java.util.ArrayList;
import java.util.List;

import org.app.admin.pojo.Type;
import org.app.admin.util.BaseType;
import org.app.framework.service.GeneralServiceImpl;
import org.app.framework.util.Common;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class TypeService extends GeneralServiceImpl<Type> {
	
	
	
	
	public List<List<Type>> addType(String forderTypes){
		
		
		String [] types = forderTypes.split(",");
		
		List<Type> listType = new ArrayList<Type>();;
		
		List<List<Type>> lists = new ArrayList<List<Type>>();
		
		for(int i=0;i<types.length;i++){
			Type type = new Type();
			if(types[i].equals(BaseType.Type.AREA.toString())){
				type.setType(BaseType.Type.AREA);
				listType.add(type);
				continue;
			}else if(types[i].equals(BaseType.Type.DIRECTLYUTIS.toString())){
				type.setType(BaseType.Type.DIRECTLYUTIS);
				listType.add(type);
				continue;
			}
		}
		if(listType.size()>0){
			lists.add(listType);
		}
		for(int i=0;i<types.length;i++){
			Type type = new Type();
			listType = new ArrayList<Type>();
			if(types[i].equals(BaseType.Type.BASEUTIS.toString())){
				type.setType(BaseType.Type.BASEUTIS);
				listType.add(type);
				lists.add(listType);
				break;
			}
		}
		
		
		for(int i=0;i<types.length;i++){
			listType = new ArrayList<Type>();
			Type type = new Type();
			if(types[i].equals(BaseType.Type.PERSION.toString())){
				type.setType(BaseType.Type.PERSION);
				listType.add(type);
				lists.add(listType);
				break;
			}
		}
		
		
		return lists;
	}
	
/*	
	public List<Type> addType(String forderTypes){
		
		
		String [] types = forderTypes.split(",");
		
		List<Type> listType = new ArrayList<Type>();
		
		
		for(int i=0;i<types.length;i++){
			
			Type type = new Type();
			
			if(types[i].equals(BaseType.Type.AREA.toString())){
				type.setType(BaseType.Type.AREA);
			}else if(types[i].equals(BaseType.Type.BASEUTIS.toString())){
				type.setType(BaseType.Type.BASEUTIS);
			}else if(types[i].equals(BaseType.Type.DIRECTLYUTIS.toString())){
				type.setType(BaseType.Type.DIRECTLYUTIS);
			}else if(types[i].equals(BaseType.Type.PERSION.toString())){
				type.setType(BaseType.Type.PERSION);
			}
			listType.add(type);
		}
		
		return listType;
	}
	
*/	
	
	
	/**
	 * 
	* @Title: findTypeByTy 
	* @Description: TODO(判断该类型的type是否为空，如果为空则返回null) 
	* @param @param gettype
	* @param @return    设定文件 
	* @return Type    返回类型 
	* @throws
	 */
	public Type findTypeByTy(BaseType.Type bsType){
		
		Query query = new Query();
		
		query.addCriteria(Criteria.where("type").is(bsType));
		
		Type type = this.findOneByQuery(query, Type.class);
		
		return  type!=null?type:null;
		
		
	}
	
	
	
	
	
	
	
		
}
