<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기에 제목을 입력하십시오</title>
</head>
<body>
	<h1>drag and drop file control</h1>
<fieldset>
	<legend>drag and drop</legend>
	<input type="file" id="file_dnd" name="file_upload">
	<div id="div_fns"></div>
	<div id="div_dnd" style="height: 300px; margin: 20px; border:3px dotted red;text-align: center;line-height: 300px;font-size: 50px; background-color: #def;" >HERE</div>
</fieldset>

<fieldset>
	<legend>지원브라우저</legend>
	
	<ul>
		<li>크롬 : 4.0</li>
		<li>IE : 9.0</li>
		<li>FF : 3.5</li>
		<li>사파리 : 6.0</li>
		<li>오페라 : 12.0</li>
	</ul>
</fieldset>
<fieldset>
	<legend>간단설명</legend>
	
	<div>
		다 필요 없고 file의 드래그앤드롭에서는 최종으로 ondrop 이 발생되며, 이 때만 파일리스트를 제어하면 된다.
	</div>
</fieldset>

<script type="text/javascript">
	var div_dnd = document.getElementById('div_dnd');
	var file_dnd = document.getElementById('file_dnd');
	var div_fns = document.getElementById('div_fns');

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
			fns.push(files[i].name+'('+files[i].size+' Byte)');
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

</script>
	
</body>
</html>