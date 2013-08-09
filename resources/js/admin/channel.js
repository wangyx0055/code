$(function() {
	$("#layout").ligerLayout();
	$("#navtab").ligerTab({
		onAfterSelectTabItem : function(tabid){
			initializeTab($(this), tabid);
		},
		onRendered : function(){
			initializeTab($(this), "hotservice");
		}
	});
	
	$("#moduleSort").ligerComboBox({
		data : [
			{id : 'service_tree', text : '类别'},
			{id : 'activity', text : '活动'},
			{id : 'service', text : '服务'},
			{id : 'enterprise', text : '企业'},
			{id : 'hjmake', text : '制造'},
			{id : 'ebusiness', text : '电商荟萃'},
			{id : 'hjbusiness', text : '厚街商贸'}
		],
		onSelected : function(value, text){
		    var url = "category/getAllServiceTrees?mchannel="+ window['tabid'];
			if(value == "service"){
				url = "service/getAllServeToField?mchannel="+ window['tabid'];
			}else if(value == "enterprise") {
				url = "enterprise/getAllEnterpriseToField?mchannel="+ window['tabid'];
			}else if(value == "hjmake") {
				url = "product/getAllProductToField?mchannel="+ window['tabid'];
			}else if(value == "ebusiness") {
				url = "product/getAllProductToField?mchannel="+ window['tabid'];
			}else if(value == "hjbusiness") {
				url = "enterprise/getAllEnterpriseToField?mchannel="+ window['tabid'];
			}else if(value == 'activity') { //活动未加入数据库，直接级联json文件
				$.getJSON('resources/json/activity.json?' + (new Date()).getTime().toString(), function(data) {
					window['mc'] = $("#moduleContent").ligerComboBox({
						valueField : 'id',
						textField : 'name',
						data : data,
						onSelected : function(v, t){
							if(!v) return;
							for(var i = 0; i < data.length; i++){
								$("#mname").attr("value", data[i].name);//色块名称
								$("#mindex").attr("value", data[i].url);	//色块链接首页
								$("#moduleAndID").attr("value", value +"|"+ data[i].id);	//色块原来所属模块对应自己的id
							}
						}
					});
				});
				return;
			}
			$.ajax({
				type : 'POST',
				url : url,
				dataType : 'json',
				success : function(responseText){
					var moduleData = responseText.data;
					if(value == "service"){
						window['valueField'] = "sid";
						window['textField'] = "sname";
						window['linkAction'] = "service/serviceLink?sid=";
					} else if(value == "enterprise") {
						window['valueField'] = "eid";
						window['textField'] = "epname";
						window['linkAction'] = "enterprise/enterpriseFeatures?eid=";
					}else if(value == "hjmake") {
						window['valueField'] = "pid";
						window['textField'] = "pname";
						window['linkAction'] = "product/productFeatures?pid=";
					}else if(value == "ebusiness") {
						window['valueField'] = "pid";
						window['textField'] = "pname";
						window['linkAction'] = "product/productFeatures?pid=";
					}else if(value == "hjbusiness") {
						window['valueField'] = "eid";
						window['textField'] = "epname";
						window['linkAction'] = "enterprise/enterpriseFeatures?eid=";
					}else{
						window['valueField'] = "cid";
						window['textField'] = "text";
						window['linkAction'] = "service/service_cid?cno=";
					}
					if(moduleData.length < 1) {
						window['mc'].setText('');
						$("#mname").val('');
						$("#mindex").val('');
						$("#moduleAndID").val('');
						window['mc'].setDisabled(true);
					} else {
						window['mc'] = $("#moduleContent").ligerComboBox({
							valueField : window['valueField'],
							textField : window['textField'],
							data : moduleData,
							onSelected : function(v, t){
								for(var i = 0; i < moduleData.length; i++){
									if(v != moduleData[i][window['valueField']]){
										continue;
									}
									$("#mname").attr("value", moduleData[i][window['textField']]);//色块名称
									$("#mindex").attr("value", window['linkAction']+ moduleData[i][window['valueField']]);	//色块链接首页
									$("#moduleAndID").attr("value", value +"|"+ moduleData[i][window['valueField']]);	//色块原来所属模块对应自己的id
									break;
								}
							}
						});
						window['mc'].setEnabled(true);
					}
				}
		    });
		}
	});
	$("#Nmchannel").ligerComboBox({
		valueFieldID : 'mchannel',
		disabled: true,
		data : [
			{id : 'hotservice', text : '热点服务'},
			{id : 'epshow', text : '企业风采'},
			{id : 'hjmake', text : '厚街制造'},
			{id : 'ebusiness', text : '电商荟萃'},
			{id : 'hjbusiness', text : '厚街商贸'}
		]
	});
	$("#Nstatus").ligerComboBox({
		valueFieldID : 'status',
		data : [
			{id : 'createing', text : '建设中'},
			{id : 'opening', text : '开放中'},
			{id : 'stoping', text : '停止服务'}
		]
	});
	window['mindex'] = $("#mindex").ligerTextBox().setDisabled(true);
	window['mcode'] = $("#mcode").ligerTextBox().setDisabled(true);
	window['micon'] = $("#micon").ligerTextBox().setDisabled(true);
	window['linktype1'] = $("#linktype1").ligerRadio();
	window['linktype2'] = $("#linktype2").ligerRadio();
	window['nlogin'] = $("#nlogin").ligerCheckBox();
	window['nauthor'] = $("#nauthor").ligerCheckBox();
	
	$("form").ligerForm({
		inputWidth : 160,
		space : 20
	});
	
	/**
	 * 点击热点服务,企业风采色块的操作
	 */
	$(".hotservice,.epshow,.hjmake,.ebusiness,.hjbusiness").dblclick(function(obj){
		var moduleData = $(this).data("moduleData");
		window['moduleData'] = moduleData;
		//如果这个色块为空，那么就清空右边form中的数据
		$("#moduleForm")[0].reset();
		$('#moduleForm input').each(function(index, input){
			if($(input).attr('type') != 'submit' && $(input).attr('type') != 'reset'){
				$(input).val("");
			}
		});
		$("#mposition").attr("value", $(this).attr("indexs"));	//色块索引位置
		$("#mcode").attr("value", window['tabid'] +"-"+ $(this).attr("indexs"));
		$("#Nmchannel").ligerGetComboBoxManager().setValue(window['tabid']);
		$("#Nstatus").ligerGetComboBoxManager().setValue("opening");
		//如果该色块已经配置相应的信息，那就将该信息赋值到右边的from表单中
		if(moduleData && moduleData.mid){
			$("#mposition").attr("value", moduleData.mposition);//模块位置索引
			$("#mid").attr("value", moduleData.mid);//色块ID
			$("#mname").attr("value", moduleData.mname);//色块名称
			$("#mcode").attr("value", moduleData.mcode);//色块编码
			$("#moduleAndID").attr("value", moduleData.moduleAndID);	//色块原来所属模块对应自己的id
			$("#Nmchannel").ligerGetComboBoxManager().setValue(moduleData.mchannel);//色块所属频道
			$("#Nstatus").ligerGetComboBoxManager().setValue(moduleData.status);//色块状态
			$("#mindex").attr("value", moduleData.mindex);	//色块链接首页
			$("#mdirect").attr("value", moduleData.mdirect);//授权回调地址
			$("#micon").attr("value", moduleData.micon);//授权回调地址
			//链接方式：1.弹窗，2.跳转
			if(moduleData.linktype == "1"){
				window['linktype1'].setValue(true);
				window['linktype2'].setValue(false);
			} else {
				window['linktype1'].setValue(false);
				window['linktype2'].setValue(true);
			}
			//进入模块时是否需要登录
			if(moduleData.nlogin){
				window['nlogin'].setValue(true);
			} else {
				window['nlogin'].setValue(false);
			}
			//进入模块时是否需要授权
			if(moduleData.nauthor){
				window['nauthor'].setValue(true);
			} else {
				window['nauthor'].setValue(false);
			}
			//色块图标或图片地址				
			$("#oldMicon").attr("value", moduleData.micon);
			//色块描述
			$("#mdesc").attr("value", moduleData.mdesc);
			//上传
			if($.trim($('#micon').val()) != ""){
				$('.fileUpload').css('display', 'none');
				$('.fileDelete').css('display', 'block');
			} 
		}else {
			$('.fileUpload').css('display', 'block');
			$('.fileDelete').css('display', 'none');
		}
		
		if(window['moduleEdit']){
			return window['moduleEdit'].show();
		}
		window['moduleEdit'] = $.ligerDialog.open({
        	title: "色块编辑",
        	height: 360,
        	width: 550,
        	isResize: true, 
        	modal: true,
        	target: $("#moduleDiv"),
        	buttons: [{
        		text: '保存',
        		onclick: function(item, dialog){
        			var url = "module/addModule";
					if(window['moduleData'] && window['moduleData'].mid){
						url = "module/modifyModule";
					}
					if($("#mindex").val() == ""){
						return $.ligerDialog.warn("您还未选择模块内容，请选择！");
					}
					if($("#oldMicon").val().indexOf("resources") != -1){
						if($("#micon").val() == ""){
							return $.ligerDialog.warn("您还未选择色块图标，请选择！");
						}
					}
					$.ajax({
						url : url,
						type : 'post',
						dataType : 'json',
						data : {
							mid : $('#mid').val() == "" ? 1 : $('#mid').val(),
							mposition : $('#mposition').val(),
							moduleAndID : $('#moduleAndID').val(),
							mname : $('#mname').val(),
							mcode : $('#mcode').val(),
							mchannel : $("#Nmchannel").ligerGetComboBoxManager().getValue(),
							status :  $("#Nstatus").ligerGetComboBoxManager().getValue(),
							mdirect : $('#mdirect').val(),
							mindex : $('#mindex').val(),
							linktype : window['linktype1'].getValue() ? 1 : 2,
							nlogin : window['nlogin'].getValue() ? true : false,
							nauthor : window['nauthor'].getValue() ? true : false,
							micon : $('#micon').val(),
							mdesc : $('#mdesc').val()					
						},
						success : function(responseText) {
							if(responseText.success){
								$.ligerDialog.success("操作成功！");
								$("#moduleForm")[0].reset();
								$('#moduleForm input').each(function(index, input){
									if($(input).attr('type') != 'submit' && $(input).attr('type') != 'reset'){
										$(input).val("");
									}
								});
								var mData = responseText.data[0];
								var className = ".icon-";
								if (tabid == "epshow"){
									className = ".ep-icon-";
								}else if (tabid == "hjmake"){
									className = ".hj-icon-";
								}else if (tabid == "ebusiness"){
									className = ".eb-icon-";
								}else if (tabid == "hjbusiness"){
									className = ".hb-icon-";
								}
								$(className + mData.mposition).data("moduleData", mData);
								$(className + mData.mposition).css("background-image", 'url("upload/'+ mData.micon +'")');
								dialog.hide();
							} else {
								$.ligerDialog.warn(responseText.message);
							}
						}
					});
        		}
        	},{
        		text: '取消',
        		onclick: function(item, dialog){
        			dialog.hide();
        		}
        	}]
		});
	});
	
	$(".hotservice,.epshow,.hjmake,.ebusiness,.hjbusiness").mouseover(function(){
		var moduleObj = $(this);
		var moduleData = moduleObj.data("moduleData");
		if(moduleData && moduleData.mindex != ""){
			var imgObj = moduleObj.children("img");
			if(imgObj.length == 0){
				moduleObj.append('<img src="resources/images/deletes.png" style="cursor:pointer;" />');
				//删除色块
				moduleObj.children("img").click(function(){
					var moduleData = moduleObj.data("moduleData");
					if(moduleData && moduleData.mid){
						$.ligerDialog.confirm('您确定要删除该色块吗？', function(b){
							if(b){
						       	$.ajax({
									type : 'post',
									url : 'module/deleteModule',
									data : {
										mid : moduleData.mid,
										mchannel : moduleData.mchannel,
										mcode : moduleData.mcode,
										mposition : moduleData.mposition,
										moduleAndID : moduleData.moduleAndID,
										micon : moduleObj.attr("iconsize")
									},
									dataType : 'json',
									success : function(data){
										if(data.success){
											var mData = data.data[0];
											moduleObj.data("moduleData", mData);
											moduleObj.css("background-image", 'url("upload/'+ mData.micon +'")');
										} else {
											$.ligerDialog.warn(data.message);
										}
									}
							    });
							}
						});
					}
				});
			} else {
				moduleObj.children("img").show();
			}
		}
	});
	
	$(".hotservice,.epshow,.hjmake,.ebusiness,.hjbusiness").mouseout(function(){
		var moduleData = $(this).data("moduleData");
		if(moduleData && moduleData.mindex != ""){
			var imgObj = $(this).children("img");
			if(imgObj.length != 0){
				$(this).children("img").hide();
			}
		}
	});
	
	$("#moduleApply,#moduleApplyEnterprise,#moduleApplyHj,#moduleApplyDs").click(function(obj){
		var jsondata = [];
		$(".hotservice,.epshow,.hjmake,.ebusiness,.hjbusiness").each(function(index, domEle){
			var moduleData = $(this).data("moduleData");
			if(moduleData && moduleData.mid){
				var rowData = [];
				rowData.push(moduleData.mid);
				rowData.push(moduleData.mposition);
				jsondata.push(rowData.join("@"));
			}
		});
		$.ajax({
			type : 'post',
			url : "module/modifyIndex",
			data : "jsondata="+ jsondata.join("|"),
			dataType : 'json',
			success : function(responseText){
				if(responseText.success){
					$.ligerDialog.success(responseText.message);
				} else {
					$.ligerDialog.warn(responseText.errorfield ? responseText.errorfield : responseText.message);
				}
			}
		});
	});
	
	/**
	 * 初始化tab标签里面的数据
	 */
	function initializeTab(tabObj, tabid){
		window['tabid'] = tabid;
		if(!tabObj.data(tabid)){
			tabObj.data(tabid, true);
		} else {
			return;
		}
		$.ajax({
			type : 'post',
			url : "module/queryModule",
			data : "mchannel="+ tabid,
			dataType : 'json',
			success : function(responseText){
				if(responseText.total != 0){
					var className = ".icon-";
					if (tabid == "epshow"){
						className = ".ep-icon-";
					} else if(tabid == "hjmake"){
						className = ".hj-icon-";
					} else if (tabid == "ebusiness"){
						className = ".eb-icon-";
					}else if (tabid == "hjbusiness"){
						className = ".hb-icon-";
					}
					var moduleData = responseText.data;
					for(var i = 0; i < moduleData.length; i++){
						$(className + moduleData[i].mposition).data("moduleData", moduleData[i]);
						$(className + moduleData[i].mposition).css("background-image", 'url("upload/'+ moduleData[i].micon +'")');
//						$(".hjmake").css("background-image", 'url("'+ moduleData[i].micon +'")');
					}
				}
				moduleDropFn("."+ tabid, "."+ tabid);
			}
		});
	}
	
	/**
	 * 色块拖动的方法函数
	 */
	function moduleDropFn(id, receices){
		$(id).ligerDrag({
			proxy : 'clone',
			revert : true,
			receive : receices,
			onStartDrag : function() {
				this.set({
					cursor : "not-allowed"
				});
			},
			onDragEnter : function(receive, source, e) {
				this.set({
					cursor : "pointer"
				});
			},
			onDragLeave : function(receive, source, e) {
				this.set({
					cursor : "not-allowed"
				});
			},
			onDrop : function(receive, source, e) {
				if (!this.proxy){
					return;
				}
				this.proxy.hide();
				var bgcolor = this.proxy.css('background-image');
				if (this.target.hasClass(receices.substring(1))) {
					var tData = $(this.target).data("moduleData");//原来的位置色块的数据
					var rData = $(receive).data("moduleData");//目标位置色块的数据
					if(tData && rData){
						//原色块和目标色块已配置过
						var tindex = tData.mposition;
						tData.mposition = rData.mposition;
						$(receive).data("moduleData", tData);
						rData.mposition = tindex;
						$(this.target).data("moduleData", rData);
					} else if(tData && !rData){
						//原色块配置过，但目标色块还没有
						tData.mposition = $(receive).attr("indexs");
						$(receive).data("moduleData", tData);
						$(this.target).data("moduleData", null);
					} else if(!tData && rData){
						//原色块还没有配置，但目标色块已经配置
						rData.mposition = $(this.target).attr("indexs");
						$(this.target).data("moduleData", rData);
						$(receive).data("moduleData", null);
					} else {
						return;
					}
					this.target.css("background-image", $(receive).css("background-image"));
					$(receive).css("background-image", bgcolor);
				}
			}
		});
	}
	/*--------------------上传部分，待封装------------------------*/
	//初始化上传窗口
	$('#uploadDiv').ligerTab();
	$('#file').change(function(){
		var name = $(this).val().split(".")[1].toLowerCase();
		if(name != "jpg" && name != "jpeg" 
			&& name != "gif" && name != "bmp" && name != "png"){
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
	
	$('#micon').click(function(){
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
						$('#micon').val(fileName);
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

