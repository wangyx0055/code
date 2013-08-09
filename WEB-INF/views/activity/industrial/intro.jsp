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
	<title>活动介绍-中小企业公共服务平台</title>
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
				<li class="current"><a href="act/industrial/intro"><i></i><em>活动介绍</em></a></li>
				<li><a href="act/industrial/about"><i></i><em>关于大赛</em></a></li>
				<li><a href="act/industrial/subject"><i></i><em>大赛主题</em></a></li>
				<li><a href="act/industrial/news"><i></i><em>参赛资讯</em></a></li>
				<li><a href="act/industrial/works"><i></i><em>往界作品欣赏</em></a></li>
				<li><a href="act/industrial/photo"><i></i><em>往界花絮</em></a></li>
				<li><a href="act/industrial/download"><i></i><em>相关下载</em></a></li>
			</ul>
			<div class="intro pull-left">
				<h2 class="subject-title-l1 pull-left">活动介绍</h2>
				<div class="intro-content">
					<h3 class="subject-title-l2">概述</h3>
					<p>工业设计是创造和提升产品附加值，发展先进制造业，构建现代产业体系的重要途径。近年来东莞市委市政府号召要大力发展“自有技术、自有品牌”，大力扶植工业设计发展，积极推动产业结构调整与转型升级，促使东莞由过去的粗放、低端、低附加值、制造加工为主，转到做品牌、做整合、做高端市场，逐步推进产业链向微笑曲线两端延伸，即一端是研发设计，一端是品牌和营销。不少企业的成功转型证明：工业设计是企业发展不可忽视的手段，对加强产品创新性、提高市场竞争力及促进品牌价值升级起到重要作用。厚街是东莞市制造业较为发达的镇街之一，尤其是家具、机电制造业作为本镇的特色产业，以工业设计创新手段促使产业新一轮转型升级显得尤为重要。在此形势下，决定举办“工业设计走进厚街”专题宣讲活动。为使活动达到预期效果，制定以下策划方案：</p>
					<h3 class="subject-title-l2">目的意义</h3>
					<p>通过举办“工业设计走进厚街”专题宣讲活动，动员企业参加2013年东莞杯国际工业设计大赛，进一步唤起制造业企业增强设计创新意识及加大研发投入的决心，提升企业创新能力和产品竞争力，树立企业自有产品品牌形象，培育发展具有东莞特色的工业设计产业，促进工业设计与制造业的融合，促进设计产业化和产业设计化协调发展，推动产业转型升级。</p>
					<h3 class="subject-title-l2">活动名称</h3>
					<p>2013“工业设计走进厚街”专题宣讲活动</p>
					<h3 class="subject-title-l2">活动内容</h3>
					<ul class="intro-list">
						<li class="s1">2013东莞杯国际工业设计大赛厚街专场宣讲会</li>
						<li class="s2">企业转型升级与工业设计专题讲座</li>
						<li class="s3">中国●厚街中小微企业公共服务平台介绍</li>
					</ul>
					<h3 class="subject-title-l2">时间和地点</h3>
					<div class="nop">
					<p>时间：2013年8月28日 13:30-17:00</p>
					<p>地点：东莞市厚街镇人民政府二楼会议室</p>
					</div>
					<h3 class="subject-title-l2">举办单位</h3>
					<div class="nop">
					<p>主办单位：东莞市科学技术局</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;东莞市经济和信息化局</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;东莞市厚街镇人民政府</p>
					<p>承办单位: 厚街镇经济科技信息局</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;广东华南工业设计院</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;中国•厚街中小微企业公共服务平台。</p>
					<p>协办单位: 东莞市鞋机商会</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;东莞国际名家具设计研发院</p>
					</div>
					<h3 class="subject-title-l2">活动对象</h3>
					<div class="nop">
					<p>企业对象：家具、机电、制鞋等成品制造业企业</p>
					<p>嘉宾对象：企业董事、总经理、市场主管、技术主管、高级工程师、设计师等</p>
					</div>
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