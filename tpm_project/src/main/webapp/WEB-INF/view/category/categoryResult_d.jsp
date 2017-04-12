<%@page import="tpm.category.model.CategoryDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//add category

	try{
		String msg = (String) request.getAttribute("msg");
		if (msg==null||msg.equals("error")||msg.equals("")) {
			
		} else {
			CategoryDTO dto=(CategoryDTO)request.getAttribute("categoryDTO");
			int idx=dto.getCategory_idx();
			String name=dto.getCategory_name();
			
			out.print("{category:{category_idx:"+idx+",category_name:'"+name+"'}}");
		}
	}catch(Exception e2){}

//update,delete category
	try{
		int msg2 = (Integer)request.getAttribute("upd");
		if (msg2 ==0) {
			
		} else {
			out.print(msg2);
		}
	}catch(Exception e){}
%>