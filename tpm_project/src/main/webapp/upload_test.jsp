<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function show() {
	var c = document.getElementById('input_file').value;
	window.alert(c);
}
</script>
</head>
<body>
<form>
<input type="file" id="input_file">
<input type="button" value="적용" onclick="show()">
</form>

</body>
</html>