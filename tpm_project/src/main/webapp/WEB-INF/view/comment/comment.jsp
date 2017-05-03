<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
	function comment(work_idx) {
		window.alert('comment페이지 업무 idx='+work_idx);
	}
</script>
<body>
<div class="container" id="commentBody">
	<div class="row">
		<div class="col-md-12" style="height: 600px; margin: 0px;">
			<div class="box-header">
				<i class="fa fa-comments-o"></i>
				<h3 class="box-title">Comment</h3>
			</div>
			
			<div class="box-body comment" id="comment-box">
				<div id="comment_div">
					<div id="comment_content_area"></div>
				</div>
			</div>
			
				<form name="newComment" id="comment_footer" action="javascript:commentAdd()" method="post">
					<input type="hidden" name="work_idx" value="${work_idx}">
					<c:set var="pdto" value="${pdto}"/>
					<c:if test="${pdto.project_level != 1000 }">
					<div class="input-group">
						<input type="text" class="form-control" id="comment"
							name="inputComment" placeholder="Type message...">
					<div class="input-group-btn">
						<button class="btn btn-success" type="button" onclick="javascript:commentAdd()">
							<i class="fa fa-plus"></i>
						</button>
						</div>
					</div>
					</c:if>		
						
				</form>
		</div>
	</div>
</div>
</body>
</html>