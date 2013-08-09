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