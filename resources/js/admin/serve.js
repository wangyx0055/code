$(function () {
	var treePanel = null, categoryNode = null, addOrUpdate = "addCategory";
	treeGridAutoHeight();
	$("#layout1").ligerLayout({
    	leftWidth: 220,
    	height: '100%'
    });
	window.onresize = function(){treeGridAutoHeight();};
	$("#toptoolbar").ligerToolBar({
		items : [{
			id : 'addBaseCategory',
			text : '添加根类别',
			click : addOrUpdateCategory
		}, {
			line : true
		}, {
			text : '展开',
			click : function(){
				treePanel.expandAll();
			}
		}, {
			line : true
		}, {
			text : '收缩',
			click : function(){
				treePanel.collapseAll();
			}
		}, {
			line : true
		}, {
			text : '刷新',
			click : function(){
				treePanel.loadData(null, 'category/getServiceTree');
			}
		}]
	});
	var treeRightKeyMenu = $.ligerMenu({
		top : 100,
		left : 100,
		width : 120,
		items : [{
			id : 'addCategory',
			text : '添加类别',
			click : addOrUpdateCategory
		}, {
			id : 'delCategory',
			text : '删除类别',
			click : function(){
				$.ajax({
					type : 'POST',
					dataType : 'json',
					url : 'category/deleteServiceTree',
					data : {"cid" : categoryNode.data.cid},
					success : function(data){
						if(data.success){
							var parentNode = treePanel.getParentTreeItem(categoryNode.target);
							treePanel.remove(categoryNode.target);
							if(parentNode){
								var childrenCount = $(parentNode).children("ul").children("li").length;
								if(!childrenCount){
									treePanel.demotion(parentNode);//给节点降级为子节点
								}
							}
						} else {
							alert(data.errorfield);
						}
					}
			    });
			}
		}, {
			id : 'modifyCategory',
			text : '修改类别',
			click : addOrUpdateCategory
		}, {
			line : true
		}, {
			id : 'addServe',
			text : '添加服务',
			click : function(item, i){
				saveService(item);
			}
		}]
	});
	
	treePanel = $(".categoryTree ul").ligerTree({
		url: 'category/getServiceTree',
		checkbox : false,
		isexpand : false,
		onSuccess : function(data){
			this.clear();
			this.setData(data[0].children);
		},
		onClick : function(node, e) {
			categoryNode = node;
			$("#cid").val(node.data.cid);
//			if(!($(node.target).children("ul").children("li").length)){
			if(node.data.leaf){
				grid.loadServerData({
					'cno' : node.data.cid,
					'page' : 1,
					'pagesize' : 10
				});
				grid.setParm('cno',node.data.cid);
			}
		},
		onContextmenu: function (node, e) {
			categoryNode = node;
			if(node.data.leaf){
				treeRightKeyMenu.setEnabled("addServe");
				treeRightKeyMenu.setDisable("addCategory");
			} else {
				treeRightKeyMenu.setDisable("addServe");
				treeRightKeyMenu.setEnabled("addCategory");
			}
			$("#cid").val(node.data.cid);
			$("#text").val(node.data.text);
			$("#leaf").val(node.data.leaf);
            treeRightKeyMenu.show({ 
            	top: e.pageY, 
            	left: e.pageX 
            });
            return false;
        }
	});
	
	//是否叶节点监听事件
	$("#isleaf").click(function(){
		$(this).val($(this).is(':checked'));
	});
	
	function addOrUpdateCategory(item, i){
		addOrUpdate = item.id;
		if(addOrUpdate == "addBaseCategory"){	//添加跟类别
			$("#cid").val('1');
			$("#leaf").val(false);
			$("#categoryName").val("");
			$("#parent-tr").hide();
			$(".childName").html("根类别名称");
			
		} else if(addOrUpdate == "modifyCategory"){	//修改类别
			var parentNode = treePanel.getParent(categoryNode.target);
			if(parentNode){
				$("#text").val(parentNode.text);
			} else {
				$("#text").val("");
			}
			$("#categoryName").val(categoryNode.data.text);
			$("#isleaf").attr("checked", categoryNode.data.leaf);
			$("#parent-tr").show();
			$(".childName").html("子类别名称");
		} else {	//添加类别
			$("#categoryName").val("");
			$("#parent-tr").show();
			$(".childName").html("子类别名称");
		}
		$.ligerDialog.open({
        	title: item.text,
        	height: "auto",
        	width: 250,
        	isResize: true, 
        	modal: true,
        	target: $("#categoryDiv"),
        	buttons: [{
        		text: '保存',
        		onclick: function(item, dialog){
        			if($("#categoryName").val() == ""){
						return alert("类别名称不能够为空");
					}
					$.ajax({
						type : 'POST',
						url : 'category/'+ ((addOrUpdate == "modifyCategory") ? 'updateServiceTree' : 'addServiceTree'),
						dataType : 'json',
//						data : $("#categoryForm").serialize(),//序列化表单里所有的内容
						data : {
							cid : $("#cid").val(),
							text : $("#categoryName").val(),
							leaf : $("#isleaf").val()
						},
						success : function(data){
							if(data.success){
								if (addOrUpdate == "addBaseCategory"){
									treePanel.append(null, [{
										cid : data.errorfield,
										text : $("#categoryName").val(),
										leaf : $("#isleaf").is(":checked"),
										parentid : 0,
										children : $("#isleaf").is(":checked") ? null : []
									}]);
								} else if(addOrUpdate == "addCategory"){
									var childrenCount = $(categoryNode.target).children("ul").children("li").length;
									if(!childrenCount){
										treePanel.upgrade(categoryNode.target);//给节点升级为父节点
									}
									treePanel.append(categoryNode.target, [{
										cid : data.errorfield,
										text : $("#categoryName").val(),
										leaf : $("#isleaf").is(":checked"),
										parentid : categoryNode.data.cid,
										children : $("#isleaf").is(":checked") ? null : []
									}]);
								} else {
									treePanel.update(categoryNode.target, {
										text : $("#categoryName").val(),
										leaf : $("#isleaf").is(":checked"),
										children : $("#isleaf").is(":checked") ? null : []
									});
									if($("#isleaf").is(":checked")) {
									 	treePanel.demotion(categoryNode.target);
									} else{
										treePanel.upgrade(categoryNode.target);//给节点升级为父节点
									}
								}
								dialog.hide();
							} else {
								alert(data.errorfield);
							}
							$("#categoryForm")[0].reset();
						}
				    });
        		}
        	},{
        		text: '关闭',
        		onclick: function(item, dialog){
        			dialog.hide();
        		}
        	}]
        });
    }
    
    window['grid'] = $("#maingrid").ligerGrid({
    	url : 'service/getAllServeBycon',
    	method : 'get',
    	root: "data",
    	width : '99%',
        height :'100%',
        record : 'total',
        pageSize : 10,
        rownumbers:true,
        parms : {
        	'cno' : categoryNode ? categoryNode.data.cid : "0"
        },
        columns: [{
        	display: '服务名称',
        	name: 'sname',
        	width: 150,
        	maxWidth: 220 
        }, { 
        	display: '服务价格',
        	name: 'sprice',
        	maxWidth: 80
        }, { 
        	display: '服务缩略图',
        	name: 'sicon',
        	width: 120,
        	maxWidth: 220,
        	render : function(rowdata, index, value){
        		return '<a class="thumbnail" onclick="serveThumbnailView(\''+ value +'\')">查看缩略图</a>';
        	}
        }, {
        	display: '服务类别名称',
        	name: 'cname',
        	width: 120,
        	maxWidth: 220
        }, {
        	display: '服务状态',
        	name: 'status',
        	width : 120,
        	render : function(rowdata, index, value){
        		switch(value){
					case 'createing': return '建设中'; break;
					case 'opening': return '开放中'; break;
					case 'stoping': return '停止服务'; break;
					default : return "";
				}
        	}
        }, {
        	name: 'sindex',
        	display: '服务首页地址',
        	minWidth: 280
        }],
        toolbar: {
        	items: [{
        		id : 'addServe',
        		text: '添加服务',
        		click: saveService
        	}, { line: true }, {
        		id : 'updateServe',
        		text: '修改服务',
        		click: function(item){
        			var record = grid.getSelectedRow();
        			if(record){
	        			$("#sid").attr("value", record.sid);
	   					$("#sname").attr("value", record.sname);
	   					$("#sprice").attr("value", record.sprice);
	   					$("#sicon").attr("value", record.sicon);
	   					$("#status").val(record.status);
	   					$("#sindex").attr("value", record.sindex);
	        			saveService(item);
	   					window['sintor'].html(record.sintro.replace(/&quot;/ig, "\""));
        			} else {
        				alert("您还未选择任何服务！");
        			}
        		}
        	}, { line: true }, {
        		text: '删除服务', 
        		click: function(){
        			var record = grid.getSelectedRow();
        			if(record){
				       	$.ajax({
							type : 'POST',
							url : 'service/deleteServe',
							data : "jsondata="+ record.sid,
							success : function(data){
								grid.reload();
							}
					    });
				    } else {
        				alert("您还未选择任何服务！");
        			}
        		}
        	}]
        }
    });
    $("#pageloading").hide();
    
    function saveService(item){
    	if(!categoryNode){
    		return alert("您还未选择类别树！请选择！");
    	}
    	if(window['managerServe']){
    		window['managerServe'].id = item.id;
			window['managerServe'].set("title", item.text);
    		if(item.id == "addServe"){
    			$("#sid").attr("value", "");
				$("#sname").attr("value", "");
				$("#sprice").attr("value", "");
				$("#oldSicon").attr("value", "");
				$("#status").val("createing");	//建设中
				$("#sindex").attr("value", "");
				window['sintor'].html("");
    		}
    		return window['managerServe'].show();
    	}
    	window['managerServe'] = $.ligerDialog.open({
    		id : item.id,
	    	title: item.text,
	    	height: 555,
	    	width: 830,
	    	isResize: true, 
	    	modal: true,
	    	target: $("#serviceDiv"),
	    	buttons: [{
	    		text: '保存',
	    		onclick: function(items, dialog){
	    			if($("#sname").val() == ""){
			    		$("#sname").attr("style", "border:1px red solid;");
			    		$("#sname").focus(function(){
			    			$("#sname").attr("style", "border:1px #CCCCCC solid;");
			    			$("#errorInfo").html("");
			    		});
			    		return $("#errorInfo").html("服务名称不能够为空！");
			    	}
			    	if($("#sindex").val() == ""){
			    		$("#sindex").attr("style", "border:1px red solid;width:400px;");
			    		$("#sindex").focus(function(){
			    			$("#sindex").attr("style", "border:1px #CCCCCC solid;width:400px;");
			    			$("#errorInfo").html("")
			    		});
			    		return $("#errorInfo").html("服务地址不能够为空");
			    	}
			    	if(!Verifys.isURL($("#sindex").val())){
			    		$("#sindex").attr("style", "border:1px red solid;width:400px;");
			    		$("#sindex").focus(function(){
			    			$("#sindex").attr("style", "border:1px #CCCCCC solid;width:400px;");
			    			$("#errorInfo").html("");
			    		});
			    		return $("#errorInfo").html("服务地址格式不正确！");
			    	}
			    	$("#cno").val(categoryNode.data.cid);
			    	$("#cname").val(categoryNode.data.text);
			    	var sintor = window['sintor'].html();
			    	sintor = sintor.replace(/\"/ig, "&quot;")
			    	var reg = ["<![endif]-->", "<w:WordDocument>"];
			    	if((sintor.indexOf(reg[0]) != -1) && (sintor.indexOf(reg[1]) != -1)){
			    		sintor = sintor.substring(sintor.indexOf(reg[0]) + 12, sintor.indexOf(reg[1]) - 26);
			    	}
			    	$("#sintro").attr("value", sintor);
			    	var url = "service/addServe";
			    	if(window['managerServe'].id == "updateServe"){
			    		url = "service/updateServe";
			    	}
			    	$("#moduleForm").ajaxSubmit({
						url : url,
						type : 'POST',
						dataType : 'json',
						clearForm: true,
						success:function(data){
							if(data.success){
								dialog.hide();
								grid.reload();
							} else {
								alert(data.errorfield);
							}
						},
						error:function(){}
			    	});
	    		}
	    	},{
	    		text: '关闭',
	    		onclick: function(item, dialog){
	    			dialog.hide();
	    		}
	    	}]
	    });
	    window['sintor'] = KindEditor.create('#sintor',{
	    	items : [
				'source', '|', 'undo', 'redo', '|', 'preview', 'code', 'cut', 'copy', 'paste',
				'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
				'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent',
				'clearhtml', '|', 'fullscreen', '/',
				'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
				'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image',
				'table', 'hr', 'emoticons', 'baidumap', 'pagebreak', 'link', 'unlink'
			],
	    	uploadJson : 'service/uploadImage'
	    });
    }
    
	function treeGridAutoHeight(){
		var bodyWidth = document.documentElement.clientWidth;
		var bodyHeight = document.documentElement.clientHeight;
		$(".categoryTree").attr("style", "height:"+ (bodyHeight - 12) +"px;");
	}
	
	/*--------------------上传部分，待封装------------------------*/
	//初始化上传窗口
	$('#uploadDiv').ligerTab();
	$('#file').change(function(){
		var name = $(this).val().split(".")[1].toLowerCase();
		if(name != "jpg" && name != "jpeg" 
			&& name != "gif" && name != "bmp"){
			$.ligerDialog.warn("请选择正确的图片格式！");
			return;
		}
		$('#fileForm').ajaxSubmit({
			url : 'public/uploadFile',
			type : 'post',
			dataType : 'json',
			clearForm : false,
			success : function(data) {
				if(data.success){
					fileName = data.message;
					$(".imageView img").attr("src", "upload/" + fileName);
				} else {
					$.ligerDialog.warn(data.message);
				}
			},
			error : function() {}
		});
	});
	
	$('#sicon').click(function(){
		if(window['uploadEdit']){
			return window['uploadEdit'].show();
		}
		window['uploadEdit'] = $.ligerDialog.open({
        	title: '上传',
        	height: 200,
        	width: 350,
        	isResize: false, 
        	target: $('#uploadDiv'),
        	modal : true,
        	buttons : [{
					text: '确定',
					onclick: function(item, dialog){
						$('#file').val('');
						$(".imageView img").attr("src", "");
						$('#sicon').val(fileName);
						dialog.hide();
					}
	        	},{
	        		text: '取消',
					onclick: function(item, dialog){
						if(fileName && fileName != "") {
							$.ajax({
								url : 'public/deleteFile',
								type : 'post',
								dataType : 'json',
								data : { "fileName" : fileName },
								success : function(data) { }
							});
						}
						$('#file').val('');
						$(".imageView img").attr("src", "");
						dialog.hide();
					}
				}]
		});
	});
	/*---------------end 上传部分-----------------*/
    
});
var fileName ; //预提交图片, 图片名为后台获取的时间戳
/**
 * @param {} imgPath	缩略图路径
 * 查看服务缩略图
 */
function serveThumbnailView(imgPath){
	$("#serveImages").attr("src", "upload/" + imgPath);
	$.ligerDialog.open({ 
    	title: '服务缩略图',
    	height: 250,
    	width: 300,
    	isResize: true, 
    	modal: true,
    	target: $("#serveThumbnailDiv"),
    	buttons: [{
    		text: '关闭',
    		onclick: function(item, dialog){
    			dialog.hide();
    		}
    	}]
    });
}
