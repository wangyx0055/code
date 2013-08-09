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
<link href="jsLib/showLoading/css/showLoading.css" rel="stylesheet" media="screen" />

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
	textarea {
		display: block;
	}
</style>
<style type="text/css"> 
    body{ padding:5px; margin:0; padding-bottom:15px;}
    #layout1{  width:100%;margin:0; padding:0;  }  
    .l-page-top{ height:80px; background:#f8f8f8; margin-bottom:3px;}
    h4{ margin:20px;}
</style>
<style>
    .liger-button {
        margin-bottom: 3px;
    }
</style>

<title>新闻管理</title>
</head>

<body style="padding: 10px">
	<div class="l-loading" style="display:block" id="pageloading"></div>
	<div id="grid"></div>
	<div id="news-window" style="width: 680px;display: none;">
       	<input name="id" type="hidden" value=''/>
       	<input name="originalPic" type="hidden" value=''/>
		<form id="news-form" class="liger-form" style="display: inline-block;width: 300px;" data-validate="{}">
	        <div class="fields">
	            <input name="title" data-type="text" data-label="标题" data-name="title"  validate="{required:true}" />
	            <li data-label="类别" data-type="select" data-name="cid" data-textField="CidName" data-width="200"" validate="{required:true}">
	                <input class="editor" data-data="getCategoryData()" data-textField="text" data-valueField="id"  /> 
	            </li>
	            <input name="author" data-type="text" data-label="发布人" data-name="author" validate="{required:true}"/>
	            <input name="source" data-type="text" data-label="来源" data-name="source" validate="{required:true}"/>
	            <li data-label="显示位置" data-type="select" data-name="isTop" data-textField="IsTopName" data-width="200" validate="{required:true}">
	                <input class="editor" data-data="getLocationData()" data-textField="text" data-valueField="id"  /> 
	            </li>
	            <!-- <input data-type="text" data-label="日期" data-name="pubdate" id="pubdate" data-readonly="true" /> -->
	            <input name="picture" data-type="text" data-label="配图" data-name="picture" />
	        </div>  
	    </form> 
	    <div style="display: inline-block;">
	    	<div style="width: 280px;height: 155px;">
	    		<img alt="新闻配图" class="news-image" width="280px" height="155px" src="resources/images/nopic.gif">
	    	</div>
	    	<div>
	    		<form class="image-form" action="javascript:void(0)" enctype="multipart/form-data">
		    		<label>配图:</label>
			  		<input type="file" name="file"/>
	    		</form>
	    	</div>
	    	<div>
	    		<input type="button" class="liger-button" name="upload" value="上传" data-width="80">
	    		<input type="button" class="liger-button" name="delete" value="撤销" data-width="80">
	    	</div>
	    </div>
	    <div>
	    	<textarea name="content" id="content" style="width:630px;height:300px;visibility:hidden;" ></textarea>
	    </div>
	</div>
	
	
	
	<!-- js -->
	<script type="text/javascript"  src="jsLib/jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript"  src="jsLib/kindeditor-4.1.7/kindeditor.js"></script>
	<script type="text/javascript"  src="jsLib/kindeditor-4.1.7/lang/zh_CN.js"></script>
	
	<script type="text/javascript" src="jsLib/ligerUI/js/ligerui.all.js"></script>
	<script type="text/javascript" src="jsLib/ligerUI/js/ligerGrid.showFilter.js"></script>
	<script type="text/javascript" src="jsLib/showLoading/js/jquery.showLoading.js"></script>
	<script type="text/javascript" src="jsLib/jquery/jquery.form.js"></script>
	<script type="text/javascript" src="jsLib/ligerUI/js/plugins/ligerComboBox.js"></script>
	<script type="text/javascript" src="jsLib/ligerUI/js/plugins/ligerTip.js"></script>
	<script type="text/javascript" src="jsLib/ligerUI/jquery-validation/jquery.validate.min.js"></script>
	<script type="text/javascript" src="jsLib/ligerUI/jquery-validation/jquery.metadata.js"></script>
	<script type="text/javascript" src="jsLib/ligerUI/jquery-validation/messages_cn.js"></script>
	
	<script type="text/javascript" src="resources/js/admin/news.js"></script>
	<script type="text/javascript">
	 function getCountryData() {
         return [
         { Name: '中国', Code: 'ZG' },
         { Name: '德国', Code: 'DG' },
         { Name: '美国', Code: 'MG' },
         { Name: '澳大利亚', Code: 'ADLY' },
         { Name: '加拿大', Code: 'JND' }
         ];
     }
	</script>
</body>
</html>