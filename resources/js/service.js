function getTree() {
	var treeCid = $("#tree_cid").val();
	var treeCname = $("#tree_cname").val();
	if (treeCid == 1) {
		treeCname = "全部服务分类";
	}
	$.ajax({
		type : "GET",
		url : "category/getServiceTree?treeCid=" + treeCid,
		dataType : "json",
		// beforeSend:RequestMenu,
		success : function(data) {

			if (data.success == false) {
				alert('类别加载失败!');
				return;
			}

			var allTreeStr = "";
			var treeStr = "";
			var oneTreeStr = "";
			var twoTreeStr = "";
			var threeTreeStr = "";

			for (i = 0; i < data.length; i++) {
				if (data[i].leaf==false) {
					oneTreeStr = '<li class="level-1"><a class="collapsed" href="javascript:void(0)">'
							+ data[i].text
							+ '<i class="switch"></i></a><ul>';
				} else {
					oneTreeStr = ' <li class="level-1" ><a href="javascript:void(0)" data-cid='+data[i].cid+' data-cname="'+data[i].text+'" data-leaf='+data[i].leaf+'>'+ data[i].text+ '</a><ul>';
				}
				if (data[i].leaf==false) {
					for (j = 0; j < data[i].children.length; j++) {

						if (data[i].children[j].leaf==false) {
							var treeStr2 = ' <li class="level-2"><a class="collapsed " href="javascript:void(0)">'
									+ data[i].children[j].text
									+ '<i class="switch"></i></a> <ul>';
						} else {

							var treeStr2 = ' <li class="level-2"><a href="javascript:void(0)" data-cid='+data[i].children[j].cid+' data-cname="'+data[i].children[j].text+'" data-leaf='+data[i].children[j].leaf+'>'
									+ data[i].children[j].text
									+ '</a></li><ul>';
						}

						if (data[i].children[j].leaf==false) {
							for (k = 0; k < data[i].children[j].children.length; k++) {

								var treeStr3 = ' <li class="level-3"><a href="javascript:void(0)" data-cid='+data[i].children[j].children[k].cid+' data-cname="'+data[i].children[j].children[k].text+'" data-leaf='+data[i].children[j].children[k].leaf+'>'+ data[i].children[j].children[k].text+ '</a></li>';

								threeTreeStr = threeTreeStr + treeStr3;

							}
						}
						twoTreeStr = twoTreeStr + treeStr2
								+ threeTreeStr + "</ul>";
						threeTreeStr = ""; // 清空三级菜单
					}
				}
				treeStr = treeStr + oneTreeStr + twoTreeStr
						+ threeTreeStr + "</ul></li>";

				twoTreeStr = "" // 清空二级菜单

			}
			var startStr = '<h3 class="head">' + treeCname
					+ '</h3><ul class="list">';
			var endStr = "</ul>";
			allTreeStr = startStr + treeStr + endStr;
			var html = document.getElementById('divTree').innerHTML = allTreeStr;

			// 显示与隐藏
			$('.list>li.level-1>a').click(function() {
				$(this).parent().children('ul').slideToggle();
				$(this).toggleClass('collapsed');
			});
			// 第三级
			$('.list li.level-2 a').click(function() {
				$(this).parent().children('ul').slideToggle();
				$(this).toggleClass('collapsed');
			});
			
			//获取类别下的服务
			$('.list a').on('click',function(){
				var $this = $(this);
				if($(this).data('leaf')){
					$('#serviceDiv .title').html($this.data('cname'));
					$.ajax({
						type : "GET",
						url : "service/getAllServeBycidToJson?cid=" + $(this).data('cid'),
						dataType : "json",
						success : function(data) {
							var services_html = '<h3 class="title">'+$this.data('cname')+'</h3><div class="list">';
							$.each(data,function(index,item){
								services_html += '<div class="mini-box"><div class="top"><a href="/service/serviceIntro?sid='+item.sid+'"><img src="upload/'+item.sicon+'"></a></div> <div class="bottom"><h3><span class="pull-left">'+item.sname+'</span><span class="num pull-right">¥'+item.sprice+'</span></h3><p class="btn" align="center"><a class="apply-btn" href="javascript:void(0);" data-sid='+item.sid+' data-sname='+item.sname+' data-sprice='+item.sprice+'><img src="resources/images/apply2_btn.jpg"></a><a class="enter-btn hide" href="service/serviceLink?sid='+item.sid+'" target="_blank" ><img src="resources/images/use_now.jpg"></a></p></div></div>';
							});
							$('.service-list').html(services_html+'</div>');
							serviceApply();
						},
						error : function() {
							art.alert("服务查询失败,请稍候再试！");
						}
					});
				}
			});
		},
		error : function() {
			art.alert("服务类别加载失败,请稍候再试！");
		}
	});

}

/* 跟据cid加载内容 */
function getServiceBycid(cid) {
	$.ajax({
		type : "GET",
		url : "service/getAllServeBycidToJson?cid=" + cid,
		dataType : "json",
		success : function(data) {
			var strHtml = "";
			var title = "";
			for (var i=0; i < data.length; i++) {
				strHtml += '<div class="mini-box"><div class="top"><a href=""><img src="upload/'+data[i].sicon+'"></a></div> <div class="bottom"><h3><span class="pull-left">'+data[i].sname+'</span><span class="num pull-right">'+data[i].price+'¥</span></h3><p class="btn" align="center"><a  href="javascript:void(0);" onclick="applyService()"><img src="resources/images/apply2_btn.jpg"></a></p></div></div>';
				title = data[i].cname;
			}
			var startHtml = '<div class="slide"><img src="resources/images/slide.jpg"></div><h3 class="title">'+title+'</h3><div class="list">';
			var endHtml = '</div>';
			strHtml = startHtml+strHtml+endHtml;
			$('#serviceDiv').html(strHtml);
		},
		error : function() {
			alert("网络连接出错！");
		}
	});
}

// 分页
function GoPage(id) {
	document.thisForm.ipage.value = id;
	document.thisForm.target = '_self';
	document.thisForm.submit();
}
$(function() {
	getTree();
	serviceApply();	
});