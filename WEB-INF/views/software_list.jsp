<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>正版软件-中小企业公共服务平台</title>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<link href="resources/css/soft.css" rel="stylesheet" type="text/css">
</head>
<body>
	<input type="hidden" value="${treeCid }" id="tree_cid" />
	<input type="hidden" value="${treeName }" id="tree_cname" />
	<jsp:include page="head.jsp" flush="true" />
	<!-- /header -->
	<div class="container">
		<ul class="breadcrumb">
			<li><a href="public/index">首页</a> <span class="divider">/</span>
			</li>
			<li class="active">${cname }</li>
		</ul>
	</div>
	<!-- /container -->
	<div class="container">
		<div class="soft-wrap">
			<div class="sidebar pull-left">
				<div class="column-bar" id="divTree">
					<%--
            <h3 class="head">正版软件</h3>
            <ul class="list">
               <li><a href="software.action">MICROSOFT 软件</a></li>
               <li><a href="software.action">赛门铁克数据和系统备份</a></li>
               <li><a href="software.action">赛门铁克防病毒、加密类软件</a>
                   <ul>
                     <li><a href="software.action">Symantec Endpoint Protection</a></li>
                     <li><a href="software.action">Symantec PGP 加密软件</a></li>
                   </ul>
               </li>
               <li><a href="software.action">深信服上网行为管控和安全类产品</a>
                   <ul>
                     <li><a href="software.action">AC 上网行为管理</a></li>
                     <li><a href="software.action">深信服下一代防火墙</a></li>
                     <li><a href="software.action">深信服SG 上网优化网关</a></li>
                   </ul>
               </li>
               <li><a href="software.action">IP-GUARD 上网行为管理软件</a></li>
               <li><a href="software.action">CAD 辅助设计软件</a></li>
               <li><a href="software.action">ADOBE</a></li>
               <li><a href="software.action">技术服务参考收费标准</a></li>
               <li><a href="software.action">其他系列产品</a></li>
            </ul>
         --%>
				</div>
			</div>
			<!-- /sidebar -->
			<div class="content pull-right">
				<h3 class="head">全部软件</h3>
				<table class="soft-data" style="width: 100%">
					<thead>
						<tr>
							<th width="114">产品编号</th>
							<th width="150">产品名称</th>
							<th width="260">产品描述</th>
							<th width="96">价格</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${serviceList }" var="item">
							<tr>
								<td align="center">${item.sid }</td>
								<td>${item.sname}</td>
								<td>${item.sintro}</td>
								<td align="center"><span class="price">${item.sprice}元</span></td>
								<td align="center"><a class="apply apply-btn"
									href="javascript:void(0);" data-sid='3' data-sname='发明专利'
									data-sprice='1000'>申请</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="pagination pagination-centered">
					<form id="thisForm" name="thisForm" method="post" action="">
						<input type="hidden" name="serve.cno" value="${cno }" />
						<div class="sabrosus">
							<span>${pageStr}</span>
						</div>
					</form>

				</div>
			</div>
			<!-- /content -->
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

	<!-- 申请窗口 -->
	<div class="apply-html hide">
		<form class="apply-form">
			<table style="width: 100%" class="apply-data">
				<tr>
					<td class="s1">服务名称：</td>
					<td>发明专利</td>
				</tr>
				<tr>
					<td class="s1">价格：</td>
					<td>3500元</td>
				</tr>
				<tr>
					<td class="s1">联系人姓名：</td>
					<td><input id="apply-name" type="text"><span
						class="apply-name-info"></span></td>
				</tr>
				<tr>
					<td class="s1">联系电话：</td>
					<td><input id="apply-tel" type="text"><span
						class="apply-tel-info"></span></td>
				</tr>
				<tr>
					<td class="s1">邮箱：</td>
					<td><input id="apply-email" type="text"><span
						class="apply-email-info"></span></td>
				</tr>
				<tr>
					<td colspan="2">请您如实填写以上信息，服务申请成功后我们将与您联系具体事宜</td>
				</tr>
			</table>
		</form>
	</div>
	<script src="resources/js/service.js"></script>
</body>
</html>
