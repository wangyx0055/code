$(function() {
	
	$('.apply-btn').click(function(){
		console.log($('.uname').data('upassid').indexOf('admin@'));
		var $btn = $(this);
		if($('.uname').data('upassid') == ''){
			art.alert($btn.data('sname')+'申请需要登录,请先登录!');
		}else if($('.uname').data('upassid').indexOf('admin@') > 0){
			if($('.uname').data('upassid') == ''){}
			$('.apply-form input[name=sid]').val($btn.data('sid'));
	 		$('.apply-form .sname').html($btn.data('sname'));
	 		$('.apply-form .sprice').html($btn.data('sprice')+' (元)');
			var applyDialog = art.dialog.get('apply-dialog');
			if(applyDialog == null){
				applyDialog = art.dialog({
					id:'apply-dialog',
					title:$btn.data('sname')+'申请',
					content:$('.apply-form').html(),
				 	initialize: function () {
				 		$('#apply-name').focus();
				 		$('#apply-name,#apply-tel,#apply-email').blur(function(e){
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
									$.ajax({
										type : 'POST',
										url : 'serviceApply',
										data:$('.apply-form').serialize(),
										dataType : 'json',
										beforeSend:function(){
										},
										success : function(data) {
											if (data.success) {
												applyDialog.hidden();
												$btn.addClass('hide');
												$btn.next().removeClass('hide');
												art.alert($btn.data('sname')+'申请成功!');
											}else{
												art.alert($btn.data('sname')+'申请失败!');
											}
										},
										failure : function(response) {
											console.log(response);
										}
									});
								},
								focus : true
							}
			        	]
				});
			}else{
				applyDialog.visible();
			}
		}
	});
});