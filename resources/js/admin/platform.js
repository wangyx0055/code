$(function(){
    window['grid'] = $("#maingrid").ligerGrid({
    	url: "hjform/load",
    	method: "get",
    	root: "aaData",
        height:'100%',
        columns: [{
        	display: '平台名称', name: 'pname', width: 150, minWidth: 220 
        }, { 
        	display: '平台管理域', name: 'pdomain', minWidth: 150
        }, { 
        	display: '平台联系人', name: 'plinkman', width: 100, minWidth: 150
        }, {
        	display: '平台联系方式', name: 'pphone', width: 100, minWidth: 150
        }, {
        	display: '平台地址', name: 'paddress', width: 150, minWidth: 250
        }],
	    pageSize:25,
	    rownumbers:true,
        toolbar: {
        	items: [{
        		text: '增加',
        		click: passportHandler,
        		icon: 'add' 
        	}, { line: true }, {
        		text: '修改',
        		click: passportHandler, 
        		icon: 'modify' 
        	}, { line: true }, {
        		text: '删除', 
        		click: passportHandler, 
        		img: 'jsLib/ligerUI-v1.2.0/lib/ligerUI/skins/icons/delete.gif'
        	}]
        }
    });
    $("#pageloading").hide();
    
    function passportHandler(item){
	    var record = grid.getSelectedRow();
	   	if(record){
			alert(record.epname);
	   	} else {
			alert("您还未选择任何数据！");	
	   	}
    }
});
