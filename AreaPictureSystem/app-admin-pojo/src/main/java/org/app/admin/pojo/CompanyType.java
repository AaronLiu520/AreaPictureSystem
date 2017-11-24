package org.app.admin.pojo;

import org.app.framework.pojo.GeneralBean;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="companyType")
public class CompanyType extends GeneralBean {
   private String name;

public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
}
