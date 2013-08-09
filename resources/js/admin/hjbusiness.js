var editor_product;	//产品信息编辑器
var grid_product;	//产品信息表格
var eid_product;	//产品管理模块,当前选中的企业eid
var lwin_preImage;	//预览图片窗口
var g_sPath;	//当前预览的图片url
//var lMenu_enterprise;	//liger菜单

$(function() {
	$.metadata.setType("attr", "validate");
	
	$(".enterprise-edit-form").ligerForm();
	$.ligerDefaults.Filter.operators['string'] = $.ligerDefaults.Filter.operators['text'] = ["like" , "equal", "notequal", "startwith", "endwith" ];
	window['enterpriseGrid'] = $(".enterprise-grid").ligerGrid({
		dataAction : 'server',
		method : 'post',
		dataType : 'json',
		url : "hjbusiness/load",
		root : 'data',
		record : 'total',
		width : '99.7%',
		height : '100%',
		pageSize : 30,
		rownumbers : true,
        onContextmenu : function (parm, e){
		    actionCustomerID = parm.data.CustomerID;
		    lMenu_enterprise.show({ top: e.pageY, left: e.pageX });
		    return false;
        } ,
		/*detail: {	//显示详细
			onShowDetail: f_showProducts,heigth:'auto'
		},*/
		frozen:false,
		columns : [ {
			display : '厚街商贸编码',
			name : 'id',
//			frozen : true,
			width : 80
		},{
			display : '厚街商贸名称',
			name : 'name',
//			frozen : true,
			width : 140
		},{
				display : '图片地址',
				name : 'image',
				width : 120
		},{
			display : '厚街商贸介绍',
			name : 'intro',
			width : 120
		}],
		toolbar : {
			items : [{
				id : 'addEnterprise',
				text : '添加厚街商贸',
				click : function(item){
					$(".enterprise-edit-form").resetForm();
					$("#preLogo").attr("src", "resources/images/nopic.gif");	//企业logo显示为默认图片
					enterpriseManager(item);
					window['epintro'].html("");
				},
				icon : 'add'
			}, {
				line : true
			}, {
				text : '查找',
				icon : 'search',
				click : function() {
					
				}
			}]
		}
	});
	
	/* 为企业logo的查看添加事件 */
	$("#uploadImage + a").click(function(){
		previewImage();
	});
	
	$("#pageloading").hide();
	
	function enterpriseManager(item){
		if(window['enterpriseManager']){
			window['enterpriseManager'].id = item.id;
			window['enterpriseManager'].set("title", item.text);
			return window['enterpriseManager'].show();
		}
		window['enterpriseManager'] = $.ligerDialog.open({
			id : item.id,
			title : item.text,
			target : $(".enterprise-edit-form"),
			width : 700,
			height : 470,
			isResize: true, 
	    	modal: true
		});
		window['epintro'] = KindEditor.create('#epintro',{
			resizeType : 1,
			allowPreviewEmoticons : false,
			allowImageUpload : false,
	    	items : [
				'source', '|', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic',
				'underline', 'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright',
				'insertorderedlist', 'insertunorderedlist', '|', 'emoticons', 'image', 'link'
			]
	    });
	}
	
	$(".l-button-submit").click(function(){
		$(".enterprise-edit-form").validate({
//			debug: true,
            errorPlacement: function (lable, element) {
                if (element.hasClass("l-textarea")) {
                    element.addClass("l-textarea-invalid");
                }
                else if (element.hasClass("l-text-field")) {
                    element.parent().addClass("l-text-invalid");
                }
                var nextCell = element.parents("td:first").next("td");
                nextCell.find("div.l-exclamation").remove(); 
                $('<div class="l-exclamation" title="' + lable.html() + '"></div>').appendTo(nextCell).ligerTip(); 
            },
            success: function (lable) {
                var element = $("#" + lable.attr("for"));
                var nextCell = element.parents("td:first").next("td");
                if (element.hasClass("l-textarea")) {
                    element.removeClass("l-textarea-invalid");
                }
                else if (element.hasClass("l-text-field")) {
                    element.parent().removeClass("l-text-invalid");
                }
                nextCell.find("div.l-exclamation").remove();
            },
			submitHandler : function(){
				var url = "hjbusiness/addEnterprise";
				if(window['enterpriseManager'].id == "updateEnterprise"){
					url = "hjbusiness/updateEnterprise";
				}
				var epintro = window['epintro'].html();
				var name = $('#name').val();
				var image = $('#image').val();
		    	epintro = epintro.replace(/\"/ig, "&quot;");
				$(".enterprise-edit-form").ajaxSubmit({
					url : url,
					type : 'post',
					dataType : 'json',
					data : {
						name : name,
							//$("#name").ligerGetComboBoxManager().findValueByText($("#name").val()),
//						epmodel : $("#epmodel").ligerGetComboBoxManager().findValueByText($("#epmodel").val()),
//						menbers : $("#menbers").ligerGetComboBoxManager().findValueByText($("#menbers").val()),
						image:image,
						intro : epintro
					},
					clearForm : false,
					success : function(data) {
						$(".enterprise-edit-form").hideLoading();
						if(data.success){
							enterpriseGrid.loadServerData();
							window['enterpriseManager'].hide();
						} else {
							$.ligerDialog.warn(data.message);
						}
					},
					error : function() {}
				});
		 	}
	 	});
	});
	$(".l-button-reset").click(function() {
		window['enterpriseManager'].hide();
	});
	
	/* 菜单初始化 */
	var lMenu_enterprise = $.ligerMenu({ 
		top: 100, 
		left: 100, 
		width: 120, 
		items:[/*{
			id : 'addEnterprise',
			text : '添加企业',
            click: function(item){
            	$(".enterprise-edit-form").resetForm();
				$("#preLogo").attr("src", "resources/images/nopic.gif");	//企业logo显示为默认图片
				enterpriseManager(item);
				window['epintro'].html("");
            }, 
            icon: 'add' 
        },*/ { 
            text: '修改厚街商贸',
            id : 'updateEnterprise',
            icon : 'modify',
            click: function(item){
            	var record = enterpriseGrid.getSelectedRow();
    			if(record == null){
    				$.ligerDialog.question("您还未选择任何企业！");
    			} else {
					$(".enterprise-edit-form").resetForm();   
					$('.enterprise-edit-form input').each(function(index, input){
						if($(input).attr('type') == 'text' || $(input).attr('type') == 'hidden'){
							$(input).val(record[$(input).attr('name')]);
						}
					});
					
    				$("#menbers").ligerGetComboBoxManager().setValue(record["menbers"]);
    				$("#eptype").ligerGetComboBoxManager().setValue(record["eptype"]);
    				$("#epmodel").ligerGetComboBoxManager().setValue(record["epmodel"]);
    				
    				
    				/* 设置表单中的'查看'显示的图片的url*/
					var path = $("#eplogo").val();
					if((path != "") && (path != null)){
						path = "upload/" + path;	
					} else {
        				path = "resources/images/nopic.gif";
					}
					$("#preLogo").attr("src", path);
					
					enterpriseManager(item);
					if(record["epintro"]){
    					window['epintro'].html(record["epintro"].replace(/&quot;/ig, "\""));
					} else {
						window['epintro'].html("");
					}
    			}
         	}
        }, { 
	    		line: true 
    	}, { 
        	id : 'deleteEnterprise',
			text : '删除厚街商贸',
			icon : 'delete',
        	click: function(item){
        		var record = enterpriseGrid.getSelectedRow();
    			if(record){
    				$.ligerDialog.confirm('系统提示', function(b){
    					if(b){
					       	$.ajax({
								type : 'post',
								url : 'hjbusiness/deleteEnterprise',
								data : "jsondata="+ record.eid,
								dataType : 'json',
								success : function(data){
									if(data.success){
										enterpriseGrid.loadServerData();
									} else {
										$.ligerDialog.warn(data.message);
									}
								}
						    });
    					}
    				});
			    } else {
    				$.ligerDialog.question("您还未选择任何企业！");
    			}
        	} 
        }]
     });
	

    
	/* 弹出产品管理窗口 */
	function showProductManagerWin(){
		if(window['productManager']){
			return window['productManager'].show();
		}
//		$(".form_product").ligerForm();
//		console.log($(".form_product"));
		
		window['productManager'] = $.ligerDialog.open({
			title : '产品管理',
			target : $(".form_product"),
			width : 700,
			height : 470,
			isResize: true, 
	    	modal: true
		});
		
		 /* 初始化html编辑器,kindeditor */
	    editor_product = KindEditor.create('#pintro', {
			allowFileManager : true,
			resizeMode : 0,
			width : '99%',
			height : 370
		});
	}
	
	/* 表单验证提交*/
	$(".btn-submit-product").click(function(){
		$(".form_product").validate({
//			debug: true,
            errorPlacement: function (lable, element) {
                if (element.hasClass("l-textarea")) {
                    element.addClass("l-textarea-invalid");
                }
                else if (element.hasClass("l-text-field")) {
                    element.parent().addClass("l-text-invalid");
                }
                var nextCell = element.parents("td:first").next("td");
                nextCell.find("div.l-exclamation").remove(); 
                $('<div class="l-exclamation" title="' + lable.html() + '"></div>').appendTo(nextCell).ligerTip(); 
            },
            success: function (lable) {
                var element = $("#" + lable.attr("for"));
                var nextCell = element.parents("td:first").next("td");
                if (element.hasClass("l-textarea")) {
                    element.removeClass("l-textarea-invalid");
                }
                else if (element.hasClass("l-text-field")) {
                    element.parent().removeClass("l-text-invalid");
                }
                nextCell.find("div.l-exclamation").remove();
            },
			submitHandler : function(){
				var url = "product/addOrUpdProduct";
				editor_product.sync();	//提交前需要执行 sync() 将HTML数据设置到原来的textarea
				$(".form_product").ajaxSubmit({
					url : url,
					type : 'post',
					dataType : 'json',
//					data : {
//					},
					clearForm : false,
					success : function(data) {
						$(".form_product").hideLoading();
						if(data.success){
							grid_product.loadServerData({
								eid : eid_product
//								pagesize : 10,
//								page : 1
							});
							clearForm_product();
							window['productManager'].hide();
						} else {
							$.ligerDialog.warn(data.message);
						}
					},
					error : function() {
						alert('error');
					}
				});
		 	}
	 	});
	});
	
	/* 隐藏产品管理窗口 */
	$(".btn-reset-product").click(function() {
		clearForm_product();
		window['productManager'].hide();
	});
	
	/* 清理表单 */
	function clearForm_product() {
		$(".form_product").clearForm();
		$("input[name='pid']").val('');
		$("input[name='picture_b']").val('');
		$("input[name='picture_s']").val('');
		$("#eid_product").val('');
		editor_product.html("");
	}

	//显示企业产品
    function f_showProducts(row, detailPanel,callback){
        var grid = document.createElement('div'); 
        $(detailPanel).append(grid);
       
        var ligergrid = $(grid).css('margin',10).ligerGrid({
            columns: [
            	{ display: '产品名称', name: 'pname', align: 'left', width: 100, minWidth: 60 },
	        	{ 
	        		display: '产品描述',
	        		name: 'pintro', 
	        		minWidth: 400,
	        		render : function(rowdata, index, value){
	        			if(value.toString().length > 30) {
	        				return value.toString().substring(0, 30) + "...";
	        			}
	        			return value;
	        		}
	        	}
	        	/*{ 
	        		display: '',
	        		name: 'pintro',
	        		minWidth: 100, 
	        		render : function(rowdata, index, value){
	        			 当前预览的图片url 
	        			if(rowdata.picture_b) {
		        			g_sPath = 'upload/' + rowdata.picture_b;
	        			} else {
	        				g_sPath = 'resources/images/nopic.gif' + rowdata.picture_b;
	        			}
							
	        			return "<a href='javascript:void(0)' onclick='previewImage();' >查看</>"	
	        		} }*/
	        ],
	        showToggleColBtn: true,
	        width: 600,
	        dataType : 'json',
			root : 'data',
			record : 'total',
			usePager : false,
	//		checkbox : true,
//		 	delayLoad : true,	//延迟加载
//	        pageSize : 10 ,
//	        pageSizeOptions : [10],
	        parms : {
	        	eid : row.eid
	        },
	        rownumbers:true,
	        url : 'product/pageQuery',
	        showTitle: false,
	        columnWidth: 100,
	        onAfterShowData: callback,
	        onContextmenu : function(parm, e){
                menu.show({ top: e.pageY, left: e.pageX });
                return false;
	        },
	        frozen:false,
	        toolbar: {
	        	items: [{ 
	    			text: '添加产品', 
		        	click: function(){
		        		 /*判断是否选中企业 */
//		        		var row = window['enterpriseGrid'].getSelectedRow();	//获取当前选中的企业
//		        		if(!row) {
//		        			alert('请先选择一个企业');
//		        			return;
//		        		}
		        		grid_product = ligergrid;
		        		 eid_product = row.eid;
		        		showProductManagerWin();	//打开表单窗口
		        		$("#eid_product").val(row.eid);	//给产品信息的企业eid隐藏框设值
		        	}, 
		        	icon: 'add' 
		        }]
	        }
        }); 
        var menu = $.ligerMenu({ 
        	top: 100, 
        	left: 100, 
        	width: 120, 
	    	items: [{ 
	    		text: '修改产品', 
	    		click: function(item) {
	    			grid_product = ligergrid;
	        		eid_product = row.eid;
	        		var record = grid_product.getSelectedRow();
        			if(record == null){
        				$.ligerDialog.question("您还未选择任何企业！");
        			} else {
						$(".form_product").resetForm();   
						$('.form_product input').each(function(index, input){
							if($(input).attr('type') == 'text' || $(input).attr('type') == 'hidden'){
								$(input).val(record[$(input).attr('name')]);
							}
						});
						showProductManagerWin();
						editor_product.html(record.pintro);
        			}
	    		}, 
	    		icon: 'modify'  
	    	}, {
				text: '删除产品', 
				click: function(item) {
	    			grid_product = ligergrid;
	    			eid_product = row.eid;
	    			var rows = grid_product.getSelectedRows();
	    			if(rows.length == 0) {
						$.ligerDialog.warn('请先选择产品');
						return;
					}
					$.ligerDialog.confirm('确定删除该产品', function (yes) {
						/* 确认删除,ajax传送id执行删除操作 */
						if(yes == true) {
							var str = "";
							$(rows).each(function(){
								str = str + this.pid + ",";	
							});	
							$.post("product/deleteProducts", { "ids": str }, function(data){
								 if(data.success) {
								 	grid_product.loadServerData({
										eid : eid_product
//										pagesize : 10,
//										page : 1
									});
								 	return;
								 } 
								 $.ligerDialog.error(data.msg)
							   }, "json");
						}
					});
	    		}, 
	    		icon: 'delete'  
			}, { 
	    		line: true 
	    	}, {
	    		text : '查看缩略图',
	    		icon : 'search',
	    		click : function(item) {
	    			var rowdata = ligergrid.getSelectedRow();
	    			if(rowdata.picture_b) {
	        			g_sPath = 'upload/' + rowdata.picture_s;
        			} else {
        				$.ligerDialog.warn('未上传产品图片');
        				return;
        			}
	    			previewImage();
	    		}
	    	}]
            });
    }
    
});

/**
 * 弹出窗口,预览显示图片
 * @param path 图片的url
 * */
function previewImage(){
	$("#preImage > img").attr("src", g_sPath);
	if(lwin_preImage) {
		lwin_preImage.show();
		return;
	}
	lwin_preImage = $.ligerDialog.open({ 
		title : '产品缩略图',
		target: $("#preImage"),
		width : 240,
		height : 160,
		modal : true
	});
}