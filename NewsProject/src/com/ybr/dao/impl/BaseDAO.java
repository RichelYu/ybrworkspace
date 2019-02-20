package com.ybr.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

@Component
public class BaseDAO<T> {
	/**
	 * hibernate session工厂
	 */
	@Resource
	private SessionFactory factory;

	/**
	 * 取得单例session对象
	 * 
	 * @return
	 */
	protected Session getSession() {
		return factory.getCurrentSession();
	}

	/**
	 * 添加 T 实体
	 * 
	 * @param t
	 */
	@Transactional
	public void add(T t) {
		Session s = getSession();
		s.save(t);
		
		
	}

	/**
	 * 更新 T 实体
	 * 
	 * @param t
	 */
	@Transactional
	public void update(T t) {
		Session s=getSession();
		s.update(t);
		
	}

	@Transactional
	public void saveOrUpdate(T t) {
		Session s=getSession();
		s.saveOrUpdate(t);
	
	}

	/**
	 * 删除 T 实体
	 * 
	 * @param t
	 */
	@Transactional
	public void delete(T t) {
		Session s=getSession();
		s.delete(t);
		
	}

	/**
	 * 分页查询hql语句 返回list
	 * 
	 * @param hql
	 *            hql语句 包含条件
	 * @param map
	 *            条件值的键值对
	 * @param firstRusult
	 *            首结果
	 * @param maxResult
	 *            最大结果
	 * @return
	 */
	@Transactional
	@SuppressWarnings("unchecked")
	public List<T> selectListForSplitPage(String hql, Map<String, Object> map, int firstResult, int maxResult) {
		Session ss=getSession();
		Query query = ss.createQuery(hql);
		if (map != null)
			for (String s : map.keySet())
				query.setParameter(s, map.get(s));
		if (firstResult > -1 && maxResult > 0)
			query.setFirstResult(firstResult).setMaxResults(maxResult);
		List<T> tt=query.list();
		
	
		return tt;
	}

	/**
	 * 根据hql查询List<T>集合
	 * 
	 * @param hql
	 *            hql语句 包含条件
	 * @param map
	 *            条件值的键值对
	 * @return
	 */
	@Transactional
	@SuppressWarnings("unchecked")
	public List<T> selectList(String hql, Map<String, Object> map) {
		Session ss=getSession();
		Query query = ss.createQuery(hql);
		if (map != null)
			for (String s : map.keySet())
				query.setParameter(s, map.get(s));
		List<T> tt=query.list();
		
		return tt;
	}

	/**
	 * 根据hql查询单个T实例
	 * 
	 * @param hql
	 * @param map
	 * @return
	 */
	@Transactional
	@SuppressWarnings("unchecked")
	public T select(String hql, Map<String, Object> map) {
		Session ss=getSession();
		Query query = ss.createQuery(hql);
		if (map != null)
			for (String s : map.keySet())
				query.setParameter(s, map.get(s));
		T tt= (T) query.uniqueResult();
	
		return tt;
	}
}

