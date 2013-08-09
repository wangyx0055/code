var tab = null;
var accordion = null;
var tree = null;
function f_heightChanged(options) {
	if (tab)
		tab.addHeight(options.diff);
	if (accordion && options.middleHeight - 24 > 0)
		accordion.setHeight(options.middleHeight - 24);
}
function f_addTab(tabid, text, url) {
	tab.addTabItem({
		tabid : tabid,
		text : text,
		url : url
	});
}
$(function() {

	// 布局
	$("#layout1").ligerLayout({
		leftWidth : 190,
		height : '100%',
		heightDiff : -34,
		space : 4,
		onHeightChanged : f_heightChanged
	});

	var height = $(".l-layout-center").height();

	// Tab
	$("#framecenter").ligerTab({
		height : height
	});

	// 面板
	$("#accordion1").ligerAccordion({
		height : height - 24,
		speed : null
	});

	$(".l-link").hover(function() {
		$(this).addClass("l-link-over");
	}, function() {
		$(this).removeClass("l-link-over");
	});
	
	$('#accordion1 ul').each(function(){
		$(this).ligerTree({
			url : 'resources/json/'+$(this).attr('id')+'.json',
			checkbox : false,
			slide : false,
			nodeWidth : 120,
			ajaxType : "GET",
			attribute : [ 'nodename', 'url' ],
			onSelect : function(node) {
				if (!node.data.url)
					return;
				var tabid = $(node.target).attr("tabid");
				if (!tabid) {
					tabid = new Date().getTime();
					$(node.target).attr("tabid", tabid);
				}
				f_addTab(tabid, node.data.text, node.data.url);
			}
		});
	});

	tab = $("#framecenter").ligerGetTabManager();
	accordion = $("#accordion1").ligerGetAccordionManager();
	tree = $("#tree1").ligerGetTreeManager();
	$("#pageloading").hide();

});