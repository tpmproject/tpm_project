<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/tpm_project/js/ajax_extension.js" type="text/javascript"></script>
<script>
function goAjax() {
	var param = 'member_idx=' + ${s_session_idx};
	sendRequest_extension(url, param, ajax_result, 'POST', 'JAVASCRIPT_AJAX');
}
</script>
</head>
<body>
<input type="button" value="JavaScript Ajax" onclick="goAjax()">
</body>
</html>