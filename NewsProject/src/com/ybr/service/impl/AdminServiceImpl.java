package com.ybr.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ybr.dao.AdminDAO;
import com.ybr.entity.Admin;
import com.ybr.service.AdminService;
@Service
public class AdminServiceImpl implements AdminService {
	@Resource
	AdminDAO adminDAO;
	@Transactional
	@Override
	public Admin selectByName(String adminname) {
		return adminDAO.selectByName(adminname);
	}
	@Transactional
	@Override
	public int selectAllCount() {
		// TODO Auto-generated method stub
		return adminDAO.selectAll();
	}
	@Transactional
	@Override
	public void update(Admin admin) {
		adminDAO.update(admin);
		
	}

}
