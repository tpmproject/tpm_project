<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
/* function closeComment(){
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
	
	
} */
 	function comment(work_idx){
		//$('input[name=work_idx]').attr('value',work_idx); 
		window.alert('comment페이지 업무 idx='+work_idx);
	} 
</script>
<body>
	<div class="box-header">
	  <i class="fa fa-comments-o"></i> <h3 class="box-title">Comment</h3>
	</div>
	
	<div class="box-body chat" id="chat-box">
	  <!-- chat item -->
	  <div class="item">
	    <img src="/tpm_project/img/member/profile/${s_member_img}" class="online">
	
	    <p class="message">
	      <a href="#" class="name">
	        <small class="text-muted pull-right"><i class="fa fa-clock-o"></i> 2:15</small>
	        ${s_member_name}
	      </a>
	      I would like to meet you to discuss the latest news about
	      the arrival of the new theme. They say it is going to be one the
	      best themes on the market
	    </p>
		    <div class="attachment">
		      <h4> 첨부 파일 : </h4>
		      <p class="filename">
		        Theme-thumbnail-image.jpg
		      </p>
		    </div>
	    <!-- /.attachment -->
	  </div>
	  <!-- /.item -->
	</div>
	<!-- /.chat -->
	
	<div class="box-footer">
	<form name="newComment" action="javascript:commentAdd()" method="post">
	<input type="hidden" name="work_idx" value="${work_idx}">
	  <div class="input-group">
    	<input type="text" class="form-control" id="comment" name="inputComment" placeholder="Type message...">
      	<div class="input-group-btn">
	  		<button class="btn btn-success" type="button" onclick="javascript:commentAdd()"><i class="fa fa-plus"></i></button>
	    </div>
	  </div>
	  </form>
	</div>

</body>
</html>