<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="<%=basePath%>">
<title>中小企业公共服务平台_后台管理系统</title>
	<link href="jsLib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="jsLib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />
	<link href="jsLib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css"/>
	<style type="text/css"> 
	    body,html{height:100%;}
	    body{ padding:0px; margin:0;   overflow:hidden;}  
	    .l-link{ display:block; height:26px; line-height:26px; padding-left:10px; text-decoration:underline; color:#333;}
	    .l-link2{text-decoration:underline; color:white; margin-left:2px;margin-right:2px;}
	    .l-layout-top{background:#102A49; color:White;}
	    .l-layout-bottom{ background:#E5EDEF; text-align:center;}
	    #pageloading{position:absolute; left:0px; top:0px; background:white url('jsLib/ligerUI/images/loading.gif') no-repeat center; width:100%; height:100%;z-index:99999;}
	    .l-link{ display:block; line-height:22px; height:22px; padding-left:16px;border:1px solid white; margin:4px;}
	    .l-link-over{ background:#FFEEAC; border:1px solid #DB9F00;} 
	    .l-winbar{ background:#2B5A76; height:30px; position:absolute; left:0px; bottom:0px; width:100%; z-index:99999;}
	    .space{ color:#E7E7E7;}
	    /* 顶部 */ 
	    .l-topmenu{ margin:0; padding:0; height:31px; line-height:31px; background:url('jsLib/ligerUI/images/top.jpg') repeat-x bottom;  position:relative; border-top:1px solid #1D438B;  }
	    .l-topmenu-logo{ color:#E7E7E7; padding-left:35px; line-height:26px;background:url('jsLib/ligerUI/images/topicon.gif') no-repeat 10px 5px;}
	    .l-topmenu-welcome{  position:absolute; height:24px; line-height:24px;  right:30px; top:2px;color:#CCCCCC;}
	    .l-topmenu-welcome a{ color:#CCCCCC; text-decoration:underline} 
 	</style>
 	
</head>
<body style="padding:0px;background:#EAEEF5;">
	<div id="pageloading"></div>
	<div id="topmenu" class="l-topmenu">
		<div class="l-topmenu-logo">云平台管理系统</div>
		<div class="l-topmenu-welcome"></div>
	</div>
	<div id="layout1"
		style="width: 99.2%; margin: 0 auto; margin-top: 4px;">
		<div position="left" title="主要菜单" id="accordion1">
			<div title="平台管理" class="l-scroll">
				<ul id="manage" style="margin-top: 3px;">
			</div>
			<div title="平台服务">
				<ul id="pservice" style="margin-top: 3px;">
			</div>
			<div title="办公自动化">
				<ul id="oa" style="margin-top: 3px;">
			</div>
			<div title="企E通">
				<ul id="erp" style="margin-top: 3px;">
			</div>
			<div title="系统管理" class="l-scroll">
				<ul id="system" style="margin-top: 3px;">
			</div>
		</div>
		<div position="center" id="framecenter">
			<div tabid="home" title="我的主页" style="height: 300px">
				<iframe frameborder="0" name="home" id="home" src="admin/welcome"></iframe>
			</div>
		</div>

	</div>
	<div style="height: 32px; line-height: 32px; text-align: center;">
		Copyright © 2011-2013 依格欣
		<c:forEach var="user" items="${userlist }">
			${user.uname },
		</c:forEach>
	</div>
	<div style="display: none"></div>
	<script src="jsLib/ligerUI/jquery/jquery-1.3.2.min.js"></script>
	<script src="jsLib/ligerUI/js/ligerui.min.js"></script>
	<script src="jsLib/showLoading/js/jquery.showLoading.js"></script>
	<script src="jsLib/jquery/jquery.cookie.js"></script>
	<script src="jsLib/jquery/jquery.md5.js"></script>
	<script src="jsLib/jquery/plugins/jrumble/jquery.jrumble.1.3.js"></script>
	<script src="jsLib/artDialog-5.0.3/artDialog.min.js"></script>
    <script src="resources/js/manage.js" type="text/javascript"></script> 
</body>
</html>