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
	<title>关于大赛-中小企业公共服务平台</title>
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
				<li class="current"><a href="act/industrial/about"><i></i><em>关于大赛</em></a></li>
				<li><a href="act/industrial/subject"><i></i><em>大赛主题</em></a></li>
				<li><a href="act/industrial/news"><i></i><em>参赛资讯</em></a></li>
				<li><a href="act/industrial/works"><i></i><em>往界作品欣赏</em></a></li>
				<li><a href="act/industrial/photo"><i></i><em>往界花絮</em></a></li>
				<li><a href="act/industrial/download"><i></i><em>相关下载</em></a></li>
			</ul>
			<div class="about pull-left">
				<h2 class="subject-title-l1">关于大赛</h2>
				<div class="about-content">
					<p style="padding:0;">东莞杯国际工业设计大赛从2005年起每年定期在制造业名城广东省东莞市举办，是国内工业设计领域知名度最高、影响力最大、成效最显著的大型工业设计竞赛活动之一。该项赛事由广东省东莞市人民政府和中国工业设计协会联合主办，东莞市科学技术局、东莞市经济和信息化局、东莞市知识产权局、广东工业大学和广东华南工业设计院具体承办，以原广东省佟星副省长专门为“东莞杯”题的“设计创新 潮起东莞”为主题，关注创新，以人为本，广泛集聚优质设计资源，促进本地企业自主创新，推动区域产业转型升级。</p>
					<p>“东莞杯”分公开组和企业组两大参赛类别，主要面向国内外设计机构设计师、大专院校设计专业师生和东莞市企业开展工业设计作品征集、评审工作，以及举办优秀工业设计作品展示、产业化推介和高级工业设计研修班、工业设计高峰论坛等系列配套活动。举办八年来，“东莞杯”共征集到来自国内外各类工业设计作品20000余件，参赛设计院校、设计机构1000余所，参加大赛系列活动的企业代表、各界人士22余万人次，大赛奖金累计发放近800万元。大赛的成功举办，不仅对于培养高校学生及设计师的创新设计能力、综合设计能力和工程实践能力，提高工业设计的教育教学及应用水平，而且对于加强东莞市与国内外工业设计交流合作，吸引优秀的设计师参与和加盟东莞的设计创新事业，提升东莞市企业的整体创新能力和产品竞争力、提高东莞市工业设计水平和设计成果产业化能力等，都产生了重要的推动作用。</p>
					<p>2013年，第九届东莞杯国际工业设计大赛将延续“创新、对接、产业化”的竞赛主题，设置了100万元总奖金奖励大赛创新成果，并将通过举办系列配套活动促使创新成果实现产业化，争取设计人与企业的双赢。在此，我们期盼有更多的设计机构、设计院校、东莞企业参与进来，共同为推动我国工业设计事业发展作出贡献。</p>
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