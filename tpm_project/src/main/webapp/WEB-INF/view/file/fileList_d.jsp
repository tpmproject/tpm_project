<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="list" value="${fileList}"></c:set>
<c:forEach var="fileList" items="${list}">
<tr class="odd gradeX">
	<td>${fileList.file_idx}</td>
	<td>${fileList.file_name}</td>
	<td>${fileList.file_size}</td>
	<td class="center">${fileList.file_date}</td>
	<td class="center">안병민</td>
</tr>
</c:forEach>


