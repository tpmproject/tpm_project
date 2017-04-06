<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="dragdoug01.css">
	<script src="dragdoug02.js"></script>
<script>
 function doFirst(){
	mypic = document.getElementById('deco');
	mypic.addEventListener("dragstart",startDrag,false);
	leftbox = document.getElementById('leftbox');
	leftbox.addEventListener("dragenter",function(e){e.preventDefault();},false);
	leftbox.addEventListener("dragover",function(e){e.preventDefault();},false);
	leftbox.addEventListener("drop",dropped,false);
 }
 function startDrag(e){
	var code = '<img id="deco" src="drag.jpg" width="200">';
	e.dataTransfer.setData('Text',code);
 }
 function dropped(e){
	e.preventDefault();
	leftbox.innerHTML = e.dataTransfer.getData('Text');
 }
 window.addEventListener("load",doFirst,false);
 function doFirst(){
		mypic = document.getElementById('deco');
		mypic.addEventListener("dragstart",startDrag,false);
		mypic.addEventListener("dragend",endDrag,false);
		leftbox = document.getElementById('leftbox');
		leftbox.addEventListener("dragenter",dragenter,false);
		leftbox.addEventListener("dragleave",dragleave,false);
		leftbox.addEventListener("dragover",function(e){e.preventDefault();},false);
		leftbox.addEventListener("drop",dropped,false);
	 }
	 function startDrag(e){
		var code = '<img id="deco" src="/tpm_project/img/member/profile/default_woman.jpg" width="200">';
		e.dataTransfer.setData('Text',code);
	 }
	 function dropped(e){
		e.preventDefault();
		leftbox.innerHTML = e.dataTransfer.getData('Text');
	 }
	  function endDrag(e){
		pic = e.target;
		pic.style.visibility='hidden';
	 }
	 function dragenter(e){
		e.preventDefault();
		leftbox.style.background="SkyBlue";
		leftbox.style.border="3px solid red";
	 }
	  function dragleave(e){
		e.preventDefault();
		leftbox.style.background="White";
		leftbox.style.border="3px solid blue";
	 }
	 
	 
	 
	 window.addEventListener("load",doFirst,false);
	 
</script>
<style>
#leftbox{
	float:left;
	width:250px;
	height:300px;
	height:250;
	margin:5px;
	border:3px solid blue;
}

#rightbox{
	float:left;
	width:250px;
	height:300px;
	height:250;
	margin:5px;
	border:3px solid red;
}
</style>
</head>
<body>
	<section id="leftbox">
		Drag an image in me!
	</section>
	<section id="rightbox">
		<img id="deco" src="/tpm_project/img/member/profile/default_woman.jpg" width="200">
	</section>
</body>
</html>