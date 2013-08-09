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
	<title>产品更多首页</title>
	<link href="resources/css/style.css" rel="stylesheet" type="text/css">
	<link href="resources/css/enterprise.css" rel="stylesheet" type="text/css">
	<link href="jsLib/jquery.fancybox/jquery.fancybox.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="head.jsp" flush="true"/>
	
	<!-- /container -->
	<div class="container">
	   <div class="enterprise-wrap">
	      <div class="intro-enterprise">
	         <div class="enterprise-product">
	            <h3>
		            <c:choose>
						<c:when test="${products[0].mchannel=='hjmake'}">
	       				厚街制造
	       				</c:when>
						<c:when test="${products[0].mchannel=='ebusiness'}">
	       				电商荟萃
	       				</c:when>
						<c:otherwise></c:otherwise>
				    </c:choose>产品展示
				</h3>
	            <ul class="list">
	            	<c:forEach var="product" items="${products}">
		               <li data-pid=${product.pid }>
		               		<div class="picture"><a class="fancybox fancybox.ajax" href="product/productFeatures?pid=${product.pid }"><img alt="" src="upload/${product.picture_s }"></a></div>
		               		<div class="name"><a class="fancybox fancybox.ajax" href="product/productFeatures?pid=${product.pid }">${product.pname }</a></div>
		               </li>
			        </c:forEach>
	            </ul>
	         </div>
	         
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

