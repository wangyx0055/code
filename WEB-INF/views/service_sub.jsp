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
<title>服务大全-${cname}</title>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<link href="resources/css/service.css" rel="stylesheet" type="text/css">
<!--[if IE]>
<link href="resources/css/ie.css" rel="stylesheet" type="text/css">
<![endif]-->
</head>
<body>

	<input type="hidden" value="${treeCid }" id="tree_cid" />
	<input type="hidden" value="${treeName }" id="tree_cname" />
	<jsp:include page="head.jsp" flush="true" />
	<!-- /header -->
	<div class="container">
		<ul class="breadcrumb">
			<li><a href="#">首页</a> <span class="divider">/</span></li>
			<li class="active">${cname }</li>
		</ul>
	</div>
	<!-- /container -->
	<div class="container">
		<div class="service-box">
			<div class="sidebar pull-left">
				<div class="sub-column-bar" id="divTree">
					<%--<h3 class="head">全部服务分类</h3>
            <ul class="list">
               <li class="level-1"><a href="">政企服务</a></li>
               <li class="level-1"><a href="">信息化服务</a></li>
               <li class="level-1"><a class="collapsed" href="javascript:void(0)">知识产权服务<i class="switch"></i></a>
                   <ul>
                     <li class="level-2"><a class="collapsed" href="javascript:void(0)">管理软件<i class="switch"></i></a>
                         <ul>
                         <li class="level-3"><a href="">管理软件</a> </li>
                         <li class="level-3"><a href="">定制软件</a></li>
                         <li class="level-3"><a href="">正版软件</a></li>
                         </ul>
                     </li>
                     <li class="level-2"><a href="">定制软件</a></li>
                     <li class="level-2"><a href="">正版软件</a></li>
                   </ul>
               </li>
               <li class="level-1"><a href="">可共用设备项目</a></li>
               <li class="level-1"><a href="">技术创新与质检</a></li>
               <li class="level-1"><a href="">人才培训项目</a></li>
               <li class="level-1"><a href="">市场服务</a></li>
            </ul>
         --%>
				</div>
				<!-- /column-bar -->
			</div>
			<div class="content pull-right" id="serviceDiv">
				<div class="service-list">
					<h3 class="title">${cname }</h3>
					<div class="list">
						<c:forEach items="${serviceList}" var="item">
							<div class="mini-box">
								<div class="top">
									<a href="service/serviceIntro?sid=${item.sid}"><img
										width="198" height="131" src="upload/${item.sicon}"
										alt=""></a>
								</div>
								<div class="bottom">
									<h3>
										<span class="name pull-left">${item.sname}</span>
										<span class="num pull-right">¥${item.sprice}</span>
									</h3>
									<p class="btn" align="center">
										<a class="apply-btn" href="javascript:void(0);"
											data-sid="${item.sid } "
											data-sname="${item.sname}"
											data-sprice="${item.sprice}"><img
											src="resources/images/apply2_btn.jpg" alt=""> </a>
									</p>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<br></br>
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
	<script src="resources/js/service.js" type="text/javascript"></script>
</body>
</html>