<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="my" uri="http://www.eaglec.com/jsp/user/functions" %>
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
	<title>中小企业公共服务平台</title>
	<link href="resources/lib/jCarousel/css/skin.css" rel="stylesheet" type="text/css" />
	<!--[if IE]>
	<link href="resources/css/ie.css" rel="stylesheet" type="text/css">
	<![endif]-->
</head>
<body>
	<jsp:include page="head.jsp" flush="true"/>
	<div class="top-col container">
		<div class="pandora pull-left">
			<div class="navbar">
				<ul id="pandora-nav" class="nav nav-tabs" data-tab-content=".service-tab-content">
					<li><a href="module/loadModule/hotservice">热点服务</a></li>
					<li><a href="module/loadModule/epshow">企业风采</a></li>
					<li><a href="module/loadModule/allservice">服务大全</a></li>
					<li><a href="module/loadModule/hjmake">厚街制造</a> </li>
					<li><a href="module/loadModule/hjbusiness">厚街商贸</a></li>
					<li><a href="module/loadModule/govep">政企之窗</a></li>
					<li><a href="module/loadModule/ebusiness">电商荟萃</a></li>
					<li><a href="module/loadModule/epknown">企业智库</a></li>
					<li><a href="module/loadModule/epweibo">企业社区</a></li>
				</ul> 
			</div>
			<div id="pandora-content" class="box tab-content service-tab-content">
				<div class="box-pane tab-pane" id="hotservice">
				</div>
				<div class="box-pane tab-pane" id="epshow">
				</div>
				<div class="active box-pane tab-pane allservice" id="allservice">
                   <div class="row">
                     <div class="w1"><a href="/service/service_cid?cno=103" target="_blank"><img src="resources/images/knowledge_1.jpg"></a></div>
                     <div class="w2">
                        <h3><a href="/service/service_cid?cno=103001" target="_blank">专利服务</a></h3>
                        <h3><a href="/service/service_cid?cno=103002" target="_blank">商标申请</a></h3>
                        <h3><a href="/service/service_cid?cno=103003" target="_blank">版权申请</a></h3>
                        <h3><a href="/service/service_cid?cno=103004" target="_blank">科技项目</a></h3>
                     </div>
                   </div>
                   <div class="row">
                     <div class="w1"><a href="/service/service_cid?cno=106" target="_blank"><img src="resources/images/knowledge_2.jpg"></a></div>
                     <div class="w2">
                        <h3><a href="/service/service_cid?cno=106001001" target="_blank">技工培训</a></h3>
                        <h3><a href="/service/service_cid?cno=106001002" target="_blank">工程师培训</a></h3>
                        <h3><a href="/service/service_cid?cno=106001006" target="_blank">酒店类培训</a></h3>
                        <h3><a href="/service/service_cid?cno=106002" target="_blank">经营管理</a></h3>
                     </div>
                   </div>
                   <div class="row">
                     <div class="w1"><a href="/service/service_cid?cno=102" target="_blank"><img src="resources/images/knowledge_3.jpg"></a></div>
                     <div class="w3">
                        <h3><a href="/service/service_cid?cno=102001" target="_blank">管理软件</a></h3>
                        <h3><a href="/service/service_cid?cno=102002" target="_blank">定制软件</a></h3>
                        <h3><a href="/service/service_cid?cno=102003" target="_blank">正版软件</a></h3>
                     </div>
                     <div class="w4"><a href="/service/service_cid?cno=105" target="_blank"><img src="resources/images/knowledge_4.jpg"></a></div>
                   </div>
                   <div class="row">
                     <div class="w5">
                       <div class="w6"><a href="/service/service_cid?cno=104" target="_blank"><img src="resources/images/knowledge_5.jpg"></a></div>
                       <div class="w7">
                       <h3><a href="/service/service_cid?cno=104001">机电类</a></h3>
                       </div>
                     </div>
                     <div class="w5" style="margin-top:7px;">
                       <div class="w6"><a href="/service/service_cid?cno=107" target="_blank"><img src="resources/images/knowledge_6.jpg"></a></div>
                       <div class="w7">
                       <h3><a href="/service/service_cid?cno=107001">电子商务</a></h3>
                       </div>
                     </div>
                     <div class="w8">
                        <h3><a href="/public/serviceIndex?treeCid=1" target="_blank">查看更多</a></h3>
                     </div>
                   </div>
                </div>
                <div class="box-pane tab-pane" id="hjmake">
				</div>
				<div class="box-pane tab-pane" id="hjbusiness">
				</div>
				<div class="box-pane tab-pane" id="govep">
				</div>
				<div class="box-pane tab-pane" id="ebusiness">
				</div>
				<div class="box-pane tab-pane" id="epknown">
				</div>
				<div class="active box-pane tab-pane" id="epweibo">
					<img src="resources/images/enterprise_blog_banner.jpg" width="730" height="312" border="0" usemap="#Map" />
					<map name="Map" id="Map">
				  	<area shape="rect" coords="477,233,631,268" href="http://hj.pservice.cn:90" target="_blank" />
				</map>
				</div>
			</div>
		</div>
		<div class="top-pane pull-right">
			<div class="top-news">
				<h3>
					新闻动态<a href="news/list?cid=5" class="news-more2 pull-right">更多</a>
				</h3>
				<ul>

					<c:forEach var="news" items="${recentList}" varStatus="status">

						<li><a href="news/article?cid=${news.cid}&id=${news.id }"
							target="_blank"> <c:choose>
									<c:when test="${fn:length(news.title)>16}">
			        				${fn:substring(news.title,0, 15)}...
			        			</c:when>
									<c:otherwise>
				        			${news.title}
			        			</c:otherwise>
								</c:choose>
						</a></li>
					</c:forEach>

				</ul>
			</div>
			<div class="top-notice">
				<h3>最新公告<a href="news/list?cid=3" class="news-more2 pull-right">更多</a></h3>
				<ul>
				<c:forEach var="news" items="${noticeList}" varStatus="status">

						<li><a
							href="news/article?cid=${news.cid}&id=${news.id }"
							target="_blank">
							 <c:choose>
									<c:when test="${fn: length(news.title)>16}">
			        				${fn:substring(news.title,0, 15)}...
			        			</c:when>
									<c:otherwise>
				        			${news.title}
			        			</c:otherwise>
								</c:choose>
						</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<!-- /container -->
	<div class="container">
		<div class="col-know pull-left">
			
				<div class="head"><a href="news/list?cid=1">展会信息</a><a href="news/list?cid=1" class="news-more pull-right">更多</a></div> 
			<div class="content">
				<div class="top">
				
				
				
