package com.ybr.service;

import com.ybr.entity.Admin;

public interface AdminService {

	Admin selectByName(String adminname);

	int selectAllCount();

	void update(Admin admin);

}
