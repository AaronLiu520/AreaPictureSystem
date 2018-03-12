package org.app.admin.service;

import java.util.ArrayList;
import java.util.List;

import org.app.admin.pojo.InformationRegister;
import org.app.framework.service.GeneralServiceImpl;
import org.app.framework.util.BasicDataResult;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class InformationRegisterService extends GeneralServiceImpl<InformationRegister> {
	
	
	/**
	 * 
	* @Title: findInformationRegister 
	* @Description: TODO(获取第一条记录) 
	* @param @return    设定文件 
	* @return InformationRegister    返回类型 
	* @throws
	 */
	public  InformationRegister findInformationRegister(){
		Query query = new Query();
		query.skip(0);// skip相当于从那条记录
		query.limit(1);// 从多少条开始,取多少条记录
		InformationRegister inf = this.findOneByQuery(query, InformationRegister.class);
		
		
		return inf==null?null:inf;
		
	}
	
	
	
	/**
	 * 
	* @Title: togetInformationRegister 
	* @Description: TODO(获取快捷选项，返回给通用类) 
	* @param @return    设定文件 
	* @return BasicDataResult    返回类型 
	* @throws
	 */
	public  BasicDataResult togetInformationRegister(){
		Query query = new Query();
		query.skip(0);// skip相当于从那条记录
		query.limit(1);// 从多少条开始,取多少条记录
		InformationRegister inf = this.findOneByQuery(query, InformationRegister.class);
		BasicDataResult basic = new BasicDataResult();
		
		if(inf!=null){
			return basic.build(200, "success", inf);
		}
		if(inf ==null){
			return basic.build(200, "success", null);
		}
		
		
		return basic.build(400, "error", null);
		
	}
	
	/**
	 * 
	* @Title: addInformationRegister 
	* @Description: TODO(将数据添加至缓存) 
	* @param @param resourceName
	* @param @param person
	* @param @param photographer
	* @param @param resourceAddress
	* @param @return    设定文件 
	* @return InformationRegister    返回类型 
	* @throws
	 */
	public InformationRegister addInformationRegister(String resourceName,String person,String photographer,String resourceAddress){
		
		InformationRegister inf = this.findInformationRegister();
		
		List resourceNameList = new ArrayList();
		List personList = new ArrayList();
		List photographerList = new ArrayList();
		List resourceAddressList = new ArrayList();
		
		
		if(inf==null){
			//执行添加
			inf = new InformationRegister();
			resourceNameList.add(resourceName);
			personList.add(person);
			photographerList.add(photographer);
			resourceAddressList.add(resourceAddress);
			inf.setPersonList(personList);
			inf.setPhotographerList(photographerList);
			inf.setResourceAddressList(resourceAddressList);
			inf.setResourceNameList(resourceNameList);
			this.save(inf);
		}else{
			
			resourceNameList=inf.getResourceNameList();
			if(resourceNameList.size()>=15){
				resourceNameList.remove(0);
			}
			if(!resourceNameList.contains(resourceName)){
				inf.getResourceNameList().add(resourceName);
			}
			
			personList = inf.getPersonList();
			if(personList.size()>=15){
				personList.remove(0);
			}
			if(!personList.contains(person)){
				inf.getPersonList().add(person);
			}
			
			
			photographerList = inf.getPhotographerList();
			if(photographerList.size()>=15){
				photographerList.remove(0);
			}
			if(!photographerList.contains(photographer)){
				inf.getPhotographerList().add(photographer);
			}
			
			resourceAddressList=inf.getResourceAddressList();
			if(resourceAddressList.size()>=15){
				resourceAddressList.remove(0);
			}
			
			if(!resourceAddressList.contains(resourceAddress)){
				inf.getResourceAddressList().add(resourceAddress);
			}
			
			this.save(inf);;
			
		}
		
		
		
		return inf;
	}
	
	
	
	
		
}
