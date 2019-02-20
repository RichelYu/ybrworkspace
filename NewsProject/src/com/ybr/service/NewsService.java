package com.ybr.service;

import java.util.List;

import com.ybr.entity.News;
/**
 * 
 * @author ybr
 *
 */
public interface NewsService {

	void add(News news);

	

	News selectById(int id);

	void delete(int id);

	void update(News news);
	/**
	 * splitPage query
	 */
	List<News> selectAll(int userid, int currentPage, int maxResult);
	int selectAll(int userid);



	List<News> selectByType(int type, int currentPage, int maxResult);
	int selectByType(int type);

}
