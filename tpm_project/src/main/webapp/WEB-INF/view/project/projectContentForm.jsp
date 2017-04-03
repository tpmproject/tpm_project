<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>TPM</title>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
function categoryAdd(){
	var param='category_name='+document.newCategory.category_name.value;
	sendRequest('categoryAdd.do',param,categoryAddResult,'POST');
}
function categoryAddResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var newCategory=XHR.responseText;
			var bodyNode=document.getElementById('body');
			var divNode=document.createElement('div');
			divNode.innerHTML=newCategory;
			bodyNode.appendChild(divNode);
		}
	}
	
}
</script>
</head>
<body id="body">
<div>
	<form name="newCategory" action="javascript:categoryAdd()" method="POST">
		<input type="text" name="category_name" placeholder="새로운 카테고리">
	</form>
</div>

</body>
</html>