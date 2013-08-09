/*
 * Author:Dominic
 * Date:2013-07-29
 */
$(document).ready(function() {
	//打开页面显示的内容
	var firsturl = $('#pandora-nav li a').eq(0).attr('href');
	var firstContent = $('#pandora-content>div').eq(0);
	$('#pandora-nav li a').eq(0).parent('li').addClass('active');
	firstContent.addClass('active');
	firstContent.load(firsturl,firstContent.show());
	//点击按钮显示相对应的内容
	$('#pandora-nav li a').click(function(){
		var index_num = $('#pandora-nav li a').index($(this)[0]);
		var currentContent = $('#pandora-content>div').eq(index_num);
		//window.location.hash = $(this).attr('href').substr(0,$(this).attr('href').length-5);
		$(this).parent('li').siblings().removeClass('active');
		$(this).parent('li').addClass('active');
		$('#pandora-content>div:visible').hide();
	    if(currentContent.hasClass('active')){
	    	currentContent.show();
	    }else{
	    	currentContent.addClass('active');
	    	currentContent.load($(this).attr('href'),currentContent.show());
	    }
		return false;
	});
});