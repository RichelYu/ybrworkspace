package com.ybr.dao.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ybr.dao.AdminDAO;
import com.ybr.entity.Admin;
@Repository
public class AdminDAOImpl implements AdminDAO {
	private final static String prehql = "select a from Admin as a ";
	@Resource
	BaseDAO<Admin> dao;
	
	@Override
	public Admin selectByName(String adminname) {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("adminname",adminname);
		return dao.select(prehql + "where a.adminname=:adminname", map);
	}

	@Override
	public int selectAll() {
		// TODO Auto-generated method stub
		return ((Number) (Object) dao.select("select count(*) from Admin as a", null)).intValue();
	}

	@Override
	public void update(Admin admin) {
		dao.update(admin);
	}

}
