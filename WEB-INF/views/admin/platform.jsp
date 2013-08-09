<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
	<base href="<%=basePath%>">
	<title>平台管理</title>
	
	<link href="jsLib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="jsLib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <link href="jsLib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript" src="jsLib/jquery/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="jsLib/ligerUI/js/core/base.js"></script>
	<script type="text/javascript" src="jsLib/ligerUI/js/plugins/ligerGrid.js"></script>
    <script type="text/javascript" src="jsLib/ligerUI/js/plugins/ligerToolBar.js"></script>
	<script type="text/javascript" src="resources/js/admin/hjform.js"></script>
	
</head>
<body>
	<div class="l-loading" style="display:block" id="pageloading"></div>
   	<div id="maingrid"></div>
</body>
</html>