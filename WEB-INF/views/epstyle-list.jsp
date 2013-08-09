<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>进驻认证企业-中小企业公共服务平台</title>
<link href="resources/css/enterprise.css" rel="stylesheet"
	type="text/css">
<!--[if IE]>
<link href="resources/css/ie.css" rel="stylesheet" type="text/css">
<![endif]-->
</head>
<body>
	<jsp:include page="head.jsp" flush="true" />
	<div class="container">
		<ul class="breadcrumb">
			<li><a href="#">首页</a> <span class="divider">/</span></li>
			<li class="active"><c:choose>
						<c:when test="${enterprises[0].mchannel=='epshow'}">
	       				企业风采
	       				</c:when>
						<c:when test="${enterprises[0].mchannel=='hjbusiness'}">
	       				厚街商贸
	       				</c:when>
						<c:otherwise></c:otherwise>
				    </c:choose></li>
		</ul>
	</div>
	<div class="container">
		<div class="enterprise-wrap">
			<div class="recommend-enterprise">
				<h3 class="title">推荐企业</h3>
				<ul class="enterprise_list">
					<c:forEach var="enterprise" items="${enterprises}">
						<c:choose>
							<c:when test="${enterprise.position > 0}">  
				              	<li>
									<p>
										<a href=""><img width="172" height="95" src="upload/${enterprise.eplogo }/>"></a>
									</p>
									<h3>
										<a href="">${enterprise.epname}</a>
									</h3>
								</li>  
				          	</c:when>
			          	</c:choose>
			        </c:forEach>
				</ul>
			</div>
			<div class="all-enterprise">
				<div class="head">
					<h3 class="title pull-left">企业名录</h3>
					<div class="show-links pull-right">
						<a href="#" class="recent-join">最新加入</a><a href="#">最热人气</a>
					</div>
				</div>
				<div class="list">
					<%-- <c:forEach var="enterprise" items="${enterprises}">
						<div class="case">
							<div class="photo pull-left">
								<a href="enterpriseFeatures.action?eid=${enterprise.eid}" target="_blank"><img width="178" height="117" src="upload/${enterprise.eplogo }"></a>
							</div>
							<div class="text pull-left">
								<h3>
									<a href="enterpriseFeatures.action?eid=${enterprise.eid}" target="_blank">${enterprise.epname}</a>
								</h3>
								<p class="s1">
									<c:set var="epintro" value="${enterprise.epintro}"/>
									<c:choose>  
							          	<c:when test="${fn:length(epintro) > 100}">  
							              	<c:out value="${fn:substring(epintro, 0, 100)}......" />  
							          	</c:when>  
						         		<c:otherwise>  
							            	<c:out value="${epintro}" />  
							          	</c:otherwise>  
							      	</c:choose>
								</p>
							</div>
						</div>
			        </c:forEach> --%>
			        <c:forEach var="enterprise" items="${enterprises}">
			        	<div class="case">
			        		<div class="photo pull-left">
			        			<a href="enterprise/enterpriseFeatures?eid=${enterprise.eid}" target="_blank"><img width="178" height="117" src="upload/${enterprise.eplogo }"></a>
			        		</div>
			        		<div class="text pull-left">
			        			<h3>
									<a href="enterprise/enterpriseFeatures?eid=${enterprise.eid}" target="_blank">${enterprise.epname}</a>
								</h3>
								<p class="s1">
									<c:set var="epintro" value="${enterprise.epintro}"></c:set>
									<c:choose>
									<c:when test="${fn:length(epintro) > 100}">
										<c:out value="${fn:substring(epintro, 0, 100)}" escapeXml="false" />
									</c:when>
									<c:otherwise>
										<c:out value="${epintro}" escapeXml="false" />
									</c:otherwise>
									</c:choose>
								</p>
			        		</div>
			        	</div>
			        </c:forEach>
				</div>
				<!-- <div class="pagination pagination-centered">
					<form id="thisForm" name="thisForm" method="post" action="">
						<input type="hidden" name="cid" value="2">
						<div class="sabrosus">
							<span>
								<ul>
									<li class="active"><a href="javascript:GoPage(1)">1</a></li>
									<li><a href="javascript:GoPage(2)">2</a></li>
									<li class="disabled"><a href="javascript:GoPage(2)  ">»</a></li>
								</ul>
								<input type="hidden" name="ipage" id="ipage">
							</span>
						</div>
					</form>
				</div> -->
			</div>
		</div>
	</div>
	<div class="footer">
		<p class="p1">主办：厚街镇经济科技信息局 | 承办：东莞市力凯科技发展有限公司 |
			技术支持：深圳市依格欣计算机技术有限公司</p>
		<p class="p2">备案号：粤ICP备11040663号-1 |
			增值电信业务经营许可证：B2-20060558号(ICP加挂服务)</p>
		<p class="p2">©2012 东莞市力凯科技发展有限公司 版权所有</p>
	</div>
	<!-- /footer -->
	<script src="resources/lib/jquery-1.9.0.min.js"></script>
	<script src="resources/js/bootstrap-dropdown.js"></script>
</body>
</html>