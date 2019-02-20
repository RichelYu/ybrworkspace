package com.ybr.controller;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ybr.entity.Admin;
import com.ybr.entity.Contact;
import com.ybr.entity.News;
import com.ybr.entity.User;
import com.ybr.service.AdminService;
import com.ybr.service.ContactService;
import com.ybr.service.NewsService;
import com.ybr.service.UserService;
/**
 * 
 * @author ybr
 *
 */
@Controller
@RequestMapping(value="/admin")
public class AdminController {
	@Autowired
	UserService userService;
	@Autowired
	NewsService newsService;
	@Autowired
	AdminService adminService;
	@Autowired
	ContactService contactService;
	int maxResult=10;
	
	@RequestMapping(value="/addNews")
	public String addNews(HttpServletRequest request,@RequestParam("file") MultipartFile file,String title,String content,int type,HttpSession session){
		Admin admin=(Admin) session.getAttribute("admin");
		
		String realpath = request.getSession().getServletContext().getRealPath("/") + "/upload/img/";
		String fileName =file.getOriginalFilename();
		Random random = new Random();  
        int rannum = (int) (random.nextDouble() * (99999 - 10000 + 1)) + 10000;// 获取5位随机数  
		String prefixName=new Date().getTime()+rannum+"";
		String suffixName=fileName.substring(fileName.lastIndexOf("."),fileName.length());
		String fn=prefixName+suffixName;
		System.out.println(fn);
		File newFile = new File(realpath, fn);
		if (!newFile.exists())
			newFile.mkdirs();
		try {
			file.transferTo(newFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		News news=new News();
		news.setContent(content);
		news.setType(type);
		news.setCreateTime(new Date());
		news.setTitle(title);
		news.setUserId(1000+admin.getId());//为防止和用户id冲突管理员发布的id前都加1000!!!我为什么这么蠢！！设计表的时候存的是id!!!!
		news.setImg("upload/img/"+fn);
		newsService.add(news);
		return "redirect:/admin/selectAllNews";
	}
	@RequestMapping(value="/deleteNews")
	public String deleteNews(int id,HttpServletRequest request){
		System.out.println(id);
		String imgurl=newsService.selectById(id).getImg();
		if(imgurl!=null){
			File file=new File(request.getSession().getServletContext().getRealPath("/"),imgurl);
			if(file.exists()){
				file.delete();
				}
		}  
		newsService.delete(id);
		return "redirect:/admin/selectAllNews";	
	}
	@RequestMapping(value="/selectAllNews")
	public String selectAllNews(HttpServletRequest request,Model model){
		int pageNum=request.getParameter("pageNum")==null?1:Integer.parseInt(request.getParameter("pageNum"));
		model.addAttribute("pageNum", pageNum);
		int totalRow;
		List<News> newsList;
		totalRow=newsService.selectAll(0);
		newsList=newsService.selectAll(0, pageNum * maxResult - maxResult, maxResult);
		model.addAttribute("lastPageNum", totalRow % maxResult == 0 ? totalRow / maxResult : totalRow / maxResult + 1);
		model.addAttribute("totalRow", totalRow);
		model.addAttribute("newsList", newsList);
		return "/AdminNewsList";
	}
	@RequestMapping(value="/selectNewsById")
	public String selectNewsById(int id,Model model){
		model.addAttribute("news", newsService.selectById(id));
		if(newsService.selectById(id).getUserId()>1000){
			model.addAttribute("author", "管理员");
			}else{
			model.addAttribute("author", userService.selectByUserId(newsService.selectById(id).getUserId()).getUsername());
		}
			return "/NewsDetail";
	}
	@RequestMapping(value="/updatePage")
	public String updatePage(int id,Model model){
		model.addAttribute("news", newsService.selectById(id));
		return "/AdminUpdateNews";
		
	}
	
	@RequestMapping(value="/updateNews")
	public String updateNews(HttpServletRequest request,@RequestParam("file") MultipartFile file,
			String title,String content,int type,HttpSession session,int id){
		News news=newsService.selectById(id);
		String oldPath=news.getImg();
		String realpath = request.getSession().getServletContext().getRealPath("/") + "/upload/applyData/";
		String fn="";
		String fileName="";
		if(file.getSize()>0){
			//如果老文件地址不是null则删除老文件上传新文件
			if(oldPath!=null){
				File oldFile = new File(request.getSession().getServletContext().getRealPath("/"),oldPath);
				if(oldFile.exists()){
				oldFile.delete();
				}
				}
			fileName=file.getOriginalFilename();
			Random random = new Random();  
	        int rannum = (int) (random.nextDouble() * (99999 - 10000 + 1)) + 10000;// 获取5位随机数  
			String prefixName=new Date().getTime()+rannum+"";
			String suffixName=fileName.substring(fileName.lastIndexOf("."),fileName.length());
			fn=prefixName+suffixName;
			System.out.println(fn);
			File newFile = new File(realpath, fn);
			if (!newFile.exists())
				newFile.mkdirs();
			try {
				file.transferTo(newFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			news.setImg("upload/img/"+fn);
		}
		news.setContent(content);
		news.setCreateTime(new Date());
		news.setTitle(title);
		news.setType(type);
		newsService.update(news);
		return "redirect:/admin/selectNewsById?id="+id;
	}
	
	
	
	
	/*************************************以下为用户管理部分*****************************************************************/
	@RequestMapping(value="/deleteUser")
	public String deleteUser(int id){
		System.out.println("进入管理员删除方法");
		userService.delete(id);
		
		return "redirect:/admin/selectAllUser";
	}
	
	@RequestMapping(value="/selectAllUser")
	public String selectAllUser(HttpServletRequest request,Model model){
		int pageNum=request.getParameter("pageNum")==null?1:Integer.parseInt(request.getParameter("pageNum"));
		model.addAttribute("pageNum", pageNum);
		int totalRow;
		List<User> userList;
		userList=userService.selectAll(pageNum * maxResult - maxResult, maxResult);
		totalRow=userService.selectAll();
		model.addAttribute("lastPageNum", totalRow % maxResult == 0 ? totalRow / maxResult : totalRow / maxResult + 1);
		model.addAttribute("totalRow", totalRow);
		model.addAttribute("userList", userList);
		return "/AdminUserList";
	}
	/********************************************管理员部分*******************************/
	@RequestMapping(value="/login")
	public String login(String adminname,String adminpassword,HttpSession session){
		Admin admin=adminService.selectByName(adminname);
		if(admin!=null){
		if(admin.getAdminpassword().equals(adminpassword)){
			System.out.println("enter judge");
			session.setAttribute("admin", admin);
			session.setAttribute("adminname", admin.getAdminname());
			System.out.println(admin.getAdminname());
			return "redirect:/admin/indexPage";
		}else{
			return "/error";
		}
	}else{
		return "/error";
	}
	}
	@RequestMapping(value="/indexPage")
	public String indexPage(Model model,HttpSession session){
		int adminCount=adminService.selectAllCount();
		int allUserCount=userService.selectAll();
		int allNewsCount=newsService.selectAll(0);
		int contactToday=contactService.selectByDay(new Date());
		int allContact=contactService.selectAll();
		List<Contact> ContactList=contactService.selectAll(new Date());
		Admin admin=(Admin) session.getAttribute("admin");
		model.addAttribute("adminCount", adminCount);
		model.addAttribute("allUserCount", allUserCount);
		model.addAttribute("allNewsCount", allNewsCount);
		model.addAttribute("adminname", admin.getAdminname());
		model.addAttribute("contactToday", contactToday);
		session.setAttribute("contactToday", contactToday);
		model.addAttribute("allContact", allContact);
		model.addAttribute("contactList", ContactList);
		return "/AdminIndex";
		
	}
	@RequestMapping(value="/addNewsPage")
	public String addNewsPage(){
		return "/AdminAddNews";
	}
	@RequestMapping(value="/updateAdminPage")
	public String updateAdminPage(Model model,HttpSession session){
		Admin admin=(Admin)session.getAttribute("admin");
		model.addAttribute("admin", admin);
		return "/AdminUpdatePassword";
	}
	@RequestMapping(value="/updateAdmin")
	public String updateAdmin(String adminpassword,HttpSession session){
		Admin admin=(Admin)session.getAttribute("admin");
		admin.setAdminpassword(adminpassword);
		adminService.update(admin);
		return "redirect:/admin/indexPage";
	}
	@RequestMapping(value="/contactToday")
	public String contactToday(Model model){
		model.addAttribute("contactList", contactService.selectAll(new Date()));
		return "/ContactTodayList";
	}
}
