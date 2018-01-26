package org.app.webAdmin.service;

import org.app.framework.service.GeneralServiceImpl;
import org.app.framework.util.BasicDataResult;
import org.app.webAdmin.pojo.Index;
import org.app.webAdmin.pojo.Setting;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

@Repository("indexService")
public class IndexService extends GeneralServiceImpl<Index> {

	

	public BasicDataResult findIndexByQuery(){
		
		Index index = this.findOneByQuery(new Query(), Index.class);
		
		if(index!=null){
			return BasicDataResult.build(200, "查询成功", index);
		}
		
		return BasicDataResult.build(401, "查询失败", null);
		
	}
	
	
	
	/**
	 * 
	* @Title: SaveOrUpdateSetting 
	* @Description: TODO(添加或修改) 
	* @param @param index
	* @param @param editid
	* @param @return    设定文件 
	* @return BasicDataResult    返回类型 
	* @throws
	 */
	public BasicDataResult SaveOrUpdateSetting(Index index,String editid) {
		
		Index ind = this.findOneById(editid, Index.class);
		
		if(ind==null){
			this.insert(index);
			return BasicDataResult.build(200, "添加成功", index);
		}else{
			ind.setBanana(index.getBanana().replaceAll("\\\\", "/"));
			ind.setBananaContent(index.getBananaContent());
			ind.setBananaTitle(index.getBananaTitle());
			ind.setGoodContestImages(index.getGoodContestImages());
			ind.setToPublic(index.getToPublic());
			this.save(ind);
			return BasicDataResult.build(200, "修改成功", index);
		}
		
		
	}
	
	
	
	
	
	
	
	
	

}
