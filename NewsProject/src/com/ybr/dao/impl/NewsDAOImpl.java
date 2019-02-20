package com.ybr.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ybr.dao.NewsDAO;
import com.ybr.entity.News;
@Repository
public class NewsDAOImpl implements NewsDAO {
	private final static String prehql = "select n from News as n ";
	@Resource
	BaseDAO<News> dao;
	
	@Override
	public void add(News news) {
		// TODO Auto-generated method stub
		dao.add(news);
	}

	

	@Override
	public News selectById(int id) {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("id",id);
		return dao.select(prehql + "where n.id=:id", map);
	}

	@Override
	public void delete(News n) {
		dao.delete(n);
		
	}

	@Override
	public void update(News news) {
		dao.update(news);
		
	}


	
	@SuppressWarnings("unchecked")
	@Transactional
	@Override
	public List<News> selectAll(int userid, int currentPage, int maxResult) {
		Criteria criteria = dao.getSession().createCriteria(News.class);
		
		if (userid> 0)
			criteria.add(Restrictions.eq("userId", userid));
		criteria.setFirstResult(currentPage).setMaxResults(maxResult).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return criteria.list();
	}


	@Transactional
	@Override
	public int selectAll(int userid) {
		Criteria criteria = dao.getSession().createCriteria(News.class);
		
		if (userid> 0)
			criteria.add(Restrictions.eq("userId", userid));
		criteria.setProjection(Projections.rowCount());

		return ((Number) criteria.uniqueResult()).intValue();
	}


	@SuppressWarnings("unchecked")
	@Transactional
	@Override
	public List<News> selectByType(int type, int currentPage, int maxResult) {
		Criteria criteria = dao.getSession().createCriteria(News.class);
		if(type>-1)
			criteria.add(Restrictions.eq("type", type));
		criteria.setFirstResult(currentPage).setMaxResults(maxResult).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return criteria.list();
	}


	@Transactional
	@Override
	public int selectByType(int type) {
		Criteria criteria = dao.getSession().createCriteria(News.class);
		if(type>=0)
			criteria.add(Restrictions.eq("type",type));
		criteria.setProjection(Projections.rowCount());
		return ((Number) criteria.uniqueResult()).intValue();
	}
	

}
