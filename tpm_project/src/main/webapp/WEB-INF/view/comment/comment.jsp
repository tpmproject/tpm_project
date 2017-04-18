<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
function closeComment(){
	localStorage.removeItem('work_idx');
	$(comment_back).fadeOut();
}
function comment(work_idx){
	$(comment_back).hide();
	$(comment_back).fadeIn();
	
	document.comment.tpm_comment_content.value='';
	
	var wdiv=document.getElementById('wdiv'+work_idx);
	var fc=wdiv.firstChild;
	while(fc.nodeName!='SPAN'){
		fc=fc.nextSibling;
	}
	var work_title=fc.innerHTML
	document.getElementById('cm_work_title').innerHTML='<h2>'+work_title+'</h2>';
	localStorage.setItem('work_idx',work_idx);
}
function addComment(){
	var content=document.comment.tpm_comment_content.value;
	if(content == null || content ==''){
		window.alert('코멘트를 입력해주세요.');
		return;
	}
	var work_idx=localStorage.getItem('work_idx');
	var param='work_idx='+work_idx+'&comment_content='+content+'&member_idx='+'${s_member_idx}';
	sendRequest('commentAdd.do', param, addCommentResult, 'POST');
}
function addCommentResult(){
	
	
}
</script>
<style>
#comment_back{
	display:none;
	min-width:300px;
	width:30%;
	height:2000%;
	position: fixed;
	right: 0px;
	top:-200px;
	background: #ecf0f5;
	z-index: 2;
	border-left: 1px solid #3c8dbc;
	padding-left: 5px;
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
}
</style>
<div id="comment_back">
<div id="comment_div">
	<span onclick="closeComment()"><i class="glyphicon glyphicon-remove"></i></span>
	<div id="cm_work_title"></div>
	<div>
		<table>
		</table>
	</div>
	
	<form name="comment" action="javascript:addComment()">
		<input type="text" name="tpm_comment_content"><span class="glyphicon glyphicon-comment btn-lg" onclick="addComment()"></span>
	</form>
</div>
</div>