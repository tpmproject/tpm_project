<%@page import="tpm.member.model.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	ArrayList<MemberDTO> arry_mdto = (ArrayList) request.getAttribute("arry_mdto");
	System.out.println(arry_mdto.toString());

	/* JSONArray arry_members = new JSONArray();

	JSONObject obj = new JSONObject(); */
%>



<%-- <%@ page contentType="text/plain; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="listSize" value="${fn:length(resultList)}"/>
{
	"total":${listSize},
	"rows":[
			<c:choose>
			<c:when test="${listSize==0}">
			{"userNm":"null", "userTel":"null", "userEmail":"null"}
			</c:when>
			<c:otherwise>
			<c:forEach var="result" items="${resultList}" varStatus="status">
			{"userNm":"<c:out value="${result.userNm}"/>", "userTel":"<c:out value="${result.areaNo}-${result.houseMiddleTelno}-${result.houseEndTelno}" />", "userEmail":"<c:out value="${result.emailAdres}"/>"}<c:if test="${status.count != listSize}">,</c:if>
			</c:forEach>
			</c:otherwise>
			</c:choose>
]} --%>
