package com.ybr.dao;

import java.util.List;

import com.ybr.entity.News;

public interface NewsDAO {

	void add(News news);

	

	News selectById(int id);

	void delete(News n);

	void update(News news);

	List<News> selectAll(int userid, int currentPage, int maxResult);
	int selectAll(int userid);



	List<News> selectByType(int type, int currentPage, int maxResult);



	int selectByType(int type);

}
