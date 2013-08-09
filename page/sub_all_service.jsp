<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
<title>服务大全-中小企业公共服务平台</title>
<link href="../resources/css/style.css" rel="stylesheet" type="text/css">
<link href="../resources/css/service.css" rel="stylesheet" type="text/css">
<!--[if IE]>
<link href="../resources/css/ie.css" rel="stylesheet" type="text/css">
<![endif]-->
</head>
<body>
	<div class="header">
		<div class="container">
			<div class="logo pull-left">
				<a href=""><img src="../resources/images/logo.png"> </a>
			</div>
			<div class="search-box pull-left">
				<form name="searchForm">
					<input class="input" type="text" id="keyword" name="keyword">
					<button type="button" class="btn" id="searchButIndex"></button>
				</form>
			</div>
			<ul class="top-navs pull-right">
				<%-- <s:if test="#session.passport == null">
					<li class="login-btn"><a href="login.action">登陆</a></li>
					<li class="user-menu dropdown hide"><a
						href="javascript:void(0)" data-toggle="dropdown"><s:property
								value="#session.passport.uname" /> </a>
						<ul class="dropdown-menu">
							<li><a href="#">用户中心</a></li>
							<li><a href="admin.action" target="_blank">管理后台</a></li>
							<li><a href="#">修改密码</a></li>
							<li><a class="logout-btn" href="#">注销登录</a></li>
						</ul>
					</li>
				</s:if>
				<s:else>
					<li class="login-btn hide"><a href="login.action">登陆</a></li>
					<li class="user-menu dropdown"><a href="javascript:void(0)"
						data-toggle="dropdown"><s:property
								value="#session.passport.upassID" /> </a>
						<ul class="dropdown-menu">
							<li><a href="#">用户中心</a></li>
							<li><a href="admin.action" target="_blank">管理后台</a></li>
							<li><a href="#">修改密码</a></li>
							<li><a class="logout-btn" href="#">注销登录</a></li>
						</ul>
					</li>
				</s:else> --%>
				<li><a href="">在线客服</a></li>
				<li><a href="">网站导航</a></li>
			</ul>
		</div>
	</div>
	<!-- /header -->
<div class="container">
<ul class="breadcrumb">
      <li><a href="#">首页</a> <span class="divider">/</span></li>
	  <li class="active">服务大全</li>
