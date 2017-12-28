package org.app.admin.service;

import java.util.ArrayList;
import java.util.List;

import org.app.admin.pojo.AdminUser;
import org.app.admin.pojo.Favorites;
import org.app.admin.pojo.Resource;
import org.app.framework.service.GeneralServiceImpl;
import org.app.framework.util.Common;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

@Repository("favoritesService")
public class FavoritesService extends GeneralServiceImpl<Favorites> {

	@Autowired
	private ResourceService resourceService;

	/**
	 * 
	 * @Title: getResource @Description:
	 *         TODO(通过资源的ID来获取需要收藏的文件夹信息) @param @param
	 *         resourceIds @param @return 设定文件 @return List<Resource>
	 *         返回类型 @throws
	 */
	public List<Resource> getResource(String resourceIds) {

		// 将传入过来的resourceIds转换成数组
		String resourceId[] = resourceIds.split(",");

		List<Resource> listResource = new ArrayList();

		for (int i = 0; i < resourceId.length; i++) {

			if (Common.isNotEmpty(resourceId[i])) {

				Resource resource = this.resourceService.findResourceByResourceId(resourceId[i]);

				if (resource != null)

					listResource.add(resource);

			}
		}
		return listResource;

	}

	/**
	 * 
	 * @Title: findFavoritesByAdminUserId @Description:
	 *         TODO(通过用户的id查询收藏夹) @param @param id @param @return 设定文件 @return
	 *         Favorites 返回类型 @throws
	 */
	public Favorites findFavoritesById(String userId) {

		Query query = new Query();

		query.addCriteria(Criteria.where("userId").is(userId));

		Favorites favorites = this.findOneByQuery(query, Favorites.class);

		if (favorites != null)
			return favorites;
		else
			return null;

	}
	
	
	
	
	

	/**
	 * 
	 * @Title: toSaveFavorites @Description: TODO(对资源进行收藏) @param @param
	 *         adminUser @param @param listResource @param @return 设定文件 @return
	 *         String 返回类型 @throws
	 */
	public boolean toSaveFavorites(AdminUser adminUser, List<Resource> listResource) {

		
		try {
			// 通过用户的id来进行查询该用户的收藏夹
			String userId = adminUser.getId();

			Favorites fa = this.findFavoritesById(userId);

			if (fa != null) {
				// 对当前收藏夹进行修改
				List<Resource> list = fa.getResource(); // 获取当前用户已经收藏的资源
				List<Resource> newlist = new ArrayList();

				if(list.size()>0){
					// 遍历每个需要新收藏的资源除去重复收藏

					for (Resource newRes : listResource) {
						boolean flag = true; // 标记是否存在该收藏资源
						for (Resource hisRes : list) {
							if(hisRes!=null){
							if (newRes.getId().equals(hisRes.getId())) {
								flag = true;
								break;
							} else {
								flag = false;
							}
						}else{
							newlist.add(newRes);
							break;
							}
						}
						// 如果不存在该资源则添加
						if (!flag) {
							newlist.add(newRes);
						}
					}
				}else{
					newlist = listResource;
				}
				
				
			
				fa.setUserId(userId);
				fa.setAdminUser(adminUser);
				fa.getResource().addAll(newlist);
				this.save(fa);
			} else {
				// 创建收藏夹

				Favorites favorites = new Favorites();

				if (adminUser != null) {

					favorites.setAdminUser(adminUser);

				}
				if (listResource.size() > 0) {
					favorites.setResource(listResource);
				}

				favorites.setUserId(adminUser.getId());

				this.insert(favorites);
			}

		} catch (Exception e) {

			e.printStackTrace();

			return false;
		}

		return true;
	}
	
	
	/**
	 * 
	* @Title: cancelFavorites 
	* @Description: TODO(取消收藏，支持批量取消) 
	* @param @param adminUser
	* @param @param listResource  //需要从收藏夹删除的资源集合
	* @param @return    设定文件 
	* @return boolean    返回类型 
	* @throws
	 */
	public boolean cancelFavorites(AdminUser adminUser, List<Resource> listResource){
		
		try{
			
			// 通过用户的id来进行查询该用户的收藏夹
			String userId = adminUser.getId();
			
			Favorites fa = this.findFavoritesById(userId);
			
			
			
			//定义一个新的List集合
			List<Resource> oldlist = new ArrayList();
			if(fa!=null&&fa.getResource().size()>0){
				
				//获取收藏夹中的所有资源
				for(Resource oldRes:fa.getResource()){
					boolean flag =false;
					//需要取消收藏的资源
					for(Resource delRes:listResource){
						//如果资源不存在则说明不是需要取消收藏的资源
						if(oldRes.getId().equals(delRes.getId())){
							flag = true;
							continue;
						}
					}
					if(!flag){
					oldlist.add(oldRes);
					}
				}
				fa.setUserId(userId);
				fa.setAdminUser(adminUser);
				fa.setResource(oldlist);
				
				this.save(fa);
				
			}else{
				return false;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return true;
	}
	
	
	
	
	
	
	
	

}
