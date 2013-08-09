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
<title>中小企业公共服务平台--会员注册</title>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<link href="resources/css/reg.css" rel="stylesheet" type="text/css">
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
				<li><a href="">登录</a></li>
				<li><a href="">注册</a></li>
				<li><a href="">在线客服</a></li>
				<li><a href="">网站导航</a></li>
			</ul>
		</div>
	</div>
	<!-- /header -->
	<div class="container">
		<div class="main">
			<h2 class="top-title">
				企业通行证注册<i>欢迎来到东莞中小企业公共服务平台，只需简单几步，即可完成注册流程。</i>
			</h2>
			<ul class="crumb-nav">
				<li class="s1">1 填写账号信息<span class="ok-icon"></span></li>
				<li class="s1">2 验证账号信息<span class="ok-icon"></span></li>
				<li class="s3">3 注册成功</li>
			</ul>
			<div class="register-success">
				<div class="success-icon pull-left"></div>
				<div class="success-content pull-left">
					<p>
						<span class="color-orange">注册完成！</span> 您的企业：<span
							class="color-blue">${enterprise.epname }</span> ，已成为本站注册会员！
					</p>
					<p>由于认证资质需要审核，因此您的账号需要审核后才能使用全部功能！</p>
					<p>
						<span class="color-red">10</span> 秒钟后会自动转到用户中心！
					</p>
					<p>
						<a href="" class="color-blue">马上进入用户中心</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="" class="color-blue">返回网站首页</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<!-- /container -->
	<div class="footer">
		<p class="p1">主办：厚街镇经济科技信息局 | 承办：东莞市力凯科技发展有限公司 |
			技术支持：深圳市依格欣计算机技术有限公司</p>
		<p class="p2">备案号：粤ICP备11040663号-1 |
			增值电信业务经营许可证：B2-20060558号(ICP加挂服务)</p>
		<p class="p2">&copy;2012 东莞市力凯科技发展有限公司 版权所有</p>
	</div>
	<script src="../jsLib/jquery/jquery-1.9.0.min.js"></script>
</body>
</html>