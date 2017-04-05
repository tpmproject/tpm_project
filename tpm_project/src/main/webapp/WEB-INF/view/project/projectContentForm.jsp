<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>TPM</title>
<link rel="stylesheet" href="bootstrap-3.3.2-dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
	function categoryAdd() {
		var param = 'project_idx=' + ${param.project_idx}
		+'&category_name=' + document.newCategory.category_name.value;
		sendRequest('categoryAdd.do', param, categoryAddResult, 'POST');
	}
	function categoryAddResult() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var result = XHR.responseText;
				if (result != null) {
					var cbodyNode = document.getElementById('cbody');
					var cateNode = document.getElementById('addCate');
					var divNode = document.createElement('div');
					divNode.innerHTML = result;
					cbodyNode.insertBefore(divNode, cateNode);
					 var cbody_width=document.getElementById("cbody");
					 cbody_width.style.width = parseInt(cbody_width.style.width)+200+"px";
				}
			}
		}

	}
</script>
<style>
.category {
	display: inline-block;
	width: 200px;
	float: left;
}
.cate_table{
	border:solid 1px black;
}
</style>
</head>
<%-- <%@include file="/WEB-INF/view/header.jsp" %> --%>
<body >
<div id="cbody" style="width:${(pdto.category_num +2)*200}px">
	<c:set var="pdto" value="${pdto}"></c:set>
	<c:choose>
		<c:when test="${empty pdto}"></c:when>
		<c:otherwise>
			<c:forEach var="cdto" items="${pdto.category_dtos}">
				<div class="category">
					<p>${cdto.category_name }<a><span class="glyphicon glyphicon-cog"></span></a>
					</p>
					<c:if test="${not empty cdto.work_dtos}">
					<c:forEach var="wdto" items="${cdto.work_dtos }">
						<table class="cate_table">
							<tbody>
								<tr>
									<td>${wdto.work_title }</td>
									<td align="right"><a onclick="test22()">설정</a></td>
								</tr>
								<tr>
									<td colspan="2">${wdto.work_start}~${wdto.work_end}</td>
								</tr>
								<tr>
									<td colspan="2">멤버1, 멤버2</td>
								</tr>
								<tr>
									<td colspan="2">체크리스트+</td>
								</tr>
								<tr>
									<td colspan="2"><c:forEach var="chdto"
											items="${wdto.checklist_dtos}">
											<input type="checkbox" value="${chdto.checklist_idx }"
												${chdto.checklist_state eq '1' ? 'checked="checked"' : '' }>${chdto.checklist_content}<br>
										</c:forEach></td>
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
					</c:forEach>
					</c:if>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>


	<div class="category" id="addCate">
		<form name="newCategory" action="javascript:categoryAdd()">
			<input type="text" name="category_name" placeholder="새로운 카테고리">
		</form>
	</div>
</div>
</body>
</html>