package com.ybr.test;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class Test {

	public static void main(String[] args) {
		Calendar c1=new GregorianCalendar();
		c1.set(Calendar.HOUR_OF_DAY,0);
		c1.set(Calendar.MINUTE,0);
		c1.set(Calendar.SECOND, 0);
		System.out.println(c1.getTime());
		Calendar c2=new GregorianCalendar();
		c2.set(Calendar.HOUR_OF_DAY, 23);
		c2.set(Calendar.MINUTE,59);
		c2.set(Calendar.SECOND, 59);
		System.out.println(c2.getTime());
		
		System.out.println("--------------------------------");
		
		
	}

}
