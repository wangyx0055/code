<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
</head>
<body>
	<div class="enterprise-window">
		<div class="top">
			<div class="photo-show pull-left">
				<img src="upload/${product.picture_b }" width="640">
			</div>
			<div class="enterprise-product-intro pull-right">
				<p class="pro-1">产品名称：</p>
				<h3>${product.pname }</h3>
				<p class="pro-1">产品介绍：</p>
				<p>${product.pintro }</p>
			</div>
		</div>
	</div>
</body>
</html>