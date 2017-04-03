<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
var p1=document.getElementById('btntest');
var p2=document.getElementById('btntest2');
function show(){
	p1.style.display='none';
	p2.style.display='block';
}
function before(){
	p1.style.display='block';
	p2.style.display='none';
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
<form name="newProject" action="projectAdd.do" method="post">
<div class="modal-body">
	<div id="btntest">
	 	<div>프로젝트명:  <input type="text" name="project_name"></div>
 		 <div>프로젝트 설명:<textarea cols="30" rows="20" name="project_content"></textarea></div>
 		 <button type="button" class="btn btn-next"  id="btn-next"  onclick="show()">다음</button>
 		 
 	 </div>
 	 <div id="btntest2" style="display: none;">
     	친구 추가하기
     	
     	<div><button type="button" class="btn btn-next" onclick="before()">이전</button>
     	<input type="submit" value="완료"></div>
 	 </div>
</div>

</form>
</body>
</html>