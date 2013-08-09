$(function() {
//	$.ajax({
//		type : 'GET',
//		url : 'enterprise!getAllEnterpriseToField.action',
//		dataType : 'json',
//		beforeSend:function(){
//			$('.enterprise-list').showLoading();
//		},
//		success : function(data) {
//			if (data.success) {
//				$.each(data.data,function(index,item){
//					$('.enterprise-list').append('<li>'+item.epname+'</li>')
//				});
//			} else {
//			}
//		},
//		failure : function(response) {
//			console.log(response);
//		}
//	});
	
	$('.box-pane img').hover(function(){
		$(this).css('opacity',0.8);
	},function(){
	    $(this).css('opacity',1);
	});
	
//	$('.enterprise-list li').hover(function(){
//		$('.enterprise-special img').attr('src','upload/'+$(this).data('img'));
//	},function(){
//		$('.enterprise-special img').attr('src','resources/images/enterprise_specia_hubei.jpg');
//	})
});


