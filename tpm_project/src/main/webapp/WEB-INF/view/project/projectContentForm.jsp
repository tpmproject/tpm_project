<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>TPM</title>
<script type="text/javascript" src="/js/httpRequest.js"></script>
<script>
function categoryAdd(){
	var category_name=document.newCategory.category_name.value;
	sendRequest('categoryAdd.do',category_name,categoryAddResult,'POST');
}
function categoryAddResult(){
	
	
}
</script>
</head>
<body>

<div>
	<form name="newCategory" action="javascript:categoryAdd()">
		<input type="text" name="category_name" placeholder="새로운 카테고리">
	</form>
</div>

</body>
</html>