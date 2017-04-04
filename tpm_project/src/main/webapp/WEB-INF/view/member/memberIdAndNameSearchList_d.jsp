<%@page import="tpm.member.model.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	ArrayList<MemberDTO> arry_mdto = (ArrayList) request.getAttribute("arry_mdto");
	
	JSONObject object = new JSONObject();

	JSONArray arry_members = new JSONArray();
	for(int i = 0 ; i < arry_mdto.size() ; i++){
		JSONObject obj = new JSONObject();
		obj.put("member_idx", arry_mdto.get(i).getMember_idx());
		obj.put("member_id", arry_mdto.get(i).getMember_id());
		obj.put("member_name", arry_mdto.get(i).getMember_name());
		obj.put("member_gender", arry_mdto.get(i).getMember_gender());
		obj.put("member_tel", arry_mdto.get(i).getMember_tel());
		obj.put("member_img", arry_mdto.get(i).getMember_img());
		arry_members.add(obj);
	}
	
	object.put("members", arry_members);
	
	out.clear();
	out.println(object);
	out.flush();
	
%>



<%-- <%@ page contentType="text/plain; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="listSize" value="${fn:length(resultLarry_members
	"total":${listSize},
	"rows":[
objectchoose>
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
