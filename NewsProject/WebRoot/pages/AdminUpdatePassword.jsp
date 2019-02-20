<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>修改管理密码</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath }/assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/amazeui.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/admin.css">
<script src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/app.js"></script>
</head>
<body>

</head>

<body>
<header class="am-topbar admin-header">
  <div class="am-topbar-brand"><img src="${pageContext.request.contextPath }/assets/i/logo.png"></div>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
    <ul class="am-nav am-nav-pills am-topbar-nav admin-header-list">

   <li class="am-dropdown tognzhi" data-am-dropdown>
  <button class="am-btn am-btn-primary am-dropdown-toggle am-btn-xs am-radius am-icon-bell-o" data-am-dropdown-toggle> 消息管理<span class="am-badge am-badge-danger am-round"><%=session.getAttribute("contactToday") %></span></button>
  <ul class="am-dropdown-content">
  <li class="am-dropdown-header">所有消息都在这里</li>
    <li><a href="${pageContext.request.contextPath }/admin/contactToday">今日反馈<span class="am-badge am-badge-danger am-round"><%=session.getAttribute("contactToday") %></span></a></li>
  </ul>
</li>
 <li class="am-hide-sm-only" style="float: right;"><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
</ul>
  </div>
</header>

<div class="am-cf admin-main"> 

<div class="nav-navicon admin-main admin-sidebar">
    
    
    <div class="sideMenu am-icon-dashboard" style="color:#aeb2b7; margin: 10px 0 0 0;"> 欢迎系统管理员：ybr</div>
    <div class="sideMenu">
      <h3 class="am-icon-flag"><em></em> <a href="${pageContext.request.contextPath }/admin/indexPage">首页</a></h3>
      
      <h3 class="am-icon-cart-plus"><em></em> <a href="${pageContext.request.contextPath }/admin/selectAllNews">新闻管理</a></h3>
      
      <h3 class="am-icon-users"><em></em> <a href="${pageContext.request.contextPath }/admin/selectAllUser">用户管理</a></h3>
      <h3 class="am-icon-gears on"><em></em> <a href="${pageContext.request.contextPath}/admin/updateAdminPage">个人信息</a></h3>
      
    </div>
    <!-- sideMenu End --> 
    
    <script type="text/javascript">
			jQuery(".sideMenu").slide({
				titCell:"h3", //鼠标触发对象
				targetCell:"ul", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
				effect:"slideDown", //targetCell下拉效果
				delayTime:300 , //效果时间
				triggerTime:150, //鼠标延迟触发时间（默认150）
				defaultPlay:true,//默认是否执行效果（默认true）
				returnDefault:true //鼠标从.sideMen移走后返回默认状态（默认false）
				});
		</script> 

    
    
    
    
    
    
    
</div>

<div class=" admin-content">
	
<div class="admin-biaogelist">
	
    <div class="listbiaoti am-cf">
      <ul class="am-icon-flag on">修改个人信息</ul>
      
      <dl class="am-icon-home" style="float: right;"> 当前位置： <a href="#">首页</a> > 个人信息</dl>

      
      
    </div>
	
    <div class="fbneirong">
      <form class="am-form" action="${pageContext.request.contextPath }/admin/updateAdmin"  enctype="multipart/form-data"
        method="post" accept-charset="utf-8" >
        
        <div class="am-form-group am-cf">
          <div class="zuo">用户名：</div>
          <div class="you">
            <input type="text" value="${admin.adminname}" class="am-input-sm" id="doc-ipt-email-1" name="adminname" readonly="readonly">
          </div>
        </div>
        
        <div class="am-form-group am-cf">
          <div class="zuo">密码：</div>
          <div class="you">
            <input type="password" value="${admin.adminpassword}" class="am-input-sm" id="doc-ipt-email-1" name="adminpassword" placeholder="请输入标题">
          </div>
        </div>
       
        
        
        <div class="am-form-group am-cf">
          <div class="you" style="margin-left: 11%;">
              <button type="submit" class="am-btn am-btn-success am-radius">保存修改</button>&nbsp;   &nbsp; 
              <button type="button" class="am-btn am-btn-secondary am-radius"
              onclick="window.location.href='${pageContext.request.contextPath}/admin/updateAdminPage'"
              >放弃修改</button>
          </div>
        </div>
      </form>
    </div>

  
 
 <div class="foods">
  <ul>
    版权所有@2017 .于冰融
  </ul>
  <dl>
    <a href="" title="返回头部" class="am-icon-btn am-icon-arrow-up"></a>
  </dl>
</div>




</div>

</div>




</div>

<script src="${pageContext.request.contextPath }/assets/js/amazeui.min.js"></script>




</body>
</html>