<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="my" uri="http://www.eaglec.com/jsp/user/functions" %>
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
<title>新闻资讯搜索页-中小企业公共服务平台</title>
<link href="resources/css/news.css" rel="stylesheet" type="text/css">
<!--[if IE]>
<link href="resources/css/ie.css" rel="stylesheet" type="text/css">
<![endif]-->
</head>
<body>
	<jsp:include page="head.jsp" flush="true" />
	<div class="container">
		<ul class="breadcrumb">
			<li><a href="/">首页</a> <span class="divider">/</span></li>
			<li class="active"><a href="news/list?cid=1">新闻资讯</a></li>
		</ul>
	</div>
	<!-- /container -->
	<div class="article-wrap">
		<div class="col-wrap">
			<div class="col-list pull-left">
				<span>${cname }</span>
				<div id="tab-content">
					<div class="tab-pane active" id="economy">
							<ul class="main-list">
								<c:forEach items="${searchList}" var="s1">
									<li>
										<h3>
											<a href="news/article?cid=${s1.cid }&id=${s1.id }" target="_blank"> ${s1.title }</a>
													<span class="pull-right date">
															${s1.pubdate }
													</span>
										</h3>
										<p>
											<c:choose>
												<c:when test="${fn:length(s1.content)>100}">
													<c:out
													value= "${fn:substring(my:replaceHTML(s1.content),0,100) }..."
														escapeXml="false">
													</c:out>
												</c:when>
												<c:otherwise>
													<c:out value= "${fn:substring(my:replaceHTML(s1.content),0,100) }..."
														escapeXml="false" />
												</c:otherwise>
											</c:choose>
										</p> 
									</li>
								</c:forEach>
							</ul>
					</div>

						<div class="pagination pagination-centered">
							<form id="thisForm" name="thisForm" method="post" action="">
								<input type="hidden" name="keyword" value="${keyword }" />
								<div class="sabrosus">
									<span>${pageStr}</span>
								</div>
							</form>
						</div>

				</div>
<!-- 					<div class="tab-pane" id="policy">b</div> -->
<!-- 					<div class="tab-pane" id="service">c</div> -->
					
			</div>
			<div class="col-side pull-right">
	<div class="hot-news">
		<h3>新闻热点</h3>
		<div class="picture">
			<a href=""><img src="resources/images/pic.jpg"></a>
		</div>
		<ul>
			<li><a href="">职业股民屡战屡败陷交易强迫症</a></li>
			<li><a href="">排协确认陈忠和当选帅顾问</a></li>
			<li><a href="">新华社连发三文为IPO重启造势</a></li>
			<li><a href="">排协确认陈忠和当选帅顾问</a></li>
			<li><a href="">新华社连发三文为IPO重启造势</a></li>
			<li><a href="">职业股民屡战屡败陷交易强迫症</a></li>
			<li><a href="">排协确认陈忠和当选帅顾问</a></li>
			<li><a href="">职业股民屡战屡败陷交易强迫症</a></li>
			<li><a href="">新华社连发三文为IPO重启造势</a></li>
			<li><a href="">职业股民屡战屡败陷交易强迫症</a></li>
		</ul>
	</div>
	<div class="ad">
		<a href="#"><img src="resources/images/ad_1.jpg"></a>
	</div>
</div>
	    </div>

		</div>
		
	<!-- /article-wrap -->
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
	<script src="resources/js/bootstrap-tab.js"></script>
	<script src="resources/js/top.js"></script>
	<script>
		$('#myTab a').click(function(e) {
			e.preventDefault();
			$(this).tab('show');
		});

		function GoPage(id) {
			document.thisForm.ipage.value = id;
			document.thisForm.target = '_self';
			document.thisForm.submit();
		}
	</script>
</body>
</html>