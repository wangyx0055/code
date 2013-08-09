<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
	<base href="<%=basePath%>">
	<title>平台管理</title>
	
	<link href="jsLib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="jsLib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />
	<link href="jsLib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css"/>
	<link href="jsLib/artDialog-5.0.3/skins/default.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
         body{ font-size:12px;}
        .l-table-edit {}
        .l-table-edit-td{ padding:4px;}
        .l-button-submit,.l-button-reset,.btn-submit-product,.btn-reset-product{width:80px;margin-left:10px; padding-bottom:2px;}
        .l-verify-tip{left:230px; top:120px;}
        .l-text-field{top:2px;left:2px;}
    </style>
</head>
<body style="padding:1px; overflow:hidden;">
	<div class="l-loading" style="display:block" id="pageloading"></div>
	
	<form class="enterprise-edit-form" style="display:none;" enctype="multipart/form-data">
		<div>
			<input type="hidden" id="eid" name="eid">
			<input type="hidden" id="epcreatedate" name="epcreatedate">
			<input type="hidden" id="oldEplogo" name="oldEplogo">
		</div>
		<table cellpadding="0" cellspacing="0" class="l-table-edit" border="0" width="100%">
			<tr>
				<td align="left" class="l-table-edit-td" width="100%" colspan=6>
					<img src="jsLib/ligerUI/skins/icons/communication.gif">
					<span>厚街基本信息</span>
					<hr style="height:1px;border:none;border-top:1px solid #cccccc;" />
				</td>
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td" width="18%">厚街制造名称:</td>
				<td align="left" class="l-table-edit-td">
					<input name="name" type="text" id="name" ltype="text" validate="{required:true}" size=50 />
				</td>
				<td align="left" width="3%"></td>
				

			<tr>
<!-- 				<td align="right" class="l-table-edit-td">网站:</td> -->
<!-- 				<td align="left" class="l-table-edit-td"> -->
<!-- 					<input name="website" type="text" id="website" ltype='text' value="" size=30 /> -->
<!-- 				</td> -->
<!-- 				<td align="left"></td> -->
				
				<td align="right" class="l-table-edit-td">logo:</td>
				<td align="left" class="l-table-edit-td">
					<input name="image" type="file" id="image" value="" size=20 />
				</td>
				<td align="left"></td>
				
			</tr>
			<tr>
				<td align="left" class="l-table-edit-td" width="100%" colspan=6>
					<img src="jsLib/ligerUI/skins/icons/communication.gif">
					<span>厚街制造介绍</span>
					<hr style="height:1px;border:none;border-top:1px solid #cccccc;" />
				</td>
			</tr>
			
			<tr>
				<td align="center" style="height:190px" valign="top" colspan=8>
					<textarea id="epintro" style="width:99%;height:160px;visibility:hidden;"></textarea>
				</td>
			</tr>
		</table>
		<div style="position:absolute;top:413px;left:0px;background-color:#F7F7F7;border-top:1px solid #C6C6C6;width:97.4%;">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td align="right" class="l-table-edit-td" style="width:83%;">
						<input type="submit" value="保存" class="l-button l-button-submit" /> 
					</td>
					<td align="left" class="l-table-edit-td">
						<input name="cancelEnterprise" type="button" value="取消" class="l-button l-button-reset"/>
					</td>

				</tr>
			</table>
		</div>
	</form>
			<div class="enterprise-grid"></div>
        
        	<!-- <div name="grid_product"></div> -->
        	<form enctype="multipart/form-data" class="form_product"   style="display: none;">
        		<input name="pid" id="pid" type="hidden"/>
        		<input name="picture_b" id="picture_b" type="hidden"/>
        		<input name="picture_s" id="picture_s" type="hidden"/>
        		<input name="eid" id="eid_product" type="hidden"/>
        		<table cellpadding="0" cellspacing="0" class="l-table-edit">
        			<tr>
		                <td align="right" class="l-table-edit-td">产品名称:</td>
		                <td align="left" class="l-table-edit-td" style="width:160px">
		                	<!-- <input name="pname" id="pname" type="text" ltype="text" 
		                		validate="{required:true,minlength:1,maxlength:30}" /> -->
		                		<input name="pname" id="pname" type="text"  class="l-text"
		                		validate="{required:true,minlength:1,maxlength:30}" /></td>
		                <td align="left"></td>
		            </tr>
		            <tr>
		                <td align="right" class="l-table-edit-td">上传图片:</td>
		                <td align="left" class="l-table-edit-td" style="width:160px">
		                	<input name="image" type="file"   /></td>
		                <td align="left"></td>
		            </tr>
        		</table>
        		<!-- <div id="maingrid1" >
        			产品名称:<input name="pname" id="pname"  type="text"/>
			    </div>
			    <div id="maingrid2" >
			    	<input name="image" type="file"   />
			    </div> -->
			    <div>
			    	<textarea id="pintro" name="pintro" style="width:630px;height:300px;visibility:hidden;"></textarea>
			    </div>
			    <div style="position:absolute;top:413px;left:0px;background-color:#F7F7F7;border-top:1px solid #C6C6C6;width:97.4%;">
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td align="right" class="l-table-edit-td" style="width:83%;">
								<input type="submit" value="保存" class="l-button btn-submit-product" /> 
							</td>
							<td align="left" class="l-table-edit-td">
								<input name="cancel_product" type="button" value="取消" class="l-button btn-reset-product"/>
							</td>
		
						</tr>
					</table>
				</div>
        	</form>
       
		
	<script type="text/javascript" src="jsLib/jquery/jquery-1.3.2.min.js"></script>
	
	<script type="text/javascript"  src="jsLib/kindeditor-4.1.7/kindeditor.js"></script>
	<script type="text/javascript"  src="jsLib/kindeditor-4.1.7/lang/zh_CN.js"></script>
	
	<script type="text/javascript" src="jsLib/ligerUI/js/ligerui.all.js"></script>
	<script type="text/javascript" src="jsLib/ligerUI/js/ligerGrid.showFilter.js"></script>
	<script type="text/javascript" src="jsLib/artDialog-5.0.3/artDialog.min.js"></script>
	<script type="text/javascript" src="jsLib/showLoading/js/jquery.showLoading.js"></script>
	<script type="text/javascript" src="jsLib/jquery/jquery.form.js"></script>
	<script type="text/javascript" src="jsLib/ligerUI/js/plugins/ligerComboBox.js"></script>
	<script type="text/javascript" src="jsLib/ligerUI/js/plugins/ligerTip.js"></script>
	<script type="text/javascript" src="jsLib/ligerUI/jquery-validation/jquery.validate.min.js"></script>
	<script type="text/javascript" src="jsLib/ligerUI/jquery-validation/jquery.metadata.js"></script>
	<script type="text/javascript" src="jsLib/ligerUI/jquery-validation/messages_cn.js"></script>
    <script type="text/javascript" src="resources/js/admin/hjmake.js"></script>
</body>
</html>