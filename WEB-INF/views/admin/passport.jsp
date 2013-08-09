<!-- 
author : pangyf
since : 2013-7-30
 -->   
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

<link href="jsLib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<link href="jsLib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />
<link href="jsLib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="jsLib/kindeditor-4.1.7/themes/default/default.css" /> 

<style type="text/css">
       body{ font-size:12px;}
    .l-table-edit {}
    .l-table-edit-td{ padding:4px;}
    .l-button-submit,.l-button-test{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
    .l-verify-tip{ left:230px; top:120px;}
    #errorLabelContainer{ padding:10px; width:300px; border:1px solid #FF4466; display:none; background:#FFEEEE; color:Red;}
	.l-text{width : 180px;}
</style>
<style>
	form {
		margin: 0;
	}	
</style>
<style type="text/css"> 
    body{ padding:5px; margin:0; padding-bottom:15px;}
    #layout1{  width:100%;margin:0; padding:0;  }  
    .l-page-top{ height:80px; background:#f8f8f8; margin-bottom:3px;}
    h4{ margin:20px;}
</style>

<title>账号管理</title>
</head>

<body style="padding: 10px">
	<!--loading层  -->
	<div class="l-loading" style="display:block" id="pageloading"></div>
	<!--表格层  -->
	<div id="grid"></div>
	<!--表单层  -->
	<div id="passport-window" style="width: 680px;display: none;">
       	    	
       	<input name="uid" type="hidden" value=''/>
       	<input name="uregdate" type="hidden" value=''/>  
		<form id="passport-form" class="liger-form"  style="display: inline-block;width: 660px;" data-validate="{}">
			<div class="l-group l-group-hasicon" style="width: 1183.7px;">
				<img src="jsLib/ligerUI/skins/icons/communication.gif">
				<span>账号基础信息</span>
				<div class="togglebtn"></div>
			</div>
	        <div class="fields">	        		        	
	        	<input name="upassid" id="upassid" data-type="text" data-label="用户帐号" data-name="upassid"  data-newline="true" validate="{required:true}" data-group="1" data-groupicon="../icons/communication.gif"/> 
	            <input name="uname" data-type="text" data-label="用户姓名" data-name="uname" data-newline="false" validate="{required:true}"/>
	            <input name="upassword" id="upassword" data-label="用户密码" data-name="upassword" data-newline="true" validate="{required:true}" />	            
	            <input name="upassword2" data-type="text" data-label="确认密码" data-name="upassword2" data-newline="false" validate="{required:true}"/>	
	            <input name="eid" digits="true" data-type="digits" data-label="企业ID" data-name="eid" data-newline="true"  validate="{required:true}"/>	
	            <input name="epid" digits="true"  data-label="企业编码" data-name="epid" data-newline="false"  validate="{required:true}"/>	
	            <input name="epname" data-type="text" data-label="企业名称" data-name="epname" data-newline="true" validate="{required:true}"/>	
	            <input name="epdomain" data-type="text" data-label="企业域名" data-name="epdomain" data-newline="flase" validate="{required:false}"/>	
	            <input name="pname" data-type="text" data-label="平台名称" data-name="pname" data-newline="true" validate="{required:false}" /> 
	            <input name="pid" data-type="digits" data-label="平台主键" data-name="pid" data-newline="flase" validate="{required:true}"/>
	        </div>  
	    </form> 	    
	</div>
	
	
	
	<!-- js -->
	<script type="text/javascript" src="jsLib/jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="jsLib/kindeditor-4.1.7/kindeditor.js"></script>
	<script type="text/javascript" src="jsLib/kindeditor-4.1.7/lang/zh_CN.js"></script>	
	<script type="text/javascript" src="jsLib/ligerUI/js/ligerui.all.js"></script>
	<script type="text/javascript" src="jsLib/ligerUI/js/ligerGrid.showFilter.js"></script>
	<script type="text/javascript" src="jsLib/showLoading/js/jquery.showLoading.js"></script>
	<script type="text/javascript" src="jsLib/jquery/jquery.form.js"></script>
	<script type="text/javascript" src="jsLib/ligerUI/js/plugins/ligerComboBox.js"></script>
	<script type="text/javascript" src="jsLib/ligerUI/js/plugins/ligerTip.js"></script>
	<script type="text/javascript" src="jsLib/ligerUI/jquery-validation/jquery.validate.min.js"></script>
	<script type="text/javascript" src="jsLib/ligerUI/jquery-validation/jquery.metadata.js"></script>
	<script type="text/javascript" src="jsLib/ligerUI/jquery-validation/messages_cn.js"></script>	
	<script type="text/javascript" src="jsLib/jquery/jquery.md5.js"></script>
	<script type="text/javascript" src="resources/js/admin/passport.js"></script>
	
</body>
</html>