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
	<title>${products.pname}</title>
	<link href="resources/css/style.css" rel="stylesheet" type="text/css">
	<link href="resources/css/enterprise.css" rel="stylesheet" type="text/css">
	<link href="jsLib/jquery.fancybox/jquery.fancybox.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="jsLib/jquery/jquery-1.9.0.min.js"></script>
	<script type="text/javascript">
	$(function() {
// 		var temp1 = ${products.mchannel};//为什么返回一个DIV
		var temp = '${products.mchannel}';//为什么返回一个DIV
//  		console.log(temp1);
// 		alert($('<div id="hjmake1" style="display:none">').attr('id'));
		if(temp == 'hjmake'){
			$("#hjmake").show();
		}else if(temp == 'ebusiness'){
			$("#ebusiness").show();
		}

	});
	</script>
</head>
<body>
	<jsp:include page="head.jsp" flush="true"/>
	
	<div id="ebusiness" style="display:none">
		<!-- /header -->
		<div class="container">
			<ul class="breadcrumb">
	      		<li><a href="product/more?mchannel=ebusiness">电商荟萃</a> <span class="divider">></span></li>
		  		<li class="active">${products.pname}</li>

		  	</ul>
		</div>
		<!-- /container -->
		<div class="container">
		   <div class="enterprise-wrap">
		      <div class="intro-enterprise">
		         <div class="intro-wrap">
		            <div class="top">
		                <div class="picture pull-left"><a href=""> <img width="272" height="180" src="upload/${products.picture_b}"/> </a>
		                </div>
		                <div class="text pull-left">
		                  <h3>${products.pname}</h3>
		                   <p>规格型号：${products.pversion}</p>
		                   <p>价格：${products.price}</p>
		                   <p>所属公司：${products.company}</p>
		                   <p>网店地址：<a href="${products.store}">${products.store}</a></p>
		                   <p>联系电话：${enterprise.linktel}</p>
		                </div>
		            </div>
		            <div class="bottom">
		               <h3>企业简介</h3>
		               <p><c:out escapeXml="false" value="${products.pintro}"/></p>
		            </div>
		         </div>

		         <!-- /enterprise-product -->
		         <div class="enterprise-contact">
		            <h3>联系方式</h3>
		            <p>联系人：${enterprise.linker}</p>
		            <p>联系电话：${enterprise.linktel}</p>
		            <p>传真：${enterprise.linkfax}</p>
		            <p>E-mail：${enterprise.linkmail}</p>
		            <p>网址：${enterprise.website}</p>
		            <p>地址：${enterprise.address}</p>
		            <p>邮编：${enterprise.postcode}</p>
		         </div>
		         <!-- /enterprise-contact -->
		      </div>
		   </div>
		</div>
	</div>
	
	
	
	
	<div id="hjmake" style="display:none">
	 <!-- /header -->
	<div class="container">
		<ul class="breadcrumb">
      		<li><a href="product/more?mchannel=hjmake">厚街制造</a> <span class="divider">></span></li>
	  		<li class="active">${products.pname}</li>
	  	</ul>
	</div>
	<!-- /container -->
	<div class="container">
	   <div class="enterprise-wrap">
	      <div class="intro-enterprise">
<!-- 	         <h3 class="title">产品简介</h3> -->
	         <div class="intro-wrap">
	            <div class="top">
	                <div class="picture pull-left"><a href=""> <img width="272" height="180" src="upload/${products.picture_b}"/> </a>
		                </div>
	                <div class="text pull-left">
	                  <h3>${products.pname}</h3>
	                   <p>规格型号：${products.pversion}</p>
	                  	<p>起订量：${products.pminimum}</p>
	                   <p>供货单价：${products.supplyprice}</p>
	                      <p>产地：${products.field}</p>
	                   <p>运输方式：${products.pattern}</p>
	                   <p>供货公司：${products.company}</p>
	                   <p>联系电话：${enterprise.linktel}</p>
	                </div>
	            </div>
	            <div class="bottom">
	               <h3>企业简介</h3>
	               <p><c:out escapeXml="false" value="${products.pintro}"/></p>
	            </div>
	         </div>
	        
	         <!-- /enterprise-product -->
	         <div class="enterprise-contact">
	            <h3>联系方式</h3>
	            <p>联系人：${enterprise.linker}</p>
	            <p>联系电话：${enterprise.linktel}</p>
	            <p>传真：${enterprise.linkfax}</p>
	            <p>E-mail：${enterprise.linkmail}</p>
	            <p>网址：${enterprise.website}</p>
	            <p>地址：${enterprise.address}</p>
	            <p>邮编：${enterprise.postcode}</p>
	         </div>
	         <!-- /enterprise-contact -->
	      </div>
	   </div>
	</div>
	</div> 
	<jsp:include page="footer.jsp" flush="true"/>
	
	
	<script type="text/javascript" src="jsLib/jquery.fancybox/jquery.fancybox.pack.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$(".fancybox").fancybox();
	});
	</script>
</body>
</html>

