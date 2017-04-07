<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/tpm_project/js/ajax_extension.js" type="text/javascript"></script>
<script>
function ajax_result(httpRequest, ctype) {
	return function() {
		if(httpRequest.readyState == 4){
			if(httpRequest.status == 200){
				if(!httpRequest.responseText.match(null)){
					var responseText = httpRequest.responseText;
					window.alert(responseText);
					
					var msg = '';
					var json = JSON.parse(responseText);
					for(var i = 0 ; i < json.length ; i++){
						msg += '<span>' + json[i].member_idx + ', ' + json[i].member_id + '</span><br>';
					}
					
					var div = document.getElementById('ajax_result_content');
					div.innerHTML = msg;
				}
			}
		}
	}
}

function goAjax() {
	var param = 'member_id=' + document.getElementById('fkey').value + '&member_idx=' + ${sessionScope.s_member_idx};
	sendRequest_extension('ajaxtest1.do', param, ajax_result, 'POST', 'JAVASCRIPT_AJAX');
}
</script>
</head>
<body>
<span>a를 입력해 보세요</span><br>
<input type="text" id="fkey"><br>
<input type="button" value="JavaScript Ajax" onclick="goAjax()">
<div id="ajax_result_content">

</div>
</body>
</html>