</div>
<!-- /container -->
<div class="container">
   <div class="service-box">
      <div class="sidebar pull-left">
         <div class="sub-column-bar">
            <h3 class="head">全部服务分类</h3>
            <ul class="list">
               <li class="level-1"><a href="">政企服务</a></li>
               <li class="level-1"><a href="">信息化服务</a></li>
               <li class="level-1"><a class="collapsed" href="javascript:void(0)">知识产权服务<i class="switch"></i></a>
                   <ul>
                     <li class="level-2"><a class="collapsed" href="javascript:void(0)">管理软件<i class="switch"></i></a>
                         <ul>
                         <li class="level-3"><a href="">管理软件</a> </li>
                         <li class="level-3"><a href="">定制软件</a></li>
                         <li class="level-3"><a href="">正版软件</a></li>
                         </ul>
                     </li>
                     <li class="level-2"><a href="">定制软件</a></li>
                     <li class="level-2"><a href="">正版软件</a></li>
                   </ul>
               </li>
               <li class="level-1"><a href="">可共用设备项目</a></li>
               <li class="level-1"><a href="">技术创新与质检</a></li>
               <li class="level-1"><a href="">人才培训项目</a></li>
               <li class="level-1"><a href="">市场服务</a></li>
            </ul>
         </div>
         <!-- /column-bar -->
      </div>
      <div class="content pull-right">
         <h3 class="title">推荐企业</h3>
         <div class="list">
             <div class="mini-box">
                 <div class="top"><a href=""><img src="../resources/images/photo_7.jpg"></a></div>
                 <div class="bottom">
                   <h3><span class="pull-left">发明专利</span><span class="num pull-right">12854人申请</span></h3>
                   <p class="btn" align="center"><a href=""><img src="../resources/images/apply2_btn.jpg"></a></p>
                 </div>
             </div>
             <div class="mini-box">
                 <div class="top"><a href=""><img src="../resources/images/photo_7.jpg"></a></div>
                 <div class="bottom">
                   <h3><span class="pull-left">发明专利</span><span class="num pull-right">12854人申请</span></h3>
                   <p class="btn" align="center"><a href=""><img src="../resources/images/apply2_btn.jpg"></a></p>
                 </div>
             </div>
             <div class="mini-box">
                 <div class="top"><a href=""><img src="../resources/images/photo_7.jpg"></a></div>
                 <div class="bottom">
                   <h3><span class="pull-left">发明专利</span><span class="num pull-right">12854人申请</span></h3>
                   <p class="btn" align="center"><a href=""><img src="../resources/images/apply2_btn.jpg"></a></p>
                 </div>
             </div>
             <div class="mini-box">
                 <div class="top"><a href=""><img src="../resources/images/photo_7.jpg"></a></div>
                 <div class="bottom">
                   <h3><span class="pull-left">发明专利</span><span class="num pull-right">12854人申请</span></h3>
                   <p class="btn" align="center"><a href=""><img src="../resources/images/apply2_btn.jpg"></a></p>
                 </div>
             </div>
             <div class="mini-box">
                 <div class="top"><a href=""><img src="../resources/images/photo_7.jpg"></a></div>
                 <div class="bottom">
                   <h3><span class="pull-left">发明专利</span><span class="num pull-right">12854人申请</span></h3>
                   <p class="btn" align="center"><a href=""><img src="../resources/images/apply2_btn.jpg"></a></p>
                 </div>
             </div>
             <div class="mini-box">
                 <div class="top"><a href=""><img src="../resources/images/photo_7.jpg"></a></div>
                 <div class="bottom">
                   <h3><span class="pull-left">发明专利</span><span class="num pull-right">12854人申请</span></h3>
                   <p class="btn" align="center"><a href=""><img src="../resources/images/apply2_btn.jpg"></a></p>
                 </div>
             </div>
             <div class="mini-box">
                 <div class="top"><a href=""><img src="../resources/images/photo_7.jpg"></a></div>
                 <div class="bottom">
                   <h3><span class="pull-left">发明专利</span><span class="num pull-right">12854人申请</span></h3>
                   <p class="btn" align="center"><a href=""><img src="../resources/images/apply2_btn.jpg"></a></p>
                 </div>
             </div>
             <div class="mini-box">
                 <div class="top"><a href=""><img src="../resources/images/photo_7.jpg"></a></div>
                 <div class="bottom">
                   <h3><span class="pull-left">发明专利</span><span class="num pull-right">12854人申请</span></h3>
                   <p class="btn" align="center"><a href=""><img src="../resources/images/apply2_btn.jpg"></a></p>
                 </div>
             </div>
             <div class="mini-box">
                 <div class="top"><a href=""><img src="../resources/images/photo_7.jpg"></a></div>
                 <div class="bottom">
                   <h3><span class="pull-left">发明专利</span><span class="num pull-right">12854人申请</span></h3>
                   <p class="btn" align="center"><a href=""><img src="../resources/images/apply2_btn.jpg"></a></p>
                 </div>
             </div>
         </div>
         <div class="pagination pagination-centered">
		     <form action="" method="post" name="thisForm" id="thisForm">
			 <input type="hidden" value="2" name="cid">						
			 <div class="sabrosus">
			 <span>
             <ul> <li class="active"><a href="javascript:GoPage(1)">1</a></li> <li><a href="javascript:GoPage(2)">2</a></li><li class="disabled"><a href="javascript:GoPage(2)  ">»</a></li></ul><input type="hidden" id="ipage" name="ipage">
             </span>
			 </div>
			 </form>
		</div>
      </div>
   </div>
</div>
<!-- /container -->
	<div class="footer">
		<p class="p1">主办 ：厚街镇经济科技信息局 | 承办：东莞市力凯科技发展有限公司 |
			技术支持：深圳市依格欣计算机技术有限公司</p>
		<p class="p2">备案号：粤ICP备11040663号-1 |
			增值电信业务经营许可证：B2-20060558号(ICP加挂服务)</p>
		<p class="p2">&copy;2012 东莞市力凯科技发展有限公司 版权所有</p>
	</div>
	<script src="../jsLib/jquery/jquery-1.9.0.min.js"></script>
	<script src="../resources/js/service.js"></script>
</body>
</html>