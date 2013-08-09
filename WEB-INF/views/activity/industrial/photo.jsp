<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv=X-UA-Compatible content=IE=EmulateIE7>
	<base href="<%=basePath%>">
	<title>往界花絮-中小企业公共服务平台</title>
	<link href="resources/industrial/css/industrial_design.css" rel="stylesheet" type="text/css" />
	<!--[if IE]>
	<link href="resources/css/ie.css" rel="stylesheet" type="text/css">
	<![endif]-->
</head>
<body>
	<jsp:include page="../../head.jsp" flush="true"/>
	<div class="id-container">
		<div class="ic-content">
			<ul class="sidebar pull-left">
				<li><a href="act/industrial/intro"><i></i><em>活动介绍</em></a></li>
				<li><a href="act/industrial/about"><i></i><em>关于大赛</em></a></li>
				<li><a href="act/industrial/subject"><i></i><em>大赛主题</em></a></li>
				<li><a href="act/industrial/news"><i></i><em>参赛资讯</em></a></li>
				<li><a href="act/industrial/works"><i></i><em>往界作品欣赏</em></a></li>
				<li class="current"><a href="act/industrial/photo"><i></i><em>往界花絮</em></a></li>
				<li><a href="act/industrial/download"><i></i><em>相关下载</em></a></li>
			</ul>
			<div class="photo pull-left">
				<h2 class="subject-title-l1">往界花絮</h2>
				<div class="photo-content">
					<ul class="photo-gallery">
						<li><img src="resources/industrial/images/photo_1.jpg" width="250" height="179" /></li>
						<li><img src="resources/industrial/images/photo_2.jpg" width="250" height="179" /></li>
						<li><img src="resources/industrial/images/photo_3.jpg" width="250" height="179" /></li>
						<li><img src="resources/industrial/images/photo_4.jpg" width="250" height="179" /></li>
						<li><img src="resources/industrial/images/photo_5.jpg" width="250" height="179" /></li>
						<li><img src="resources/industrial/images/photo_6.jpg" width="250" height="179" /></li>
						<li><img src="resources/industrial/images/photo_7.jpg" width="250" height="179" /></li>
						<li><img src="resources/industrial/images/photo_8.jpg" width="250" height="179" /></li>
						<li><img src="resources/industrial/images/photo_9.jpg" width="250" height="179" /></li>
						<li><img src="resources/industrial/images/photo_10.jpg" width="250" height="179" /></li>
						<li><img src="resources/industrial/images/photo_11.jpg" width="250" height="179" /></li>
						<li><img src="resources/industrial/images/photo_12.jpg" width="250" height="179" /></li>
						<li><img src="resources/industrial/images/photo_13.jpg" width="250" height="179" /></li>
						<li><img src="resources/industrial/images/photo_14.jpg" width="250" height="179" /></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- /ic-content -->
	</div>
	<jsp:include page="../../footer.jsp"></jsp:include>
	
	<script src="jsLib/bootstrap-master/js/bootstrap-dropdown.js"></script>
	<script src="jsLib/bootstrap-master/js/bootstrap-button.js"></script>
	<script src="jsLib/showLoading/js/jquery.showLoading.js"></script>
	<script type="text/javascript" src="resources/js/ajax-tab.js"></script>
	<script type="text/javascript" src="resources/js/index.js"></script>
	<script type="text/javascript" src="resources/industrial/js/industrial.js"></script>
</body>
</html>