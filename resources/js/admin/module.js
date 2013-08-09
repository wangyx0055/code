var editor;
$(document).ready(function() {
    editor = new $.fn.dataTable.Editor({
        "ajaxUrl": "module/manage",
        "domTable": "#data",
        "idSrc": "mid",
        "fields" : [
        	{"name" : "mcode", "label": "模块编号"},
			{"name" : "mname", "label": "模块名称"},
			{"name" : "mchannel", "label": "模块所属频道"},
			{"name" : "mposition", "label": "模块位置索引"},
			{"name" : "mindex", "label": "模块链接首页"},
			{"name" : "nauthor", "label": "是否需要授权"},
			{"name" : "linktype", "label": "链接方式", "type" : "text"},
			{"name" : "mdesc", "label": "模块描述", "type" : "textarea"}
		]
    });
    $('#data').on('click', 'a.editor_edit', function(e) {
    	alert(11);
//        e.preventDefault();
//        editor.edit($(this).parents('tr')[0], '修改记录', {
//            "label": "保存",
//            "fn": function() {
//                editor.submit()
//            }
//        });
    });
    $('#data').dataTable({
        "oLanguage": {
            "sLengthMenu": "每页显示 _MENU_ 条记录",
            "sZeroRecords": "对不起，查询不到任何相关数据",
            "sInfo": "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
            "sInfoEmtpy": "找不到相关数据",
            "sInfoFiltered": "数据表中共为 _MAX_ 条记录)",
            "sProcessing": "正在加载中...",
            "sSearch": "搜索",
            "sUrl": "",
            "oPaginate": {
                "sFirst": "第一页",
                "sPrevious": " 上一页 ",
                "sNext": " 下一页 ",
                "sLast": " 最后一页 "
            }
        },
        "sScrollY": 400,
        "bJQueryUI": true,
        "sPaginationType": "full_numbers",
        "sAjaxSource": "modulegetAllModules",
        "sAjaxDataProp": "data",
        "aoColumns" : [
        	{"mData" : "mcode"},//模块编码
			{"mData" : "mname"},//模块名称
			{"mData" : "mchannel"},//模块所属频道
			{"mData" : "mposition"},//模块位置索引
			{"mData" : "mindex"},//模块链接首页
			{"mData" : "nauthor"},//是否需要授权
			{"mData" : "linktype"},//链接方式：1.弹窗，2.跳转
			{"mData" : "mdesc"},//模块描述
    		{"mData" : null, "sDefaultContent" : '<a href="" class="editor_edit"><i class="icon-edit"></i></a> | <a href="" class="editor_remove"><i class="icon-remove"></i></a>'}
		],
		"aoColumnDefs": [
			{"mRender": function (data, type, row) {
				switch(data){
					case 'hotservice': return '热点服务'; break;
					case 'epshow': return '企业风采'; break;
					case 'allservice': return '服务大全'; break;
					case 'hjproduce': return '厚街制造'; break;
					case 'hjbusiness': return '厚街商贸'; break;
					case 'govep': return '政企之窗'; break;
					case 'ebshow': return '电商荟萃'; break;
					case 'epknown': return '企业智库'; break;
					case 'epweibo': return '企业社区'; break;
				}
            }, "aTargets": [2]},
            {"mRender": function (data, type, row) {
            	switch(data){
            		case false: return '不需要授权'; break;
					case true: return '需要授权'; break;
            	}
            }, "aTargets": [5]},
            {"mRender": function (data, type, row) {
            	switch(data){
            		case '1': return '弹窗'; break;
					case '2': return '跳转'; break;
            	}
            }, "aTargets": [6]}
		]
    });
    $("#data_length").before('<div class="btn-addModule"><p><button id="b_addModule" class="btn btn-mini" type="button">添加色块</button></p></div>');
    
    var oTable = $('#data').dataTable();
    $('#data').on('click', 'a.editor_remove', function(e) {
        e.preventDefault();
        var tr = $(this).parents('tr')[0];
       	var record = oTable.fnGetData(tr);
       	$.ajax({
			type : 'POST',
			url : 'module/deleteModule',
			data : "jsondata="+ record.mid,
			success : function(data){
				oTable.fnDeleteRow(tr);
			}
	    });
    });
    
    //点击添加按钮后弹出添加模块的窗体
    $("#b_addModule").click(function(){
    	 $("#moduleWin").modal({
    	 	show : true,
    	 	backdrop : false
    	 });
    });
    
    $("#maction").change(function(){
    	var jsondata = "service", action = $("#maction").val();
    	if(action.indexOf("service_cid") != -1){
    		jsondata = "serviceType";
    	}
    	$.ajax({
			type : 'POST',
			url : 'module/getLinkAddress',
			data : {
				jsondata : jsondata
			},
			dataType : 'json',
			success : function(responseText){
				if(responseText.success){
					var tempStr = [], mData = responseText.data;
					for(var i = 0; i < mData.length; i++){
						tempStr.push('<option value="'+ mData[i][0] +'">'+ mData[i][1] +'</option>');
					}
					$("#mservice").html(tempStr.join(""));
				}
			}
	    });
    });
    
    
    //添加模块保存操作
    $("#saveModule").click(function(){
    	$("#mindex").val(($("#maction").val() + $("#mservice").val()));
    	$.ajax({
			type : 'POST',
			url : 'module/addModule',
			data : $("#moduleForm").serialize(),//序列化表单里所有的内容
			success : function(data){
				$("#moduleWin").modal('hide');
			}
	    });
    });
    //隐藏添加模块的窗体
    $("#cancelModule").click(function(){
    	$("#moduleWin").modal('hide');
    });
    $("#mposition").keypress(function(event){
        var keyCode = event.which;
        //只允许输入数字和按下删除键
        if (keyCode == 8 || (keyCode >= 48 && keyCode <=57)){
        	return true;
        } else {
        	return false;
        }
    }).focus(function(){
        this.style.imeMode = 'disabled';
    });
    $("#mposition").keyup(function(){
    	var mposition = $("#mposition").val();
    	if(mposition > 99){
    		$("#mposition").val(mposition.substring(0,2));
    	}
    });
});






