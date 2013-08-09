<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<title>新闻资讯-中小企业公共服务平台</title>
<jsp:include page="top.jsp" flush="true"/>
<link href="resources/css/news.css" rel="stylesheet" type="text/css">
<!--[if IE]>
<link href="resources/css/ie.css" rel="stylesheet" type="text/css">
<![endif]-->
</head>
<body>
<jsp:include page="head.jsp" flush="true"/>
<div class="container">
  <ul class="breadcrumb">
      <li><a href="">首页</a> <span class="divider">/</span></li>
	  <li class="active"><a href="news/list?cid=1">新闻资讯</a></li>
  </ul>
</div>
<!-- /container -->
<div class="article-wrap">
  <div class="col-wrap">
     <div class="col-list pull-left">
        <ul id="myTab" class="col-nav-bar">
      
          <c:if test="${cid == 1}"><li class="active"><a href="#economy">经济资讯</a></li></c:if>
          <c:if test="${cid != 1}"><li ><a href="#economy">经济资讯</a></li></c:if>
          <c:if test="${cid == 2}"><li class="active"><a href="#economy">政策法规</a></li></c:if>
          <c:if test="${cid != 2}"><li><a href="#economy">政策法规</a></li></c:if>
          <c:if test="${cid == 3}"><li class="active"><a href="#economy">服务动态</a></li></c:if>
          <c:if test="${cid != 3}"><li ><a href="#economy">服务动态</a></li></c:if>
          <c:if test="${cid == 4}"><li class="active"><a href="#economy">服务指南 </a></li></c:if>
          <c:if test="${cid != 4}"><li ><a href="#economy">服务指南</a></li></c:if>
        </ul>
        <div class="tab-content">       
           <div id="economy">
             <ul class="main-list">
             <c:forEach items="${newsList }" var="item" >
                <li>
                   <h3><a href="news/article?cid=${item.cid }&id=${item.id }"  target="_blank">${item.title } </a>
                   		<span class="date">${item.pubdate }</span></h3>
                   <p>${fn:substring(my:replaceHTML(item.content), 0, 100) }...</p>
                </li>
			</c:forEach>
             </ul>

           	<div class="pagination pagination-centered">
					<form id="thisForm" name="thisForm" method="post" action="">
						<input type="hidden" name="cid" value="${cid }" />						
						<div class="sabrosus">
						<span>${pageStr}</span>
						</div>
					</form>
				
				</div>         
           
           </div>
           <div class="tab-pane" id="policy">b</div>
           <div class="tab-pane" id="service">c</div>
        </div>
     </div>
     <div class="col-side pull-right">
         <div class="hot-news">
           <h3>新闻热点</h3>
           <div class="picture"><a href=""><img src="resources/images/pic.jpg"></a></div>
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
         <div class="ad"><a href="#"><img src="resources/images/ad_1.jpg"></a></div>
     </div>
  </div>
</div>
<!-- /article-wrap -->
<div class="footer">
<p class="p1">主办：厚街镇经济科技信息局 | 承办：东莞市力凯科技发展有限公司 | 技术支持：深圳市依格欣计算机技术有限公司</p>
<p class="p2">备案号：粤ICP备11040663号-1 | 增值电信业务经营许可证：B2-20060558号(ICP加挂服务)</p>
<p class="p2">©2012 东莞市力凯科技发展有限公司 版权所有</p>
</div>
<!-- /footer -->
<script src="resources/lib/jquery-1.9.0.min.js"></script>
<script src="resources/js/bootstrap-dropdown.js"></script>
<script src="resources/js/bootstrap-tab.js"></script>
 <script src="resources/js/top.js"></script>
<script>
$('#myTab a').click(function (e) {
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