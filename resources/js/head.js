function passportLogin(){
	$('.login-btn').on('click', function(e) {
		var loginDialog = art.dialog.get('login-dialog');
		if(loginDialog == null){
			var loginNow = function(){
				if ($('.upassid').val() == '') {
					$('.upassid').focus();
				} else if ($.trim($('.upassword').val()) == '') {
					$('.upassword').focus();
				} else if ($.trim($('.authcode').val()) == '') {
					$('.authcode').focus();
				} else {
					$.ajax({
						type : 'POST',
						url : 'public/passportLogin',
						dataType : 'json',
						data : {
							'upassid' : $.trim($('.upassid').val()),
							'upassword' : $.md5($.trim($('.upassword').val())),
							'authcode':$.trim($('.authcode').val()),
							KEEP_LOGIN:$('.keeplogin').is(':checked')
						},
						beforeSend:function(){
							loginDialog.button({
						        id: 'btn-login',
						        value: '登录中...',
						        disabled: true
						    });
						},
						success : function(data) {
							if (data.success) {
								$.cookie('UPASSID',$.trim($('.upassid').val()),{ expires: 30, path: '../'});
								$('.login-reg').addClass('hide');
								$('.uname').data('upassid',$.trim($('.upassid').val()));
								$('.uname').html(data.errorfield);
								$('.user-menu').removeClass('hide');
								loginDialog.hidden();
								window.location.reload();
							} else {
								$('.'+data.errorfield).select().focus();
								$('.'+data.errorfield+'-info').html(data.message);
							}
							loginDialog.button({
						        id: 'btn-login',
						        value: '立即登录',
					            focus: true,
						        disabled: false
						    });
						},
						failure : function(response) {
							$('.login-btn').button('reset');
							console.log(response);
						}
					});
				}
				return false;
			};
			loginDialog = art.dialog({
				id:'login-dialog',
				title:'平台登录',
				content:$('.login-form').html(),
				lock:true,
			 	initialize: function () {
			 		$('.upassid,.upassword,.authcode').on('keyup', function(e){
						var ev = document.all ? window.event : e;
						if(ev.keyCode == 13) {
							loginNow();
						}
					});
			 		if($.cookie('UPASSID') == null || $.cookie('UPASSID') == ''){
			 			$('.upassid').focus();
			 		}else{
			 			var upassid = $.cookie('UPASSID');
			 			if(upassid.charAt(0) == "\""){
			 				upassid = upassid.substring(1);
			 			}
			 			if(upassid.charAt(upassid.length - 1) == "\""){
			 				upassid = upassid.substring(0, upassid.length - 1);
			 			}
			 			$('.upassid').val(upassid);
			 			$('.upassword').focus();
			 		}
			 		$('.upassid,.upassword,.authcode').blur(function(e){
			 			var $helpInfo = $(this).parent().next();
			 			if($(this).val() == ''){
			 				$helpInfo.html($helpInfo.data('label')+'不能为空!');
			 			}else{
			 				$helpInfo.html('');
			 			}
			 		});
			    },
				button:[{
					value:'立即登录',
					id:'btn-login',
		            callback: function () {
		                return loginNow();
		            },
		            focus: true
	            }]
			});
		}else{
			loginDialog.visible();
		}
	});
}

function passportLogout(){
	$('.logout-btn').on('click', function() {
		$.ajax({
			type : 'POST',
			url : 'public/passportLogout',
			dataType : 'json',
			success : function(data) {
				if (data.success) {
					$('.user-menu').addClass('hide');
					$('.login-reg').removeClass('hide');
					window.location.href = './';
				}
			},
			failure : function(response) {
				console.log(response);
			}
		});
	});
}

function serviceApply(){
	$('.apply-btn').click(function(){
		var $btn = $(this);
		if($('.uname').data('upassid') == ''){
			art.alert($btn.data('sname')+'申请需要登录,请先登录!');
		}else if($('.uname').data('upassid').indexOf('admin@') == -1){
			art.alert('对不起,您没有权限申请此服务,请与企业管理员联系!');
		}else if($('.uname').data('upassid').indexOf('admin@') == 0){
			$('.apply-form input[name=sid]').val($btn.data('sid'));
	 		$('.apply-form .sname').html($btn.data('sname'));
	 		$('.apply-form .sprice').html($btn.data('sprice'));
			var applyDialog = art.dialog.get('apply-dialog');
			if(applyDialog == null){
				applyDialog = art.dialog({
					id:'apply-dialog',
					title:$btn.data('sname')+'申请',
					content:$('.apply-form').html(),
				 	initialize: function () {
				 		$('.link-name,.link-tel,.link-mail').blur(function(e){
				 			var $helpInfo = $(this).next();
				 			if($(this).val() == ''){
				 				$helpInfo.html($helpInfo.data('label')+'不能为空!');
				 			}else{
				 				$helpInfo.html('');
				 			}
				 		});
				    },
					button:[
				        	{
								value :'申请',
								callback : function(){
									if($('.link-name').val() == ''){
										$('.apply-name-info').html('联系人不能为空!');
										return false;
									}else if($('.link-tel').val() == ''){
										$('.apply-tel-info').html('联系电话不能为空!');
										return false;
									}else if($('.link-mail').val() == ''){
										$('.apply-mail-info').html('联系邮箱不能为空!');
										return false;
									}else{
										$.ajax({
											type : 'POST',
											url : 'service/serviceApply',
											data:{sid:$('.apply-sid').val(),linker:$('.link-name').val(),linkTel:$('.link-tel').val(),linkMail:$('.link-mail').val()},
											dataType : 'json',
											beforeSend:function(){
											},
											success : function(data) {
												if (data.success) {
													applyDialog.hidden();
													$('.apply-btn').addClass('hide');
													$('.enter-btn').removeClass('hide');
													art.alert(data.message);
												}else{
													art.alert(data.message);
												}
											},
											failure : function(response) {
												console.log(response);
											}
										});
									}
								},
								focus : true
							}
			        	]
				});
			}else{
				applyDialog.visible();
			}
		}else{
			art.alert('登录状态出现异常,请尝试重新登录!');
		}
	});
}

