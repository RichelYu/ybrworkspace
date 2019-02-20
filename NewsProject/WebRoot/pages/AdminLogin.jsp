<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html class="no-js">
<head>

  <title>后台管理登陆页面</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/css/adminlogin/amazeui.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/css/adminlogin/app.css">
</head>
<body>
<div class="am-g myapp-login">
	<div class="myapp-login-bg">
		 <div class="myapp-login-logo">
		 	<i class="am-icon-stumbleupon"></i>
		 </div>
		 <div class="am-u-sm-10 myapp-login-form">
		 	<form class="am-form" action="${pageContext.request.contextPath }/admin/login">
			  <fieldset>
		
			    <div class="am-form-group">

			      <input type="text" class="" name="adminname"  placeholder="请输入用户名">
			    </div>

			    <div class="am-form-group">
			     
			      <input type="password" class="" name="adminpassword"  placeholder="请输入密码">
			    </div>
			    <p><button type="submit" class="am-btn am-btn-default">Login</button></p>
			    <div class="login-text">
			    	后台管理员登陆页面
			    </div>
			  </fieldset>
			</form>
		 </div>
	</div>
</div>

</body>
</html>