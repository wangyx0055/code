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
	<link href="jsLib/showLoading/css/showLoading.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="jsLib/jquery.fancybox/jquery.fancybox.css" type="text/css" media="screen" />
	<style type="text/css">
         body{ font-size:12px;}
        .l-table-edit {}
        .l-table-edit-td{ padding:4px;}
        .l-button-submit,.l-button-reset,.btn-submit-product,.btn-reset-product{width:80px;margin-left:10px; padding-bottom:2px;}
        .l-verify-tip{left:230px; top:120px;}
        .l-text-field{top:2px;left:2px;}
        .search{margin: 10px;}
        .search-form {
        	margin : 20px;
        }
        .search-label {
        	width: 80px;
        	display: block;
        	float: left;
        	padding-top: 2px;
        	text-align: right;
        }
        .search-label-input {
        	display:inline-block;
        	padding-left:20px;
        }
    </style>
</head>
<body style="padding:1px; overflow:hidden;">
	<div class="l-loading" style="display:block" id="pageloading"></div>
	
	<form class="enterprise-edit-form" style="display:none;" >
		<div>
			<input type="hidden" id="eid" name="eid" value="">
			<input type="hidden" id="epcreatedate" name="epcreatedate">
			<!-- <input type="hidden" id="eplogo" name="eplogo"> -->
		</div>
		<table cellpadding="0" cellspacing="0" class="l-table-edit" border="0" width="100%">
			<tr>
				<td align="left" class="l-table-edit-td" width="100%" colspan=6>
					<img src="jsLib/ligerUI/skins/icons/communication.gif">
					<span>基础信息</span>
					<hr style="height:1px;border:none;border-top:1px solid #cccccc;" />
				</td>
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td" width="18%">企业名称:</td>
				<td align="left" class="l-table-edit-td">
					<input name="epname" type="text" id="epname" ltype="text" validate="{required:true}" size=50 />
				</td>
				<td align="left" width="14%"></td>
				
				<td align="right" class="l-table-edit-td">企业地址:</td>
				<td align="left" class="l-table-edit-td">
					<input name="epaddress" type="text" id="epaddress" ltype="text" size=30 />
				</td>
				<td align="left"></td>
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td">企业编码:</td>
				<td align="left" class="l-table-edit-td">
					<input name="epid" type="text" id="epid" ltype='text' value="" validate="{required:true}"  size=30 />
				</td>
				<td align="left"></td>
				
				<td align="right" class="l-table-edit-td" width="18%">企业域名:</td>
				<td align="left" class="l-table-edit-td" width="28%">
					<input name="epdomain" type="text" id="epdomain" ltype="text" validate="{required:true}" size=30 />
				</td>
				<td align="left" width="5%"></td>
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td" valign="top">平台联系人:</td>
				<td align="left" class="l-table-edit-td">
					<input name="eplinkman" type="text" id="eplinkman" ltype="text" size=30 />
				</td>
				<td align="left"></td>
				
				<td align="right" class="l-table-edit-td" valign="top">平台联系电话:</td>
				<td align="left" class="l-table-edit-td">
					<input name="epphone" type="text" id="epphone" ltype="text" size=30 />
				</td>
				<td align="left"></td>
				
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td">平台邮箱:</td>
				<td align="left" class="l-table-edit-td">
					<input name="epemail" type="text" id="epemail" ltype="text" validate="{required:false,email:true}" size=30 />
				</td>
				<td align="left"></td>
				
				<td align="right" class="l-table-edit-td">年营业额:</td>
				<td align="left" class="l-table-edit-td">
					<input name="turnover" type="text" id="turnover" ltype='text' value="" size=30 />
				</td>
				<td align="left"></td>

			</tr>
			<tr>
				<td align="right" class="l-table-edit-td" valign="top">成立日期:</td>
				<td align="left" class="l-table-edit-td">
					<input name="foundtime" type="text" id="foundtime" ltype="date" validate="{required:false}" size=30 />
				</td>
				<td align="left"></td>
				
				<td align="right" class="l-table-edit-td" valign="top">企业性质:</td>
				<td align="left" class="l-table-edit-td">
					<input type="text" id="eptype" name="eptype" ltype="select" size=30 />
				</td>
				<td align="left"></td>
				
			</tr>

			<tr>
				<td align="right" class="l-table-edit-td">注册资金:</td>
				<td align="left" class="l-table-edit-td">
					<input name="epcapital" type="text" id="epcapital" ltype="text" size=30 />
				</td>
				<td align="left"></td>
				
				<td align="right" class="l-table-edit-td">经营模式:</td>
				<td align="left" class="l-table-edit-td">
					<input type="text" id="epmodel" name="epmodel	" ltype="select" size=30  />
				</td>
				<td align="left"></td>
				
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td">员工人数:</td>
				<td align="left" class="l-table-edit-td">
					<input type="text" id="menbers" name="menbers" ltype="select" size=30 />
				</td>
				<td align="left"></td>
				
				<td align="right" class="l-table-edit-td">主营产品:</td>
				<td align="left" class="l-table-edit-td">
					<input name="products" type="text" id="products" ltype='text' value="" size=30 />
				</td>
				<td align="left"></td>
				
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td" width="18%">所属频道:</td>
				<td align="left" class="l-table-edit-td">
					<!-- <select  name="mchannel" validate="{required:true}">
			        		<option value="epshow">企业风采</option>
			        		<option value="hjbusiness">厚街商贸</option>
	        		</select> -->
	        		<input type="text" id="enterp-mchannel" name="mchannel" ltype="select" size=30  
        			        	validate="{required:true}"  nullText="不能为空!"/>
				</td>
				<td align="left" width="14%"></td>
				<td align="right" class="l-table-edit-td"></td>
				<td align="left" class="l-table-edit-td">
				</td>
				<td align="left"></td>
			</tr>
			<tr>
				<td align="left" class="l-table-edit-td" width="100%" colspan=6>
					<img src="jsLib/ligerUI/skins/icons/communication.gif">
					<span>企业联系信息</span>
					<hr style="height:1px;border:none;border-top:1px solid #cccccc;" />
				</td>
			</tr>

			<tr>
				<td align="right" class="l-table-edit-td" valign="top">企业联系人:</td>
				<td align="left" class="l-table-edit-td">
					<input name="linker" type="text" id="linker" ltype="text" size=30 />
				</td>
				<td align="left"></td>
				
				<td align="right" class="l-table-edit-td" valign="top">企业联系电话:</td>
				<td align="left" class="l-table-edit-td">
					<input name="linktel" type="text" id="linktel" ltype="text" size=30 />
				</td>
				<td align="left"></td>
				
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td" valign="top">企业传真</td>
				<td align="left" class="l-table-edit-td">
					<input name="linkfax" type="text" id="linkfax" ltype="text" size=30 />
				</td>
				<td align="left"></td>
				
				<td align="right" class="l-table-edit-td" valign="top">企业邮箱</td>
				<td align="left" class="l-table-edit-td">
					<input name="linkmail" type="text" id="linkmail" ltype="text" validate="{required:false,email:true}" size=30 />
				</td>
				<td align="left"></td>
				
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td" valign="top">企业地址</td>
				<td align="left" class="l-table-edit-td">
					<input name="address" type="text" id="address" ltype="text" size=30 />
				</td>
				<td align="left"></td>
				
				<td align="right" class="l-table-edit-td" valign="top">企业邮编</td>
				<td align="left" class="l-table-edit-td">
					<input name="postcode" type="text" id="postcode" ltype="text" size=30 />
				</td>
				<td align="left"></td>
				
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td">logo:</td>
				<td align="left" class="l-table-edit-td">
					<input name="eplogo" type="text" id="eplogo" readonly="readonly"/>
					<!-- <a href="javascript:void(0)" style="padding-left: 0;" >查看</a> -->
				</td>
				<td align="left">
					<input type="button" value="选择" onclick="g_module='enterprise';g_showFileManager();"/>
					<a href="resources/images/nopic.gif" class="fancybox">预览</a>
				</td>
				<td align="right" class="l-table-edit-td">网站:</td>
				<td align="left" class="l-table-edit-td">
					<input name="website" type="text" id="website" ltype='text' value="" size=30 />
				</td>
				<td align="left"></td>
			</tr>
			<!-- <tr>
				<td align="center" style="height:190px" valign="top" colspan=8>
				</td>
					<textarea id="epintro" style="width:99%;height:160px;visibility:hidden;"></textarea>
			</tr> -->
		</table>
		
		<textarea id="epintro" style="width:99%;height:160px;visibility:hidden;"></textarea>
	</form>
			<div id="enterprise-grid" class="enterprise-grid"></div>
        
        	<!-- <div name="grid_product"></div> -->
        	<form  class="form_product liger-form"  style="display: none;">
        		<input name="pid" id="pid" type="hidden"/>
        		<input name="picture_b" id="picture_b"type="hidden"/>
        		<input name="picture_s" id="picture_s" type="hidden"/>
        		<input name="eid" id="eid_product" type="hidden"/>
        		<table cellpadding="0" cellspacing="0" class="l-table-edit">
        			<tr>
		                <td align="right" class="l-table-edit-td">所属频道:</td>
		                <td align="left" class="l-table-edit-td" style="width:160px">
        			        <input type="text" id="mchannel" name="mchannel" ltype="select" size=30  
        			        	validate="{required:true}"  nullText="不能为空!"/>
        			   </td>
        			   
		                <td align="right" style="display:none;width: 84px;" class=canbe_to_batch_id>单位：</td>
		                <td align="left" style="display:none;" class=canbe_to_batch_id>
		                	<input name="pmonad" type="text" id="pmonad" ltype="text" size=30 /></td>
        			   
		                <td align="right" style="display:none;width: 84px;" class=canbe_to_batch_id1>产品价格：</td>
		                <td align="left" style="display:none;" class=canbe_to_batch_id1>
		                	<input name="price" type="text" id="price" ltype="text" size=30 validate="{required:false,digits:true}" /></td>
        			   
		            </tr>
		       
        			<tr>
		                <td align="right" class="l-table-edit-td">产品名称:</td>
		                <td align="left" class="l-table-edit-td" style="width:160px">
		                		<input name="pname" id="pname" type="text"  class="l-text"
		                		validate="{required:true,minlength:1,maxlength:30}" />
		                </td>
		                
		                <td align="right" style="display:none;" class=canbe_to_batch_id>起订量：</td>
		                <td align="left" style="display:none;" class=canbe_to_batch_id><input name="pminimum" type="text"  data-newline="true" id="pminimum" ltype="text" size=30 /></td>
		                
		                <td align="right" style="display:none;" class=canbe_to_batch_id1>网店地址：</td>
		                <td align="left" style="display:none;" class=canbe_to_batch_id1><input name="store" type="text" id="store" ltype="text" size=30 /></td>
		                
		            </tr>
        			<tr>
		                <td align="right" class="l-table-edit-td">产品分类：</td>
		                <td align="left" class="l-table-edit-td" style="width:160px">
		                		<input name="ptype" type="text" id="ptype" ltype="text" size=30 /></td>
		                <td align="right" style="display:none;" class=canbe_to_batch_id>产品供货价格：</td>
		                <td align="left" style="display:none;" class=canbe_to_batch_id>
		                	<input name="supplyprice" type="text" id="supplyprice" ltype="text" size=30 validate="{required:false,digits:true}"/></td>
		            	<td></td>
		            	<td></td>
		            </tr>
        			<tr>
		                <td align="right" class="l-table-edit-td">规格型号：</td>
		                <td align="left" class="l-table-edit-td" style="width:160px">
		                	<!-- <input name="pname" id="pname" type="text" ltype="text" 
		                		validate="{required:true,minlength:1,maxlength:30}" /> -->
		                		<input name="pversion" type="text" id="pversion" ltype="text" size=30 /></td>
		                <td align="right" style="display:none;" class=canbe_to_batch_id>产地：</td>
		                <td align="left" style="display:none;" class=canbe_to_batch_id><input name="field" type="text" id="field" ltype="text" size=30 /></td>
		           		<td></td>
		            	<td></td>
		            </tr>
        			<tr>
		                <td align="right" class="l-table-edit-td">公司：</td>
		                <td align="left" class="l-table-edit-td" style="width:160px">
		                	<!-- <input name="pname" id="pname" type="text" ltype="text" 
		                		validate="{required:true,minlength:1,maxlength:30}" /> -->
		                		<input name="company" type="text" id="company" ltype="text" size=30 /></td>
		                <td align="right" style="display:none;" class=canbe_to_batch_id>运输方式：</td>
		                <td align="left" style="display:none;" class=canbe_to_batch_id><input name="pattern" type="text" id="pattern" ltype="text" size=30 /></td>
		           		<td></td>
		            	<td></td>
		            </tr>
        			
		            <tr>
		                <td align="right" class="l-table-edit-td">产品图片:</td>
		                <td align="left" class="l-table-edit-td" style="width:160px">
		                	<!-- <input name="image" type="file" /> -->
		                	<input class="product-image" name="product-image" type="text" readonly="readonly" class="l-text"/>
		                </td>
		                <td align="left" >
		                	<input type="button" value="选择" onclick="g_module='product';g_showFileManager();"/>
		                </td>
		                <td></td>
		            	<td></td>
		            	<td></td>
		            </tr>
        		</table>
			    <div>
			    	<textarea id="pintro" name="pintro" style="width:630px;height:300px;visibility:hidden;"></textarea>
			    </div>
        	</form>
       		<div id="preImage" align="center" style="display: none;overflow: hidden;">
       			<img alt="预览产品图片"  src="resources/images/nopic.gif">
       		</div>
       		<div class="search" style="display: none;">
       			<form method="post" class="search" style="margin-top: 20px;">
       				<div class="search">
       					<label class="search-label">企业所属频道:</label>
       					<div class="search-label-input">
       				<select id="emchannel" name="emchannel" style="width: 130px;">
		        		<option >             </option>
		        		<option value="epshow">企业风采</option>
		        		<option value="hjbusiness">厚街商贸</option>
        			 </select>
       					</div>
       				</div>
       			
       				<div class="search">
       					<label class="search-label">企业名:</label>
       					<div class="search-label-input">
       						<input type="text"  name="epname" class="l-text" />
       					</div>
       				</div>
       				<!-- <div class="search">
       					<label class="search-label">域名:</label>
       					<div class="search-label-input">
       						<input type="text" name="epdomain" class="l-text" />
       					</div>
       				</div>
       				<div class="search">
       					<label class="search-label">联系人:</label>
       					<div class="search-label-input">
	       					<input type="text" name="eplinkman" class="l-text" />
       					</div>
       				</div>
       				<div class="search">
       					<label class="search-label">地址:</label>
       					<div class="search-label-input">
       						<input type="text" name="epaddress" class="l-text" />
       					</div>
       				</div> -->
       				<div class="search">
       					<label class="search-label">起始:</label>
       					<div class="search-label-input">
       						<input type="text" name="from" />
       					</div>
       				</div>
       				<div class="search">
       					<label class="search-label">结束:</label>
       					<div class="search-label-input">
       						<input type="text" name="end" />
       					</div>
       				</div>
       			</form>
       		</div>
	<div>
		<form class="picupload-form" style="display:none;" enctype="multipart/form-data">
			<div>
				<input type="file" class="picupload" name="file"/>
			</div>
		</form>
	</div>
	
	
	<script type="text/javascript" src="jsLib/jquery/jquery-1.8.3.min.js"></script>
	
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
    <script type="text/javascript" src="jsLib/jquery.fancybox/jquery.fancybox.pack.js"></script>
    <script type="text/javascript" src="resources/js/admin/enterprise.js"></script>
</body>
</html>