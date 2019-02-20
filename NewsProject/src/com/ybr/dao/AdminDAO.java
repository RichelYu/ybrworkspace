package com.ybr.dao;

import com.ybr.entity.Admin;

public interface AdminDAO {

	Admin selectByName(String adminname);

	int selectAll();

	void update(Admin admin);

}
