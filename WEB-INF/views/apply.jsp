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
<meta charset="UTF-8">
<base href="<%=basePath%>">
<title>服务申请-中小企业公共服务平台</title>
<link href="resources/css/patent.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="head.jsp" flush="true"/>
	<div class="container">
		<ul class="breadcrumb">
			<li><a href="#">首页</a> <span class="divider">/</span>
			</li>
			<li class="active">服务申请</li>
	</div>
	<!-- /container -->
	<div class="patent-box container">
		<div class="content pull-left">
			<h1 class="service-name" align="center">${service.sname}</h1>
			<div class="sintro"><c:out value="${service.sintro}" default="暂无介绍!" escapeXml="false"/></div>
			<p align="center">
				<a class="apply-btn" href="javascript:void(0)" data-sid=${service.sid } data-sname=${service.sname } data-sprice=${service.sprice }>
					<img src="resources/images/apply_btn.jpg">
				</a> 
				<a class="enter-btn hide" href="${service.sindex}">
					<img src="resources/images/enter_btn.jpg">
				</a>
			</p>
		</div>
		<div class="sidebar pull-right">
			<h3 class="head">
				${service.sname}<span class="num pull-right">? 申请</span>
			</h3>
			<p>&nbsp;</p>
			<!-- <p align="center">
				<a href=""><img src="resources/images/apply_btn.jpg">
				</a>
			</p> -->
			<%--<p>&nbsp;</p>
			<p align="center">
				<a href=""><img src="resources/images/consult_btn.jpg">
				</a>
			</p>
		--%></div>
	</div>
	<!-- /container -->
	<div class="footer">
		<p class="p1">主办：厚街镇经济科技信息局 | 承办：东莞市力凯科技发展有限公司 |
			技术支持：深圳市依格欣计算机技术有限公司</p>
		<p class="p2">备案号：粤ICP备11040663号-1 |
			增值电信业务经营许可证：B2-20060558号(ICP加挂服务)</p>
		<p class="p2">&copy;2012 东莞市力凯科技发展有限公司 版权所有</p>
	</div>
	<script type="text/javascript">
		serviceApply();
	</script>
</body>
</html>