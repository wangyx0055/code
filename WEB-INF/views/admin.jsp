<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>用户中心--${passport.uname }</title>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<link href="resources/css/ucenter.css" rel="stylesheet" type="text/css">
<link href="jsLib/easyui/themes/default/easyui.css" rel="stylesheet" type="text/css">
<link href="jsLib/easyui/themes/icon.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="header">
  <div class="container">
     <div class="logo pull-left"><a href=""><img src="resources/images/logo.png"></a></div>
     <div class="search-box pull-left">
       <input class="input" type="text">
       <button class="btn" type="button"></button>
     </div>
     <ul class="top-navs pull-right">
        <li>${passport.upassid }</li>
        <li><a href="">在线客服</a></li>
        <li><a href="">网站导航</a></li>
     </ul>
  </div>
</div>
<!-- /header -->
<div class="container">
<ul class="breadcrumb">
      <li><a href="#">首页</a><span class="divider">/</span></li>
	  <li class="active">用户中心</li>
</div>
<!-- /container -->
<div class="container">
<div class="main">
   <h1 class="ucenter-title">用户中心</h1>
   <div class="ucenter-menu">
      <ul>
       	<li class="hover"><a href="public/ucenter">用户首页</a></li>
       	<li><a href="public/ucenter_info">企业资料</a></li>
       	<li><a href="public/account_manage">企业子账号</a></li>
       	<li><a href="page/ucenter/message_manage.html">通知</a></li>
       	<li><a href="page/ucenter/email_manage.html">邮件</a></li>
      </ul>
   </div>
   <div class="ucenter-box">
<div class="user-home-top">
   <div class="user-home-photo pull-left">
      <img src="resources/images/nopic.jpg" width="152" height="140" alt="用户头像">
   </div>
   <div class="user-home-info pull-left">
      <h3 class="bsp"><span class="uname">${passport.uname }</span>[ ${passport.epname } ]</h3>
      <div class="new-count bsp">新通知(<span class="color-red">12</span>)  新邮件(<span class="color-red">10</span>)</div>
      <div class="pf-do pull-left"><a class="btn-edit" href="">编辑资料</a><a href="">详细资料</a></div>
   </div>
</div>
<div class="home-col-wrap">
   <div class="home-col pull-left">
     <div class="head"><strong>新闻动态</strong><a href="ajaxPage/platform_service.html" class="more pull-right">更多</a></div>
     <div class="body">
       <ul class="home-message-list">
         <c:forEach items="${newsList}" var="s">    
          <li><a href="news/newsArticle?cid=${s.cid }&id=${s.id}"  target="_blank">${s.title}</a><span class="date pull-right">${s.pubdate}</span></li>
        </c:forEach>
     </ul>
     </div>
   </div>
   <div class="home-col pull-right">
     <div class="head"><strong>企业子账号</strong><a href="#" class="more pull-right">更多</a></div>
     <div class="body">
        <table class="enterprise-child table table-bordered">
         <c:forEach items="${passportList}" var="s1">
           <tr>
              <td width="30">${ID.index+1}</td>
              <td width="320">${s1.upassid}</td>
              <td>${s1.uname}</td>
           </tr>
         </c:forEach>
        </table>
     </div>
   </div>
</div>
<!-- /home-col-wrap -->
<div class="home-col-wrap home-col-border">
<div class="head"><strong>我申请的服务</strong><a href="ajaxPage/platform_service.html" class="more pull-right">更多</a></div>
<div class="body">
    <table class="enterprise-myservice table table-bordered">
         <tr><th>ID</th><th>申请时间</th><th>服务名称</th><th>状态</th></tr>
         <c:forEach items="${esApplyList}" var="s2" varStatus="good">
           <tr>
              <td width="30">${good.count}</td>
              <td width="320"><a href="service/serviceIntro?sid=${s2.sid}" target="_blank">${s2.sname}</a></td>
              <td width="320">${s2.applyDate}</td>
              <td>${s2.applyStatus}</td>
           </tr>
         </c:forEach>
        </table>
</div>
</div>
<!-- /home-col-wrap -->
<div class="home-col-wrap home-col-border">
<div class="head"><strong>平台服务</strong><a href="ajaxPage/platform_service.html" class="more pull-right">更多</a></div>
<div class="body">
  <ul class="home-service-list">
    <c:forEach items="${serviceList}" var="s3">
     <li>
     <div class="photo"><a href="service/serviceIntro?sid=${s3.sid }"><img src="upload/${s3.sicon}" width="71" height="71" alt="图片"></a></div>
     <div class="title"><a href="service/serviceIntro?sid=${s3.sid }">${s3.sname}</a></div>
     </li>        
    </c:forEach>
  </ul>
</div>
</div>
   </div>
</div>
</div>
<!-- /container -->
<div class="footer">
<p class="p1">主办：厚街镇经济科技信息局 | 承办：东莞市力凯科技发展有限公司 | 技术支持：深圳市依格欣计算机技术有限公司</p>
<p class="p2">备案号：粤ICP备11040663号-1 | 增值电信业务经营许可证：B2-20060558号(ICP加挂服务)</p>
<p class="p2">&copy;2012 东莞市力凯科技发展有限公司 版权所有</p>
</div>
</body>
</html>