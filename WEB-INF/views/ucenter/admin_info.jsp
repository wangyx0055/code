<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>用户中心--${passport.uname }</title>
<link href="resources/css/style.css" rel="stylesheet"
	type="text/css">
<link href="jsLib/jNotify/jNotify.jquery.css" rel="stylesheet"
	type="text/css">
<link href="resources/css/ucenter.css" rel="stylesheet"
	type="text/css">
<link href="resources/css/ucenter/user_info.css" rel="stylesheet"
	type="text/css">

</head>
<body>
	<div class="header">
		<div class="container">
			<div class="logo pull-left">
				<a href=""><img src="resources/images/logo.png">
				</a>
			</div>
			<div class="search-box pull-left">
				<input class="input" type="text">
				<button class="btn" type="button"></button>
			</div>
			<ul class="top-navs pull-right">
				<li><a href="">在线客服</a>
				</li>
				<li><a href="">网站导航</a>
				</li>
			</ul>
		</div>
	</div>
	<!-- /header -->
	<div class="container">
		<ul class="breadcrumb">
			<li><a href="#">首页</a><span class="divider">/</span>
			</li>
			<li class="active">用户中心</li>
	</div>
	<!-- /container -->
	<div class="container">
		<div class="main">
			<h1 class="ucenter-title">用户中心</h1>
			<div class="ucenter-menu">
				<ul>
					<li><a href="public/ucenter">用户首页</a></li>
					<li class="hover"><a href="public/user_info">用户资料</a></li>
					<li><a href="public/account_manage">企业子账号</a></li>
					<li><a href="page/ucenter/message_manage.html">通知</a></li>
       				<li><a href="page/ucenter/email_manage.html">邮件</a></li>
				</ul>
			</div>
			<div class="ucenter-box">
				<div class="user-info-wrap">
					<div class="infoblock">
						<form class="info_title">
							<fieldset class="S_line2">
								<legend class="tit S_txt1">基本信息</legend>
							</fieldset>
							<div class="btns">
								<a href="javascript:void(0)"><span action-data="edit=0"
									class="base-action">编辑</span>
								</a>
							</div>
						</form>
						<div class="base-view">
							<div class="pf-item clearfix">
								<div class="label S_txt2">用户账号</div>
								<div class="con">admin@ygx</div>
							</div>
						</div>

						<div class="base-view-edit">
							<div class="pf-item clearfix">
								<div class="label S_txt2">用户账号</div>
								<div class="con">admin@ygx</div>
							</div>
						</div>
					</div>
					<!-- /infoblock -->
					<form class="info_title" id="epform" name="epform" type="post"
						enctype="multipart/form-data">
						<div class="infoblock">
							<fieldset class="S_line2">
								<legend class="tit S_txt1">企业资料</legend>
							</fieldset>
							<div class="btns">
								<a href="javascript:void(0)">
								<span action-data="edit=0" class="enterprise-action">编辑</span>
								</a>
							</div>
							<div class="enterprise-view">
								<div class="pf-item clearfix">
									<div class="label S_txt2">企业全称</div>
									<div class="con epname">${enterprise.epname}</div>
								</div>
								<div class="pf-item clearfix">
									<div class="label S_txt2">企业编码</div>
									<div class="con">${enterprise.epid }</div>
								</div>

								<div class="pf-item clearfix">
									<div class="label S_txt2">联系邮箱</div>
									<div class="con epemail">${enterprise.epemail }</div>
								</div>
								<div class="pf-item clearfix">
									<div class="label S_txt2">联系人</div>
									<div class="con eplinkman">${enterprise.eplinkman }</div>
								</div>
								<div class="pf-item clearfix">
									<div class="label S_txt2">联系手机</div>
									<div class="con epphone">${enterprise.epphone }</div>
								</div>
								<div class="pf-item clearfix">
									<div class="label S_txt2">企业性质</div>
									<div class="con">${enterprise.eptype}</div>
								</div>
								<div class="pf-item clearfix">
									<div class="label S_txt2">企业规模</div>
									<div class="con">${enterprise.menbers}</div>
								</div>
								<div class="pf-item clearfix">
									<div class="label S_txt2">注册资金</div>
									<div class="con">${enterprise.epcapital}</div>
								</div>
								<div class="pf-item clearfix">
									<div class="label S_txt2">主营模式</div>
									<div class="con">${enterprise.epmodel}</div>
								</div>
								<div class="pf-item clearfix">
									<div class="label S_txt2">主营产品</div>
									<div class="con">${enterprise.products}</div>
								</div>							
								<div class="pf-item clearfix">
									<div class="label S_txt2">企业简介</div>
									<div class="con">${enterprise.epintro}</div>
								</div>
							</div>

							<div class="enterprise-view-edit">							
								<!-- 隐藏字段 -->
								<input id="eid" name="eid" class="input" type="hidden" value="${enterprise.eid }" />						
								<input id="epdomain" name="epdomain" class="input" type="hidden" value="${enterprise.epdomain }" />
								<input id="eplogo" name="eplogo" class="input" type="hidden" value="${enterprise.eplogo }" />
								<input id="position" name="position" class="input" type="hidden" value="${enterprise.position }" />
								<input id="epcreatedate" name="epcreatedate" class="input" type="hidden" value="${enterprise.epcreatedate }" />
								<input id="foundtime" name="foundtime" class="input" type="hidden" value="${enterprise.foundtime }" />
								
								
								<div class="pf-item clearfix">			
								   <div class="label S_txt2">企业全称</div>
								   <div class="con">
								   <input id="epname" name="epname" class="input" type="text" value="${enterprise.epname }" />
								   </div>
								</div>
								
								<div class="pf-item clearfix">
									<div class="label S_txt2">企业编码</div>
									<div class="con">${enterprise.epid }</div>
									<input id="epid" name="epid" class="input" type="hidden" value="${enterprise.epid }" />
							    </div>
							    
								<div class="pf-item clearfix">
									<div class="label S_txt2">联系邮箱</div>
									<div class="con">
								    <input id="epemail" name="epemail" class="input" type="text" value="${enterprise.epemail }" />
									</div>
								</div>
								
								<div class="pf-item clearfix">
									<div class="label S_txt2">联系人</div>
									<div class="con">
								    <input id="eplinkman" name="eplinkman" class="input" type="text" value="${enterprise.eplinkman }" />
									</div>
								</div>

								<div class="pf-item clearfix">
									<div class="label S_txt2">联系手机</div>
									<div class="con">
									<input id="epphone" name="epphone" class="input" type="text" value="${enterprise.epphone }" />
									</div>								
								</div>

								<div class="pf-item clearfix">
									<div class="label S_txt2">企业性质</div>
									<div class="con">${enterprise.eptype }</div>
									<input id="eptype" name="eptype" class="input" type="hidden" value="${enterprise.eptype }" />
								</div>
								
								<div class="pf-item clearfix">
									<div class="label S_txt2">企业规模</div>
									<div class="con">${enterprise.menbers }</div>
									<input id="menbers" name="menbers" class="input" type="hidden" value="${enterprise.menbers }" />
								</div>
								
								<div class="pf-item clearfix">
									<div class="label S_txt2">注册资金</div>
									<div class="con">${enterprise.epcapital}</div>
									<input id="epcapital" name="epcapital" class="input" type="hidden" value="${enterprise.epcapital }" />
								</div>
								
								<div class="pf-item clearfix">
									<div class="label S_txt2">主营模式</div>
									<div class="con">${enterprise.epmodel }</div>
									<input id="epmodel" name="epmodel"  class="input" type="hidden" value="${enterprise.epmodel }" />
								</div>
								
								<div class="pf-item clearfix">
									<div class="label S_txt2">主营产品</div>
									<div class="con">
									${enterprise.products }
									</div>
									<input id="products" name="products" class="input" type="hidden" value="${enterprise.products }" />									
								</div>
								
								<div class="pf-item clearfix">
									<div class="label S_txt2">企业简介</div>
									<div class="con">${enterprise.epintro }</div>
									<input id="epintro" name="epintro" class="input" type="hidden" value="${enterprise.epintro }" />
								</div>
							</div>

						</div>
						<!-- /infoblock -->
						<br/>
						<div class="infoblock">
							<fieldset class="S_line2">
								<legend class="tit S_txt1">企业联系信息</legend>
							</fieldset>
							<div class="btns">
								<a href="javascript:void(0)">
								<span action-data="edit=0" class="contact-action">编辑</span>
								</a>
							</div>

							<div class="contact-view">
								<div class="pf-item clearfix">
									<div class="label S_txt2">企业联系人</div>
									<div class="con linker">${enterprise.linker }</div>
								</div>
								
								<div class="pf-item clearfix">
									<div class="label S_txt2">联系电话</div>
									<div class="con linktel">${enterprise.linktel }</div>
								</div>

								<div class="pf-item clearfix">
									<div class="label S_txt2">公司传真</div>
									<div class="con linkfax">${enterprise.linkfax }</div>
								</div>
								
								<div class="pf-item clearfix">
									<div class="label S_txt2">公司邮箱</div>
									<div class="con linkmail">${enterprise.linkmail }</div>
								</div>
								
								<div class="pf-item clearfix">
									<div class="label S_txt2">公司地址</div>
									<div class="con address">${enterprise.address }</div>
								</div>
								
								<div class="pf-item clearfix">
									<div class="label S_txt2">邮政编码</div>
									<div class="con postcode">${enterprise.postcode }</div>
								</div>
							</div>

							<div class="contact-view-edit">
								<div class="pf-item clearfix">
									<div class="label S_txt2">企业联系人</div>
									<div class="con">
									<input id="linker" name="linker" class="input" type="text" value="${enterprise.linker }"/>
									</div>
								</div>
								
								<div class="pf-item clearfix">
									<div class="label S_txt2">联系电话</div>
									<div class="con">
									<input id="linktel" name="linktel" class="input" type="text" value="${enterprise.linktel }" />
									</div>
								</div>
								
								<div class="pf-item clearfix">
									<div class="label S_txt2">公司传真</div>
									<div class="con">
									<input id="linkfax" name="linkfax" class="input" type="text" value="${enterprise.linkfax }"/>
									</div>
								</div>
								
								<div class="pf-item clearfix">
									<div class="label S_txt2">公司邮箱</div>
									<div class="con">
								    <input id="linkmail" name="linkmail" class="input" type="text" value="${enterprise.linkmail }"/>
									</div>
								</div>
								
								<div class="pf-item clearfix">
									<div class="label S_txt2">公司地址</div>
									<div class="con">
									<input id="address" name="address" class="input" type="text" value="${enterprise.address }"/>
									</div>
								</div>
								
								<div class="pf-item clearfix">
									<div class="label S_txt2">邮政编码</div>
									<div class="con">
									<input id="postcode" name="postcode"  class="input" type="text" value="${enterprise.postcode }"/>
									</div>
								</div>
							</div>

						</div>
						<!-- /infoblock -->
					</form>
				</div>

			</div>
			<!-- /ucenter-box -->
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
	<script src="jsLib/jNotify/jNotify.jquery.min.js"></script>
	<script src="jsLib/jquery/jquery.form.js" type="text/javascript"></script>
	<script src="resources/js/ucenter/user_info.js"></script>
</body>
</html>