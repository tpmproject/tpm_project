<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 2.1.3 -->
<script src="/tpm_project/sample/cho/main/plugins/jQuery/jQuery-2.1.3.min.js"></script>
<script>
function goAjax() {
	
	var params = 'member_idx=' + ${sessionScope.s_member_idx} + '&member_id=' + $('#fkey').val();

	$.ajax({
		url : 'ajaxtest2.do',
		type : 'post',
		/*data : { memeber_idx : ${sessionScope.s_member_idx},
				 member_id : $('#fkey').val() },*/
		//data : params ,
		//dataType : 'text', // 텍스트 형식으로 넘어온다.
		dataType : 'json', // 제이슨 형식으로 넘어온다.
		beforeSend : function(data, form, option) {
			window.alert($('#fkey').val());
			if($('#fkey').val() == ''){
				window.alert('키를 입력해');
				return false;
			}
		},
		success : function(json) {
			window.alert(json);
			var msg = '';
			for(var i = 0 ; i < json.length ; i++){
				msg += '<span>' + json[i].member_idx + ', ' + json[i].member_id + '</span><br>';
			}
			$('#ajax_result_content').html(msg);
		}
	});
}
</script>
</head>
<body>
<span>a를 입력해 보세요</span><br>
<input type="text" id="fkey"><br>
<input type="button" value="Jquery Ajax" onclick="goAjax()">
<div id="ajax_result_content">
</div>
</body>
</html>