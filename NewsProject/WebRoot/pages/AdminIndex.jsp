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
<title>后台管理页面</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
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
  <button class="am-btn am-btn-primary am-dropdown-toggle am-btn-xs am-radius am-icon-bell-o" data-am-dropdown-toggle> 消息管理<span class="am-badge am-badge-danger am-round">${contactToday}</span></button>
  <ul class="am-dropdown-content">
    <li class="am-dropdown-header">所有消息都在这里</li>
    <li><a href="${pageContext.request.contextPath }/admin/contactToday">今日反馈<span class="am-badge am-badge-danger am-round">${contactToday}</span></a></li>
  </ul>
</li>

 <!-- <li class="kuanjie">
 	 <a href="#">系统设置</a>
 </li>
 <li class="soso">
 </li> -->
  <li class="am-hide-sm-only" style="float: right;"><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
    </ul>
  </div>
</header>

<div class="am-cf admin-main"> 

<div class="nav-navicon admin-main admin-sidebar">
    
    
    <div class="sideMenu am-icon-dashboard" style="color:#aeb2b7; margin: 10px 0 0 0;"> 欢迎系统管理员：<%out.print(session.getAttribute("adminname")); %></div>
    <div class="sideMenu">
      <h3 class="am-icon-flag"><em></em> <a href="${pageContext.request.contextPath }/admin/indexPage">首页</a></h3>
      
      <h3 class="am-icon-cart-plus"><em></em> <a href="${pageContext.request.contextPath }/admin/selectAllNews">新闻管理</a></h3>
      
      <h3 class="am-icon-users"><em></em> <a href="${pageContext.request.contextPath }/admin/selectAllUser">用户管理</a></h3>
      
      <h3 class="am-icon-gears"><em></em> <a href="${pageContext.request.contextPath }/admin/updateAdminPage">个人信息</a></h3>
     
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
	

<div class="admin">
   <div class="admin-index">
      <dl data-am-scrollspy="{animation: 'slide-right', delay: 100}">
        <dt class="qs"><i class="am-icon-users"></i></dt>
        <dd>${allUserCount }</dd>
        <dd class="f12">用户数量</dd>
      </dl>
      <dl data-am-scrollspy="{animation: 'slide-right', delay: 300}">
        <dt class="cs"><i class="am-icon-area-chart"></i></dt>
        <dd>${allNewsCount }</dd>
        <dd class="f12">新闻数量</dd>
      </dl>
      <dl data-am-scrollspy="{animation: 'slide-right', delay: 300}">
        <dt class="cs"><i class="am-icon-area-chart"></i></dt>
        <dd>${allContact }</dd>
        <dd class="f12">反馈数量</dd>
      </dl>
      
      
      
     
    </div>
    <div class="admin-biaoge">
      <div class="xinxitj">信息概况</div>
      <table class="am-table">
        <thead>
          <tr>
            <th>管理员总人数</th>
            <th>今日反馈数量</th>
         </tr>
        </thead>
        <tbody>
          <tr>
            <td>${adminCount }</td>
            <td>${contactToday}</td>
            
          </tr>
        </tbody>
      </table>
      <div class="xinxitj">管理员今日发布信息概况</div>
      <table class="am-table">
        <thead>
          <tr>
            <th>反馈ID</th>
            <th>反馈标题</th>
            <th>反馈内容</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${contactList }" var="c">
          <tr>
            <td>${c.id }</td>
            <td>${c.contactTitle }</td>
            <td>${c.contactContent }</td>
          </tr>
          </c:forEach>
        </tbody>
      </table>
     
    </div>
    <div class="shuju">
      <div class="shujuone">
        <dl>
          <dt>管理员用户名：  ${adminname}</dt>
       	  <dt>管理员权限：</dt>
          <dt>对用户的操作（删除、查询）；</dt>
          <dt>对新闻的操作（增删改查）</dt>
        </dl>
        <ul>
          <h2>6</h2>
          <li>项权限</li>
        </ul>
      </div>
     
     
      <script type="text/javascript">jQuery(".slideTxtBox").slide();</script> 
   
   
   
   
   
   
   
   
</div>

    <div class="foods">
    	<ul>版权所有@2017 .于冰融</ul>
    	<dl><a href="" title="返回头部" class="am-icon-btn am-icon-arrow-up"></a></dl>


    	
    </div>







</div>

</div>




</div>

<script src="${pageContext.request.contextPath }/assets/js/amazeui.min.js"></script>




</body>
</html>
