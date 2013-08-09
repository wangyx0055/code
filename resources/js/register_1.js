$(function(){
	$(".form-horizontal").validate({
		onfocusout: function(element) { $(element).valid(); },
		rules: {
			"epname": {
				required: true,
				minlength: 4
			},
			"epid":{
				required: true,
				rangelength:[3,10]
			},
			"eplinkman":{
				required: true,
				minlength: 2
			},
			"epemail": {
				required: true,
				email: true
			},
			"agree": {
				required: true
			},"mchannel": {
				required: true
			}
		},
		messages: {
			"epname": {
				required: "请输入 企业名称",
				minlength: "企业名称不得小于4个字符"
			},
			"epid": {
				required: "请输入企业编码",
				rangelength: "企业编码长度必须介于3和10之间"
			},
			"eplinkman": {
				required: "请输入联系人姓名",
				minlength: "联系人姓名不得小于2个字符"
			},
			"epemail": {
				required: "请输入联系人邮箱",
				email: "请输入正确格式的电子邮件"
			},
			"agree": {
				required: "请勾选"
			},"mchannel" :{
					required: "请选择企业类型"
			}
		}
	});
});