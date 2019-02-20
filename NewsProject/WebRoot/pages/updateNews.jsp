<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="">
    <meta name="author" content="">
	
    <title>修改新闻</title>
	
   <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/bootstrap.min.css"  type="text/css">
	
	<!-- Owl Carousel Assets -->
    <link href="${pageContext.request.contextPath }/client/owl-carousel/owl.carousel.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/client/owl-carousel/owl.theme.css" rel="stylesheet">
	
	<!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/style.css">
	 <link href="${pageContext.request.contextPath }/client/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
	
	<!-- Custom Fonts -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/client/font-awesome-4.4.0/css/font-awesome.min.css"  type="text/css">
	
	<!-- jQuery and Modernizr-->
	<script src="${pageContext.request.contextPath }/client/js/jquery-2.1.1.js"></script>
	
	<!-- Core JavaScript Files -->  	 
    <script src="${pageContext.request.contextPath }/client/js/bootstrap.min.js"></script>
	
</head>

<body>
<header>
	<!--Top-->
	<nav id="top">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<strong>Welcome !<%=session.getAttribute("username") %></strong>
				</div>
				<div class="col-md-6">
					<ul class="list-inline top-link link">
						<li><a href="${pageContext.request.contextPath }/news/indexPage"><i class="fa fa-home"></i> 主页</a></li>
						<li><a href="${pageContext.request.contextPath }/news/addContactPage"><i class="fa fa-comments"></i> 反馈</a></li>
						<li><a href="${pageContext.request.contextPath }/user/loginOut"> 注销</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	
	<!--Navigation-->
    <nav id="menu" class="navbar container">
		<div class="navbar-header">
			<button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
			<a class="navbar-brand" href="#">
				<div class="logo"><span>Welcome</span></div>
			</a>
		</div>
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath }/news/indexPage">主页</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">分类 <i class="fa fa-arrow-circle-o-down"></i></a>
					<div class="dropdown-menu">
						<div class="dropdown-inner">
							<ul class="list-unstyled">
								<li><a href="${pageContext.request.contextPath }/news/selectByType?type=0">财经</a></li>
								<li><a href="${pageContext.request.contextPath }/news/selectByType?type=1">社会</a></li>
								<li><a href="${pageContext.request.contextPath }/news/selectByType?type=2">军事</a></li>
								<li><a href="${pageContext.request.contextPath }/news/selectByType?type=6">房产</a></li>
								<li><a href="${pageContext.request.contextPath }/news/selectByType?type=3">历史文化</a></li>
							</ul>
							<ul class="list-unstyled">
								<li><a href="${pageContext.request.contextPath }/news/selectByType?type=4">科技</a></li>
								<li><a href="${pageContext.request.contextPath }/news/selectByType?type=5">汽车</a></li>
								<li><a href="${pageContext.request.contextPath }/news/selectByType?type=8">娱乐</a></li>
								<li><a href="${pageContext.request.contextPath }/news/selectByType?type=7">体育</a></li>
								<li><a href="${pageContext.request.contextPath }/news/selectByType?type=9">健康</a></li>
							</ul>
						</div>
					</div>
				</li>
				<li class="dropdown"><a href="${pageContext.request.contextPath }/news/selectAll" >我的发布</a>
					
				</li>
				<li class="dropdown"><a href="${pageContext.request.contextPath }/news/addPage"  >发布新闻</a>
				</li>
				<li><a href="${pageContext.request.contextPath }/news/addContactPage"><i class="fa fa-envelope"></i>反馈</a></li>
			</ul>
			
		</div>
	</nav>
