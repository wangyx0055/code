var newsEidtorWin;	//新闻编辑窗口,全局变量
var newsForm;	//新闻编辑表单
var newsGrid;	//新闻表格	
var editor;		//html编辑器
var validator;	//表单的验证器

$(function() {
	newsGrid = $("#grid").ligerGrid({
		url : 'news/queryNews',
		dataAction : 'server',
		dataType : 'json',
		root : 'result',
		record : 'total',
		width : '100%',
		checkbox: true,
		height : '100%',
		pageSize : 30,
		rownumbers : true,
		groupColumnName:'cid',
		groupRender: function (cid, groupdata) {
            return '类别 ' + renderCid(cid);
        },
		columns : [{
					display : '标题',
					name : 'title',
					align : 'left',
					width : 200,
					minWidth : 100
				}, {
					display : '操作人',
					name : 'author',
					align : 'left',
					width : 100,
					minWidth : 60
				}, {
					display : '类别',
					name : 'cid',
					minWidth : 120,
					render : function(rowdata, index, value){
						return renderCid(value);
					}
				}, {
					display : '更新时间',
					name : 'pubdate',
					minWidth : 140
				}, {
					display : '',
					name : 'id',
					minWidth : 60,
					render : function(rowdata, index, value) {
						var url = 'news/article?cid='
							+ rowdata['cid'] + '&id=' + rowdata['id'];
						return '<a href=' + url
							+ ' target="_blank" style="color:green">查看</a>';
					}
				}],
		toolbar : {
			items : [{
				text : '增加',
				click : addNews,	//增加新闻
				icon : 'add',
				name : 'addNews'
			}, {
				line : true
			}, {
				text : '修改',
				name : 'updateNews',
				click : function(button){
					var record = newsGrid.getSelectedRow();
        			if(record == null){
        				alert("您还未选择任何企业！");
        			} else {
        				showWin(button);	//打开编辑窗口
						resetForm();
						var lform = liger.get("news-form");
						lform.setData(record);
						$("input[name='id']").val(record['id']);
						$("input[name='originalPic']").val(record['picture']);
						editor.html(record['content']);
						if(record['picture']){	//新闻配图src地址设置
							$(".news-image").attr("src", 
								'upload/' + record['picture']);
						}
						
        			}
				},
				icon : 'modify'
			}, {
				line : true
			}, {
				text : '删除',
				click : deleteRows,
				img : 'jsLib/ligerUI/skins/icons/delete.gif'
			}]
		}
	});
	
	/* 图片上传按钮点击事件 */
	$("input[name='upload']").click(function() {
		var filename = $("input[name='file']").val();
		if(filename) {
			var name = filename.split(".")[1].toLowerCase();
			if(name != "jpg" && name != "jpeg" 
				&& name != "gif" && name != "bmp"){
				$.ligerDialog.warn("请选择正确的图片格式！");
				return;
			}
			
			/* 通过ajaxSubmit上传图片 */
			$(".image-form").ajaxSubmit({
					url : "public/uploadFile",
					type : 'post',
					dataType : 'json',
					clearForm : false,
					success : function(data) {
						if (data.success) {
							$("#picture").val(data.message);
							$(".image-form input").val('');
							$(".news-image").attr("src", "upload/" + data.message);
						} 
					},
					error : function() {
						/* FIXME */
						$.ligerDialog.error('提交失败,请稍后重试');
					}
				});
		}
	});

	/* 图片撤销按钮点击事件 */
	$("input[name='delete']").click(function() {
		var picture = $("#picture").val();
		if (picture) {
			
			/* 通过ajax发送请求删除图片 */
			$.ajax({
					   type: "post",
					   url: "public/deleteFile",
					   data: {
							fileName : picture
						},
					   dataType : 'json',
					   success: function(data){
						    if(data.success) {
								$('#picture').val('');
								$(".news-image").attr("src", "resources/images/nopic.gif");
							} 
					   },
					   error : function() {
							/* FIXME */
							$.ligerDialog.error('提交失败,请稍后重试');
						}
					});
		}
	});
	
	$("#pageloading").hide();
});

/**
 * 渲染表格中的分类列
 * @param value	新闻cid值
 * */
