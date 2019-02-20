<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="">
    <meta name="author" content="">
	
    <title>新闻主页</title>
	
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
	<style type="text/css">
		.cont{
			color:#FFFFFF;
			overflow:hidden;
			/* text-overflow:ellipsis; */
			display:-webkit-box;
			-webkit-line-clamp:2;
			-webkit-box-orient:vertical;
			word-break:break-all;
		}
	</style>
	
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
	<div class="copyrights"></div>	
	<div class="featured container">
		<div class="row">
			<div class="col-sm-8">
				<!-- Carousel -->
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>
					<!-- Wrapper for slides -->
					<div class="carousel-inner">
					<c:forEach items="${newsList0 }" var="n0">
						<div class="item active">
<a href="${pageContext.request.contextPath }/news/selectById?id=${n0.id}"><img src="${pageContext.request.contextPath }/${n0.img}" alt="First slide"></a>
							<!-- Static Header -->
							<div class="header-text hidden-xs">
								<div class="col-md-12 text-center">
									<h3>${n0.title }</h3>
									<br>
									<h5 class="cont"><font color="#FFFFFF">${n0.content }</font></h5>
									<br>
								</div>
							</div><!-- /header-text -->
						</div>
						</c:forEach>
						<c:forEach items="${newsList00 }" var="n00">
						<div class="item">
<a href="${pageContext.request.contextPath }/news/selectById?id=${n00.id}"><img src="${pageContext.request.contextPath }/${n00.img }" alt="Second slide"></a>
							<!-- Static Header -->
							<div class="header-text hidden-xs">
								<div class="col-md-12 text-center">
									<h3>${n00.title }</h3>
									<br>
									<h5 class="cont"><font color="#FFFFFF">${n00.content }</font></h5>
									<br>
								</div>
							</div><!-- /header-text -->
						</div>
						</c:forEach>
						<c:forEach items="${newsList01 }" var="n01">
						<div class="item">
<a href="${pageContext.request.contextPath }/news/selectById?id=${n01.id}"><img src="${pageContext.request.contextPath }/${n01.img}" alt="Third slide"></a>
							<!-- Static Header -->
							<div class="header-text hidden-xs">
								<div class="col-md-12 text-center">
									<h3>${n01.title }</h3>
									<br>
									<h5 class="cont"><font color="#FFFFFF">${n01.content }</font></h5>
									<br>
								</div>
							</div><!-- /header-text -->
						</div></c:forEach>
					</div>
					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left"></span>
					</a>
					<a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</div><!-- /carousel -->
			</div>
			<div class="col-sm-4" >
				<div id="owl-demo-1" class="owl-carousel">
				<!-- 每日推荐三组图片 -->
				<c:forEach items="${imgList }" var="i">
			<a href="${pageContext.request.contextPath }/news/selectById?id=${i.id}"><img src="${pageContext.request.contextPath }/${i.img}" /></a>
					</c:forEach>
				</div>
				<!-- 每日推一图 -->
				<c:forEach items="${newsList00 }" var="n00">
	<a href="${pageContext.request.contextPath }/news/selectById?id=${n00.id}"><img src="${pageContext.request.contextPath }/${n00.img}" /></a>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<!-- Content -->
	<div id="page-content" class="index-page container">
		<div class="row">
			<div id="main-content"><!-- background not working -->
				<div class="col-md-6">
				<c:forEach items="${greatNews }" var="g">
					<div class="box wrap-vid">
						<div class="zoom-container">
							<div class="zoom-caption">
								<span class="youtube">Hot!</span>
								
								<p>${g.title }</p>
							</div>
							<img src="${pageContext.request.contextPath }/${g.img}" />
						</div>
						<h3 class="vid-name"><a href="${pageContext.request.contextPath }/news/selectById?id=${g.id}">${g.title }</a></h3>
						<div class="info">
							
							<span><i class="fa fa-calendar"></i><fmt:formatDate value="${g.createTime }" pattern="yyyy-MM-dd"/></span> 
							<span><i class="fa fa-heart"></i>10</span>
						</div>
						<p class="more">${g.content }</p>
					</div>
					</c:forEach>
					<div class="box">
						<div class="box-header header-vimeo">
							<h2>体育</h2>
						</div>
						<div class="box-content">
							<div class="row">
								<div class="col-md-6">
								<c:forEach items="${singlePE }" var="single">
									<div class="wrap-vid">
										<div class="zoom-container">
											<div class="zoom-caption">
												<span class="vimeo">Hot</span>
												
												<p>${single.title }</p>
											</div>
											<img src="${pageContext.request.contextPath }/${single.img}" />
										</div>
										<h3 class="vid-name"><a href="${pageContext.request.contextPath }/news/selectById?id=${single.id}">${single.title }</a></h3>
										<div class="info">
											
											<span><i class="fa fa-calendar"></i><fmt:formatDate value="${single.createTime }" pattern="yyyy-MM-dd"/></span> 
											<span><i class="fa fa-heart"></i>1</span>
										</div>
									</div>
									<p class="more">${single.content }</p>
								</c:forEach>
								</div>
								
								<div class="col-md-6">
								<c:forEach items="${PENewsList }" var="pe">
									<div class="post wrap-vid">
										<div class="zoom-container">
											<div class="zoom-caption">
												<span class="vimeo">PE</span>
												<p>${pe.title }</p>
											</div>
											<img src="${pageContext.request.contextPath }/${pe.img}" />
										</div>
										<div class="wrapper">
											<h5 class="vid-name"><a href="${pageContext.request.contextPath }/news/selectById?id=${pe.id}">${pe.title }</a></h5>
											<div class="info">
												<!-- <h6>By <a href="#">Kelvin</a></h6> -->
												<span><i class="fa fa-heart"></i>12/ <i class="fa fa-calendar"></i><fmt:formatDate value="${pe.createTime }" pattern="yyyy-MM-dd"/></span>
												<span class="rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-half"></i>
												</span>
											</div>
										</div>
									</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<div class="box">
						<div class="box-header header-photo">
							<h2>娱乐</h2>
						</div>
						<div class="box-content">
							<div id="owl-demo-2" class="owl-carousel">
								<div class="item">
								<c:forEach items="${amuse1 }" var="a1">
									<a href="${pageContext.request.contextPath }/news/selectById?id=${a1.id}"><img src="${pageContext.request.contextPath }/${a1.img}" /></a>
								</c:forEach>
								</div>
								<div class="item">
								<c:forEach items="${amuse2 }" var="a2">
