/**
 * author : pangyf
 * since : 2013-7-30
 * */ 

var passportEidtorWin;	//账号编辑窗口,全局变量
var passportGrid;	//账号编辑表格
var validator;	//表单的验证器

$(function() {
	passportGrid = $("#grid").ligerGrid({
		url: "passport/getAllPassport",
    	method: "get",
    	root: "data",
        height:'100%',
        pageSize:25,
	    rownumbers:true,		
		columns: [
		          {display: '用户帐号', name: 'upassid'}, 
		          {display: '用户姓名', name: 'uname'},
		          {display: '平台名称', name: 'pname' },
		          {display: '企业名称', name: 'epname' },
		          {display: '企业域名', name: 'epdomain'},
		          {display: '注册时间', name: 'uregdate'},
		          {display: '帐号状态', name: 'ustatus'}],
		toolbar : {
			items : [{
				text : '修改',
				name : 'updatePassport',
				icon : 'modify',
				click :function(item){							
							updatePassport(item,passportGrid.getSelectedRow());	//修改账号(item对象与选择的行对象)
					
						}
			}, {
				line : true
			}, {
				text : '删除',				
				icon : 'delete',
				click : deleteRow	//单行删除账号
			}]
		},		
    	onDblClickRow : function (data, rowindex, rowobj){		//双击行事件的处理	    	
	    	var item = {text : '修改',	name : 'updatePassport'};	    	
	    	updatePassport(item,passportGrid.getSelectedRow());    //修改账号(item对象与选择的行对象)
    	}
	});
	
	$("#pageloading").hide();
});



/**
 * 当点击'修改'按钮时候,弹出账号编辑窗口,在次窗口中进行操作过程
 * @param item 发出click事件的按钮对象
 * @param record 选择的行对象
 */
function updatePassport(item,record){	
	if(record == null){
		$.ligerDialog.warn("您还未选择任何账号！");		
	} else {
		showWin(item);
		resetForm();
		
		var passportForm = liger.get("passport-form");		
		passportForm.setData({
			
			uid : record.uid,
			upassid : record.upassid,
			uname : record.uname,
			upassword : '',
			upassword2: '',
			pname : record.pname,
			epname : record.epname,
			epdomain : record.epdomain,
			eid : record.eid,
			pid : record.pid,
			epid : record.epid,
			uregdate : record.uregdate
			
		});
		//$("input[name='uid']").val(record['uid']);	//将record对象中uid的值赋予隐藏元素（uid）		
		//$("input[name='uregdate']").val(record['uregdate']);
		
	}	
}

/**
 * 打开账号编辑窗口
 * @param item 发出click事件的按钮对象 
 */
function showWin(item){
	
	/* 账号编辑窗口对象若不存在则创建并打开，反之则直接打开 */
	if(!passportEidtorWin) {
		
		/* ligerui初始化弹出窗口 */        
		passportEidtorWin = $.ligerDialog.open({
			title : item.text,
			target :  $("#passport-window"),
			width : 720,
			height : 470,
			isResize: true, 
	    	modal: true,
	    	isDrag: true,
	    	name : item.name,
	    	buttons: [{
	    		text: '保存',
	    		onclick: function(item, dialog) {
	    			
	    			var passportForm = liger.get("passport-form");
	    			
	    			
	    			if (passportForm.valid()) {
	    				
		    			url = 'passport/updatePassport'; 
		    			var data = passportForm.getData();
		    			var oldDate =  data.uregdate;
		    			
		    			if(data.uregdate){		//防止注册时间为空的情况		    				
		    				oldDate = new Date(Date.parse(oldDate.replace(/\-/g,"/")));	//将Sting类型的uregdate转成Date类型
		    			}
		    			
		    			if(data.upassword == data.upassword2){
		    				$.ajax({
								   type: "post",
								   url: url,						   
								   data: {
									   	uid : $.trim(data.uid),
									   	upassid : $.trim(data.upassid),
										uname : $.trim(data.uname),
										upassword : $.md5($.trim(data.upassword)),										
										pname : $.trim(data.pname),
										epname : $.trim(data.epname),
										epdomain : $.trim(data.epdomain),
										eid : $.trim(data.eid),	
										pid : $.trim(data.pid),
										epid : $.trim(data.epid),
										uregdate : oldDate					
								   },
								   dataType : 'json',
								   success: function(data){
										passportEidtorWin.hide();
										if(data.success){
											
											$.ligerDialog.success('修改成功！');									
											passportGrid.reload();							    
											resetForm();
											
									 	}else{
									 		
											$.ligerDialog.error('修改失败！');									
											passportGrid.reload();							    
											resetForm();
									 	} 
										
								   },
								   error : function() {
									   
									   	passportEidtorWin.hide();								
										$.ligerDialog.error('修改失败！');								
										passportGrid.reload();	
										resetForm();
									}
								});			
		    			}else {
		    				$.ligerDialog.warn("两次输入的密码不一致！");
		    			}
		    			     
		            }
		            else {
		                passportForm.showInvalid();
		                return;
		            }
	    		}
    		}, { 
    			text: '取消',
    			onclick: function (item, dialog){
    				resetForm();
    				dialog.hide(); 
    			}
    		}]		
	    });
		
		$("#upassid").ligerGetTextBoxManager().setDisabled();		//设置用户账号为只读	
		
	} else {
		passportEidtorWin.show();
		passportEidtorWin.set("title", item.text);
		resetForm();
	}
}

/**
 * 删除账号
 * */
function deleteRow(){
	var record = passportGrid.getSelectedRow();
	if(record  == null) {
		$.ligerDialog.warn('未选中任何账号！');
		return;
	}
	$.ligerDialog.confirm('确定删除账号'+record.upassid+'?', function (yes) {
		/* 确认删除,ajax传送industryId(PK)执行删除操作 */
		if(yes == true) {			
			$.ajax({				
				url : 'passport/deletePassport',
				type : 'POST',
				dataType : 'json',
				data :{uid : record.uid},
				success : function(data){
					if(data.success){
						$.ligerDialog.success('删除成功！');									
						passportGrid.reload();
						return;
				 	}else{
				 		$.ligerDialog.error('删除失败！');									
						passportGrid.reload();
						return;
				 	} 
				},
				error : function() {					
					$.ligerDialog.error('删除失败！');					
					passportGrid.reload();
				 	return;
				}			
		    });	
		    		
		}
	});
}

/**
 * 重置表单
 * */
function resetForm(){
	//$("input[name='uid']").val('');
	//$("input[name='uregdate']").val('');
	var passportForm = liger.get("passport-form");
	passportForm.setData({
		uid : '',
		upassid : '',
		uname : '',
		upassword : '',
		upassword2: '',
		pname : '',
		epname : '',
		epdomain : '',
		eid : '',
		pid : '',
		epid : '',
		uregdate : ''
		
	});
}