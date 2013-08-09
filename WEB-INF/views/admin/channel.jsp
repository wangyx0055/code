<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<title>模块管理</title>
	
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
	
	<script type="text/javascript" src="jsLib/jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="jsLib/jquery/jquery.form.js"></script>
	<script src="jsLib/ligerUI/js/ligerui.min.js"	type="text/javascript"></script>
	<script src="jsLib/jquery-validation/jquery.validate.min.js" type="text/javascript"></script> 
	<script src="jsLib/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
	<script src="jsLib/jquery-validation/messages_cn.js" type="text/javascript"></script>
	<script type="text/javascript" src="resources/js/admin/channel.js"></script>
</head>
<body>
	<div id="layout">
        <div position="center" style="padding:2px;">
       		<div id="navtab">
				<div class="box-pane tab-pane active" tabid="hotservice" title="热点服务" showClose="true">
					<div class="hotservice icon-1" indexs="1" iconsize="204X100"></div>
					<div class="hotservice icon-2" indexs="2" iconsize="99X99"></div>
					<div class="hotservice icon-3" indexs="3" iconsize="99X99"></div>
					<div class="hotservice icon-4" indexs="4" iconsize="99X99"></div>
					<div class="hotservice icon-5" indexs="5" iconsize="99X99"></div>
					<div class="hotservice icon-6" indexs="6" iconsize="99X99"></div>
					<div class="hotservice icon-7" indexs="7" iconsize="99X99"></div>
					<div class="hotservice icon-8" indexs="8" iconsize="99X99"></div>
					<div class="hotservice icon-9" indexs="9" iconsize="99X99"></div>
					<div class="hotservice icon-10" indexs="10" iconsize="205X205"></div>
					<div class="hotservice icon-11" indexs="11" iconsize="204X100"></div>
					<div class="hotservice icon-12" indexs="12" iconsize="204X100"></div>
					<div class="hotservice icon-13" indexs="13" iconsize="99X99"></div>
					<div class="hotservice icon-14" indexs="14" iconsize="99X99"></div>
					<div class="hotservice icon-15" indexs="15" iconsize="99X99"></div>
					<div id="moduleApply" style="position:fixed;top:380px;margin-left:260px;cursor:pointer;">
						<img alt="" src="resources/images/apply_btn.png">
					</div>
				</div>
				
				<div class="box-pane tab-pane" tabid="epshow" title="企业风采" showClose="true">
					<div class="epshow ep-icon-1" indexs="1" iconsize="204X100"></div>
					<div class="epshow ep-icon-2" indexs="2" iconsize="99X99"></div>
					<div class="epshow ep-icon-3" indexs="3" iconsize="99X99"></div>
					<div class="epshow ep-icon-4" indexs="4" iconsize="205X205"></div>
					<div class="epshow ep-icon-5" indexs="5" iconsize="204X100"></div>
					<div class="epshow ep-icon-6" indexs="6" iconsize="99X99"></div>
					<div class="epshow ep-icon-7" indexs="7" iconsize="99X99"></div>
					<div class="epshow ep-icon-8" indexs="8" iconsize="99X99"></div>
					<div class="epshow ep-icon-9" indexs="9" iconsize="99X99"></div>
					<div class="epshow ep-icon-10" indexs="10" iconsize="204X100"></div>
					<div class="epshow ep-icon-11" indexs="11" iconsize="99X99"></div>
					<div class="epshow ep-icon-12" indexs="12" iconsize="99X99"></div>
					<div class="epshow ep-icon-13" indexs="13" iconsize="204X100"></div>
					<div class="epshow ep-icon-14" indexs="14" iconsize="99X99"></div>
					<div id="moduleApplyEnterprise" style="position:fixed;top:380px;margin-left:260px;cursor:pointer;">
						<img alt="" src="resources/images/apply_btn.png">
					</div>
				</div>
				
				<div class="box-pane tab-pane" tabid="hjmake" title="厚街制造" showClose="true">
					<div class="hjmake hj-icon-1" indexs="1" iconsize="204X100">1</div>
					<div class="hjmake hj-icon-2" indexs="2" iconsize="99X99">2</div>
					<div class="hjmake hj-icon-3" indexs="3" iconsize="99X99">3</div>
					<div class="hjmake hj-icon-4" indexs="4" iconsize="205X205">4</div>
					<div class="hjmake hj-icon-5" indexs="5" iconsize="204X100">5</div>
					<div class="hjmake hj-icon-6" indexs="6" iconsize="99X99">6</div>
					<div class="hjmake hj-icon-7" indexs="7" iconsize="99X99">7</div>
					<div class="hjmake hj-icon-8" indexs="8" iconsize="99X99">8</div>
					<div class="hjmake hj-icon-9" indexs="9" iconsize="99X99">9</div>
					<div class="hjmake hj-icon-10" indexs="10" iconsize="204X100">10</div>
					<div class="hjmake hj-icon-11" indexs="11" iconsize="99X99">11</div>
					<div class="hjmake hj-icon-12" indexs="12" iconsize="99X99">12</div>
					<div class="hjmake hj-icon-13" indexs="13" iconsize="204X100">13</div>
					<div class="hjmake hj-icon-14" indexs="14" iconsize="99X99">14</div>
					<div id="moduleApplyHj" style="position:fixed;top:380px;margin-left:260px;cursor:pointer;">
						<img alt="" src="resources/images/apply_btn.png">
					</div>

				</div>
				
				<!-- 电商荟萃 -->
				<div class="box-pane tab-pane" tabid="ebusiness" title="电商荟萃" showClose="true">
					<div class="ebusiness eb-icon-1" indexs="1" iconsize="204X100">1</div>
					<div class="ebusiness eb-icon-2" indexs="2" iconsize="99X99">2</div>
					<div class="ebusiness eb-icon-3" indexs="3" iconsize="99X99">3</div>
					<div class="ebusiness eb-icon-4" indexs="4" iconsize="205X205">4</div>
					<div class="ebusiness eb-icon-5" indexs="5" iconsize="204X100">5</div>
					<div class="ebusiness eb-icon-6" indexs="6" iconsize="99X99">6</div>
					<div class="ebusiness eb-icon-7" indexs="7" iconsize="99X99">7</div>
					<div class="ebusiness eb-icon-8" indexs="8" iconsize="99X99">8</div>
					<div class="ebusiness eb-icon-9" indexs="9" iconsize="99X99">9</div>
					<div class="ebusiness eb-icon-10" indexs="10" iconsize="204X100">10</div>
					<div class="ebusiness eb-icon-11" indexs="11" iconsize="99X99">11</div>
					<div class="ebusiness eb-icon-12" indexs="12" iconsize="99X99">12</div>
					<div class="ebusiness eb-icon-13" indexs="13" iconsize="204X100">13</div>
					<div class="ebusiness eb-icon-14" indexs="14" iconsize="99X99">14</div>
					<div id="moduleApplyDs" style="position:fixed;top:380px;margin-left:260px;cursor:pointer;">
						<img alt="" src="resources/images/apply_btn.png">
					</div>
				</div>
				
				<!-- 厚街商贸 -->
				<div class="box-pane tab-pane" tabid="hjbusiness" title="厚街商贸 " showClose="true">
					<div class="hjbusiness hb-icon-1" indexs="1" iconsize="204X100">1</div>
					<div class="hjbusiness hb-icon-2" indexs="2" iconsize="99X99">2</div>
					<div class="hjbusiness hb-icon-3" indexs="3" iconsize="99X99">3</div>
					<div class="hjbusiness hb-icon-4" indexs="4" iconsize="205X205">4</div>
					<div class="hjbusiness hb-icon-5" indexs="5" iconsize="204X100">5</div>
					<div class="hjbusiness hb-icon-6" indexs="6" iconsize="99X99">6</div>
					<div class="hjbusiness hb-icon-7" indexs="7" iconsize="99X99">7</div>
					<div class="hjbusiness hb-icon-8" indexs="8" iconsize="99X99">8</div>
					<div class="hjbusiness hb-icon-9" indexs="9" iconsize="99X99">9</div>
					<div class="hjbusiness hb-icon-10" indexs="10" iconsize="204X100">10</div>
					<div class="hjbusiness hb-icon-11" indexs="11" iconsize="99X99">11</div>
					<div class="hjbusiness hb-icon-12" indexs="12" iconsize="99X99">12</div>
					<div class="hjbusiness hb-icon-13" indexs="13" iconsize="204X100">13</div>
					<div class="hjbusiness hb-icon-14" indexs="14" iconsize="99X99">14</div>
					<div id="moduleApplyDs" style="position:fixed;top:380px;margin-left:260px;cursor:pointer;">
						<img alt="" src="resources/images/apply_btn.png">
					</div>
				</div>
			</div>
        </div>
    </div>
    
    <div id="moduleDiv" style="display: none;">
		<form name="moduleForm" method="post" id="moduleForm">
			<div>
				<input id="mid" name="mid" type="hidden">
				<input id="oldMicon" name="oldMicon" type="hidden">
				<input id="mposition" name="mposition" type="hidden">
				<input id="moduleAndID" name="moduleAndID" type="hidden">
			</div>
			<table class="l-table-edit" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td align="right" width="15%" class="l-table-edit-td">模块分类：</td>
					<td align="left" width="35%" class="l-table-edit-td">
						<input name="moduleSort" type="text" id="moduleSort" ltype="select" />
					</td>
					
					<td align="right" width="15%" class="l-table-edit-td">模块内容：</td>
					<td align="left" width="35%" class="l-table-edit-td">
						<input name="moduleContent" type="text" id="moduleContent" ltype="select" />
					</td>
				</tr>
				
				<tr>
					<td align="right" class="l-table-edit-td">色块名称：</td>
					<td align="left" class="l-table-edit-td">
						<input name="mname" type="text" id="mname" ltype="text" />
					</td>
					
					<td align="right" class="l-table-edit-td">色块编码：</td>
					<td align="left" class="l-table-edit-td">
						<input name="mcode" type="text" id="mcode" ltype="text" />
					</td>
				</tr>
				
				<tr>
					<td align="right" class="l-table-edit-td">所属频道：</td>
					<td align="left" class="l-table-edit-td">
						<input name="Nmchannel" type="text" id="Nmchannel" ltype="select" />
					</td>
					
					<td align="right" class="l-table-edit-td">色块状态：</td>
					<td align="left" class="l-table-edit-td">
						<input name="Nstatus" type="text" id="Nstatus" ltype='select' />
					</td>
				</tr>
				
				<tr>
					<td align="right" class="l-table-edit-td">授权地址：</td>
					<td align="left" class="l-table-edit-td">
						<input name="mdirect" type="text" id="mdirect" ltype="text" />
					</td>
					
					<td align="right" class="l-table-edit-td">链接首页：</td>
					<td align="left" class="l-table-edit-td">
						<input name="mindex" type="text" id="mindex" ltype="text" />
					</td>
				</tr>
				
				<tr>
					<td align="right" class="l-table-edit-td">链接方式：</td>
					<td align="left" class="l-table-edit-td">
						<input id="linktype1" type="radio" name="linktype" value="1" checked="checked" />
						<label for="linktype1">跳转</label>&nbsp;&nbsp;
						<input id="linktype2" type="radio" name="linktype" value="2" />
						<label for="linktype2">弹窗</label>
					</td>
					
					<td align="right" class="l-table-edit-td">是否授权：</td>
					<td align="left" class="l-table-edit-td">
						<input name="nauthor" type="checkbox" id="nauthor"/>
					</td>
				</tr>
				
				<tr>
					<td align="right" class="l-table-edit-td">是否登录：</td>
					<td align="left" class="l-table-edit-td">
						<input id="nlogin" type="checkbox" name="nlogin" checked="checked" />
					</td>
					
					<td align="right" class="l-table-edit-td">色块图标：</td>
					<td align="left" class="l-table-edit-td">
						<input name="micon" type="text" id="micon" size="15" ltype="text" />
					</td>
				</tr>
				
				<tr>
					<td align="right" class="l-table-edit-td">模块描述：</td>
					<td align="left" class="l-table-edit-td" colspan="9">
						<textarea name="mdesc" id="mdesc" cols="100" rows="4" class="l-textarea" style="width:94%"></textarea>
					</td>
				</tr>
			</table>
		</form>
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
	<!-- end 上传小窗口 -->
</body>
</html>

