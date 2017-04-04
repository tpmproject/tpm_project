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

function projectMemberAdd(){
	var param='member_id='+document.newProject.member_id.value;
	sendRequest('projectMemberAdd.do',param,projectMemberAddResult,'POST');
	
}

function projectMemberAddResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var result=XHR.responseText;
			if(result!=null){
				var bodyNode=document.getElementById('body');
				var divNode=document.createElement('div');
				divNode.innerHTML=result;
				bodyNode.appendChild(divNode);
			}
		}
	}
	
}

</script>
</head>
<body id="body">
<!-- header -->
<div class="modal-header">
    <!-- 닫기(x) 버튼 -->
  <button type="button" class="close" data-dismiss="modal">×</button>
  <!-- header title -->
  <h4 class="modal-title">프로젝트 생성</h4>
</div>

<!-- body -->

<div class="modal-body">
<form name="newProject" action="projectAdd.do" method="post">
	<div id="btntest">
	 	<div>프로젝트명:  <input type="text" name="project_name"></div>
 		 <div>프로젝트 설명:<textarea cols="30" rows="20" name="project_content"></textarea></div>
 		 <button type="button" class="btn btn-next"  id="btn-next"  onclick="show()">다음</button>
 	 </div>
 	
 	 <div id="btntest2" style="display: none;">
     	<h2>그룹원 추가 하기</h2>
     	<div><input type="text" name="member_id"><button type="button"  class="btn" onclick="projectMemberAdd()">검색</button> </div>
     	<hr>
     	그룹원 리스트
     	
     	<div><button type="button" class="btn btn-next" onclick="before()">이전</button>
     	<input type="submit" class="btn" value="완료"></div>
     	
 	 </div>
</form> 	 
</div>
</body>
</html>