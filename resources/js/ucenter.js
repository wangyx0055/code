$(function(){
	window.onload = function(){
		//用户中心加载的时候，就先加载第一个页面
		$('.ucenter-menu a[data-target="#enterpriseInfo"]').ajaxTab('show');
		$('.ucenter-menu ul li').click(function(){
			var index_num = $('.ucenter-menu ul').find('li').index($(this)[0]);
			$('.ucenter-box>div:visible').hide();
			$('.ucenter-menu ul li').removeClass('hover');
			$('.ucenter-menu ul li').eq(index_num).addClass('hover');
			$('.ucenter-box>div').eq(index_num).show();
		});
	};
});

