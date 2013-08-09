$(function(){
	$('#common-use li').click(function(){
		$(this).siblings().removeClass('active');
		$(this).addClass('active');
	})
})