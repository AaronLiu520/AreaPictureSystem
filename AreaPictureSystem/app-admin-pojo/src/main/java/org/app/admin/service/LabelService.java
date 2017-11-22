package org.app.admin.service;


import org.app.admin.pojo.Label;
import org.app.framework.service.GeneralServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.util.Assert;



@Repository("labelService")
public class LabelService extends GeneralServiceImpl<Label> {
	private static final Logger log = LoggerFactory
			.getLogger(LabelService.class);
   
	/**
	 * @方法描述：判断标签是否存在
	 * @param Label b
	 * @return boolean类型
	 */
     private boolean exists(Label b){
		Query query=new Query();
		Assert.notNull(b.getLabelName(),"标签名字不能为空");
        query.addCriteria(Criteria.where(Label.class.getDeclaredFields()[0].getName()).is(b.getLabelName())); 
        return this.exists(query, Label.class); 
     }
     public void remove(String id){
    	 Query query=new Query();
    	 query.addCriteria(Criteria.where("id").is(id));
    	 super.remove(Label.class, query);
     }
     /**
      * @方法描述：add or update
      * @param Label b
      * @return boolean
      */
     public void addorupdate(Label label){
    	 try {
 			if (label != null) {
 				if (label.getId() == null)
 					this.insert(label);
 				else
 					this.save(label);
 			}
 			log.info(label.toString());
 		} catch (Exception e) {
 			log.error(e.getMessage(), e);
 		}
     }
      

}
