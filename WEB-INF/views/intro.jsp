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
<title>服务申请-中小企业公共服务平台</title>
<link href="resources/css/patent.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="head.jsp" flush="true" />
	<div class="login-html hide">
		<form class="login-form">
			<div class="item">
				<div class="input-prepend">
					<span class="add-on">企业编码</span> <input class="input epid"
						name="epid" type="text"> <span class="epid-info"></span>
				</div>
			</div>
			<div class="item">
				<div class="input-prepend">
					<span class="add-on">通行证帐号</span> <input class="input upassid"
						id="upassid" name="upassid" type="text" required> <span
						class="upassid-info"></span>
				</div>
			</div>
			<div class="item">
				<div class="input-prepend">
					<span class="add-on">通行证密码</span> <input class="input upassword"
						id="upassword" name="upassword" type="password" required>
					<span class="upassword-info"></span>
				</div>
			</div>
			<div class="item">
				<input class="KEEP_LOGIN" type="checkbox" name="KEEP_LOGIN">
				<span class="remeber">记住账号</span><span class="FORGET_PASSWORD"><a
					href="#">忘记密码?</a> </span>
			</div>
		</form>
	</div>
	<div class="container">
		<ul class="breadcrumb">
			<li><a href="#">首页</a> <span class="divider">/</span></li>
			<li class="active">新闻资讯</li>
		</ul>
	</div>
	<!-- /container -->
	<div class="patent-box container">
		<div class="content pull-left">
			<h1 align="center">${module.mname }</h1>
			<p>${module.mdesc }</p>
			<p align="center">
				<a class="apply-btn" href="javascript:void(0)"
					data-url="public/moudleAuthor?mcode=${module.mcode }"><img
					src="resources/images/apply_btn.jpg"> </a> <a class="enter-btn"
					href="${module.mdirect}"
					data-url="public/moduleEnter?mcode=${module.mcode }"><img
					src="resources/images/apply_btn.jpg"> </a>
			</p>
		</div>
		<div class="sidebar pull-right">
			<h3 class="head">
				发明专利 <span class="num pull-right">12158人申请</span>
			</h3>
			<p>&nbsp;</p>
			<p align="center">
				<a href=""><img src="resources/images/apply_btn.jpg"> </a>
			</p>
			<p>&nbsp;</p>
			<p align="center">
				<a href=""><img src="resources/images/consult_btn.jpg"> </a>
			</p>
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
	<script src="jsLib/jquery/jquery-1.9.0.min.js"></script>
	<script src="jsLib/jquery/jquery.md5.js"></script>
	<script src="jsLib/bootstrap-master/js/bootstrap-button.js"></script>
	<script src="jsLib/artDialog-5.0.3/artDialog.min.js"></script>
	<script src="jsLib/artDialog-5.0.3/artDialog.plugins.min.js"></script>
	<script src="resources/js/apply.js"></script>
</body>
</html>