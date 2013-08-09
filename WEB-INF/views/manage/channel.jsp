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
<title>中小企业公共服务平台_后台管理系统</title>
<link href="jsLib/ligerUI/skins/Aqua/css/ligerui-all.css"
	rel="stylesheet" type="text/css" />
<script src="jsLib/jquery/jquery-1.3.2.min.js"
	type="text/javascript"></script>
<script src="jsLib/ligerUI/js/core/base.js" type="text/javascript"></script>
<script src="jsLib/ligerUI/js/plugins/ligerGrid.js"
	type="text/javascript"></script>
<script src="jsLib/ligerUI/js/plugins/ligerTab.js"
	type="text/javascript"></script>
<script src="jsLib/ligerUI/js/plugins/ligerDrag.js"
	type="text/javascript"></script>
<script src="../grid/CustomersData.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$("#navtab1").ligerTab();
	});
</script>
</head>
<body style="padding: 10px">
	<div id="navtab1"
		style="width: 600px; overflow: hidden; border: 1px solid #A3C0E8;">
		<div tabid="home" title="热点服务" lselected="true" style="height: 300px">
			<iframe frameborder="0" name="showmessage"src="../../demos/form/form.htm"></iframe>
		</div>
		<div title="企业风采" showClose="true">
			<div id="maingrid2" style="margin: 10px; height: 300px;">企业风采</div>
		</div>
		<div title="服务大全" showClose="true">
			<div id="Div1" style="margin: 10px; height: 300px;">服务大全</div>
		</div>
		<div title="厚街制造" showClose="true">
			<div id="Div2" style="margin: 10px; height: 300px;">厚街制造</div>
		</div>
	</div>
</body>
</html>