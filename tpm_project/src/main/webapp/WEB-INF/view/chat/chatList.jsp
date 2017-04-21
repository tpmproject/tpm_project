<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<fieldset>
	<legend>프로젝트 리스트</legend>
	<ul>
		<c:forEach var="pdto" items="${arry_pdto}">
			<li><a href="javascript:showChatContent('P','${pdto.project_idx}')">${pdto.project_name},${pdto.project_idx}</a></li>
		</c:forEach>
	</ul>
</fieldset>
<fieldset>
	<legend>채널 리스트</legend>
	
	<ul>
		<c:forEach var="chdto" items="${arry_chdto}">
			<li><a href="javascript:showChatContent('C','${chdto.channel_idx}')">${chdto.channel_name},${chdto.channel_idx}</a></li>
		</c:forEach>
	</ul>
</fieldset>