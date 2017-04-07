<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/sample/cho/main/import.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/view/header.jsp"%>
<%@ include file="/WEB-INF/view/aside.jsp"%>
	<div id="cbody" style="width:${(pdto.category_num +2)*200}px">
		<div>
			<br>&nbsp;&nbsp;<span class="glyphicon glyphicon-chevron-right"></span>
			<h3>${pdto.project_name}</h3>
		</div>
		<c:set var="pdto" value="${pdto}"></c:set>
		<c:forEach var="arr" items="${arr}">
			<form class="form-horizontal" action="memberUpdate.do">
			<div>
			<img src="/tpm_project/img/member/profile/${arr.member_img}">
				<h4>${arr.member_name}(${arr.member_id})</h4></div>
				<div class="col-sm-offset-7">
					<a class="btn btn-default disabled">외향성</a>&nbsp;&nbsp;&nbsp; <select>
						<option>5</option>
						<option>4</option>
						<option>3</option>
						<option>2</option>
						<option>1</option>
					</select> &nbsp;&nbsp;&nbsp;&nbsp; <a class="btn btn-default disabled">사고형</a>&nbsp;&nbsp;&nbsp;
					<select>
						<option>5</option>
						<option>4</option>
						<option>3</option>
						<option>2</option>
						<option>1</option>
					</select> <br> <a class="btn btn-default disabled">내향성</a>&nbsp;&nbsp;&nbsp;
					<select>
						<option>5</option>
						<option>4</option>
						<option>3</option>
						<option>2</option>
						<option>1</option>
					</select> &nbsp;&nbsp;&nbsp;&nbsp; <a class="btn btn-default disabled">감정형</a>&nbsp;&nbsp;&nbsp;
					<select>
						<option>5</option>
						<option>4</option>
						<option>3</option>
						<option>2</option>
						<option>1</option>
					</select> <br> <a class="btn btn-default disabled">감각형</a>&nbsp;&nbsp;&nbsp;
					<select>
						<option>5</option>
						<option>4</option>
						<option>3</option>
						<option>2</option>
						<option>1</option>
					</select> &nbsp;&nbsp;&nbsp;&nbsp; <a class="btn btn-default disabled">판단형</a>&nbsp;&nbsp;&nbsp;
					<select>
						<option>5</option>
						<option>4</option>
						<option>3</option>
						<option>2</option>
						<option>1</option>
					</select> <br> <a class="btn btn-default disabled">직감형</a>&nbsp;&nbsp;&nbsp;
					<select>
						<option>5</option>
						<option>4</option>
						<option>3</option>
						<option>2</option>
						<option>1</option>
					</select> &nbsp;&nbsp;&nbsp;&nbsp; <a class="btn btn-default disabled">인식형</a>&nbsp;&nbsp;&nbsp;
					<select>
						<option>5</option>
						<option>4</option>
						<option>3</option>
						<option>2</option>
						<option>1</option>
					</select>
				</div>
				<br>
				<div>
					<input type="reset" value="초기화">
					<input type="submit" value="평가완료">
					<hr>
				</div>
			</form>

		</c:forEach>
	</div>
</body>
</html>