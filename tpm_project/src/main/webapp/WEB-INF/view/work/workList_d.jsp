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
	<table>
		<tbody>
			<tr>
				<td>카테고리 이름</td>
				<td align="right"><a id="workAdd">추가</button><br/>
				<div class="modal fade">
				  <div class="modal-dialog">
				    <div class="modal-content">
				    	<!-- remote ajax call이 되는영역 -->
				    </div>
				  </div>
				</div>
				</td>
			</tr>
			<tr>
				<td>업무명</td>
				<td align="right"><a>설정</a>
				</td>
			</tr>
			<tr>
				<td colspan="2">기간</td>
			</tr>
			<tr>
				<td colspan="2">멤버1, 멤버2</td>
			</tr>
			<tr>
				<td colspan="2">체크리스트+</td>
			</tr>
			<tr>
				<td colspan="2"><textarea rows="7">업무2</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="left">표시하기</td>
			</tr>
			<tr>
				<td>진행률</td>
				<td>막대그래프</td>
			</tr>
			<tr>
				<td><input type="button" value="결재요청"></td>
				<td align="right">코멘트|첨부파일</td>
			</tr>
		</tbody>
	</table>
</div>
<%@ include file="/WEB-INF/view/footer.jsp"%>
</body>
</html>