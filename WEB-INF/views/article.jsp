<%@page import="java.text.SimpleDateFormat"%>
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
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>新闻咨询正文-中小企业公共服务平台</title>
<link href="resources/css/news.css" rel="stylesheet" type="text/css">
<!--[if IE]>
<link href="resources/css/ie.css" rel="stylesheet" type="text/css">
<![endif]-->
</head>
<body>

<jsp:include page="head.jsp" flush="true"/>
<div class="container">
<ul class="breadcrumb">
	<li><a href="#">首页</a> <span class="divider">/</span>
	</li>
	<li><a href="news/list?cid=1">新闻资讯</a> <span
		class="divider">/</span>
	</li>
	<li class="active">正文</li>
</ul>
</div>
<!-- /container -->
	<div class="article-wrap">
		<div class="col-wrap">
			<div class="col-list pull-left">
				<div class="hd">
					<h1>${news.title }</h1>
					<div class="tit-bar">
						<span class="date"><%
							/* SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"); */
							com.eaglec.hj.domain.News news = (com.eaglec.hj.domain.News)request.getAttribute("news");
							String pubdate = news.getPubdate().toString().substring(0, 16); 
						%><%=pubdate %></span> <span class="source">来源：${news.source}</span>
						<span class="print pull-right"><a href="javascript:void(0)">打印</a>
						</span>
					</div>
				</div>
				<div class="bd">${news.content }</div>
				<div class="share">
					<!-- Baidu Button BEGIN -->
					<div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare">
						<a class="bds_qzone"></a> <a class="bds_tsina"></a> <a
							class="bds_tqq"></a> <a class="bds_renren"></a> <a
							class="bds_t163"></a> <span class="bds_more">更多</span> <a
							class="shareCount"></a>
					</div>
					<script type="text/javascript" id="bdshare_js"
						data="type=tools&amp;uid=0"></script>
					<script type="text/javascript" id="bdshell_js"></script>
					<script type="text/javascript">
						document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion="
								+ Math.ceil(new Date() / 3600000)
					</script>
					<!-- Baidu Button END -->
				</div>
				<div class="more-info">
					<h3>更多资讯</h3>
					<ul>		
						<c:forEach var="s" items="${newsList}">
							<li><a
								href="news/article?cid=${s.cid }&id=${s.id }">
									<c:out value="${s.title}" escapeXml="false" /> </a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="col-side pull-right">
				<div class="hot-service">
					<h3>新闻热点</h3>
					<ul class="hot-column">
						<li><a href=""><img src="resources/images/hot_column_1.jpg">
						</a></li>
						<li><a href=""><img src="resources/images/hot_column_2.jpg">
						</a></li>
						<li><a href=""><img src="resources/images/hot_column_3.jpg">
						</a></li>
						<li><a href=""><img src="resources/images/hot_column_4.jpg">
						</a></li>
					</ul>
					<ul class="hot-links">
						<li><a href="">电子商务</a>
						</li>
						<li><a href="">工业设计</a>
						</li>
						<li><a href="">工业团购</a>
						</li>
						<li><a href="">电子商务</a>
						</li>
						<li><a href="">工业设计</a>
						</li>
						<li><a href="">工业团购</a>
						</li>
					</ul>
				</div>
				<div class="ad">
					<a href="#"><img src="resources/images/ad_2.jpg">
					</a>
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
	<script src="resources/js/top.js"></script>
</body>
</html>
