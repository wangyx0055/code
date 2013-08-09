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
<title>中小企业公共服务平台--会员注册</title>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<link href="resources/css/reg.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="header">
		<div class="container">
			<div class="logo pull-left">
				<a href=""><img src="resources/images/logo.png"></a>
			</div>
			<div class="search-box pull-left">
				<input class="input" type="text">
				<button class="btn" type="button"></button>
			</div>
			<ul class="top-navs pull-right">
				<li><a href="">在线客服</a></li>
				<li><a href="">网站导航</a></li>
			</ul>
		</div>
	</div>
	<!-- /header -->
	<div class="container">
		<div class="main">
			<h2 class="top-title">
				企业通行证注册<i>欢迎来到东莞中小企业公共服务平台，只需简单几步，即可完成注册流程。</i>
			</h2>
			<ul class="crumb-nav">
				<li class="s1">1 填写账号信息</li>
				<li class="s2">2 验证账号信息</li>
				<li>3 注册成功</li>
			</ul>
			<div class="form-container">
				<form class="form-horizontal" action="enterprise/register_1"
					method="post">
					<div class="control-group">
						<label class="control-label" for="enterprise_name">企业类型：</label>
						<div class="controls">
							<select id="mchannel" name="mchannel" >
		        		<option >       </option>
		        		<option value="epshow">企业风采</option>
		        		<option value="hjbusiness">厚街商贸</option>
        			 </select>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="enterprise_name">企业名称：</label>
						<div class="controls">
							<input type="text" id="epname"
								name="epname">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="epid">企业编码：</label>
						<div class="controls">
							<input type="text" id="epid" name="epid" onblur="javascript:validateinput()"><span id="validateepid"></span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="password">联系人：</label>
						<div class="controls">
							<input type="text" id="eplinkman"
								name="eplinkman">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="confirm_password">联系邮箱：</label>
						<div class="controls">
							<input type="text" id="epemail"
								name="epemail">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label"></label>
						<div class="controls">
							<input id="agree" name="agree" type="checkbox">&nbsp;我已阅读并同意《平台服务协议》
						</div>
					</div>
					<div class="control-group">
						<label class="control-label"></label>
						<div class="controls">
							<button type="submit" class="buttom-next"></button>
						</div>
					</div>
				</form>
			</div>
		</div>
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
	<script src="jsLib/jquery/jquery.validate.min.js"></script>
	<script src="resources/js/register_1.js"></script>
	<script type="text/javascript">
    
    function validateinput(){
		$.post(
				
				'enterprise/validateepid',
				{epid:$("#epid").val()},
				function(data){
					console.debug(data.message);
					 if(data.message == 1){
						$("#validateepid").html("企业编号已经存在！");
						$("#epid").val("");
					}else{
 						$("#validateepid").html("");
					} 
				},
				"json"
		); 
    }
	</script>
</body>
</html>