<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>新闻管理</title>
</head>

<body>
	<body>
<br>	版本更新文档(2013-08-09)
<br>更新内容
<br>===========================================================================
<br>1.修复平台网站后台-企业管理-修改企业信息失败
<br>2.修复平台网站后台-企业管理--商品无法删除
<br>3.修复服务大全服务只能显示前9项的问题
<br>4.修复平台服务-信息化服务-正版软件无法增加子类别
<br>5.修复企业风采-“查看更多”链接页面出错
<br>6.修改网站底部版权信息
<br>7.修复平台网站服务内容，前台和后台看到的不一致 (数据表servicetree_pc资料丢失造成的）
<br>8.修复点主页面的logo图标链接首页。
<br>9.修复服务大全中的上级目录中点图报错，子目录能正常登录链接。

</body>
</body>
</html>