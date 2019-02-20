
package com.ybr.service;

import java.util.Date;
import java.util.List;

import com.ybr.entity.Contact;

public interface ContactService {

	void add(Contact c);

	int selectByDay(Date date);

	int selectAll();

	List<Contact> selectAll(Date date);

}
