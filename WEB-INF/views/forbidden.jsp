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
<title>中小企业公共服务平台-后台管理系统</title>
<link href="resources/css/404.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="head.jsp" flush="true"/>
<div class="wrap">
   <div class="container">
       <div class="forbidden-icon"></div>
       <div class="forbidden-content">
         <h2>抱歉...</h2>
         <p>当前您没有访问权限，请联系管理员</p>
         <p class="s1"><a href=""><img src="../resources/images/back_btn.png"></a><a href="/"><img src="../resources/images/home_icon.png"></a></p>
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
</body>
</html>