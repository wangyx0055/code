$(function() {
	
	$('.epid').focus(function(){
		$('.epid-info').html('');
	});
	$('.upassid').focus(function(){
		$('.upassid-info').html('');
	});
	$('.upassword').focus(function(){
		$('.upassword-info').html('');
	});
	
	$('.login-btn').click(function(){
	    if ($('.epid').val() == '') {
			$('.epid').focus();
			$('.epid-info').html('企业编码不能为空!');
		} else if ($('.upassid').val() == '') {
			$('.upassid').focus();
			$('.upassid-info').html('通行证帐号不能为空!');
		} else if ($.trim($('.upassword').val()) == '') {
			$('.upassword').focus();
			$('.upassword-info').html('通行证密码不能为空!');
		} else {
			$.ajax({
				type : 'POST',
				url : 'passport/verifyPassport',
				dataType : 'json',
				data : {
					'passport.epid' : $.trim($('.epid').val()),
					'passport.upassID' : $.trim($('.upassid').val()),
					'passport.upassword' : $.md5($.trim($('.upassword').val()))
				},
				beforeSend:function(){
					$('.login-btn').button('loading');
				},
				success : function(data) {
					$('.login-btn').button('reset');
					if (data.success) {
				        window.location.href = data.message;
					} else {
						$('.'+data.errorfield).select().focus();
						$('.'+data.errorfield+'-info').html(data.message);
					}
				},
				failure : function(response) {
					console.log(response);
				}
			});
		}
	});
});