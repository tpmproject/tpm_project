<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	window.alert('${success}');
	opener.memberAddForm.member_id.value = '${email}';
	var msg = '';
	msg += '<button class="btn btn-success disabled" type="button"> 인증 완료 ';
	msg += '<i class="fa fa-check spaceLeft"></i>';
	msg += '</button>';
	opener.document.getElementById('email_check_div').innerHTML = msg;
	window.self.close();
</script>