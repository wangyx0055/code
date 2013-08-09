<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<title>找不到页面-中小企业公共服务平台</title>
<jsp:include page="top.jsp" flush="true"/>
<link href="resources/css/404.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="head.jsp" flush="true"/>
<div class="wrap">
   <div class="container">
       <div class="smile"></div>
       <div class="content">
          <div class="error pull-left"><img src="public/images/404.png"></div>
          <div class="text pull-left">
              <h2>抱歉，出现错误了！</h2>
              <p>您要查询的网页已删除或者暂时不能用</p>
              <p>点击一下链接继续浏览网站其他信息</p>
              <p class="s1"><a href=""><img src="resources/images/back_btn.png"></a><a href=""><img src="resources/images/home_icon.png"></a></p>
          </div>
       </div>
   </div>
<!-- /container -->
</div>
<!-- /wrap -->
<div class="footer">
<p class="p1">主办：厚街镇经济科技信息局 | 承办：东莞市力凯科技发展有限公司 | 技术支持：深圳市依格欣计算机技术有限公司</p>
<p class="p2">备案号：粤ICP备11040663号-1 | 增值电信业务经营许可证：B2-20060558号(ICP加挂服务)</p>
<p class="p2">&copy;2012 东莞市力凯科技发展有限公司 版权所有</p>
</div>
	<script src="jsLib/jquery/jquery-1.9.0.min.js"></script>
	<script src="jsLib/bootstrap-master/js/bootstrap-button.js"></script>
	<script src="jsLib/showLoading/js/jquery.showLoading.js"></script>
	<script src="jsLib/jquery/jquery.cookie.js"></script>
    <script src="jsLib/jquery/jquery.md5.js"></script>
    <script src="jsLib/jquery/plugins/jrumble/jquery.jrumble.1.3.js"></script>
    <script src="jsLib/artDialog-5.0.3/artDialog.min.js"></script>
	<script src="resources/js/login.js"></script>
</body>
</html>