package org.app.framework.action;

import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

/**
 * 所有的Action extends 录前的 action
 * @author mac
 *
 * @param <E>
 */
public abstract class GeneralAction<E> {

	

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
