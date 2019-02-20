<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>用户注册登陆页面</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="author" content="" />
  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	
	<!-- Animate.css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/userlogin/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/userlogin/css/icomoon.css">
	<!-- Themify Icons-->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/userlogin/css/themify-icons.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/userlogin/css/bootstrap.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/userlogin/css/magnific-popup.css">

	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/userlogin/css/owl.carousel.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/userlogin/css/owl.theme.default.min.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/userlogin/css/style.css">

	<!-- Modernizr JS -->
	<script src="${pageContext.request.contextPath }/userlogin/js/modernizr-2.6.2.min.js"></script>
	

	</head>
	<body>
		
	<div class="gtco-loader"></div>
	
	<div id="page">

	
	<div class="page-inner">
	<nav class="gtco-nav" role="navigation">
		<div class="gtco-container">
			
			<div class="row">
				<div class="col-sm-4 col-xs-12">
					<div id="gtco-logo">小于播报 <em>.</em></div>
				</div>
				
			</div>
			
		</div>
	</nav>
	
	<header id="gtco-header" class="gtco-cover" role="banner" style="background-image: url(${pageContext.request.contextPath}/userlogin/images/img_4.jpg)">
		<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12 col-md-offset-0 text-left">
					

					<div class="row row-mt-15em">
						<div class="col-md-7 mt-text animate-box" data-animate-effect="fadeInUp">
							<span class="intro-text-small">welcome to 小于播报</span>
							<h1>小于播报欢迎您.</h1>	
						</div>
						<div class="col-md-4 col-md-push-1 animate-box" data-animate-effect="fadeInRight">
							<div class="form-wrap">
								<div class="tab">
									<ul class="tab-menu">
										<li class="active gtco-first"><a href="#" data-tab="signup">注册</a></li>
										<li class="gtco-second"><a href="#" data-tab="login">登陆</a></li>
									</ul>
									<div class="tab-content">
										<div class="tab-content-inner active" data-content="signup">
											<form action="${pageContext.request.contextPath }/user/add" method="post" onsubmit="f()">
												<div class="row form-group">
													<div class="col-md-12">
														<label for="username">用户名</label>
														<input type="text" name="username" class="form-control" id="33" onblur="judge()" required>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
														<label for="password">密码</label>
														<input type="password" name="password" class="form-control" id="password" required>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
														<label for="">性别:</label>
														<input type="radio" value="true"  id="sex" name="sex" required>男
														<input type="radio" value="false"  id="sex" name="sex" required>女
													</div>
												</div>

												<div class="row form-group">
													<div class="col-md-12">
														<input type="submit" class="btn btn-primary" value="注册">
													</div>
												</div>
											</form>	
										</div>

										<div class="tab-content-inner" data-content="login">
											<form action="${pageContext.request.contextPath }/user/login" method="post" onsubmit="ff()">
												<div class="row form-group">
													<div class="col-md-12">
														<label for="username">用户名</label>
														<input type="text" name="username" class="form-control" id="username1">
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
														<label for="password">密码</label>
														<input type="password" name="password" class="form-control" id="password1">
													</div>
												</div>

												<div class="row form-group">
													<div class="col-md-12">
														<input type="submit" class="btn btn-primary" value="登陆" >
													</div>
												</div>
											</form>	
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
							
					
				</div>
			</div>
		</div>
	</header>
	
	</div>

	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
	<script>
	
	
	var result=null
	function judge(){
	var username=encodeURI(encodeURI($("#33").val()));
		$.ajax({
         type: "POST",
         async:false,
         cache:true,
         contentType:"application/x-www-form-urlencoded;charset=UTF-8",
         url: "${pageContext.request.contextPath}/user/checkUser?username="+username,//
         data: {},//参数
         dataType: "json",
         success: function (data) {//如果成功，返回参数，回调函数
        	 user=JSON.parse(data.user);
        	 console.log(user)
             if (user!=null) {
                 alert("该用户已存在！")
                 result=false
                 }
             else{
             	
				result=true	
             }
         },
     });
	return result
	}
	
	
	function f(){
		var gnl=confirm("确定要提交?"); 
		if (gnl==true){
			if(judge()){
				return true
				}else{ return false}
		} else{
		return false;
		}
	}  
	//验证用户名或密码是否匹配
	/* function judgePassword(){
	
	
	
	
		
		return result
		
	} */
	
	function ff(){
	var	result=null
	var username=encodeURI(encodeURI($("#username1").val()));
	var password=$("#password1").val();
	$.ajax({
         type: "POST",
         async:false,
         cache:true,
         contentType:"application/x-www-form-urlencoded;charset=UTF-8",
         url: "${pageContext.request.contextPath}/user/checkUser?username="+username,//
         data: {},//参数
         dataType: "json",
         success: function (data) {//如果成功，返回参数，回调函数
        	 user=JSON.parse(data.user);
        	 p=JSON.parse(data.p);
        	 if(p==password){
        	 	result==true
        	 
        	 }else{
        	 alert("用户名或密码错误！")
        	 result=false
        	 }
            
         },
     });
     
     if(result==true)
     	return true
     else
        return false	
     
	}
</script>
	
	
	<!-- jQuery -->
	<script src="${pageContext.request.contextPath }/userlogin/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="${pageContext.request.contextPath }/userlogin/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath }/userlogin/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="${pageContext.request.contextPath }/userlogin/js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="${pageContext.request.contextPath }/userlogin/js/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script src="${pageContext.request.contextPath }/userlogin/js/jquery.countTo.js"></script>
	<!-- Magnific Popup -->
	<script src="${pageContext.request.contextPath }/userlogin/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath }/userlogin/js/magnific-popup-options.js"></script>
	<!-- Main -->
	<script src="${pageContext.request.contextPath }/userlogin/js/main.js"></script>

	</body>
</html>

