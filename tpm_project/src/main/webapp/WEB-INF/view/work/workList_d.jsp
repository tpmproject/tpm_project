<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap-3.3.2-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap-3.3.2-dist/css//bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#workAdd").click(function(){
		$('div.modal').modal({remote:'workAdd.do'});
	})
})
</script>
</head>
<body>
<%@ include file="/WEB-INF/view/sidebar.jsp"%>
<div class="category">
	<ul>
		<li>카테고리 이름<a id="workAdd">추가</a></li>
			<div class="modal fade">
				<div class="modal-dialog">
				   <div class="modal-content">
				    	<!-- remote ajax call이 되는영역 -->
				    </div>
				</div>
			</div>
		<li>업무명<a>설정</a></li>
		<li>기간</li>
		<li>멤버</li>
		<li>체크리스트 +</li>
		<li><textarea rows="7"></textarea></li>
		<li><a>표시하기</a></li>
		<li>진행률 | 막대그래프</li>
		<li><input type="button" value="결재요청">코멘트|첨부파일</li>
	</ul>
</div>
<%@ include file="/WEB-INF/view/footer.jsp"%>
</body>
</html>