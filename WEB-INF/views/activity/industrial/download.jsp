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
	<title>相关下载-中小企业公共服务平台</title>
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
				<li><a href="act/industrial/photo"><i></i><em>往界花絮</em></a></li>
				<li class="current"><a href="act/industrial/download"><i></i><em>相关下载</em></a></li>
			</ul>
			<div class="download pull-left">
				<h2 class="subject-title-l1">相关下载</h2>
				<div class="download-content">
					<ul class="download-source">
						<li>
							<p><a id="cmd" href="resources/industrial/doc/1.doc"><img src="resources/industrial/images/download_btn_1.jpg" /></a></p>
							<p>“2013工业设计走进厚街”专题宣讲活动邀请函公文.doc</p>
						</li>
						<li>
							<p><a href="resources/industrial/doc/2.doc"><img src="resources/industrial/images/download_btn_2.jpg" /></a></p>
							<p>“2013工业设计走进厚街”宣讲活动邀请函.doc</p>
						</li>
						<li>
							<p><a href="resources/industrial/doc/3.doc"><img src="resources/industrial/images/download_btn_3.jpg" /></a></p>
							<p>“2013东莞杯国际工业设计大赛”投稿说明.doc</p>
						</li>
						<li>
							<p><a href="resources/industrial/doc/4.doc"><img src="resources/industrial/images/download_btn_4.jpg" /></a></p>
							<p>“2013东莞杯国际工业设计大赛”报名表.doc</p>
						</li>
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