<!-- 				<div>${knowledgeTop.picture}</div> -->
						<p class="photo">
							<a href="news/article?cid=${knowledgeTop.cid }&id=${knowledgeTop.id}" target="_blank">
								<img src="upload/${knowledgeTop.picture}" width="222" height="118"/>
							</a>
						</p>
							<h3 class="title">
							<a href="news/article?cid=${knowledgeTop.cid}&id=${knowledgeTop.id}" target="_blank">
							
							<c:choose>
									<c:when test="${fn:length(knowledgeTop.title)>14}">
										${fn:substring(knowledgeTop.title,0,13)}...
									</c:when>
									<c:otherwise>
										${knowledgeTop.title}
									</c:otherwise>
							</c:choose>
							</a>
							</h3>
						<p style="height: 72px">
						<c:choose>
							<c:when test="${fn:length(knowledgeTop.content)>70}">
								<c:out
									value="${fn:substring(my:replaceHTML(knowledgeTop.content),0,78)}..."
									escapeXml="false">
									</c:out>
							</c:when>
							<c:otherwise>
								<c:out value="${fn:substring(my:replaceHTML(knowledgeTop.content),0,78)}..."
									escapeXml="false" />
									</c:otherwise>
							</c:choose>				
					<a class="read-all" href="news/article?cid=${knowledgeTop.cid}&id=${knowledgeTop.id}" target="_blank">
					 	阅读全文 </a>
					
					</p>
				</div>
				<ul class="list">
					<c:forEach var="s" items="${knowledgeList}" >
						<li>
							<a href="news/article?cid=${s.cid }&id=${s.id}" target="_blank">
							<c:choose>
								<c:when test="${fn:length(s.title) > 18}">
									${fn:substring(s.title,0,18)}
								</c:when>
								<c:otherwise>
									${s.title }
								</c:otherwise>
							</c:choose>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="foot"><a class="more pull-right" href="news/list?cid=1">更多</a></div>
		</div>
		<!-- /col-know -->
		<div class="col-main pull-right">
			<div class="top">
				<div class="col pull-left">
					<div class="head"><a href="news/list?cid=2">最新推荐</a><a href="news/list?cid=2" class="news-more pull-right">更多</a></div> 
					<div class="top-news">
						<div class="photo pull-left">
							<a href="news/article?cid=${recommendTop.cid }&id=${recommendTop.id}" target="_blank">
								<img src="upload/${recommendTop.picture}" width="68" height="68"/>
							</a>
						</div>
						<div class="content pull-right">
								<h3 class="title">
								<a href="news/article?cid=${recommendTop.cid }&id=${recommendTop.id}" target="_blank">
								<c:choose>
										<c:when test="${fn:length(recommendTop.title)>15}">
											${fn:substring(recommendTop.title,0,14)}...
										</c:when>
										<c:otherwise>
											${recommendTop.title }
										</c:otherwise>
								</c:choose>
								
								</a>
								</h3>
							<p style="height: 50px">
							<c:choose>
								<c:when test="${fn:length(recommendTop.content)>68}">
									<c:out
									value="${fn:substring(my:replaceHTML(recommendTop.content),0,55)}..."
										escapeXml="false" />
								</c:when>
								<c:otherwise>
									<c:out value="${fn:substring(my:replaceHTML(recommendTop.content),0,55)}..."
										escapeXml="false" />
								</c:otherwise>
							</c:choose>
							</p>
						</div>
					</div>
					<ul class="list">
							<c:forEach var="s1" items="${recommendList}">
								<li><a
									href="news/article?cid=${s1.cid }&id=${s1.id}"
									target="_blank">
									<c:choose>
										<c:when test="${fn:length(s1.title) > 27}">
											${fn:substring(s1.title,0, 26)}...
										</c:when>
										<c:otherwise>
											${s1.title}
										</c:otherwise>
									</c:choose>
									 </a>
								</li>
							</c:forEach>
				</ul></div>
				<div class="col pull-right">
					<div class="head"><a href="news/list?cid=1">政策法规</a><a class="news-more pull-right" href="news/list?cid=1">更多</a></div> 
					<div class="top-news">
						<div class="photo pull-left">
							<a href="news/article?cid=${marketTop.cid }&id=${marketTop.id}" target="_blank">
								<img src="upload/${marketTop.picture}" width="68" height="68"/>
							</a>
						</div>
						<div class="content pull-right">
								<h3 class="title">
								<a href="news/article?cid=${marketTop.cid }&id=${marketTop.id}" target="_blank">
								<c:choose>
										<c:when test="${fn:length(marketTop.title)>15}">
											${fn:substring(marketTop.title,0,14)}...
										</c:when>
										<c:otherwise>
											${marketTop.title}
										</c:otherwise>
								</c:choose>
								</a>
								</h3>
								<p style="height: 50px">
								<c:choose>
									<c:when test="${fn:length(marketTop.content)>57}">
										<c:out
										value="${fn:substring(my:replaceHTML(marketTop.content),0,55)}..."
											escapeXml="false" />
									</c:when>
									<c:otherwise>
										<c:out value="${fn:substring(my:replaceHTML(marketTop.content),0,55)}..."
											escapeXml="false" />
									</c:otherwise>
								</c:choose>
								</p>
						</div>
						
					</div>
					<ul class="list">
						<c:forEach var="s2" items="${marketList}">
							<li><a
								href="news/article?cid=${s2.cid }&id=${s2.id}"
								target="_blank">
								<c:choose>
									<c:when test="${fn:length(s2.title) > 27}">
										${fn:substring(s2.title,0, 26)}... 
									</c:when>
									<c:otherwise>
										${s2.title}
									</c:otherwise>						 
								</c:choose>
								</a>
								</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="bottom">
				<div class="enterprise-icon pull-left"><img src="resources/images/enterprise_icon.jpg"></div>
				<marquee class="enterprise-list pull-left" scrollAmount=2 direction=up width=200 height=150 onmouseover="this.stop();" onmouseout="this.start();">
					<c:forEach var="s3" items="${enterprises}" >
						<li data-img="${s3.eplogo}">
							<a href="enterprise/enterpriseFeatures?eid=${s3.eid }" target="_blank">
								${s3.epname}
							</a>
						</li>
					</c:forEach>
				</marquee>
				<div class="enterprise-special pull-right"><a href=""><img src="upload/hj_cinese_group.jpg"></a></div>
			</div>
		</div>
		<!-- /col-main -->
	</div>
	<!-- /container -->
	<div class="friend-links container">
		<img src="resources/images/photo_4.jpg">
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
	<script src="jsLib/bootstrap-master/js/bootstrap-dropdown.js"></script>
	<script src="jsLib/bootstrap-master/js/bootstrap-button.js"></script>
	<script src="jsLib/showLoading/js/jquery.showLoading.js"></script>
	<script type="text/javascript" src="resources/js/ajax-tab.js"></script>
	<script type="text/javascript" src="resources/js/index.js"></script>
</body>
</html>