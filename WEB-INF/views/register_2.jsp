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



<link href="jsLib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="jsLib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />
	<link href="resources/css/home.css" rel="stylesheet" type="text/css">
	<style type="text/css">
		body{
			overflow: hidden;
		}
		.l-table-edit-td{
			padding:10px 2px 0px 0px;
		}
		.box-pane {
			margin: 10px auto;
			overflow-y: auto; 
		}
		.hotservice{
			border:1px solid #A0A0A0;
		}
		.epshow{
			border:1px solid #A0A0A0;
		}
		.hjmake{
			border:1px solid #A0A0A0;
		}
		.ebusiness{
			border:1px solid #A0A0A0;
		}
		.hjbusiness{
			border:1px solid #A0A0A0;
		}
		.moduleType{
			top: 3px;
			left: 4px;
		}
		.promptInfo{
			border: 1px solid red;
		    height: 50px;
		    position: absolute;
		    text-align: center;
		    vertical-align: middle;
		    width: 80px;
		}
		.l-text-disabled .l-text-field {
			color: #C0BFBD;
		}
	</style>
<link href="jsLib/bootstrap-fileupload/bootstrap-fileupload.css"
	rel="stylesheet" type="text/css">
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
				<li class="s1">1 填写账号信息<span class="ok-icon"></span></li>
				<li class="s3">2 验证账号信息</li>
				<li>3 注册成功</li>
			</ul>
			<div class="form-container">
				<form class="myform" action="enterprise/register_2" method="post" enctype="multipart/form-data">
				  <input type="hidden" name="epid" value=${enterprise.epid }>
				  <input type="hidden" name="eplinkman" value=${enterprise.eplinkman }>
				  <input type="hidden" name="epname" value=${enterprise.epname }>
				  <input type="hidden" name="mchannel" value=${enterprise.mchannel }>
				  <input type="hidden" name="epemail" value=${enterprise.epemail }>
				  <input type="hidden" name="epemailcode" value=${enterprise.epemailcode }>
				  <h3 class="head">公司信息</h3>
				  <div class="form-horizontal">
				    <div class="control-group">
				      <label class="control-label">公司名称：</label>
				      <div class="controls">
				        <input type="text" value="${enterprise.epname }" readonly="readonly" disabled="disabled" />
				      </div>
				    </div>
				    <div class="control-group">
				      <label class="control-label" for="epemailcode1">企业邮件验证码：</label>
				      <div class="controls">
				        <input id="epemailcode1" type="text" name="epemailcode1">
				      </div>
				    </div>
				    <div class="control-group">
				      <label class="control-label" for="indirty">所属行业：</label>
				      <div class="controls">
				        <select name="indirty" id="indirty">
				          <option>软件行业</option>
				          <option>金融行业</option>
				        </select>
				      </div>
				    </div>
				    <div class="control-group">
				      <label class="control-label" for="epphone">公司电话：</label>
				      <div class="controls">
				        <input type="text" class="isTel" id="epphone"
													name="epphone">
				        <label class="error">格式：010-12345678</label>
				      </div>
				    </div>
				    <div class="control-group">
				      <label class="control-label" for="epdomain">公司域名：</label>
				      <div class="controls">
				        <input type="text" id="epdomain" name="epdomain">
				      </div>
				    </div>
				    <div class="control-group">
				      <label class="control-label" for="epaddress">公司地址：</label>
				      <div class="controls">
				        <input type="text" id="epaddress" name="epaddress">
				      </div>
				    </div>
				    <div class="control-group">
				      <label class="control-label" for="eplogo">企业logo图片：</label>
				      <div class="controls">
				        <input name="eplogo" type="text" id="eplogo" size="15" ltype="text" />
				      </div>
				    </div>
				    <div class="control-group">
				      <label class="control-label" for="epintro">公司介绍：</label>
				      <div class="controls">
				        <input type="text" id="epintro" name="epintro">
				      </div>
				    </div>
				    <div class="control-group">
				      <label class="control-label" for="eptype">企业性质：</label>
				      <div class="controls">
				        <select name="eptype" id="eptype">
				          <option>国企</option>
				          <option>个体</option>
				        </select>
				      </div>
				    </div>
				    <div class="control-group">
				      <label class="control-label" for="epcapital">企业注册资金：</label>
				      <div class="controls">
				        <input type="text" id="epcapital" name="epcapital">
				        （单位万元） </div>
				    </div>
				    <div class="control-group">
				      <label class="control-label" for="turnover">年营业额：</label>
				      <div class="controls">
				        <input type="text" id="turnover" name="turnover">
				        （单位万元） </div>
				    </div>
				    <div class="control-group">
				      <label class="control-label" for="epmodel">企业经营模式：</label>
				      <div class="controls">
				        <input type="text" id="epmodel" name="epmodel">
				      </div>
				    </div>
				    <div class="control-group">
				      <label class="control-label" for="foundtime">企业成立时间：</label>
				      <div class="controls">
				        <input type="text" id="foundtime" name="foundtime">
				      </div>
				    </div>
				    <div class="control-group">
				      <label class="control-label" for="menbers">企业员工人数：</label>
				      <div class="controls">
				        <input type="text" id="menbers" name="menbers">
				      </div>
				    </div>
				    <div class="control-group">
				      <label class="control-label" for="products">企业主营产品：</label>
				      <div class="controls">
				        <input type="text" id="products" name="products">
				      </div>
				    </div>
				    <div class="control-group">
				      <label class="control-label" for="permit">营业执照：</label>
				      <div class="controls">
				        <input name="permit" type="text" id="permit" size="15" ltype="text" />
				      </div>
				    </div>
				    <div class="control-group">
				      <label class="control-label" for="permitid">营业执照注册号：</label>
				      <div class="controls">
				        <input type="text" id="permitid" name="permitid">
				      </div>
				    </div>
				    <div class="control-group">
				      <label class="control-label" for="missive">企业公函：</label>
				      <div class="controls">
				        <input name="missive" type="text" id="missive" size="15" ltype="text" />
				      </div>
				    </div>
				  </div>
				  <h3 class="head">联系方式</h3>
				  <div class="form-horizontal">
				    <div class="control-group">
				      <label class="control-label" for="linker">真实姓名：</label>
				      <div class="controls">
				        <input type="text" id="linker" name="linker">
				      </div>
				    </div>
				    <div class="control-group">
				      <label class="control-label" for="linktel">手机号码：</label>
				      <div class="controls">
				        <input type="text" id="linktel" name="linktel">
				      </div>
				    </div>
				    <div class="control-group">
				      <label class="control-label" for="linkfax">传真号码：</label>
				      <div class="controls">
				        <input type="text" id="linkfax" name="linkfax">
				      </div>
				    </div>
				    <div class="control-group">
				      <label class="control-label" for="linkmail">个人电子邮箱：</label>
				      <div class="controls">
				        <input type="text" id="linkmail" name="linkmail">
				      </div>
				    </div>
				    <div class="control-group">
				      <label class="control-label" for="website">个人网址：</label>
				      <div class="controls">
				        <input type="text" id="website" name="website">
				      </div>
				    </div>
				    <div class="control-group">
				      <label class="control-label" for="address">个人地址：</label>
				      <div class="controls">
				        <input type="text" id="address" name="address">
				      </div>
				    </div>
				    <div class="control-group">
				      <label class="control-label" for="postcode">邮编：</label>
				      <div class="controls">
				        <input type="text" id="postcode" name="postcode">
				      </div>
				    </div>
				    <div class="control-group">
				      <label class="control-label" for="qq">QQ：</label>
				      <div class="controls">
				        <input type="text" id="qq" name="qq">
				      </div>
				    </div>
				    <div class="control-group">
				      <label class="control-label"></label>
				      <div class="controls">
				        <button class="agree-btn"></button>
				      </div>
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
	
	<!-- 上传小窗口 -->
	<div id="uploadDiv" style="display:none;">
		<div title="本地上传">
			<div style="margin: 10px;">
				<form action="#" id="fileForm" name="fileForm" method="post" enctype="multipart/form-data">
					<input type='file' id="file" name="file" />
					<div class="imageView" style="margin: 5px; " >
						<img alt="图片预览" src="upload/99X99.jpg" width="80" height="50" />
					</div>
				</form>
			</div>
		</div>
	</div>
    <script type="text/javascript" src="jsLib/jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="jsLib/jquery/jquery.form.js"></script>
	<script src="jsLib/ligerUI/js/ligerui.min.js"	type="text/javascript"></script>
	<script src="jsLib/jquery-validation/jquery.validate.min.js" type="text/javascript"></script> 
	<script src="jsLib/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
	<script src="jsLib/jquery-validation/messages_cn.js" type="text/javascript"></script>
	<script src="resources/js/register_2.js"></script>
</body>
</html>