$(function() {
	
	$('.box-pane img').hover(function(){
		$(this).css('opacity',0.8);
	},function(){
	    $(this).css('opacity',1);
	});
	
	// 搜索
	$('#searchButIndex').on('click',function(){
		if($('#keyword').val()==""){
			alert('请输入需要搜索的内容');
			return;
		}
		var url = "news/searchNews";
		document.searchForm.action = url;
		document.searchForm.method = "post";
		document.searchForm.submit();
	});
	
	passportLogin();
	passportLogout();
	/**
	 * 点击登录按钮执行的方法(或者回车事件)
	 *//*
	function usersLogin(){
		if ($('#upassid').val() == '') {
			$('.upassid-info').html('账号不能为空');
			$('#upassid').focus(function(){
			   	$('.upassid-info').html('');
			})
		} else if ($.trim($('#upassword').val()) == '') {
			$('.upassword-info').html('密码不能为空');
            $('#upassword').focus(function(){
			   	$('.upassword-info').html('');
			})
		} else {
			var upassid = $.trim($('#upassid').val());
			var upassword = $.trim($('#upassword').val());
			if(P_SEQUENCE){
				if(P_SEQUENCE[0] != upassid){
					upassword = $.md5(upassword);
				}
			} else {
				upassword = $.md5(upassword);
			}
			$.ajax({
				type : 'POST',
				url : '/public/passportLogin',
				dataType : 'json',
				data : {
					'passport.upassid' : upassid,
					'passport.upassword' : upassword,
					'KEEP_LOGIN' : $('#KEEP_LOGIN').is(":checked")
				},
				success : function(data) {
					if (data.success) {
						$('.login-reg').hide();
						$('.uname').html(data.errorfield);
						$('.user-menu').show();
						loginDialog.close();
					} else {
						$('.'+ data.errorfield +'-info').html(data.message);
						$('#upassid').focus(function(){
						   $('.upassid-info').html('');
						})
                        $('#upassword').focus(function(){
						   $('.upassword-info').html('');
						})
					}
				},
				failure : function(response) {
					console.log(response);
				}
			});
		}
		return false;
	}
	
	*//**
	 * 点击登录按钮弹出登录的窗体
	 *//*
	$('.login-btn').on('click', function(e) {
	function zimbraRegUser(){
		$.ajax({
			type : 'GET',
			url : 'http://71tong.easysaas.net/service/Account',
			dataType : 'jsonp',
			jsonp: "callbackparam",
			jsonpCallback:"success_jsonpCallback",
			data : {
				'order' : '36',
				'upassid' : 'admin',
				'epdomain' : '71tong.easysaas.net',
				'username' : '超级管理员',
				'userrole' : '1',
				'isDomainAdmin' : '0',
				'active' : '0',
				'usergrade' : '1'
			},
			success : function(data) {
				if (data.success) {
					$('.apply-btn').attr('disabled',true)
				}else{
					$('.apply-btn').button('reset');
				}
			},
			failure : function(response) {
				console.log(response);
			}
		});
	}
		$.ajax({
			type : 'get',
			dataType : "jsonp",
			url : 'http://71tong.easysaas.net/service/Mail',
			jsonp: "callbackparam",//服务端用于接收callback调用的function名的参数
			jsonpCallback:"success_jsonpCallback",//callback的function名称
			data : {
				'domain' : '71tong.easysaas.net',
				'order' : '1',
				'username' : 'admin'
			},
			beforeSend:function(){},
			success : function(data) {
				console.log(data);
			},
			failure : function(response) {
				console.log(response);
			}
		});
		loginDialog = art.dialog({
			id : 'login_dialog',
			title : '平台登录',
			content : $('.login-form').html(),
			lock : true,
			initialize : function() {
				if(P_SEQUENCE != null){
					P_SEQUENCE = P_SEQUENCE.substring(1, P_SEQUENCE.length - 1).split('|');
					$('#upassid').attr("value", P_SEQUENCE[0]);
					$('#upassword').attr("value", P_SEQUENCE[1]);
					$('#KEEP_LOGIN').attr("checked", true);
				} else if(P_UPASSID != null){
					$('#upassid').attr("value", P_UPASSID.substring(1, P_UPASSID.length - 1));
				}
				$('#upassid').on('keyup', function(e){
					var ev = document.all ? window.event : e;
				    if(ev.keyCode == 13) {
				       	usersLogin();
				    }
				}).focus();
				$('#upassword').on('keyup', function(e){
					var ev = document.all ? window.event : e;
				    if(ev.keyCode == 13) {
				       	usersLogin();
				    }
				});
				$('#KEEP_LOGIN').on('keyup', function(e){
					var ev = document.all ? window.event : e;
				    if(ev.keyCode == 13) {
				       	usersLogin();
				    }
				});
			},
			button : [{
				value : '登  录',
				id : 'btn-login',
				callback : usersLogin,
				focus : true
			}]
		});
	});*/
	
	$('.online-service,.site-nav').click(function(){
		art.alert("功能建设中,敬请期待!");
	});
	
});


