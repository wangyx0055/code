$(function(){
    $('.base-action').on('click',function(){
    	var i = $('.base-action').attr('action-data');
		if(i=='edit=0'){
			$(this).html('保存');
			$('.base-action').attr('action-data','edit=1');
			$('.base-view').hide();
			$('.base-view-edit').show();
			$.ajax({
				type:'POST',
				url:'',
				data:'',
				success:function(){
					
				}
			});
		}
		else if(i=='edit=1'){
			$(this).html('编辑');
			jSuccess('保存成功',{VerticalPosition:'center'});
			$('.base-action').attr('action-data','edit=0');
			$('.base-view').show();
			$('.base-view-edit').hide();
			$.ajax({
				type:'POST',
				url:'',
				data:'',
				success:function(){
					
				}
			});
		}
	});

	$('.enterprise-action').on('click', function() {
		var i = $('.enterprise-action').attr('action-data');
		if (i == 'edit=0') {
			$(this).html('保存');
			$('.enterprise-action').attr('action-data', 'edit=1');
			$('.enterprise-view').hide();
			$('.enterprise-view-edit').show();
			$.ajax({
				type : 'POST',
				url : '',
				data : '',
				success : function() {

				}
			});
		} else if (i == 'edit=1') {
			$(this).html('编辑');
		
			$('.enterprise-action').attr('action-data', 'edit=0');
			$('.enterprise-view').show();
			$('.enterprise-view-edit').hide();
			$("#epform").ajaxSubmit({
				url : "enterprise/updateEnterprise",
				type : 'POST',
				dataType : 'text',
				beforeSubmit : function() {
				},
				//clearForm : true,
				success : function(data) {
						$('.epname').html($('#epname').val());
						$('.epemail').html($('#epemail').val());
						$('.eplinkman').html($('#eplinkman').val());
						$('.epphone').html($('#epphone').val());
						jSuccess('保存成功',{VerticalPosition:'center'});
				},
				error : function() {
				}
			});
		}
	});
	$('.contact-action').on('click', function() {
		var i = $('.contact-action').attr('action-data');
		if (i == 'edit=0') {
			$(this).html('保存');
			$('.contact-action').attr('action-data', 'edit=1');
			$('.contact-view').hide();
			$('.contact-view-edit').show();
			$.ajax({
				type : 'POST',
				url : '',
				data : '',
				success : function() {
				}
			});
		} else if (i == 'edit=1') {
			$(this).html('编辑');
			$('.contact-action').attr('action-data', 'edit=0');
			$('.contact-view').show();
			$('.contact-view-edit').hide();
			$("#epform").ajaxSubmit({
				url : "enterprise/updateEnterprise",
				type : 'POST',
				dataType : 'text',
				beforeSubmit : function() {
				},
				//clearForm : true,
				success : function(data) {
						$('.linker').html($('#linker').val());
						$('.linktel').html($('#linktel').val());
						$('.linkfax').html($('#linkfax').val());
						$('.linkmail').html($('#linkmail').val());
						$('.address').html($('#address').val());
						$('.postcode').html($('#postcode').val());
						jSuccess('保存成功',{VerticalPosition:'center'});
				},
				error : function() {
				}
			});
		}
	});
});