package org.app.admin.service;


import org.app.admin.pojo.SchoolNature;
import org.app.framework.service.GeneralServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

@Repository("schoolNatureService")
public class SchoolNatureService extends GeneralServiceImpl<SchoolNature> {
	private static final Logger log = LoggerFactory
			.getLogger(SchoolNatureService.class);
	
	/**
     * @方法描述：add or update
     * @param schoolNature b
     * @return boolean
     */
    public void addorupdate(SchoolNature schoolNature){
   	 try {
			if (schoolNature != null) {
				if (schoolNature.getId() == null)
					this.insert(schoolNature);
				else
					this.save(schoolNature);
			}
			log.info(schoolNature.toString());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
    }
    public void remove(String id){
    	Query query=new Query();
    	query.addCriteria(Criteria.where("id").is(id));
    	super.remove(SchoolNature.class, query);
    }
}