<a href="${pageContext.request.contextPath }/news/selectById?id=${a2.id}"><img src="${pageContext.request.contextPath }/${a2.img}" /></a>
								</c:forEach>
								</div>
								<div class="item">
								<c:forEach items="${amuse3 }" var="a3">
<a href="${pageContext.request.contextPath }/news/selectById?id=${a3.id}"><img src="${pageContext.request.contextPath }/${a3.img}" /></a>
								</c:forEach>
								</div>
								<div class="item">
								<c:forEach items="${amuse4 }" var="a4">
<a href="${pageContext.request.contextPath }/news/selectById?id=${a4.id}"><img src="${pageContext.request.contextPath }/${a4.img}" /></a>
								</c:forEach>
								</div>
								<div class="item">
								<c:forEach items="${amuse5 }" var="a5">
		<a href="${pageContext.request.contextPath }/news/selectById?id=${a5.id}"><img src="${pageContext.request.contextPath }/${a5.img}" /></a>
								</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<div class="box">
						<div class="box-header header-natural">
							<h2>健康</h2>
						</div>
						<div class="box-content">
							<div class="row">
							<c:forEach items="${healthList }" var="hea">
								<div class="col-md-6">
									<img src="${pageContext.request.contextPath }/${hea.img}" />
									<h3><a href="${pageContext.request.contextPath }/news/selectById?id=${hea.id}">${hea.title }</a></h3>
									<span><i class="fa fa-heart"></i> 19 / <i class="fa fa-calendar"></i> <fmt:formatDate value="${hea.createTime }" pattern="yyyy-MM-dd"/> <i class="fa fa-comment-o"> / </i> 10 <i class="fa fa-eye"></i> 945</span>
									<span class="rating">
										<i class="fa fa-star"></i>
										<i class="fa fa-star"></i>
										<i class="fa fa-star-half"></i>
									</span>
									<p>${hea.content }</p>
								</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="sidebar">
				<div class="col-md-3">
					<!---- Start Widget ---->
					<div class="widget wid-vid">
						<div class="heading">
							<h4>科技</h4>
						</div>
						<div class="content">
							
							<div class="tab-content">
								<div id="most" class="tab-pane fade in active">
								<c:forEach items="${scienceList }" var="sci">
									<div class="post wrap-vid">
										<div class="zoom-container">
											<img src="${pageContext.request.contextPath }/${sci.img}" />
										</div>
										<div class="wrapper">
											<h5 class="vid-name"><a href="${pageContext.request.contextPath }/news/selectById?id=${sci.id}">${sci.title }</a></h5>
											<div class="info">
												<span><i class="fa fa-heart"></i>20/ <i class="fa fa-calendar"></i><fmt:formatDate value="${sci.createTime }" pattern="yyyy-MM-dd"/></span>
											</div>
										</div>
									</div>
								</c:forEach>	
								</div>
							
							</div>
						</div>
					</div>
					<!---- Start Widget ---->
					
					<!---- Start Widget ---->
					<div class="widget wid-new-post">
						<div class="heading"><h4>历史文化</h4></div>
						<div class="content">
							<c:forEach items="${historyList }" var="his">
							<h6><a href="${pageContext.request.contextPath }/news/selectById?id=${his.id}">${his.title }</a></h6>
							<img src="${pageContext.request.contextPath }/${his.img}" />
							<ul class="list-inline">
								<li><i class="fa fa-calendar"></i><fmt:formatDate value="${his.createTime }" pattern="yyyy-MM-dd"/></li> 
								<li><i class="fa fa-comments"></i>13</li>
							</ul>
							<p>${his.content }</p>
							</c:forEach>
							
						</div>
					</div>
					
				</div>
				<div class="col-md-3">
				<!---- Start Widget ---->
					<div class="widget wid-tags">
						<div class="heading"><h4>标签</h4></div>
						<div class="content">
							<a href="${pageContext.request.contextPath }/news/selectByType?type=0">财经</a>
								<a href="${pageContext.request.contextPath }/news/selectByType?type=1">社会</a>
								<a href="${pageContext.request.contextPath }/news/selectByType?type=2">军事</a>
								<a href="${pageContext.request.contextPath }/news/selectByType?type=6">房产</a>
								<a href="${pageContext.request.contextPath }/news/selectByType?type=4">科技</a>
								<a href="${pageContext.request.contextPath }/news/selectByType?type=5">汽车</a>
								<a href="${pageContext.request.contextPath }/news/selectByType?type=8">娱乐</a>
								<a href="${pageContext.request.contextPath }/news/selectByType?type=7">体育</a>
								<a href="${pageContext.request.contextPath }/news/selectByType?type=9">健康</a>
								<a href="${pageContext.request.contextPath }/news/selectByType?type=3">历史文化</a>
						</div>
					</div>
				<!---- Start Widget ---->
					<div class="widget wid-recent-post">
						<div class="heading"><h4>新闻总览</h4></div>
						<div class="content">
						<c:forEach items="${allNews }" var="all">
							<span> <a href="${pageContext.request.contextPath }/news/selectById?id=${all.id}">${all.title }</a></span>
						</c:forEach>	
						</div>
					</div>
					<!---- Start Widget ---->
					<div class="widget wid-banner">
						<div class="content">
							<img src="${pageContext.request.contextPath }/client/images/banner-2.jpg" class="img-responsive"/>
						</div>
					</div>
					<!---- Start Widget ---->
					
					<!---- Start Widget ---->
					
					<!---- Start Widget ---->
					<div class="widget wid-tweet">
						<div class="heading"><h4>今日热评</h4></div>
						<div class="content">
						<c:forEach items="${contactList }" var="contact">
							<div class="tweet-item">
								<p><i class="fa fa-twitter"></i>${contact.contactTitle }</p>
								<p>${contact.contactContent }</p>
							</div>
						</c:forEach>	
							<p>想要加入我，请联系邮箱1771541966@qq.com</p>
						</div>
					</div>
					
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
								<a href="${pageContext.request.contextPath }/news/selectByType?type=6">房产</a>
								<a href="${pageContext.request.contextPath }/news/selectByType?type=3">历史文化</a>
							
								<a href="${pageContext.request.contextPath }/news/selectByType?type=4">科技</a>
								<a href="${pageContext.request.contextPath }/news/selectByType?type=5">汽车</a>
								<a href="${pageContext.request.contextPath }/news/selectByType?type=8">娱乐</a>
								<a href="${pageContext.request.contextPath }/news/selectByType?type=7">体育</a>
								<a href="${pageContext.request.contextPath }/news/selectByType?type=9">健康</a>
							
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
	<script src="${pageContext.request.contextPath }/client/owl-carousel/owl.carousel.js"></script>
    <script>
    $(document).ready(function() {
      $("#owl-demo-1").owlCarousel({
        autoPlay: 3000,
        items : 1,
        itemsDesktop : [1199,1],
        itemsDesktopSmall : [400,1]
      });
	  $("#owl-demo-2").owlCarousel({
        autoPlay: 3000,
        items : 3,
        
      });
    });
    </script>
	
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/client/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/client/js/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
	<script type="text/javascript">
    $('.form_datetime').datetimepicker({
        //language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1
    });
	$('.form_date').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
	$('.form_time').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 1,
		minView: 0,
		maxView: 1,
		forceParse: 0
    });
</script>
</body>
</html>
