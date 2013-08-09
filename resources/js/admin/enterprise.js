var editor_product;    //产品信息编辑器
var grid_product;    //产品信息表格
var lproduct_grids = new Array();    //产品表格数组
var eid_product;    //产品管理模块,当前选中的企业eid
var lwin_preImage;    //预览图片窗口ligerui对象
var lwin_search;    //企业查询窗口ligerui对象
var g_sPath;    //当前预览的图片url
var lPicUploadWin;    //文件上传窗口
var g_g_module;	//当前掉用文件上传窗口的模块名称如:企业"enterprise",产品"product"
var lmchannel;    //产品所属频道ligerCombox对象
var lenterpMchannel;	//企业所属平道ligerCombox对象
//var lMenu_enterprise;	//liger菜单

$(function() {
	$.metadata.setType("attr", "validate");
	$("#menbers").ligerComboBox({
		valueFieldID : 'menbers',
		data : [
			{id : '20人以下', text : '20人以下'},
			{id : '20-50人', text : '20-50人'},
			{id : '51-100人', text : '51-100人'},
			{id : '101-200人', text : '101-200人'},
			{id : '201-500人', text : '201-500人'},
			{id : '501-1000人', text : '501-1000人'},
			{id : '1000人以上', text : '1000人以上'}
		]
	});
	$("#eptype").ligerComboBox({
		valueFieldID : 'eptype',
		data : [
			{id : '政府机构', text : '政府机构'},
			{id : '国有企业', text : '国有企业'},
			{id : '民营上市企业', text : '民营上市企业'},
			{id : '三资企业', text : '三资企业'},
			{id : '私营企业', text : '私营企业'},
			{id : '个体户', text : '个体户'}
		]
	});
	$("#epmodel").ligerComboBox({
		valueFieldID : 'epmodel',
		data : [
			{id : '生产型', text : '生产型'},
			{id : '贸易型', text : '贸易型'},
			{id : '服务型', text : '服务型'},
			{id : '生产型,贸易型', text : '生产型,贸易型'},
			{id : '贸易型,服务型', text : '贸易型,服务型'},
			{id : '生产型,贸易型,服务型', text : '生产型,贸易型,服务型'}
		]
	});
	lmchannel = $("#mchannel").ligerComboBox({
		data : [
			{id : 'hjmake', text : '厚街制造产品'},
			{id : 'ebusiness', text : '电商荟萃产品'}
		],
		onSelected: function (value, text) {
			if(value == "hjmake"){
				$(".canbe_to_batch_id").show();
				$(".canbe_to_batch_id1").hide();
			} else if (value == "ebusiness"){
				$(".canbe_to_batch_id").hide();
				$(".canbe_to_batch_id1").show();
			}else{
				$(".canbe_to_batch_id").hide();
				$(".canbe_to_batch_id1").hide();
			}
		}
	});
	lenterpMchannel = $("#enterp-mchannel").ligerComboBox({
		data : [
			{id : 'epshow', text : '企业风采'},
			{id : 'hjbusiness', text : '厚街商贸'}
		]
	});
	
	$(".enterprise-edit-form").ligerForm();
	$(".form_product").ligerForm();
	$.ligerDefaults.Filter.operators['string'] = $.ligerDefaults.Filter.operators['text'] = ["like" , "equal", "notequal", "startwith", "endwith" ];
	window['enterpriseGrid'] = $(".enterprise-grid").ligerGrid({
		dataAction : 'server',
		method : 'post',
		dataType : 'json',
		url : "enterprise/findEnterpriseByParams",
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
		detail: {	//显示详细
			onShowDetail: showProducts,
			heigth:'auto'
		},
		frozen:false,
		columns : [{
			display : '企业名称',
			name : 'epname',
//			frozen : true,
			width : 140
		}, {
			display : '企业编码',
			name : 'epid',
//			frozen : true,
			width : 80
		}, {
			display : '企业域名',
			name : 'epdomain',
//			frozen : true,
			width : 100
		}, {
			display : '创建日期',
			name : 'epcreatedate',
//			frozen : true,
			width : 120

		}, {
			display : '基础信息',
			columns : [{
				display : '企业性质',
				name : 'eptype',
				width : 120,
				render : function(rowdata, index, value){
					switch(value){
						/*case "governmental" : return "政府机构";
						case "stateOwnedEnterprise" : return "国有企业";
						case "privatelyOperatedEnterprise" : return "民营上市企业";
						case "threeCapitalEnterprise" : return "三资企业";
						case "privateEnterprise" : return "私营企业";
						case "individual" : return "个体户";*/
						case "政府机构" : return "政府机构";
						case "国有企业" : return "国有企业";
						case "民营上市企业" : return "民营上市企业";
						case "三资企业" : return "三资企业";
						case "私营企业" : return "私营企业";
						case "个体户" : return "个体户";
					}
				}
			}, {
				display : '企业注册资金',
				name : 'epcapital',
				width : 80
			}, {
				display : '企业经营模式',
				name : 'epmodel',
				width : 100,
				render : function(rowdata, index, value){
					switch(value){
						/*case "production" : return "生产型";
						case "trade" : return "贸易型";
						case "service" : return "服务型";*/
						case "生产型" : return "生产型";
						case "贸易型" : return "贸易型";
						case "服务型" : return "服务型";
						case "生产型,贸易型" : return "生产型,贸易型";
						case "贸易型,服务型" : return "贸易型,服务型";
						case "生产型,贸易型,服务型" : return "生产型,贸易型,服务型";
					}
				}
			}, {
				display : '企业员工人数',
				name : 'menbers',
				width : 80,
				render : function(rowdata, index, value){
					switch(value){
						/*case "20down" : return "20人以下";
						case "2050" : return "20-50人";
						case "51100" : return "51-100人";
						case "101200" : return "101-200人";
						case "201500" : return "201-500人";
						case "5011000" : return "501-1000人";
						case "10000up" : return "1000人以上";*/
						case "20人以下" : return "20人以下";
						case "20-50人" : return "20-50人";
						case "51-100人" : return "51-100人";
						case "101-200人" : return "101-200人";
						case "201-500人" : return "201-500人";
						case "501-1000人" : return "501-1000人";
						case "1000人以上" : return "1000人以上";
					}
				}
			}, {
				display : '企业主营产品',
				name : 'products',
				width : 120
			}]
		}, {
			display : '联系信息',
			columns : [{
				display : '联系人',
				name : 'eplinkman',
				width : 100
			}, {
				display : '联系电话',
				name : 'epphone',
				width : 120
			}, {
				display : '企业邮箱',
				name : 'epemail',
				width : 120
			}, {
				display : '联系地址',
				name : 'epaddress',
				width : 120
			}, {
				display : '邮编',
				name : 'postcode',
				width : 80
			}, {
				display : '网站',
				name : 'website',
				width : 120
			}]
		}],
		toolbar : {
			items : [{
				id : 'addEnterprise',
				text : '添加企业',
				click : function(item){
					$(".enterprise-edit-form").resetForm();
					$("#eid").val("");
					$("#epcreatedate").val("");
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
					if(lwin_search) {
						lwin_search.show();
						return;
					}
					
					/* 初始化企业查询窗口 */
					lwin_search = $.ligerDialog.open({
						title : '查询企业',
						target : $("form").filter(".search"),
						width : 340,
						height : 230,
						isResize: true, 
				    	modal: true,
				    	buttons : [{
				    		text : '查询',
				    		onclick: function (item, dialog) { 
				    			var $inputs = $("div").filter(".search-label-input").children("input");
				    			$inputs.each(function (i, n) {
				    				window['enterpriseGrid'].
				    					setParm($(n).attr("name"), $(n).attr("value"));
				    			});
				    			window['enterpriseGrid'].setParm("mchannel",$("#emchannel").val());
				    			window['enterpriseGrid'].setParm("from",$("input[name='from']").val());
				    			window['enterpriseGrid'].setParm("end",$("input[name='end']").val());
				    			window['enterpriseGrid'].reload();
				    			lwin_search.hide();
				    		}
				    	}, {
				    		text : '取消',
				    		onclick: function (item, dialog) { 
				    			$("form").filter(".search").resetForm();
				    			dialog.hide();
				    		}
				    	}]
					});
				}
			}]
		}
	});
	
	/* 为企业logo的查看添加事件 */
	$("#uploadImage + a").click(function(){
		g_previewImage();
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
	    	modal: true,
	    	buttons : [{
	    		text : '提交',
	    		onclick: function (item, dialog) { 
	    			
	    			/* 企业表单输入验证 */
	    			if (!$(".enterprise-edit-form").valid()) {
	    				return;
	    			}
	    			
	    			var eid = $("#eid").val();
	    			var url = "enterprise/addEnterp";
	    			if (eid) {
	    				url = "enterprise/updEnterp";
	    			}
	    			var epintro = window['epintro'].html();
			    	epintro = epintro.replace(/\"/ig, "&quot;");
			    	window['enterpriseManager'].hide();
			    	$("#enterprise-grid").showLoading();
	    			$(".enterprise-edit-form").ajaxSubmit({
	    				url : url,
						type : 'post',
						dataType : 'json',
						data : {
//							eptype : $("#eptype").ligerGetComboBoxManager().findValueByText($("#eptype").val()),
//							epmodel : $("#epmodel").ligerGetComboBoxManager().findValueByText($("#epmodel").val()),
//							menbers : $("#menbers").ligerGetComboBoxManager().findValueByText($("#menbers").val()),
							epintro : epintro
						},
						clearForm : true,
						success : function(data) {
							$("#enterprise-grid").hideLoading();
							if(data.success){
								enterpriseGrid.reload();
								window['enterpriseManager'].hide();
							} else {
								$.ligerDialog.warn(data.message);
							}
						},
						error : function() {
							$("#enterprise-grid").hideLoading();
						}
	    			});
	    			
	    		}
	    	}, {
	    		text : '取消',
	    		onclick: function (item, dialog) { 
	    			window['enterpriseManager'].hide();
	    		}
	    	}]
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
	
	/* 企业表单初始化验证插件 */
	$(".enterprise-edit-form").validate({
//			debug: true,
        /*errorPlacement: function (lable, element) {
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
        },*/
		errorPlacement: function (lable, element)
        {

            if (element.hasClass("l-textarea"))
            {
                element.addClass("l-textarea-invalid");
            }
            else if (element.hasClass("l-text-field"))
            {
                element.parent().addClass("l-text-invalid");
            }
            $(element).removeAttr("title").ligerHideTip();
            $(element).attr("title", lable.html()).ligerTip();
        },
        success: function (lable)
        {
            var element = $("#" + lable.attr("for"));
            if (element.hasClass("l-textarea"))
            {
                element.removeClass("l-textarea-invalid");
            }
            else if (element.hasClass("l-text-field"))
            {
                element.parent().removeClass("l-text-invalid");
            }
            $(element).removeAttr("title").ligerHideTip();
        },
		submitHandler : function(){
			alert('submit');
	 	}
 	});
 	
 	/* 产品表单初始化验证插件 */
	$(".form_product").validate({
		errorPlacement: function (lable, element)
        {

            if (element.hasClass("l-textarea"))
            {
                element.addClass("l-textarea-invalid");
            }
            else if (element.hasClass("l-text-field"))
            {
                element.parent().addClass("l-text-invalid");
            }
            $(element).removeAttr("title").ligerHideTip();
            $(element).attr("title", lable.html()).ligerTip();
        },
        success: function (lable)
        {
            var element = $("#" + lable.attr("for"));
            if (element.hasClass("l-textarea"))
            {
                element.removeClass("l-textarea-invalid");
            }
            else if (element.hasClass("l-text-field"))
            {
                element.parent().removeClass("l-text-invalid");
            }
            $(element).removeAttr("title").ligerHideTip();
        },
		submitHandler : function(){
			alert('submit');
	 	}
 	});
	
	$(".l-button-reset").click(function() {
		window['enterpriseManager'].hide();
	});
	
	/* 企业表格右键菜单初始化 */
	var lMenu_enterprise = $.ligerMenu({ 
		top: 100, 
		left: 100, 
		width: 120, 
		items:[{ 
            text: '修改企业',
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
    				lenterpMchannel.selectValue(record.mchannel);
    				
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
			text : '删除企业',
			icon : 'delete',
        	click: function(item){
        		var record = enterpriseGrid.getSelectedRow();
    			if(record){
    				$.ligerDialog.confirm('确认删除该企业吗?', function(b){
    					if(b){
					       	$.ajax({
								type : 'post',
								url : 'enterprise/delEnterp',
								data : {
									"eid" : record.eid
								},
								dataType : 'json',
								success : function(data){
									if(data.success){
										enterpriseGrid.reload();
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
        }, {
        	line : true
        }, {
			text : '添加产品',
			icon : 'add',
        	click: function(item){
        		
        		var row = enterpriseGrid.getSelectedRow();
//        		showProducts();
//        		grid_product = ligergrid;
        		eid_product = row.eid;
        		g_showProductWin();	//打开表单窗口
        		$("#eid_product").val(row.eid);	//给产品信息的企业eid隐藏框设值
        	}		
        }]
     });
	
	/* 显示企业产品表格 */
    function showProducts(row, detailPanel, callback){
        var grid = document.createElement('div'); 
        $(detailPanel).append(grid);
       	
        var ligergrid = grid_product = $(grid).css('margin',10).ligerGrid({
            columns: [{ 
            	display: '产品名称',
            	name: 'pname',
            	align: 'left',
            	width: 100,
            	minWidth: 60 
            }, { 
            	display: '产品分类',
            	name: 'ptype',
            	align: 'left',
            	width: 100,
            	minWidth: 60 
            },{ 
            	display: '产品单位',
            	name: 'pmonad',
            	align: 'left',
            	width: 100,
            	minWidth: 60 
            },{ 
            	display: '产品起订量',
            	name: 'pminimum',
            	align: 'left',
            	width: 100,
            	minWidth: 60 
            },{ 
            	display: '产品规格型号',
            	name: 'pversion',
            	align: 'left',
            	width: 100,
            	minWidth: 60 
            },{ 
            	display: '产品供货价格',
            	name: 'supplyprice',
            	align: 'left',
            	width: 100,
            	minWidth: 60 
            },{ 
            	display: '产品价格',
            	name: 'price',
            	align: 'left',
            	width: 100,
            	minWidth: 60 
            },{ 
            	display: '产品所属公司',
            	name: 'company',
            	align: 'left',
            	width: 100,
            	minWidth: 60 
            },{ 
            	display: '产品产地',
            	name: 'field',
            	align: 'left',
            	width: 100,
            	minWidth: 60 
            },{ 
            	display: '产品运输方式',
            	name: 'pattern',
            	align: 'left',
            	width: 100,
            	minWidth: 60 
            },{ 
            	display: '产品网店地址',
            	name: 'store',
            	align: 'left',
            	width: 100,
            	minWidth: 60 
            },{ 
        		display: '产品描述',
        		name: 'pintro', 
	        	minWidth: 100,
	        	width : 471,
        		render : function(rowdata, index, value){
        			if(value && (value.toString().length > 30)) {
        				return value.toString().substring(0, 30) + "...";
        			}
        			return value;
       			}
       		}, {
        		display: '',
        		name: 'pid',
        		width : 50,
        		render : function(rowdata, index, value){
        			return "<a href='javascript:void(0)' onclick='g_updProduct(" + 
        				value + "," + rowdata.eid + "," + index + ");'>修改</a>";
       			}
        	}, {
        		display: '',
        		name: 'pid',
        		width : 50,
        		render : function(rowdata, index, value){
        			
        			return "<a href='javascript:void(0)' onclick='g_delProduct("+
        				value + "," + rowdata.eid + ");'>删除</a>";
       			}
        	}, {
        		display: '',
        		name: 'picture_b',
        		width : 70,
        		render : function(rowdata, index, value){
        			if (!value) {
        				value = "resources/images/nopic.gif"
        				return "<a href='"+ value +"' class='fancybox'>产品大图</a>";
        			}
        			return "<a href='upload/"+ value +"' class='fancybox'>产品大图</a>";
       			}
        	}, {
        		display: '',
        		name: 'picture_s',
        		width : 70,
        		render : function(rowdata, index, value){
        			if (!value) {
        				value = "resources/images/nopic.gif"
        				return "<a href='"+ value +"' class='fancybox'>产品缩略图</a>";
        			}
        			return "<a href='upload/"+ value +"' class='fancybox'>产品缩略图</a>";
       			}
        	}],
	        showToggleColBtn: true,
	        width: 1000,
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
	        url : 'product/page',
	        showTitle: false,
	        columnWidth: 100,
	        onAfterShowData: callback,
	        onContextmenu : function(parm, e){
//                menu.show({ top: e.pageY, left: e.pageX });
                return false;
	        },
	        frozen:false
	        /*toolbar: {
	        	items: [{ 
	    			text: '添加产品', 
		        	click: function(){
		        		 判断是否选中企业 
//		        		var row = window['enterpriseGrid'].getSelectedRow();	//获取当前选中的企业
//		        		if(!row) {
//		        			alert('请先选择一个企业');
//		        			return;
//		        		}
		        		grid_product = ligergrid;
		        		 eid_product = row.eid;
		        		g_showProductWin();	//打开表单窗口
		        		$("#eid_product").val(row.eid);	//给产品信息的企业eid隐藏框设值
		        	}, 
		        	icon: 'add' 
		        }]
	        }*/
        }); 
        lproduct_grids.push(ligergrid);
    }
    
    $("input[name='from']").ligerDateEditor();
    $("input[name='end']").ligerDateEditor();
    
    /* 渲染fancybox */
    $(".fancybox").fancybox();
});

/**
 * 弹出窗口,预览显示图片
 * @param path 图片的url
 * */
function g_previewImage(eid, rowid){
	if(grid_product.options.parms.eid != eid) {
		$.each(lproduct_grids, function(index, grid) {
			if(grid.options.parms.eid == eid) {
				grid_product = grid;
				return false;
			}
		});
	}
	var record = grid_product.getRow(rowid);
	
	$("#preImage > img").attr("src", "upload/" + record.picture_s);
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

/* 清理表单 */
function clearForm_product() {
	$(".form_product").clearForm();
	$("input[name='pid']").val('');
	$("input[name='picture_b']").val('');
	$("input[name='picture_s']").val('');
	$("#eid_product").val('');
	editor_product.html("");
}

/* 弹出产品管理窗口 */
function g_showProductWin() {
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
    	modal: true,
    	buttons : [{
    		text : '提交',
    		onclick: function (item, dialog) { 
    			
    			/* 产品表单输入验证 */
    			if (!$(".form_product").valid()) {
    				return;
    			}
    			
    			/* 表单提交前要清理一下'所属频道'里不需要的值 */
    			var vmchannel = liger.get('mchannel').getValue();
    			if (vmchannel == "hjmake") {
					$(".canbe_to_batch_id1 input").val("");
    			} else if (vmchannel == "ebusiness") {
    				$(".canbe_to_batch_id input").val("");
    			}
    			
    			var eid = $("#eid_product").val();
				editor_product.sync();	//提交前需要执行 sync() 将HTML数据设置到原来的textarea
				$(".form_product").ajaxSubmit({
					url : "product/addOrUpd",
					type : 'post',
					dataType : 'json',
//					data : {
//					},
					clearForm : true,
					success : function(data) {
						$(".form_product").hideLoading();
						if(data.success){
							if(grid_product) {
								if(grid_product.options.parms.eid != eid) {
									$.each(lproduct_grids, function(index, grid) {
										if(grid.options.parms.eid == eid) {
											grid_product = grid;
											return false;
										}
									});
								}
								if(grid_product.options.parms.eid == eid) {
									grid_product.loadServerData({
										eid : eid
									});
								}
							}
							clearForm_product();
							window['productManager'].hide();
						} else {
							$.ligerDialog.warn(data.message);
						}
					},
					error : function() {
						$.ligerDialog.error("请求出错了,请刷新页面后重试");
					}
				});
    		}
    	}, {
    		text : '取消',
    		onclick: function (item, dialog) { 
    			$(".form_product").resetForm();
    			clearForm_product();
    			liger.get("mchannel").selectValue("");
    			window['productManager'].hide();
    		}
    	}]
	});
	
	 /* 初始化html编辑器,kindeditor */
    editor_product = KindEditor.create('#pintro', {
		allowFileManager : true,
		resizeMode : 0,
		width : '99%',
		height : 370
	});
}

/* 删除图片 */
function delProductImage (fileName) {
	if (fileName) {
		
		/* 通过ajax发送请求删除图片 */
		$.ajax({
		   type: "post",
		   url: "public/deleteFile",
		   data: {
				fileName : fileName
			},
		   dataType : 'json',
		   success: function(data){
			    
		   },
		   error : function() {
				/* FIXME */
				$.ligerDialog.error('提交失败,请稍后重试');
			}
		});
	} 
}

/**
 * 修改产品信息
 * @param pid 产品id
 * @param eid 企业id
 * @param rowid 产品所处的索引
 */
function g_updProduct(pid, eid, rowid) {
	if(grid_product.options.parms.eid != eid) {
		$.each(lproduct_grids, function(index, grid) {
			if(grid.options.parms.eid == eid) {
				grid_product = grid;
				return false;
			}
		});
	}
	
	var record = grid_product.getRow(rowid);
	$(".form_product").resetForm();   
	$('.form_product input').each(function(index, input){
		if($(input).attr('type') == 'text' || $(input).attr('type') == 'hidden'){
			$(input).val(record[$(input).attr('name')]);
		}
	});
	lmchannel.selectValue(record.mchannel);
	g_showProductWin();
	editor_product.html(record.pintro);
}

/**
 * 删除产品信息
 * @param pid 产品id
 * @param eid 企业id
 */
function g_delProduct(pid, eid){
	if(grid_product.options.parms.eid != eid) {
		$.each(lproduct_grids, function(index, grid) {
			if(grid.options.parms.eid == eid) {
				grid_product = grid;
				return false;
			}
		});
	}
	
	$.ligerDialog.confirm('确定删除该产品', function (yes) {
//		 确认删除,ajax传送id执行删除操作 
		if(yes == true) {
			var str = pid + ",";	
			$.post("product/delete", { "ids": str }, function(data){
				 if(data.success) {
				 	grid_product.loadServerData({
						eid : eid
					});
				 	return;
				 } 
				 $.ligerDialog.error(data.msg)
			   }, "json");
		}
	});
}

/* 打开文件上传窗口 */
function g_showFileManager () {
	if (lPicUploadWin) {
		lPicUploadWin.show();
		return;
	}
	
	/* 初始图片上传窗口 */
	lPicUploadWin = $.ligerDialog.open({
		title : '图片上传',
		target : $(".picupload-form"),
		width : 300,
		height : 100,
		isResize: true, 
    	modal: true,
    	buttons : [{
    		text : '确定',
    		onclick: function (item, dialog) { 
    			var filename = $(".picupload").val();
				if(filename) {
					var name = filename.split(".")[1].toLowerCase();
					if (name != "jpg" && name != "jpeg" 
						&& name != "gif" && name != "bmp"){
						$.ligerDialog.warn("请选择正确的图片格式！");
						return;
					}
					if (g_module == 'enterprise') {
						var eplogo = $("#eplogo").val();
						delProductImage(eplogo);
					} else {
						var productImage = $(".product-image").val();
						delProductImage(productImage);
					}
					
					/* 通过ajaxSubmit上传图片 */
					$(".picupload-form").ajaxSubmit({
						url : "public/uploadFile",
						type : 'post',
						dataType : 'json',
						clearForm : false,
						success : function(data) {
							if (data.success) {
								if (g_module == "enterprise") {
									$("#eplogo").val(data.message);
								} else {
									$(".product-image").val(data.message);
								}
								$(".picupload").val('');
								lPicUploadWin.hide();
								return;
							} 
							$.ligerDialog.error(data.error);
						},
						error : function() {
							/* FIXME */
							$.ligerDialog.error('提交失败,请稍后重试');
						}
					});
				}
    		}
    	}, {
    		text : '取消',
    		onclick: function (item, dialog) { 
    			var filename = $(".picupload").val('');
    			lPicUploadWin.hide();
    		}
    	}]
	});
}

