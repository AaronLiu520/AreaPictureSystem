package org.app.admin.service;

import org.app.admin.pojo.CompanyType;
import org.app.framework.service.GeneralServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;
@Repository("companyTypeService")
public class CompanyTypeService extends GeneralServiceImpl<CompanyType>{
	private static final Logger log = LoggerFactory
			.getLogger( CompanyTypeService.class);
	
	/**
     * @方法描述：add or update
     * @param CompanyTypeService b
     * @return 
     */
    public void addorupdate(CompanyType companyType){
   	 try {
			if (companyType != null) {
				if (companyType.getId() == null)
					this.insert(companyType);
				else
					this.save(companyType);
			}
			log.info(companyType.toString());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
    }
    public void remove(String id){
    	Query query=new Query();
    	query.addCriteria(Criteria.where("id").is(id));
    	super.remove(CompanyType.class, query);
    }
}
