<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<title>企业注册-中小企业公共服务平台</title>
<link href="../resources/css/style.css" rel="stylesheet" type="text/css">
<link href="../resources/css/404.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="header">
		<div class="container">
			<div class="logo pull-left">
				<a href=""><img src="../resources/images/logo.png"></a>
			</div>
			<div class="search-box pull-left">
				<input class="input" type="text">
				<button class="btn" type="button"></button>
			</div>
			<ul class="top-navs pull-right">
				<li><a href="">在线客服</a></li>
				<li><a href="">网站导航</a></li>
			</ul>
		</div>
	</div>
	<!-- /header -->
	<div class="wrap">
		<div class="container">
			<div class="message">
				<div class="sad"></div>
				<h1 class="notice">${message }</h1>
				<p class="notice">中国 厚街中小微企业公共服务平台</p>
				<p class="goback">
					<a href="javascript:history.go(-1);"><img
						src="../resources/images/back_btn.png" /></a>
				</p>
			</div>
		</div>
		<!-- /container -->
	</div>
	<!-- /wrap -->
	<div class="footer">
		<p class="p1">主办：厚街镇经济科技信息局 | 承办：东莞市力凯科技发展有限公司 |
			技术支持：深圳市依格欣计算机技术有限公司</p>
		<p class="p2">备案号：粤ICP备11040663号-1 |
			增值电信业务经营许可证：B2-20060558号(ICP加挂服务)</p>
		<p class="p2">&copy;2012 东莞市力凯科技发展有限公司 版权所有</p>
	</div>
</body>
</html>
