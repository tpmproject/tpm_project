<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기에 제목을 입력하십시오</title>


<style type="text/css">
    
    #right-side #sidebar-wrapper {
    margin-right: -250px;
    right: 0;
    width: 250px;
	background-color:silver;
    position: fixed;
    height: 100%;
    overflow-y: auto;
    margin-top: -100px;
    z-index: 1000;
    transition: all 0.5s ease-in 0s;
    -webkit-transition: all 0.5s ease-in 0s;
    -moz-transition: all 0.5s ease-in 0s;
    -ms-transition: all 0.5s ease-in 0s;
    -o-transition: all 0.5s ease-in 0s;
  }

  #right-side .sidebar-nav {
    position: absolute;
    top: 0;
    width: 250px;
    list-style: none;
    margin: 0;
    padding: 0;
  }

  #right-side .sidebar-nav li {
    line-height: 50px;
    text-indent: 20px;
  }

  #right-side .sidebar-nav li a {
    color: #999999;
    display: block;
    text-decoration: none;
  }

  #right-side .sidebar-nav li a:hover {
    color: #fff;
    background: rgba(255,255,255,0.2);
    text-decoration: none;
  }

  #right-side .sidebar-nav li a:active, .sidebar-nav li a:focus {
    text-decoration: none;
  }

  #right-side .sidebar-nav > .sidebar-brand {
    height: 55px;
    line-height: 55px;
    font-size: 18px;
  }

  #right-side .sidebar-nav > .sidebar-brand a {
    color: #999999;
  }

  #right-side .sidebar-nav > .sidebar-brand a:hover {
    color: #fff;
    background: none;
  }

  #right-side #menu-toggle {
    top: 0;
    right: 0;
    position: fixed;
    z-index: 1;
  }

  #right-side #sidebar-wrapper.active {
    right: 250px;
    width: 600px;
    margin-top: -100px;
    transition: all 0.5s ease-out 0s;
    -webkit-transition: all 0.5s ease-out 0s;
    -moz-transition: all 0.5s ease-out 0s;
    -ms-transition: all 0.5s ease-out 0s;
    -o-transition: all 0.5s ease-out 0s;
  }

  #right-side .toggle {
    margin: 5px 190px 0 0;
  }
  
 </style>

<!-- 임시) 여기까지 첨부파일   -->
</head>
<body>
	<h1 style="margin: 10px 100px;">파일 업로드</h1>
<fieldset style="border-color:white;">
	<legend>파일 </legend>
	<form name="fileUpLoadForm" action="fileAdd.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="work_idx" id="id_work_idx" value="${wdto.work_idx}">
	<input type="hidden" name="project_idx" id="id_project_idx" value="${pdto.project_idx }">
	 
	<input type="file" id="file_dnd" name="file_upload" multiple="multiple">
	<div id="div_list"></div>
	<div id="div_fns"></div>
	<div id="div_dnd" style="height: 500px; margin: 20px;text-align: center;line-height: 500px;font-size: 50px; background-color: #def;" >
	<img src="/tpm_project/img/fileicon/file.PNG"></div>
	<input type="submit" value="업로드">
	</form>
</fieldset>



<script type="text/javascript">

    

	var div_dnd = document.getElementById('div_dnd');    //드래그앤 드랍 영역
	var file_dnd = document.getElementById('file_dnd');  //input type="file"
	var div_fns = document.getElementById('div_fns');    //선택한 파일 목록
    
	function del(a){
		window.alert(a);
	}
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
			fns.push(files[i].name+'('+files[i].size+' Byte)<input type="button" value="삭제" onclick="del('+files[i]+')">' );
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