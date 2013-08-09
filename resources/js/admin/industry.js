/**
 * author : pangyf
 * since : 2013-7-30
 * */ 

var industryEidtorWin;	//企业行业编辑窗口,全局变量
var industryGrid;	//企业行业表格
var validator;	//表单的验证器
var editor;		//html编辑器

$(function() {
	industryGrid = $("#grid").ligerGrid({
		url: "industry/getAllIndustry",
    	method: "get",
    	root: "data",
        height:'100%',
        pageSize:25,
	    rownumbers:true,		
		columns: [
		          //{display: '行业ID', name: 'industryId'}, 
		          {display: '行业名称', name: 'industryName'},
		          {display: '行业编号', name: 'industryCode' },
		          {display: '关联货品主类别', name: 'correlCategory'},
		          {display: '描述', name: 'descript' }],
		toolbar : {
			items : [{
				text : '添加',
				icon : 'add',
				name : 'addIndustry',
				click : addIndustry		//添加行业
			},{
				line : true
			}, {
				text : '修改',
				name : 'updateIndustry',
				icon : 'modify',
				click :function(item){							
							updateIndustry(item,industryGrid.getSelectedRow());	//修改行业(item对象与选择的行对象)	
						}
			}, {
				line : true
			}, {
				text : '删除',				
				icon : 'delete',
				click : deleteRow	//单行删除行业
			}]
		},		
    	onDblClickRow : function (data, rowindex, rowobj){		//双击行事件的处理	    	
	    	var item = {text : '修改',	name : 'updateIndustry'};	    	
	    	updateIndustry(item,industryGrid.getSelectedRow());    //修改行业(item对象与选择的行对象)
		}
	});
	
	$("#pageloading").hide();
});

/**
 * 当点击'增加'按钮时候,弹出行业编辑窗口,在次窗口中进行操作过程
 * @param item 发出click事件的按钮对象
 */
function addIndustry(item){
	showWin(item);
}

/**
 * 当点击'修改'按钮时候,弹出行业编辑窗口,在次窗口中进行操作过程
 * @param item 发出click事件的按钮对象
 * @param record 选择的行对象
 */
function updateIndustry(item,record){	
	if(record == null){
		$.ligerDialog.warn("您还未选择任何行业！");		
	} else {
		showWin(item);
		resetForm();
		var industryForm = liger.get("industry-form");
		industryForm.setData(record);
		$("input[name='industryId']").val(record.industryId);		//将record对象中industryId的值赋予输入框industry					
		editor.html(record.descript);
	}	
}

/**
 * 打开行业编辑窗口
 * @param item 发出click事件的按钮对象 
 */
function showWin(item){
	
	/* 账号编辑窗口对象若不存在则创建并打开，反之则直接打开 */
	if(!industryEidtorWin) {
		
		/* ligerui初始化弹出窗口 */        
		industryEidtorWin = $.ligerDialog.open({
			title : item.text,
			target :  $("#industry-window"),
			width : 720,
			height : 470,
			isResize: false, 
	    	modal: true,
	    	isDrag: true,
	    	name : item.name,
	    	buttons: [{
	    		text: '保存',
	    		onclick: function(item, dialog) {
	    			
	    			var industryForm = liger.get("industry-form");
	    			
	    			if (industryForm.valid()) {		//当industryForm不为空时，进行下一步	    				
						var url = 'industry/addIndustry';
						var data = industryForm.getData();
						/* 当id的value为''时,进行新增,反之修改 */
		    			var industryId = $("input[name='industryId']").val();		    			
		    			if(industryId){
		    				url = 'industry/updateIndustry';
		    			} 
		    			editor.sync();	//提交前需要执行 sync() 将HTML数据设置到原来的textarea		    			
		    			data.descript = $("textarea[name='descript']").val();		    			
		    			$.ajax({
						   type: "post",
						   url: url,						   
						   data: data,
						   dataType : 'json',
						   success: function(data){
								industryEidtorWin.hide();
								if(data.success){
									if(!industryId){		//如果industryId不存在则进行的是添加操作
										$.ligerDialog.success('添加成功');									
									}else {
										$.ligerDialog.success('修改成功');
									}
									industryGrid.reload();							    
									resetForm();
							 	}else{
							 		if(!industryId){
										$.ligerDialog.error('添加失败');									
									}else {
										$.ligerDialog.error('修改失败');
									}
									industryGrid.reload();							    
									resetForm();
							 	}
						   },
						   error : function() {
							   	industryEidtorWin.hide();
								if(!industryId){
									$.ligerDialog.error('添加失败');
									
								}else {
									$.ligerDialog.error('修改失败');
								}
								industryGrid.reload();	
								resetForm();
							}
						});			     
		            }
		            else {
		                industryForm.showInvalid();
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
	    
		/* 初始化html编辑器,kindeditor */
	    editor = KindEditor.create('textarea[name="descript"]', {
			allowFileManager : false,
			resizeMode : 0,						
			width : '99%',
			height : 300
		});
	    
	} else {
		industryEidtorWin.show();
		industryEidtorWin.set("title", item.text);
		resetForm();
	}
}

/**
 * 删除账号
 * */
function deleteRow(){
	var record = industryGrid.getSelectedRow();
	if(record  == null) {
		$.ligerDialog.warn('未选中任何行业');
		return;
	}
	$.ligerDialog.confirm('确定删除行业'+record.industryName+'?', function (yes) {
		/* 确认删除,ajax传送industryId(PK)执行删除操作 */
		if(yes == true) {			
			$.ajax({				
				url : 'industry/deleteIndustry',
				type : 'POST',
				dataType : 'json',
				data :{industryId : record.industryId},
				success : function(data){
					if(data.success){
						$.ligerDialog.success('删除成功');									
						industryGrid.reload();
						return;
				 	}else{
				 		$.ligerDialog.error('删除失败');									
						industryGrid.reload();
						return;
				 	} 
				},
				error : function() {					
					$.ligerDialog.error('删除失败');					
					industryGrid.reload();
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
	var industryForm = liger.get("industry-form");	
	industryForm.setData({		
		industryName : '',
		industryCode : '',		
		correlCategory: ''		
	});
	$("input[name='industryId']").val('');
	editor.html('');
}