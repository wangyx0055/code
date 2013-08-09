<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>${enterprise.name}</title>
	<link href="resources/css/style.css" rel="stylesheet" type="text/css">
	<link href="resources/css/enterprise.css" rel="stylesheet" type="text/css">
	<link href="jsLib/jquery.fancybox/jquery.fancybox.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="head.jsp" flush="true"/>
	<!-- /header -->
	<div class="container">
		<ul class="breadcrumb">
      		<li><a href="#">首页</a> <span class="divider">/</span></li>
	  		<li class="active">制造</li>
	  	</ul>
	</div>
	<!-- /container -->
	<div class="container">
	   <div class="enterprise-wrap">
	      <div class="intro-enterprise">
	         <h3 class="title">制造简介</h3>
	         <div class="intro-wrap">
	            <div class="top">
	                <div class="picture pull-left"><a href=""><img width="272" height="180" src="upload/${enterprise.eplogo }"/></a></div>
	                <div class="text pull-left">
	                  <h3>${enterprise.name}</h3>
	                  <p>名称：${enterprise.name}</p>
	                  <p>简介：${enterprise.intro}</p>
<!-- 	                  <p>经营模式：<s:property value="#request.enterprise.epmodel"/></p> -->
<!-- 	                  <p>成立时间：<s:property value="#request.enterprise.foundtime"/></p> -->
<!-- 	                  <p>员工人数：<s:property value="#request.enterprise.menbers"/></p> -->
<!-- 	                  <p>年营业额：<s:property value="#request.enterprise.turnover"/></p> -->
<!-- 	                  <p>主营产品或服务：<s:property value="#request.enterprise.products"/></p> -->
	                </div>
	            </div>
	            <div class="bottom">
	               <h3>企业简介</h3>
	               <p><c:out escapeXml="false" value="${enterprise.name}"/></p>
	            </div>
	         </div>
	         <!-- /intro-wrap -->
	         <div class="enterprise-product">
	            <h3>企业产品展示</h3>
	            <ul class="list">
	            	<c:forEach var="product" items="${products}">
		               <li data-pid=${product.pid }>
		               		<div class="picture"><a class="fancybox fancybox.ajax" href="public/productDetail?pid=${product.pid }"><img alt="" src="upload/${product.picture_s }"></a></div>
		               		<div class="name"><a class="fancybox fancybox.ajax" href="public/productDetail?pid=${product.pid }">${product.pname }</a></div>
		               </li>
			        </c:forEach>
	            </ul>
	         </div>
	         <!-- /enterprise-product -->
	         <div class="enterprise-contact">
	            <h3>联系方式</h3>
	            <p>联系人：<s:property value="#request.enterprise.linker"/></p>
	            <p>联系电话：<s:property value="#request.enterprise.linktel"/></p>
	            <p>传真：<s:property value="#request.enterprise.linkfax"/></p>
	            <p>E-mail：<s:property value="#request.enterprise.linkmail"/></p>
	            <p>网址：<s:property value="#request.enterprise.website"/></p>
	            <p>地址：<s:property value="#request.enterprise.address"/></p>
	            <p>邮编：<s:property value="#request.enterprise.postcode"/></p>
	         </div>
	         <!-- /enterprise-contact -->
	      </div>
	   </div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
	
	<script type="text/javascript" src="jsLib/jquery/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="jsLib/jquery.fancybox/jquery.fancybox.pack.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$(".fancybox").fancybox();
	});
	</script>
</body>
</html>

