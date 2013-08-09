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
<title>服务大全-${cname }</title>
<link href="resources/css/service.css" rel="stylesheet" type="text/css">
<!--[if IE]>
<link href="resources/css/ie.css" rel="stylesheet" type="text/css">
<![endif]-->
</head>
<body>
	<jsp:include page="head.jsp" flush="true" />
	<div class="container">
		<ul class="breadcrumb">
			<li><a href="#">首页</a> <span class="divider">/</span></li>
			<li class="active">服务大全</li>
		</ul>
	</div>
	<!-- /container -->
	<div class="container">
		<div class="service-box">
			<div class="sidebar pull-left">
				<div class="user-pane">
					<div class="head">
						<div class="user-photo pull-left">
							<img src="../resources/images/photo_6.jpg" width="72" height="72">
						</div>
						<div class="user-info pull-right">
							<p>中国南方电网有限责 任公司</p>
							<br>
							<p>我的名称</p>
						</div>
					</div>
					<div class="body">
						<p>
							<span class="pull-left">通知：（0）</span> <span class="pull-right">新的邮件
								：（0）</span>
						</p>
						<p class="s1">已申请的服务: 发明专利 实用新型 专利 外观专利 PTC国际专利申 请 ..</p>
					</div>
				</div>
				<div class="column-bar" id="divTree">
					<%--
            <h3 class="head">全部服务分类</h3>
            <ul class="list">
               <li><a href="">政企服务</a></li>
               <li><a href="">信息化服务</a></li>
               <li><a href="">知识产权服务</a>
                   <ul>
                     <li><a href="">管理软件</a>
                        <div class="sub-column">
                          <dl>
                             <dt><a href="">软件工程</a></dt>
                             <dd><em><a href="">设备、工件参数化项目</a></em><em><a href="">有限元力学分析项目</a></em><em><a href="">流体力学分析项目</a></em><em><a href="">模流分析项目</a></em></dd>
                          </dl>
                          <dl>
                             <dt><a href="">检测检验工程</a></dt>
                             <dd><em><a href="">皮革制品真假识别观察</a></em><em><a href="">昆虫鼻子观察</a></em><em><a href="">线路板焊点BGA分析</a></em><em><a href="">CVT齿轮装配面</a></em><em><a href="">评估无铅汽车导航系统底板</a></em><em><a href="">螺栓的断裂面</a></em><em><a href="">观察安装粘合剂</a></em><em><a href="">导光板</a></em><em><a href="">ITO膜</a></em><em><a href="">测量玻璃瓶螺纹规</a></em><em><a href="">注射器针头</a></em><em><a href="">药丸</a></em><em><a href="">成型产品毛边的高度</a></em><em><a href="">印刷涂层表面</a></em><em><a href="">毛细管的顶端</a></em></dd>
                          </dl>
                          <dl>
                             <dt><a href="">其它</a></dt>
                             <dd><em><a href="">皮革制品真假识别观察</a></em><em><a href="">昆虫鼻子观察</a></em><em><a href="">线路板焊点BGA分析</a></em><em><a href="">CVT齿轮装配面</a></em><em><a href="">评估无铅汽车导航系统底板</a></em><em><a href="">螺栓的断裂面</a></em><em><a href="">观察安装粘合剂</a></em><em><a href="">导光板</a></em><em><a href="">ITO膜</a></em><em><a href="">测量玻璃瓶螺纹规</a></em><em><a href="">注射器针头</a></em><em><a href="">药丸</a></em><em><a href="">成型产品毛边的高度</a></em><em><a href="">印刷涂层表面</a></em><em><a href="">毛细管的顶端</a></em></dd>
                          </dl>
                        </div>
                     </li>
                     <li><a href="">定制软件</a></li>
                     <li><a href="">正版软件</a></li>
                   </ul>
               </li>
               <li><a href="">可共用设备项目</a></li>
               <li><a href="">技术创新与质检</a></li>
               <li><a href="">人才培训项目</a></li>
               <li><a href="">市场服务</a></li>
            </ul>
         --%>
				</div>
				<!-- /column-bar -->
				<div class="hot-service">
					<h3 class="head">热门服务</h3>
					<div class="hot-list">
						<div class="hot-pane">
							<div class="hot-thumb pull-left">
								<a href=""><img src="../resources/images/hat_icon.gif"></a>
							</div>
							<div class="hot-content pull-right">
								<h3>发明专利申请</h3>
								<p>12854人申请</p>
							</div>
						</div>
						<div class="hot-pane">
							<div class="hot-thumb pull-left">
								<a href=""><img src="../resources/images/hat_icon.gif"></a>
							</div>
							<div class="hot-content pull-right">
								<h3>用户体验设计</h3>
								<p>12854人申请</p>
							</div>
						</div>
						<div class="hot-pane">
							<div class="hot-thumb pull-left">
								<a href=""><img src="../resources/images/hat_icon.gif"></a>
							</div>
							<div class="hot-content pull-right">
								<h3>原创品牌设计开发</h3>
								<p>12854人申请</p>
							</div>
						</div>
						<div class="hot-pane">
							<div class="hot-thumb pull-left">
								<a href=""><img src="../resources/images/hat_icon.gif"></a>
							</div>
							<div class="hot-content pull-right">
								<h3>评估无铅汽车导航系统</h3>
								<p>12854人申请</p>
							</div>
						</div>
						<div class="hot-pane">
							<div class="hot-thumb pull-left">
								<a href=""><img src="../resources/images/hat_icon.gif"></a>
							</div>
							<div class="hot-content pull-right">
								<h3>发明专利申请</h3>
								<p>12854人申请</p>
							</div>
						</div>
					</div>
				</div>
				<!-- /hot-service -->
			</div>
			<div class="content pull-right">
				<div class="slide">
					<img src="../resources/images/slide.jpg">
				</div>
				<div class="server-list">
					<h3 class="title" id="serviceTitle"></h3>
					<div class="list" id="serviceDiv">
						<c:forEach items="#request.serviceList " var="service">
							<div class="mini-box">
								<div class="top">
									<a href=""><img width="198" height="131"
										src="upload/${service.sicon }"></a>
								</div>
								<div class="bottom">
									<h3>
										<span class="pull-left">${service.sname }</span><span
											class="num pull-right">${service.price }¥</span>
									</h3>
									<p class="btn" align="center">
										<a href=""><img src="resources/images/apply2_btn.jpg"></a>
									</p>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<br>
				<%-- <div class="pagination pagination-centered">
					<form id="thisForm" name="thisForm" method="post" action="">
						<input type="hidden" name="cid" value="${cno }" />						
						<div class="sabrosus">
						<span>${pageStr}</span>
						</div>
					</form>
				
				</div>      --%>
			</div>
		</div>
	</div>
	<!-- /container -->
	<div class="footer">
		<p class="p1">主办 ：厚街镇经济科技信息局 | 承办：东莞市力凯科技发展有限公司 |
			技术支持：深圳市依格欣计算机技术有限公司</p>
		<p class="p2">备案号：粤ICP备11040663号-1 |
			增值电信业务经营许可证：B2-20060558号(ICP加挂服务)</p>
		<p class="p2">&copy;2012 东莞市力凯科技发展有限公司 版权所有</p>
	</div>
	<script src="jsLib/jquery/jquery-1.9.0.min.js"></script>
	<script src="resources/js/service.js"></script>
</body>
</html>