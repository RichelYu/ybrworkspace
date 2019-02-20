package com.ybr.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ybr.dao.UserDAO;
import com.ybr.entity.User;
@Repository
public class UserDAOImpl implements UserDAO {
	/**
	 * hql ǰ׺
	 */
	private final static String prehql = "select u from User as u ";
	@Resource
	private BaseDAO<User> dao;
	@Override
	public void add(User user) {
		
		dao.add(user);
		
	}

	@Override
	public void delete(User user) {
		dao.delete(user);
	}

	@Override
	public void update(User user) {
		
	}
	@Override
	public User selectById(int id) {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("id",id);
		return dao.select(prehql + "where u.id=:id", map);
	}

	@Override
	public User selectByUsername(String username) {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("username",username);
		return dao.select(prehql + "where u.username=:username", map);
	}

	@Override
	public List<User> selectAll(int firstResult, int maxResult) {
		return dao.selectListForSplitPage(prehql, null, firstResult, maxResult);
	}

	@Override
	public int selectAll() {
		return ((Number) (Object) dao.select("select count(*) from User as u", null)).intValue();
	}

}
