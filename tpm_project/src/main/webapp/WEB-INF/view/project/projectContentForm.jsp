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

function check(ch){
	var param='checklist_idx='+ch;
	sendRequest('checkUpdate.do', param, checkResult, 'POST');
}
function checkResult() {
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;
							
			/* 	glyphicon glyphicon-ok' : 'glyphicon glyphicon-unchecked */
				
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
	width: 200px;
	margin: 4px;
}
.cate_table thead td{
	padding: 4px;
}
.cate_table tbody td{
	padding-left: 4px;
}
.category_head{
	padding-top:7px;
	padding-bottom:7px;
	text-align: center;
}
.table_i{
	display: inline-block;
	height: 18px;
	vertical-align: text-top;
}
.check_div{
	padding-left:19px;
	height: 100px;
}
</style>
</head>
<%-- <%@include file="/WEB-INF/view/header.jsp" %> --%>
<body >
<div id="cbody" style="width:${(pdto.category_num +2)*200}px">
<div>
	<br>&nbsp;&nbsp;<span class="glyphicon glyphicon-chevron-right"></span>${pdto.project_name}
</div>
	<c:set var="pdto" value="${pdto}"></c:set>
	<c:choose>
		<c:when test="${empty pdto}"></c:when>
		<c:otherwise>
			<c:forEach var="cdto" items="${pdto.category_dtos}">
				<div class="category">
					<div class="category_head">
					${cdto.category_name }&nbsp;&nbsp;<i class="glyphicon glyphicon-plus"></i>
					&nbsp;&nbsp;<i class="glyphicon glyphicon-cog"></i>
					</div>
				
					<c:if test="${not empty cdto.work_dtos}">
					<c:forEach var="wdto" items="${cdto.work_dtos }">
						<table class="cate_table">
							<thead>
								<tr>
									<td>${wdto.work_title }</td>
									<td align="right"><i class="glyphicon glyphicon-cog"></i>&nbsp;&nbsp;&nbsp;</td>
								</tr>
							</thead>
							
							<tbody>	
								<tr>
									<td colspan="2"><div class="table_i glyphicon glyphicon-calendar"></div>&nbsp;${wdto.work_start}~${wdto.work_end}</td>
								</tr>						
								<tr>
									<td colspan="2">
									<div class="table_i glyphicon glyphicon-user"></div>
									<c:forEach var="mdto" items="${marr}">
									<c:if test="${mdto.work_idx eq wdto.work_idx}">${mdto.member_name}
									</c:if>
									</c:forEach>
									
									</td>
								</tr>
								<tr>
									<td colspan="2"><div class="table_i glyphicon glyphicon-check"></div>&nbsp;체크리스트+</td>
								</tr>
								<tr>
									<td colspan="2">
									<div class="check_div">
										<c:forEach var="chdto"
											items="${wdto.checklist_dtos}">
											<a onclick="javascript:check(${chdto.checklist_idx })">
											<i id="ch${chdto.checklist_idx }" class="${chdto.checklist_state eq '1' ? 'glyphicon glyphicon-ok' : 'glyphicon glyphicon-unchecked' }">
											</i>
											${chdto.checklist_content}
											</a><br>
										</c:forEach>
									</div>
									</td>
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
			<input type="text" class="form-control" name="category_name" placeholder="새로운 카테고리">
		</form>
	</div>
</div>
</body>
</html>