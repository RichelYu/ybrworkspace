package com.ybr.dao;

import java.util.List;

import com.ybr.entity.User;

public interface UserDAO {

	void add(User user);

	void delete(User user);

	void update(User user);

	User selectById(int id);

	User selectByUsername(String username);

	List<User> selectAll(int firstResult, int maxResult);

	int selectAll();
}
