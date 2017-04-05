<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>TPM</title>
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
				var cateNode=document.getElementById('addCate');
				var divNode=document.createElement('div');
				divNode.innerHTML=result;
				bodyNode.insertBefore(divNode,cateNode);
				
			}
		}
	}
	
}
</script>
<style>
.category{
	display:inline-block;
	width: 200px;
	height:1000px;
	float:left;
}
</style>
</head>
<body id="body">
<c:set var="pdto" value="${pdto}"></c:set>
<c:choose>
<c:when test="${empty pdto}"></c:when>
<c:otherwise>
	<c:forEach var="cdto" items="${pdto.category_dtos}">
		<div class="category">
	      
	            <table>
	              <tbody>
	                <tr>
	                  <td>${cdto.category_name }</td>
	                  <td align="right">설정</td>
	                </tr>
	                 
	               <c:forEach var="wdto" items="${cdto.work_dtos }">
	                	<tr>
		                  <td>${wdto.work_title }</td>
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
                	</c:forEach>
	                
	              </tbody>
	            </table>
	    </div>
	</c:forEach>
</c:otherwise>
</c:choose>


<div class="category" id="addCate">
	<form name="newCategory" action="javascript:categoryAdd()">
		<input type="text" name="category_name" placeholder="새로운 카테고리">
	</form>
</div>

</body>
</html>