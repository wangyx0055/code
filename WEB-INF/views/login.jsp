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
<title>服务平台登录-中小企业公共服务平台</title>
<jsp:include page="top.jsp" flush="true" />
<link href="resources/css/register.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="head.jsp" flush="true" />
	<div class="container">
		<div class="form-box">
			<h3 class="title">
				通行证登录<i>欢迎登录中小企业公共服务平台</i>
			</h3>
			<div class="content">
				<div class="form pull-left">
					<table>
						<tr>
							<td class="s1" align="right">企业编码:</td>
							<td><input class="input epid" name="epid" type="text"
								placeholder="输入企业编码" required></td>
							<td class="epid-info"></td>
						</tr>
						<tr>
							<td class="s1" align="right">通行证帐号:</td>
							<td><input class="input upassid" name="upassid" type="text"
								placeholder="输入通行证帐号" required></td>
							<td class="upassid-info"></td>
						</tr>
						<tr>
							<td class="s1" align="right">通行证密码:</td>
							<td><input class="input upassword" name="upassword"
								type="password" placeholder="输入通行证密码" required></td>
							<td class="upassword-info"></td>
						</tr>
						<tr>
							<td></td>
							<td class="s1"><input name="" type="checkbox" value="" /><span
								class="remeber-account"> 记住账号</span><a
								class="forgot-password pull-right" href="">忘记密码</a></td>
						</tr>
						<tr>
							<td class="s1"></td>
							<td><button type="submit" class="login-btn"></button></td>
						</tr>
					</table>
				</div>
				<div class="notice pull-right">
					<h3 class="s2">还不是中小微平台用户？</h3>
					<p>
						<a href=""><img src="resources/images/register_btn.jpg"></a>
					</p>
				</div>
			</div>
		</div>
		<!-- /form-box -->
	</div>
	<!-- /container -->
	<div class="footer">
		<p class="p1">主办：厚街镇经济科技信息局 | 承办：东莞市力凯科技发展有限公司 |
			技术支持：深圳市依格欣计算机技术有限公司</p>
		<p class="p2">备案号：粤ICP备11040663号-1 |
			增值电信业务经营许可证：B2-20060558号(ICP加挂服务)</p>
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