package com.ybr.dao.impl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.ybr.dao.ContactDAO;
import com.ybr.entity.Contact;
@Repository
public class ContactDAOImpl implements ContactDAO {
	private final static String prehql = "select c from Contact as c ";
	@Resource
	BaseDAO<Contact> dao;
	
	@Override
	public void add(Contact c) {
		dao.add(c);
	}

	@Override
	public int selectAll() {
		// TODO Auto-generated method stub
		return ((Number) (Object) dao.select("select count(*) from Contact as c", null)).intValue();
	}

	@Override
	public int selectByDay(Date date) {
		Date d=new Date();
		String s1="00:00:00";
		String s2="23:59:59";
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		s1=df.format(d)+" "+s1;
		s2=df.format(d)+" "+s2;
		Criteria criteria = dao.getSession().createCriteria(Contact.class);
		if (date != null)
			try {
				criteria.add(Restrictions.between("contactTime",sdf.parse(s1),sdf.parse(s2)));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		criteria.setProjection(Projections.rowCount());
		return ((Number) criteria.uniqueResult()).intValue();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Contact> selectAll(Date date) {
		Date d=new Date();
		String s1="00:00:00";
		String s2="23:59:59";
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		s1=df.format(d)+" "+s1;
		s2=df.format(d)+" "+s2;
		Criteria criteria = dao.getSession().createCriteria(Contact.class);
		if(date!=null)
			try {
				criteria.add(Restrictions.between("contactTime",sdf.parse(s1),sdf.parse(s2)));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return criteria.list();
	}

}
