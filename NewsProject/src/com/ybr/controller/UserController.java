package com.ybr.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ybr.entity.User;
import com.ybr.service.UserService;
import com.ybr.util.JsonUtils;

@Controller
@RequestMapping(value="/user")
public class UserController {
	@Autowired
	UserService userService;
	@RequestMapping(value="/loginPage")
	public String loginPage(){
		return "/login";
	}
	
	
	@RequestMapping(value="/add")
	public String add(String username,String password,boolean sex){
		User user=new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setSex(sex);
		userService.add(user);
		return "redirect:/user/loginPage";
	}
	
	@RequestMapping(value="/update")
	public String update(int id,String username,String password,boolean sex){
		User user=new User();
		user.setId(id);
		user.setUsername(username);
		user.setPassword(password);
		user.setSex(sex);
		userService.update(user);
		return null;
	}
	
	@RequestMapping(value="/login")
	public String login(String username,String password,HttpSession session){
		User user=userService.selectByUsername(username);
		if(user!=null){
		if(user.getPassword().equals(password)){
			System.out.println("enter judge");
			session.setAttribute("user", user);
			session.setAttribute("username", user.getUsername());
			return "redirect:/news/indexPage";
		}else{
			return "/login";
		}
	}else{
		return "/login";
	}
	}
	@RequestMapping(value="/loginOut")
	public String logOut(HttpSession session){
		session.removeAttribute("user");
		return "redirect:/user/loginPage";
	}
	
	@ResponseBody
	@RequestMapping(value="/checkUser")
	public String checkUser(String username){
		System.out.println("进入方法");
		try {
			username=URLDecoder.decode(username, "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		User u=userService.selectByUsername(username);
		String password="";
		if(u!=null){
			password=u.getPassword();
		}
		JSONObject json = new JSONObject();
		try {
			json.put("user", JsonUtils.toJson(u));
			json.put("p",JsonUtils.toJson(password));
		} catch (JSONException e) {
			System.out.println("make json error.");
		}
		System.out.println("存放完毕json数据");
		return json.toString();
		
	}
}
