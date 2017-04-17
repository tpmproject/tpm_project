<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
function comment(work_idx){
	$(comment_back).hide();
	$(comment_back).fadeIn();
	
	var wdiv=document.getElementById('wdiv'+work_idx);
	var fc=wdiv.firstChild;
	while(fc.nodeName!='SPAN'){
		fc=fc.nextSibling;
	}
	var work_title=fc.innerHTML
	document.getElementById('cm_work_title').innerHTML=work_title;
	
}
</script>
<style>
#comment_back{
	display:none;
	width:300px;
	height:2000%;
	position: fixed;
	right: 0px;
	top:-200px;
	background: white;
	z-index: 2;
}
#comment_div{
	position: fixed;
	top: 20%;
	
	z-index: 3;
	width:100%;
}
#cm_work_title{
	height:40px;
	width:100%;
	background:gray;
}
</style>
<div id="comment_back">
	<div id="comment_div">
	<div id="cm_work_title"></div>
		<div>
		코멘트 내용
		</div>
		<form>
		<input type="text" name="tpm_comment_content">
		</form>
	</div>
</div>