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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>新闻管理页</title>

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

 <li class="soso">
 	
 </li>
 </ul>
  </div>
</header>

<div class="am-cf admin-main"> 

<div class="nav-navicon admin-main admin-sidebar">
    
    
    <div class="sideMenu am-icon-dashboard" style="color:#aeb2b7; margin: 10px 0 0 0;"> 欢迎系统管理员：<%out.print(session.getAttribute("adminname")); %></div>
    <div class="sideMenu">
      <h3 class="am-icon-flag"><em></em> <a href="${pageContext.request.contextPath }/admin/indexPage">首页</a></h3>
      
      <h3 class="am-icon-cart-plus on"><em></em> <a href="${pageContext.request.contextPath }/admin/selectAllNews">新闻管理</a></h3>
      
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
	
	<div class="am-popup am-popup-inner" id="my-popups">
	
	   
	
	    
</div>

<div class="admin-biaogelist">
	
    <div class="listbiaoti am-cf">
      <ul class="am-icon-users"> 新闻列表</ul>
      
      <dl class="am-icon-home" style="float: right;">当前位置： 首页 > <a href="#">新闻列表</a></dl>
      
      <button type="button" class="am-btn am-btn-danger am-round am-btn-xs am-icon-plus" onclick="window.location.href='${pageContext.request.contextPath}/admin/addNewsPage'">发布新闻</button>

      <!--这里打开的是新页面-->
    </div>
    <form class="am-form am-g">
          <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped">
            <thead>
              <tr class="am-success">

                <th class="table-id">ID</th>
                <th class="table-title">新闻标题</th>
                <th class="table-author">发布者id</th>
                <th class="table-type">新闻类型</th>
                <th class="table-author am-hide-sm-only">发布日期</th>
                <th class="table-author am-hide-sm-only">点击次数</th>
                
                <th width="130px" class="table-set">操作</th>
              </tr>
            </thead>
            <tbody>
             <c:forEach items="${newsList }" var="n">
              <tr>
                <td>${n.id }</td>
                <td><a href="${pageContext.request.contextPath }/admin/selectNewsById?id=${n.id}">${n.title }</a></td>
                <td>${n.userId }</td>
                <td>
                      <c:choose>
                      <c:when test="${n.type==0 }">财经</c:when>
                      <c:when test="${n.type==1 }">社会</c:when>
                      <c:when test="${n.type==2 }">军事</c:when>
                      <c:when test="${n.type==3 }">历史文化</c:when>
                      <c:when test="${n.type==4 }">科技</c:when>
                      <c:when test="${n.type==5 }">汽车</c:when>
                      <c:when test="${n.type==6 }">房产</c:when>
                      <c:when test="${n.type==7 }">体育</c:when>
                      <c:when test="${n.type==8 }">娱乐</c:when>
                      <c:when test="${n.type==9 }">健康</c:when>
                      </c:choose>
                </td>
                <td class="am-hide-sm-only"><fmt:formatDate value="${n.createTime }" pattern="yyyy-MM-dd"/></td>
                <td class="am-hide-sm-only">${n.click }</td>
                <td>
                	<div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">
                      <button class="am-btn am-btn-default am-btn-xs am-text-success am-round"
                      type="button" onclick="window.location.href='${pageContext.request.contextPath}/admin/selectNewsById?id=${n.id }'"
                      ><span class="am-icon-search" title="查看详情"></span> </button>
                      <button class="am-btn am-btn-default am-btn-xs am-text-secondary am-round" 
                      type="button" onclick="window.location.href='${pageContext.request.contextPath}/admin/updatePage?id=${n.id }'"
                      data-am-modal="{target: '#my-popups'}" title="修改"><span class="am-icon-pencil-square-o"></span></button>
                      <button  type="button"
                       onclick="javascript:if(confirm('确定要删除此信息吗？删除后将不可恢复')){location.href='${pageContext.request.contextPath}/admin/deleteNews?id=${n.id}'; return true;alert('删除成功！');}return false;"
                      class="am-btn am-btn-default am-btn-xs am-text-danger am-round" title="删除订单"><span class="am-icon-trash-o" ></span></button>
                    </div>
                  </div>
                </td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
          共 ${totalRow } 条记录
          <ul class="am-pagination am-fr">
                <c:choose>
				<c:when test="${pageNum <= 1}">
					<li class="am-disabled"><a href="${pageContext.request.contextPath }/admin/selectAllNews?pageNum=1">首页</a></li>
					<li class="am-disabled"><a href="${pageContext.request.contextPath }/admin/selectAllNews?pageNum=1">上一页</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${pageContext.request.contextPath }/admin/selectAllNews?pageNum=1">首页</a></li>
					<li><a href="${pageContext.request.contextPath }/admin/selectAllNews?pageNum=${pageNum-1}">上一页</a></li>
				</c:otherwise>
			</c:choose>
			<li class="am-active am-disabled"><a href="${pageContext.request.contextPath }/admin/selectAllNews?pageNum=${pageNum }">${pageNum }</a></li>
			<c:choose>
				<c:when test="${pageNum < lastPageNum}">
					<li><a href="${pageContext.request.contextPath }/admin/selectAllNews?pageNum=${pageNum + 1}">下一页</a></li>
					<li><a href="${pageContext.request.contextPath }/admin/selectAllNews?pageNum=${lastPageNum}">尾页</a></li>
				</c:when>
				<c:otherwise>
					<li class="am-disabled"><a href="${pageContext.request.contextPath }/admin/selectAllNews?pageNum=${lastPageNum}">下一页</a></li>
					<li class="am-disabled"><a href="${pageContext.request.contextPath }/admin/selectAllNews?pageNum=${lastPageNum}">尾页</a></li>
				</c:otherwise>
			</c:choose>
              </ul>
          
          
          
      
          <hr />
          <p></p>
        </form>
 
 
 
 
 <div class="foods">
  <ul>
    版权所有@2017.于冰融</a>
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