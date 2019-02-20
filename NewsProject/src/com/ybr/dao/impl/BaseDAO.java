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
	 * hibernate session����
	 */
	@Resource
	private SessionFactory factory;

	/**
	 * ȡ�õ���session����
	 * 
	 * @return
	 */
	protected Session getSession() {
		return factory.getCurrentSession();
	}

	/**
	 * ��� T ʵ��
	 * 
	 * @param t
	 */
	@Transactional
	public void add(T t) {
		Session s = getSession();
		s.save(t);
		
		
	}

	/**
	 * ���� T ʵ��
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
	 * ɾ�� T ʵ��
	 * 
	 * @param t
	 */
	@Transactional
	public void delete(T t) {
		Session s=getSession();
		s.delete(t);
		
	}

	/**
	 * ��ҳ��ѯhql��� ����list
	 * 
	 * @param hql
	 *            hql��� ��������
	 * @param map
	 *            ����ֵ�ļ�ֵ��
	 * @param firstRusult
	 *            �׽��
	 * @param maxResult
	 *            �����
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
	 * ����hql��ѯList<T>����
	 * 
	 * @param hql
	 *            hql��� ��������
	 * @param map
	 *            ����ֵ�ļ�ֵ��
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
	 * ����hql��ѯ����Tʵ��
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

