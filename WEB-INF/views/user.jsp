<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<title>超级管理员中心</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<jsp:include page="top.jsp" flush="true" />
<link href="resources/css/ucenter.css" rel="stylesheet" type="text/css">
<script src="resources/js/ucenter.js"></script>
</head>
<body>
	<jsp:include page="head.jsp" flush="true" />

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
					<c:choose>
						<c:when test="upassid == 'admin'">
							<li class="hover"><a
								href="enterprise/getEnterpriseByEpdomian"
								data-toggle="ajax-tab" data-target="#enterpriseInfo"
								data-path="">企业资料</a></li>
							<li><a href="#" data-toggle="ajax-tab"
								data-target="#accountManager" data-path="">账号管理</a></li>
							<li><a href="#" data-toggle="ajax-tab"
								data-target="#serveManager" data-path="">服务管理</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="service/loadServe"
								data-toggle="ajax-tab" data-target="#messageManager"
								data-path="">消息管理</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<div class="ucenter-box">
				<div id="enterpriseInfo" class="ucenter-pane"></div>
				<div id="accountManager" class="ucenter-pane">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>AAA</th>
								<th>BBB</th>
								<th width="60">操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>aaa</td>
								<td>bbb</td>
								<td><a class="btn-primary" href="">修改</a></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="serveManager" class="ucenter-pane">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>S1</th>
								<th>S2</th>
								<th>S3</th>
								<th width="60">操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>111</td>
								<td>222</td>
								<td>333</td>
								<td><a class="btn-primary" href="">修改</a></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="messageManager" class="ucenter-pane"></div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="jsLib/bootstrap-master/js/bootstrap-tab.js"></script>
	<script src="jsLib/showLoading/js/jquery.showLoading.js"></script>
	<script src="jsLib/bootstrap-ajax-tabs-master/bootstrap-ajax-tabs.js"></script>
</body>
</html>