function renderCid(value){
	switch(value){
		case 1:
			value = '展会信息';
			break;
		case 2:
			value = '最新推荐';
			break;
		case 3:
			value = '政策法规';
			break;
		case 4:
			value = '最新公告';
			break;
		case 5:
			value = '新闻动态';
			break;
		default:
			value = '无';
	}
	return value;
}

/**
 * 当点击'增加'按钮时候,弹出新闻编辑窗口,在次窗口中进行操作过程
 * @param button 出发click事件的按钮对象
 */
function addNews(button){
	showWin(button);
}

/* 打开新闻编辑窗口 */
function showWin(button){
	/* 新闻编辑窗口对象若不存在则创建并打开，反之则直接打开 */
	if(!newsEidtorWin) {
		/* ligerui初始化弹出窗口 */        
		newsEidtorWin = $.ligerDialog.open({
			title : button.text,
			target :  $("#news-window"),
//			target :  $("div[name='newsWin']"),
			width : 720,
			height : 470,
			isResize: true, 
	    	modal: true,
	    	isDrag: true,
	    	name : button.name,
	    	buttons: [{
	    		text: '提交',
	    		onclick: function(item, dialog) {
	    			var lform = liger.get("news-form");
	    			if (lform.valid()) {
						var url = 'news/addNews';
	    			
		    			/* 当id的value为''时,进行新增,反之修改 */
		    			var vid = $("input[name='id']").val();
		    			if(vid){
		    				url = 'news/updNews';
		    			}
		    			var originalPic = $("input[name='originalPic']").val();
						editor.sync();	//提交前需要执行 sync() 将HTML数据设置到原来的textarea
						var content = $("textarea[name='content']").val();
		    			var data = lform.getData();
		    			data.content = content;
		    			data.id = vid;
		    			data.originalPic = originalPic;
		    			$("#grid").showLoading();
		    			$.ajax({
						   type: "post",
						   url: url,
						   data: data,
						   dataType : 'json',
						   success: function(data){
								newsEidtorWin.hide();
							    if(data.success){
									$.ligerDialog.success(data.message);
									newsGrid.reload();
								} else {
									$.ligerDialog.warn(data.message);
								}
								resetForm();
								$("#grid").hideLoading();
						   },
						   error : function() {
								$.ligerDialog.error('提交失败,请稍后重试');
								resetForm();
								$("#grid").hideLoading();
							}
						});			     
		            }
		            else {
		                lform.showInvalid();
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
	    editor = KindEditor.create('textarea[name="content"]', {
			allowFileManager : true,
			resizeMode : 0,
			width : '99%'
		});
	} else {
		newsEidtorWin.show();
		newsEidtorWin.set("title", button.text);
//		resetForm();
	}
}

/**
 * 多行删除
 * */
function deleteRows(){
	var rows = newsGrid.getCheckedRows();
	if(rows.length == 0) {
		$.ligerDialog.warn('未选中任何新闻');
		return;
	}
	$.ligerDialog.confirm('确定删除已选择新闻', function (yes) {
		
		/* 确认删除,ajax传送id执行删除操作 */
		if(yes == true) {
			var str = "";
			$(rows).each(function(){
				str = str + this.id + ",";	
			});	
			$("#grid").showLoading();
			$.post("news/deleteNews", { "id": str }, function(data){
				 if(data.success) {
				 	$("#grid").hideLoading();
				 	newsGrid.reload();
				 	return;
				 } 
				 $("#grid").hideLoading();
				 $.ligerDialog.error(data.message);
			   }, "json");
		}
	});
}

/* 获取新闻类别数据 */
function getCategoryData() {
	return [{
				id : 1,
				text : '展会信息'
			}, {
				id : 2,
				text : '最新推荐'
			}, {
				id : 3,
				text : '政策法规'
			}, {
				id : 4,
				text : '最新公告'
			}, {
				id : 5,
				text : '新闻动态'
			}];
}

/* 获取新闻类别数据 */
function getLocationData() {
	return [{
				id : 'false',
				text : ' 默认'
			}, {
				id : 'true',
				text : '置顶'
			}];
}

/**
 * 重置表单
 * */
function resetForm(){
	$("input[name='id']").val('');
	$("input[name='originalPic']").val('');
	editor.html('');
	$(".news-image").attr("src", 'resources/images/nopic.gif');
	var lform = liger.get("news-form");
	lform.setData({
		title : '',
		cid : '',
		author : '',
		source : '',
		isTop : '',
		picture : ''
	});
}