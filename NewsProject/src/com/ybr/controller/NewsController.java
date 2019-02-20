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

import com.ybr.entity.Contact;
import com.ybr.entity.News;
import com.ybr.entity.User;
import com.ybr.service.ContactService;
import com.ybr.service.NewsService;
import com.ybr.service.UserService;

@Controller
@RequestMapping(value="/news")
public class NewsController {
	private static User user = null;
	@Autowired
	NewsService newsService;
	@Autowired
	UserService userService;
	@Autowired
	ContactService contactService;
	int maxResult=4;
	
	
	@RequestMapping(value="/indexPage")
	public String indexPage(Model model){
		model.addAttribute("newsList0", newsService.selectAll(0, 0, 1));
		model.addAttribute("newsList00", newsService.selectAll(0, 2, 1));
		model.addAttribute("newsList01", newsService.selectAll(0, 3, 1));
		//每日推荐一个点赞次数最多的新闻
		model.addAttribute("greatNews", newsService.selectAll(0, 4, 1));
		model.addAttribute("newsList1", newsService.selectAll(0, 0, 2));
		model.addAttribute("newsList2", newsService.selectAll(0, 2, 2));
		//每天推荐三组图片
		model.addAttribute("imgList", newsService.selectAll(0,5,3));
		//体育模块
		model.addAttribute("PENewsList", newsService.selectByType(7,0,3));
		model.addAttribute("singlePE", newsService.selectByType(7, 0, 1));
		//娱乐模块
		model.addAttribute("amuse1", newsService.selectByType(8, 0, 2));
		model.addAttribute("amuse2", newsService.selectByType(8, 3, 2));
		model.addAttribute("amuse3", newsService.selectByType(8, 5, 2));
		model.addAttribute("amuse4", newsService.selectByType(8, 7, 2));
		model.addAttribute("amuse5", newsService.selectByType(8, 9, 2));
		//健康模块
		model.addAttribute("healthList", newsService.selectByType(9, 0, 2));
		//科技模块
		model.addAttribute("scienceList", newsService.selectByType(4, 0, 3));
		//历史文化
		model.addAttribute("historyList", newsService.selectByType(3, 0, 4));
		//新闻总览
		model.addAttribute("allNews", newsService.selectAll(0, 0, 35));
		//今日热评
		model.addAttribute("contactList", contactService.selectAll(null));
		return "/index";
	}
	
	@RequestMapping(value="/addPage")
	public String addPage(){
		return "/publish";
	}
	@RequestMapping(value="/updatePage")
	public String updatePage(Model model,int id){
		model.addAttribute("news", newsService.selectById(id));
		return "/updateNews";
	}
	
	@RequestMapping(value="/add")
	public String add(HttpServletRequest request,@RequestParam("file") MultipartFile file,String title,String content,int type,HttpSession session){
		user=(User) session.getAttribute("user");
		
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
		news.setUserId(user.getId());
		news.setImg("upload/img/"+fn);
		newsService.add(news);
		return "redirect:/news/selectAll";
	}
	
	@RequestMapping(value="/selectAll")
	public String selectAll(Model model,HttpSession session){
		user=(User) session.getAttribute("user");
		model.addAttribute("newsList", newsService.selectAll(user.getId(),0,Integer.MAX_VALUE));
		return "/allNews";
		
	}
	@RequestMapping(value="/selectById")
	public String selectById(Model model,int id){
		model.addAttribute("news", newsService.selectById(id));
		int userid=newsService.selectById(id).getUserId();
		System.out.println(userid);
		if(userid>1000){
			model.addAttribute("username", "一个低调的管理员");
		}else{
			model.addAttribute("username", userService.selectByUserId(userid).getUsername());
		}
		return "/singleNews";
	}
	@RequestMapping(value="delete")
	public String delete(int id,HttpServletRequest request){
		
		String imgurl=newsService.selectById(id).getImg();
		if(imgurl!=null){
			File file=new File(request.getSession().getServletContext().getRealPath("/"),imgurl);
			if(file.exists()){
				file.delete();
				}
		}
		newsService.delete(id);
		return "redirect:/news/selectAll";
	}
	@RequestMapping(value="/update")
	public String update(HttpServletRequest request,@RequestParam("file") MultipartFile file,
			String title,String content,int type,HttpSession session,int id){
		News news=newsService.selectById(id);
		String oldPath=news.getImg();
		String realpath = request.getSession().getServletContext().getRealPath("/") + "/upload/img/";
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
		return "redirect:/news/selectById?id="+id;
	}
	
	@RequestMapping(value="/addContactPage")
	public String addContactPage(){
		return "/Contact";
	}
	@RequestMapping(value="/addContact")
	public String addContact(String contactTitle,String contactContent,String Email){
		Contact c=new Contact();
		c.setContactContent(contactContent);
		c.setEmail(Email);
		c.setContactTitle(contactTitle);
		c.setContactTime(new Date());
		contactService.add(c);
		return "redirect:/news/indexPage";
	}
	@RequestMapping(value="/selectByType")
	public String selectByType(int type,Model model,HttpServletRequest request){
		int pageNum=request.getParameter("pageNum")==null?1:Integer.parseInt(request.getParameter("pageNum"));
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("type", type);
		List<News> newsList;
		int totalRow;
		totalRow=newsService.selectByType(type);
		newsList=newsService.selectByType(type,pageNum * maxResult - maxResult, maxResult);
		model.addAttribute("newsList", newsList);
		model.addAttribute("lastPageNum", totalRow % maxResult == 0 ? totalRow / maxResult : totalRow / maxResult + 1);
		model.addAttribute("totalRow", totalRow);
		return "/TypeNews";
		
	}
	
}
