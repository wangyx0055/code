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
<title>服务正在建设中-中小企业公共服务平台</title>
<link href="resources/css/404.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="head.jsp" flush="true"/>
<div class="wrap" style="height:530px;">
   <div class="container">
      <div class="building_forbidden"><img src="resources/images/forbidden.png"></div>
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