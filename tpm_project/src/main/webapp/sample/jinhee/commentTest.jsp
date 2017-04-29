<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function comment(work_idx) {
		//window.alert('comment페이지 업무 idx='+work_idx);
	}
	function showComment(){
		var param  = 'work_idx='+work_idx;
		window.alert(param);
		
		//sendRequest('commentList.do', param, showCommentResult, 'POST');
		
		$.ajax({
			url : 'commentList.do',
			type : 'post',
			data : param,
			dataType : 'json',
			success : function(json){
				var msg = '';
				
				for(var i=0; i<json.length; i++){
					var comments = json[i];
					window.alert(comments);
					
					msg += '<div class="box-body chat" id="chat-box">';
					msg += 		'<div class="item">';
					msg += 			'<img src="/tpm_project/img/member/profile/'+ json[i].cdto.mdto.member_ing +'" class="online">';
					msg += 			'<p class="message">';
					msg +=				'<a href="#" class="name"> <small class="text-muted pull-right">';
					msg += 					'<i class="fa fa-clock-o"></i> '+ json[i].cdto.comment_date+'</small>'+ json[i].cdto.mdto.member_name +'('+ json[i].cdto.mdto.member_id +')';
					msg += 				'</a>';
					msg += 				 json[i].cdto.comment_content;
					msg +=			 '</p>';
					msg += 		'</div>';
					msg += '</div>';
				}
				
				$('#comment_content').html(msg);
			}
			
		});
	}
</script>
</head>
<body>
	<div id="comment_content"></div>
</body>
</html>