</header>
	
	<!-- Header -->
	
	<!-- Content -->
	<div id="page-content" class="archive-page container">
		<div class="">
			<div class="row">
				<div id="main-content" class="col-md-8">
					<div class="box">
						<center><div class="box-header">
							<h1 class="center">修改新闻</h1>
						</div></center>
						<div class="box-content">
							<div id="contact_form">
								<form name="form1" id="ff"  method="post" action="${pageContext.request.contextPath }/news/update"
								 enctype="multipart/form-data">
									<label>
									<span>新闻ID:</span>
									<input type="text"  name="id" value="${news.id }" readonly="readonly" >
									</label>
									<label>
									<span>新闻标题:</span>
									<input type="text"  name="title" value="${news.title }" id="name" required>
									</label>
									
									<label>
									<span>新闻内容:</span>
									<input type="text" name="content" id="message" value="${news.content}">
									</label><br>
									<label>
									<span>新闻分类:</span>
									<select  name="type" class="form-control">
           	<option value="-1">请选择新闻类型</option>
           	<c:choose>
           	<c:when test="${news.type==0 }"><option value="0" selected="selected">财经</option></c:when>
           	<c:otherwise><option value="0" >财经</option></c:otherwise>
           	</c:choose>
           	<c:choose>
           	<c:when test="${news.type==1 }"><option value="1" selected="selected">社会</option></c:when>
           	<c:otherwise><option value="1" >社会</option></c:otherwise>
           	</c:choose>
           	<c:choose>
           	<c:when test="${news.type==2 }"><option value="2" selected="selected">军事</option></c:when>
           	<c:otherwise><option value="2">军事</option></c:otherwise>
           	</c:choose>
           	<c:choose>
           	<c:when test="${news.type==3 }"><option value="3" selected="selected">历史文化</option></c:when>
           	<c:otherwise><option value="3">历史文化</option></c:otherwise>
           	</c:choose>
           	<c:choose>
           	<c:when test="${news.type==4 }"><option value="4" selected="selected">科技</option></c:when>
           	<c:otherwise><option value="4">科技</option></c:otherwise>
           	</c:choose>
           	<c:choose>
           	<c:when test="${news.type==5 }"><option value="5" selected="selected">汽车</option></c:when>
           	<c:otherwise><option value="5">汽车</option></c:otherwise>
           	</c:choose>
           	<c:choose>
           	<c:when test="${news.type==6 }"><option value="6" selected="selected">房产</option></c:when>
           	<c:otherwise><option value="6">房产</option></c:otherwise>
           	</c:choose>
			<c:choose>
			<c:when test="${news.type==7}"><option value="7" selected="selected">体育</option> </c:when>
			<c:otherwise><option value="7">体育</option> </c:otherwise>
			</c:choose>
           	<c:choose>
           	<c:when test="${news.type==8}"><option value="8" selected="selected">娱乐</option></c:when>
           	<c:otherwise><option value="8">娱乐</option></c:otherwise>
           	</c:choose>
           	<c:choose>
           	<c:when test="${news.type==9 }"><option value="9" selected="selected">健康</option></c:when>
           	<c:otherwise><option value="9">健康</option></c:otherwise>
           	</c:choose>
           	</select>
									</label>
									<br>
									<label>
									<span>上传新闻图片:</span>
									<input type="file"  name="file"  >
									</label>
									<center><input class="sendButton" type="submit" name="Submit" value="提交修改">
									<input type="button" class="sendButton" onclick="window.location.href='${pageContext.request.contextPath}/news/selectAll'" value="放弃修改">
									</center>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div id="sidebar" class="col-md-4">
					
					
				</div>
			</div>
		</div>
	</div>

	<footer>
		<div class="wrap-footer">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-footer footer-1">
						<div class="footer-heading"><h1><span style="color: #fff;">NEWSPAPER</span></h1></div>
						<div class="content">
							<p>欢迎来把我的新闻网站印刷成报纸！！！</p>
							<strong>Email address:</strong>
							<p>1771541966@qq.com</p>
						</div>
					</div>
					<div class="col-md-4 col-footer footer-2">
						<div class="footer-heading"><h4>标签</h4></div>
						<div class="content">
							
								<a href="${pageContext.request.contextPath }/news/selectByType?type=0">财经</a>
								<a href="${pageContext.request.contextPath }/news/selectByType?type=1">社会</a>
								<a href="${pageContext.request.contextPath }/news/selectByType?type=2">军事</a>
								<a href="${pageContext.request.contextPath }/news/selectByType?type=3">房产</a>
								<a href="${pageContext.request.contextPath }/news/selectByType?type=4">历史文化</a>
							
								<a href="${pageContext.request.contextPath }/news/selectByType?type=5">科技</a>
								<a href="${pageContext.request.contextPath }/news/selectByType?type=6">汽车</a>
								<a href="${pageContext.request.contextPath }/news/selectByType?type=7">房产</a>
								<a href="${pageContext.request.contextPath }/news/selectByType?type=8">体育</a>
							
						</div>
					</div>
					<div class="col-md-4 col-footer footer-3">
						<div class="footer-heading"><h4>友情链接</h4></div>
						<div class="content">
							<ul>
								<li><a href="http://www.baidu.com">百度</a></li>
								<li><a href="http://news.sina.com.cn/">新浪新闻</a></li>
								<li><a href="http://news.qq.com/">腾讯新闻</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="copy-right">
			<p>Copyright &copy; 2017.于冰融</p>
		</div>
	</footer>
	<!-- Footer -->
	
	<!-- JS -->
	<script src="owl-carousel/owl.carousel.js"></script>
    <script>
    $(document).ready(function() {
      $("#owl-demo").owlCarousel({
        autoPlay: 3000,
        items : 5,
        itemsDesktop : [1199,4],
        itemsDesktopSmall : [979,4]
      });

    });
    </script>
	
</body>
</html>
