package org.app.webAdmin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.app.framework.service.GeneralServiceImpl;
import org.app.framework.util.BasicDataResult;
import org.app.framework.util.Common;
import org.app.framework.util.FileOperateUtil;
import org.app.webAdmin.pojo.Index;
import org.app.webAdmin.pojo.Setting;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository("indexService")
public class IndexService extends GeneralServiceImpl<Index> {

	@Autowired
	private FileOperateUtil operateUtil;
	
	@Autowired
	private ContestImagesService contestImagesService;


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
	public BasicDataResult SaveOrUpdateSetting(Index index,String editid,MultipartFile[] bananaImg,HttpServletRequest request) {
		
		if(index!=null){
			if(bananaImg[0].getOriginalFilename()!=null){
				// 上传aboutUs 图片
				List<Map<String, Object>> listMap = this.operateUtil.uploadImgs(bananaImg, request);

				for (Map<String, Object> map : listMap) {

					index.setBanana(map.get("servletPath").toString().replaceAll("\\\\", "/"));
				}
			}
			
			
			Index ind = this.findOneById(editid, Index.class);
			
			if(ind==null){
				this.insert(index);
				return BasicDataResult.build(200, "添加成功", index);
			}else{
				ind.setBanana(index.getBanana());
				ind.setBananaContent(index.getBananaContent());
				ind.setBananaTitle(index.getBananaTitle());
				ind.setGoodContestImages(index.getGoodContestImages());
				ind.setToPublic(index.getToPublic());
				this.save(ind);
				return BasicDataResult.build(200, "修改成功", index);
			}
			
		}
		
		return BasicDataResult.build(400, "未能匹配到信息", index);
		
		
		
	
		
		
	}
	
	
	
	
	
	
	
	
	

}
