$(function(){
	// 电话号码验证
	jQuery.validator.addMethod("isTel", function(value, element) {
	var tel = /^\d{3,4}-?\d{7,9}$/; //电话号码格式010-12345678
	return this.optional(element) || (tel.test(value));
	}, "请正确填写您的电话号码"); 
	$(".myform").validate({
		onfocusout: function(element) { $(element).valid(); },
		rules: {
			"epemailcode1": {
				required: true
			},
			"epphone":{
				required: true
			},
			"linkmail":{
				required: true,
				email: true
			}
		},
		messages: {
			"epemailcode1": {
				required: "请输入验证码"
			},
			"epphone": {
				required: "请输入电话号码"
			},
			"linkmail": {
				required: "请输入联系人邮箱",
				email: "请输入正确格式的电子邮件"
			}
		}
	});
	
	/*$(".agree-btn").click(function(){
		$(".myform").ajaxSubmit({
			url : "enterprise/register_2",
			type : 'post',
			dataType : 'json',
			data : {},
			clearForm : true,
			success : function(data) {
				if(data.success){
				} else {
					$.ligerDialog.warn(data.message);
				}
			},
			error : function() {
			}
		});
		return false;
	});*/
	
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
	
	$('#eplogo,#missive,#permit').click(function(){
		var me = this;
//		alert('kaishi');
		
//		if(window['uploadEdit']){
//			return window['uploadEdit'].show();
//		}
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
						$(me).val(fileName);
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
