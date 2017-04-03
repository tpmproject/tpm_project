<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function show(){
	var p1=document.getElementById('btntest');
	p1.style.display='none';
	var p2=document.getElementById('btntest2');
	p2.style.display='block';
}

</script>
</head>
<body>
<!-- header -->
<div class="modal-header">
    <!-- 닫기(x) 버튼 -->
  <button type="button" class="close" data-dismiss="modal">×</button>
  <!-- header title -->
  <h4 class="modal-title">프로젝트 생성</h4>

</div>
<!-- body -->
<div class="modal-body">
	<div id="btntest">
	
     <div>프로젝트명:  <input type="text" name="pname"></div>
 	 <div>프로젝트 설명:<textarea cols="30" rows="20"></textarea></div>
 	 </div>
 	 <div id="btntest2" style="display: none;">
     	명:<input type="text" name="pname"><br><textarea cols="30" rows="20"></textarea>
 	 </div>
</div>
<!-- Footer -->
<div class="modal-footer">
   	<button type="button" class="btn btn-next"  id="btn-next"  onclick="show()">다음</button>
  <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
</div>
</body>
</html>