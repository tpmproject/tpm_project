<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기에 제목을 입력하십시오</title>

</head>
<body>
<fieldset>
	<legend>${wdto.work_idx} </legend>
	<form name="fileUpLoadForm" action="fileAdd.do" method="post" enctype="multipart/form-data" >
	<input type="hidden" name="work_idx" id="id_work_idx" value="${wdto.work_idx}">
	<input type="hidden" name="project_idx" id="id_project_idx" value="${pdto.project_idx }">
	 
	<input type="file" id="file_dnd" name="file_upload" multiple="multiple">
	
	<div id="div_list"></div>
	<div id="div_fns"></div>
	<div id="div_dnd" style="height: 350px; margin: 20px;text-align: center;line-height: 500px;font-size: 50px; background-color: #def;" >
	<img src="/tpm_project/img/fileicon/file.PNG"></div>
	<input type="submit" value="업로드">
	</form>
</fieldset>



<script type="text/javascript">



	var div_dnd = document.getElementById('div_dnd');    //드래그앤 드랍 영역
	var file_dnd = document.getElementById('file_dnd');  //input type="file"
	var div_fns = document.getElementById('div_fns');    //선택한 파일 목록

	//-- 이벤트를 중지 시킨다
	var stopevent = function(evt){
		console.log(evt.type);
		evt.preventDefault(); 
		evt.stopPropagation();
	}
	
	//-- 선택된 파일명 표시
	var showfns = function(files){
		var fns = [];
	
		for(var i=0,m=files.length;i<m;i++){
			fns.push(files[i].name+'('+files[i].size+' Byte)<input type="button" value="삭제" onclick="del(1)">' );
		}
		
		div_fns.innerHTML = fns.join('<br>');
	}
	//-- 드래그 관련 이벤트에 기본적으로 이벤트를 중지 시키도록 한다.
	div_dnd.ondragstart = stopevent
	div_dnd.ondragend = stopevent
	div_dnd.ondragover = stopevent
	div_dnd.ondragenter = stopevent
	div_dnd.ondragleave = stopevent
	div_dnd.ondrag = stopevent
	// div_dnd.ondrag = stopevent //이 이벤트는 따로 동작시킨다.
	
	// ondrop 에서 선택된 파일 제어 구문을 넣는다.
	div_dnd.ondrop= function(evt){
		stopevent(evt);//이벤트는 중지 시킨다.
		var files = evt.dataTransfer.files; //드롭된 파일리스트(FileList)
		console.log(files);
		file_dnd.files = files; //input type=file 에 파일을 넣어준다.
		file_dnd.onchange(); 
	}
	file_dnd.onchange = function(evt){
		showfns(this.files); //선택된 파일 목록 표시
	}
	
	function del(file){
		
		window.alert($('#file_dnd').val());
		
		
	}

</script>
	
</body>
</html>