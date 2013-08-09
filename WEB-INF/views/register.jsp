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
<title>会员注册-中小企业公共服务平台</title>
<jsp:include page="top.jsp" flush="true" />
<link href="resources/css/register.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="head.jsp" flush="true" />
	<div class="container">
		<div class="form-box">
			<h3 class="title">
				通行证注册<i>欢迎来到东莞中小企业公共服务平台，只需简单几步，即可完成注册流程。</i>
			</h3>
			<div class="content">
				<div class="form pull-left">
					<table>
						<tr>
							<td class="s1">企业名称:</td>
							<td><input class="input" type="text"></td>
						</tr>
						<tr>
							<td class="s1">用户昵称:</td>
							<td><input class="input" type="text"></td>
						</tr>
						<tr>
							<td class="s1">通行证帐号 :</td>
							<td><input class="input" type="text"></td>
						</tr>
						<tr>
							<td class="s1">密码:</td>
							<td><input class="input" type="text"></td>
						</tr>
						<tr>
							<td class="s1">确认密码:</td>
							<td><input class="input" type="text"></td>
						</tr>
						<tr>
							<td class="s1">电子邮箱:</td>
							<td><input class="input" type="text"></td>
						</tr>
						<tr>
							<td class="s1"></td>
							<td><input type="checkbox">我已阅读并同意《平台服务协议》</td>
						</tr>
						<tr>
							<td class="s1"></td>
							<td><button type="submit" class="submit"></button></td>
						</tr>
					</table>
				</div>
				<div class="notice pull-right">
					<p>
						<a href=""><img src="resources/images/login_btn.jpg"></a>
					</p>
					<p class="s1">还不是中小微平台用户？</p>
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
</body>
</html>