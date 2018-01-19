package org.app.webAdmin.service;

import org.app.framework.service.GeneralServiceImpl;
import org.app.framework.util.Common;
import org.app.webAdmin.pojo.News;
import org.springframework.stereotype.Repository;

/**
 * 
 * @ClassName: NewsService
 * @Description: TODO(新闻)
 * @author fliay
 * @date 2018年1月17日 下午2:13:41
 *
 */
@Repository
public class NewsService extends GeneralServiceImpl<News> {

	public void SaveOrUpdateNews(News news, String editid) {

		if (news != null) {

			if (Common.isNotEmpty(editid)) {
				// 执行修改
				News ednews = this.findOneById(editid, News.class);

				if (ednews == null)
					ednews = new News();

				ednews.setAuthor(news.getAuthor());
				ednews.setContent(news.getContent());
				ednews.setNewsTitle(news.getNewsTitle());
				ednews.setSort(news.getSort());
				ednews.setStatus(news.isStatus());
				ednews.setNewsDate(news.getNewsDate());
				ednews.setPicture(news.getPicture().replaceAll("\\\\", "/"));

				this.save(ednews);
			} else {
				news.setPicture(news.getPicture().replaceAll("\\\\", "/"));

				// 执行添加
				this.insert(news);
			}

		}

	}

}
