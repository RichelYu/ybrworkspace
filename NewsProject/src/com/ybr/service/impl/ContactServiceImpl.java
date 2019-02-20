package com.ybr.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ybr.dao.ContactDAO;
import com.ybr.entity.Contact;
import com.ybr.service.ContactService;
@Service
public class ContactServiceImpl implements ContactService {
	@Resource
	ContactDAO contactDAO;
	@Transactional
	@Override
	public void add(Contact c) {
		contactDAO.add(c);
	}
	@Transactional
	@Override
	public int selectByDay(Date date) {
		// TODO Auto-generated method stub
		return contactDAO.selectByDay(date);
	}
	@Transactional
	@Override
	public int selectAll() {
		
		return contactDAO.selectAll();
	}
	@Transactional
	@Override
	public List<Contact> selectAll(Date date) {
		// TODO Auto-generated method stub
		return contactDAO.selectAll(date);
	}

}
