package com.ybr.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ybr.dao.NewsDAO;
import com.ybr.entity.News;
import com.ybr.service.NewsService;
@Service
public class NewsServiceImpl implements NewsService {
	@Resource
	NewsDAO newsDAO;
	
	@Transactional
	@Override
	public void add(News news) {
		newsDAO.add(news);
	}

	
	@Transactional
	@Override
	public News selectById(int id) {
		
		return newsDAO.selectById(id);
	}
	@Transactional
	@Override
	public void delete(int id) {
		News n=newsDAO.selectById(id);
		newsDAO.delete(n);
		
		
	}
	@Transactional
	@Override
	public void update(News news) {
		newsDAO.update(news);
		
	}
	@Transactional
	@Override
	public List<News> selectAll(int userid, int currentPage, int maxResult) {
		// TODO Auto-generated method stub
		return newsDAO.selectAll(userid,currentPage,maxResult);
	}


	@Transactional
	@Override
	public int selectAll(int userid) {
		return newsDAO.selectAll(userid);
	}

	@Transactional
	@Override
	public List<News> selectByType(int type, int currentPage, int maxResult) {
		
		return newsDAO.selectByType(type,currentPage,maxResult);
	}

	@Transactional
	@Override
	public int selectByType(int type) {
		// TODO Auto-generated method stub
		return newsDAO.selectByType(type);
	}

}
