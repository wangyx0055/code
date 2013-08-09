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
	<title>大赛主题-中小企业公共服务平台</title>
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
				<li class="current"><a href="act/industrial/subject"><i></i><em>大赛主题</em></a></li>
				<li><a href="act/industrial/news"><i></i><em>参赛资讯</em></a></li>
				<li><a href="act/industrial/works"><i></i><em>往界作品欣赏</em></a></li>
				<li><a href="act/industrial/photo"><i></i><em>往界花絮</em></a></li>
				<li><a href="act/industrial/download"><i></i><em>相关下载</em></a></li>
			</ul>
			<div class="subject pull-left">
				<h2 class="subject-title-l1">大赛主题</h2>
				<div class="subject-content">
					<h1>设计创新 潮起东莞 ——创新、对接、产业化</h1>
					<p>&nbsp;</p>
					<h2 class="subject-title-l2-a">创新：</h2>
					<p>克服现有产品的问题与不足，满足人们对产品功能、美感的新需求，有效利用新技术、新材料、新能源、新工艺，提出全新的创意方案，设计开发理念新颖、构思巧妙、富有时代美感的新产品。</p>
					<p>&nbsp;</p>
					<h2 class="subject-title-l2-a">对接：</h2>
					<p>强调设计与制造对接，实现设计方案与企业生产的对接，设计人才与企业的对接，工业设计机构与企业的对接，推动产业发展，获得个人价值的体现。</p>
					<p>&nbsp;</p>
					<h2 class="subject-title-l2-a">产业化：</h2>
					<p>以企业为主体，以市场为导向，综合考虑产品生产的可行性、经济性、对环境的影响与可持续发展，利用东莞作为世界制造业基地的优势，实现创意设计方案向产业转化并走向市场，获得良好的经济效益与社会效益，争取设计者与企业的双赢。</p>
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