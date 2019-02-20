package com.ybr.service;

import java.util.List;

import com.ybr.entity.User;

public interface UserService {

	void add(User user);

	void delete(int id);

	void update(User user);
	
	User selectByUsername(String username);

	User selectByUserId(int userid);

	List<User> selectAll(int i, int maxResult);

	int selectAll();

}
