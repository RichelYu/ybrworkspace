package com.ybr.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{
/**
 * handlerִ�����֮������������
 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception exc)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
/**
 * handlerִ��֮��ModelAndView����֮ǰ�����������
 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	/**
	 * Handlerִ��֮ǰ�����������
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		 //��ȡ�����URL 
		  String url = request.getRequestURI(); 
		  //URL:login.jsp�ǹ�����;���demo�ǳ���login.jsp�ǿ��Թ������ʵģ�������URL���������ؿ��� 
		  if(url.indexOf("/user/login")>=0){ 
		   return true; 
		  } 
		  //��ȡSession 
		  HttpSession session = request.getSession(); 
		  String username = (String)session.getAttribute("username"); 
		  if(username != null){ 
		   return true; 
		  } else{
		  //�����������ģ���ת����¼���� 
		  request.getRequestDispatcher("/pages/login.jsp").forward(request, response); 
		  return false; 
		  }
		  
		 } 
	}
	
	

