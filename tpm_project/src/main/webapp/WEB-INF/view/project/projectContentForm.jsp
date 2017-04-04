<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>TPM</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
    <link href="css/category_css.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
function categoryAdd(){
	var param='project_idx='+${param.project_idx}+'&category_name='+document.newCategory.category_name.value;
	sendRequest('categoryAdd.do',param,categoryAddResult,'POST');
}
function categoryAddResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var result=XHR.responseText;
			if(result!=null){
				var bodyNode=document.getElementById('body');
				var divNode=document.createElement('div');
				divNode.innerHTML=result;
				bodyNode.appendChild(divNode);
			}
		}
	}
	
}
</script>
</head>
<body id="body">
<c:set var="pdto" value="${pdto}"></c:set>
<c:choose>
<c:when test="${empty pdto}"></c:when>
<c:otherwise>
	<c:set var="cdtos" value="${pdto.category_dtos}"></c:set>
	<c:forEach var="cdto" items="cdtos" begin="0" end="${pdto.category_num}">
		<div class="section">
	      <div class="container">
	        <div class="row">
	          <div class="col-md-2">
	            <table class="table">
	              <tbody>
	                <tr>
	                  <td></td>
	                  <td align="right">설정</td>
	                </tr>
	                <tr>
	                  <td>업무명</td>
	                  <td align="right">
	                    <a onclick="test22()">설정</a>
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
	                  <td colspan="2">
	                    <textarea rows="7">업무2</textarea>
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
	                  <td>
	                    <input type="button" value="결재요청">
	                  </td>
	                  <td align="right">코멘트|첨부파일</td>
	                </tr>
	              </tbody>
	            </table>
	          </div>
	        </div>
	      </div>
	    </div>
	</c:forEach>
</c:otherwise>
</c:choose>


<div>
	<form name="newCategory" action="javascript:categoryAdd()">
		<input type="text" name="category_name" placeholder="새로운 카테고리">
	</form>
</div>

</body>
</html>