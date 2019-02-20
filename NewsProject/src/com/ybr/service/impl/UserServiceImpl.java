package com.ybr.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ybr.dao.UserDAO;
import com.ybr.entity.User;
import com.ybr.service.UserService;
@Service
public class UserServiceImpl implements UserService {
	@Resource
	UserDAO userDAO;
	
	@Transactional
	@Override
	public void add(User user) {
		userDAO.add(user);
	}
	@Transactional
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		User user=userDAO.selectById(id);
		userDAO.delete(user);
	}
	@Transactional
	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		userDAO.update(user);
	}
	
	@Transactional
	@Override
	public User selectByUsername(String username) {
		
		return userDAO.selectByUsername(username);
	}
	@Transactional
	@Override
	public User selectByUserId(int userid) {
		
		return userDAO.selectById(userid);
	}
	@Transactional
	@Override
	public List<User> selectAll(int i, int maxResult) {
		// TODO Auto-generated method stub
		return userDAO.selectAll(i,maxResult);
	}
	@Transactional
	@Override
	public int selectAll() {
		
		return userDAO.selectAll();
	}

}
