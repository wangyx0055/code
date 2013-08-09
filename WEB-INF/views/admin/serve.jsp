<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>服务大全</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
	<style type="text/css" title="currentStyle">
		@import "jsLib/ligerUI/skins/Aqua/css/ligerui-all.css";
		@import "jsLib/ligerUI/skins/ligerui-icons.css";
    	@import "jsLib/ligerUI/skins/Gray/css/all.css";
    	@import "jsLib/kindeditor-4.1.7/themes/default/default.css";
	</style>
	
	<style type="text/css">
	 	.categoryTree{
			overflow:auto;
		}
		.l-menu-item-text {
    		font-family: "微软雅黑","宋体",Arial,sans-serif;
    		font-size: 12px;
		}
		.btn-toolbar {
		    font-size: 0;
		    margin-bottom: 2px;
		    margin-top: 10px;
		    width: 800px;
		}
		.l-toolbar-item-hasicon {
		    padding-left: 4px;
		}
		.l-panel-btn{
		    padding-left: 4px;
			padding-right: 4px;
		}
		.l-table-edit-td{
			padding:10px 2px 8px 10px;
			width:150px;
		}
		.td-lable{
			width:60px;
		}
		
		.thumbnail{
			cursor: pointer;
			color: #6D9DD7;
		}
	</style>
	
	<script src="jsLib/jquery/jquery-1.8.3.min.js"></script>
	<script src="jsLib/jquery/jquery.form.js"></script>
	
    <script type="text/javascript"  src="jsLib/kindeditor-4.1.7/kindeditor.js"></script>
	<script type="text/javascript"  src="jsLib/kindeditor-4.1.7/lang/zh_CN.js"></script>
	
    <script src="jsLib/ligerUI/js/ligerui.min.js"	type="text/javascript"></script>
    
	<script src="resources/js/verify.js"></script>
	<script src="resources/js/admin/serve.js"></script>
	
  </head>
  
<body style="padding:0px;overflow: hidden;">
	<div id="layout1" style="width:99.6%; margin:0 auto; margin-top:2px;">
		<div position="left">
			<div class="categoryTree">
				<div id="toptoolbar" style="width:220px;overflow:hidden; border:1px solid #A3C0E8; "></div>
			    <ul></ul>
		    </div>
		</div>
		<div position="center" title="标题">
			<div class="l-loading" style="display:block" id="pageloading"></div>
			<div id="maingrid"></div>
		</div>
	</div>

	<div id="categoryDiv" style="text-align:center;display:none;">
	   	<form id="categoryForm">
	   		<table cellpadding="0" cellspacing="0" class="l-table-edit" >
		   		<input type="hidden" name="cid" id="cid">
		   		<!-- <input type="hidden" name="leaf" id="leaf"> -->
	   			<tr id="parent-tr">
	                <td align="right" class="l-table-edit-td">父类别名称</td>
	                <td align="left" class="l-table-edit-td">
	                	<input type="text" id="text" ltype="text" disabled/></td>
	                <td align="left"></td>
            	</tr>
            	<tr>
	                <td align="right" class="l-table-edit-td childName">子类别名称</td>
	                <td align="left" class="l-table-edit-td">
	                	<input type="text" id="categoryName" name="text" ltype="text"/></td>
	                <td align="left"></td>
            	</tr>
            	<tr>
	                <td align="right" class="l-table-edit-td">作为叶节点</td>
	                <td align="left" class="l-table-edit-td">
	                	<input type="checkbox" id="isleaf" name="leaf" /></td>
	                <td align="left"></td>
            	</tr>
	    	</table>
	   	</form>
	</div>
	
	<div id="serviceDiv" style="overflow:hidden;display:none;">
   	    <form id="moduleForm" >
   	    	<input type="hidden" name="sid" id="sid">
   	    	<input type="hidden" name="cno" id="cno">
   	    	<input type="hidden" name="cname" id="cname">
   	    	<input type="hidden" name="oldSicon" id="oldSicon">
   	    	<input type="hidden" name="sintro" id="sintro">
   	    	<table cellpadding="0" cellspacing="0" class="l-table-edit" border="0">
	   	    	<tr id="parent-tr">
	                <td align="right" class="td-lable" for="sname">服务名称</td>
	                <td align="left" class="l-table-edit-td" style="width:120px;">
	                	<input type="text" id="sname" name="sname" ltype="text"/>
	                </td>
	                
	                <td align="right" class="td-lable" for="status" style="width:50px;">服务状态</td>
	                <td align="left" class="l-table-edit-td">
	                	<select class="input-medium" name="status" id="status" style="width:150px;">
				    		<option value="createing">建设中</option>
							<option value="opening">开放中</option>
							<option value="stoping">停止服务</option>
				    	</select>
				    </td>
	                
	                <td align="right" class="td-lable" for="sprice" style="width:50px;">服务价格</td>
	                <td align="left" class="l-table-edit-td">
	                	<input style="width:190px;" type="text" id="sprice" type="number" name="sprice" ltype="text" onkeydown="Verifys.checkKeyForFloat(this.value, event);"/>
	                </td>
	           	</tr>
	           	
	           	<tr>
	           		<td align="right" class="td-lable" for="sindex">服务地址</td>
	                <td align="left" class="l-table-edit-td" colspan="3">
	                	<input type="text" id="sindex" name="sindex" ltype="text" style="width:390px;"/>
	                </td>
	                
	                <td align="right" class="td-lable" for="sicon">服务图标</td>
	                <td align="left" class="l-table-edit-td">
	                	<input style="width:190px;" name="sicon" type="text" id="sicon" readonly="readonly" ltype="text" />
	                </td>
	           	</tr>
	           	
	           	<tr>
					<td align="left" width="100%" colspan="6">
						<img src="jsLib/ligerUI/skins/icons/communication.gif">
						<span>服务描述</span>
						<hr style="width:98%;height:1px;border:none;border-top:1px solid #cccccc;" />
					</td>
				</tr>
				
	           	<tr>
	           		<td align="center" colspan="6">
	           			<textarea id="sintor" style="width:800px;height:370px;"></textarea>
	           		</td>
	           	</tr>
	    	</table>
	    </form>
	</div>
	
	<div id="serveThumbnailDiv" style="text-align:center;padding-top:20px;">
    	<img id="serveImages" width="250" height="150" alt="" src="upload/99X99.jpg">
    </div>
	
	<!-- 上传小窗口 -->
	<div id="uploadDiv">
		<div title="本地上传">
			<div style="margin: 10px;">
				<form action="#" id="fileForm" name="fileForm" method="post" enctype="multipart/form-data">
					图片：<input type='file' id="file" name="file" />
					<div class="imageView" style="margin: 5px; " >
						<img alt="图片预览" src="upload/99X99.jpg" width="80" height="50" />
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
