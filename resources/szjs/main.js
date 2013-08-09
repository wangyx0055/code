$(function(){
	//左侧菜单隔行换色
	$('.menu > li:odd').addClass('odd');
	//左侧菜单滑动显示子菜单
	$('.menu > li').hover(function(){
		$(this).children('.sub-menu').show();
	},function(){
		$(this).children('.sub-menu').hide();
	});
	//搜索下拉列表
	$('.select').hover(function(){
		$('.choose-list').show();
	},function(){
		$('.choose-list').hide();
	});
	$('.choose-list li').on('click',function(){
		$('.choose-name').text($(this).text());
		$(this).parent().hide();
	});
});