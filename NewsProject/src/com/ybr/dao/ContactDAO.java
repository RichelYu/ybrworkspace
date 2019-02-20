package com.ybr.dao;

import java.util.Date;
import java.util.List;

import com.ybr.entity.Contact;

public interface ContactDAO {

	void add(Contact c);

	int selectAll();

	int selectByDay(Date date);

	List<Contact> selectAll(Date date);

}
