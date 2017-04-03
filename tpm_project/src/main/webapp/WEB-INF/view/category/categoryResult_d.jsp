<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="tpm.category.model.CategoryDTO" %>
<%
CategoryDTO dto=(CategoryDTO)request.getAttribute("categoryDTO");
%>
<%=dto.getCategory_name()%>