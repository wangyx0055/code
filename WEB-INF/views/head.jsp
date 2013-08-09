<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
	<meta charset="UTF-8">
	<meta http-equiv=X-UA-Compatible content=IE=EmulateIE7>
	<link href="jsLib/artDialog-5.0.3/skins/default.css" rel="stylesheet" type="text/css" />
	<link href="jsLib/artDialog-5.0.3/skins/login.css" rel="stylesheet" type="text/css" />
	<link href="resources/css/style.css" rel="stylesheet" type="text/css">
	<link href="resources/css/home.css" rel="stylesheet" type="text/css">
	<script src="jsLib/jquery/jquery-1.9.1.min.js"></script>
	<script src="jsLib/jquery/jquery.cookie.js"></script>
	<script src="jsLib/jquery/jquery.md5.js"></script>
	<script src="jsLib/artDialog-5.0.3/artDialog.min.js"></script>
	<script src="jsLib/artDialog-5.0.3/artDialog.plugins.min.js"></script>
	<script src="resources/js/head.js"></script>
</head>

<div class="header">
	<div class="container">
		<div class="logo pull-left">
			<a href="./"><img src="resources/images/logo.png"> </a>
		</div>
		<div class="search-box pull-left">
			<form name="searchForm">
				<input class="input" type="text" id="keyword" name="keyword">
				<button type="button" class="btn" id="searchButIndex"></button>
			</form>
		</div>
		<ul class="top-navs pull-right">
		<c:choose>
			<c:when test="${empty passport}">
				<li class="login-reg">
					[ <a class="login-btn" href="javascript:void(0);">登录</a> | 
					<a class="reg-btn" href="register" target="_blank">注册</a> ]
				</li>
				<li class="user-menu hide">
					<a href="public/ucenter" target="_blank" class="uname" data-upassid="">未登录! </a>
					[ <a class="logout-btn" href="javascript:void(0);">退出 </a> ]
				</li>
			</c:when>
			<c:otherwise>
				<li class="login-reg hide">
					[ <a class="login-btn" href="javascript:void(0);">登录</a> | 
					<a class="reg-btn" href="register" target="_blank">注册</a> ]
				</li>
				<li class="user-menu">
					<a href="public/ucenter" target="_blank" class="uname" data-upassid="${passport.upassid}">
						${passport.uname}
					</a>
					[ <a class="logout-btn" href="javascript:void(0);">退出 </a> ]
				</li>
			</c:otherwise>
		</c:choose>
<!-- 			<li><a class="online-service" href="onlineservice.action" target="_blank">在线客服</a></li> -->
<!-- 			<li><a href="/jsLib/olcall/mc2.html" target="_blank">在线客服</a></li> -->
			<li><a href="olcall" target="_blank">在线客服</a></li>
			<li><a class="site-nav" href="javascript:void(0);">网站导航</a></li>
		</ul>
	</div>
</div>
<div class="login-html hide">
	<form class="login-form">
	<table width="300">
       	<div class="control-group">
         	<div class="input-prepend"> 
          		<span class="add-on">帐  号</span>
            	<input class="input upassid" id="upassid" name="upassid" type="text" required>
          	</div>
           	<span class="help-inline upassid-info" data-label="账号"></span>
       	</div>
       	<div class="control-group">
          	<div class="input-prepend"> 
          		<span class="add-on">密  码</span>
	            <input class="input upassword" id="upassword" name="upassword" type="password" required>
          	</div>
            <span class="help-inline upassword-info" data-label="密码"></span>
       	</div>
       	<div class="control-group">
          	<div class="input-prepend"> 
          		<span class="add-on">验证码</span>
	            <input style="width:62px;border-radius:0;border-right:none;" class="authcode" id="authcode" name="authcode" type="text" required>
          		<span class="add-on" style="border-radius:0 4px 4px 0"><img alt="点击刷新" src="public/authcode" onclick="this.src='public/authcode?'+new Date();" width="60" height="20" /></span>
          	</div>
            <span class="help-inline authcode-info" data-label="验证码"></span>
       	</div>
       	<div class="control-group">
       		<span class="add-on"><input class="keeplogin" type="checkbox" name="KEEP_LOGIN"></span>
       		<span class="remeber">保持登录</span><span class="FORGET_PASSWORD"><a href="#">忘记密码?</a></span>
       	</div>
    </table>
  	</form>
</div>

<!-- 申请窗口 -->	
<div class="apply-html hide">
	<form class="apply-form">
	   <table width="100%" class="apply-data">
	   		<input class="apply-sid" name="sid" type="hidden">
	      <tr><td class="s1">服务名称：</td><td class="sname"></td></tr>
	      <tr><td class="s1">价格：</td><td class="sprice"></td></tr>
	      <tr><td class="s1">联系人姓名：</td><td><input class="link-name" name="linker" type="text"><span class="help-inline apply-name-info" data-label="联系人"></span></td></tr>
	      <tr><td class="s1">联系电话：</td><td><input class="link-tel" name="linkTel" type="text"><span class="help-inline apply-tel-info" data-label="联系电话"></span></td></tr>
	      <tr><td class="s1">邮箱：</td><td><input class="link-mail" name="linkMail" type="text"><span class="help-inline apply-email-info" data-label="联系邮箱"></span></td></tr>
	      <tr><td colspan="2">请您如实填写以上信息，服务申请成功后我们将与您联系具体事宜</td></tr>
	   </table>
  	</form>
</div>