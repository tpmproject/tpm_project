<%@page import="net.sf.json.JSONArray"%>
<%@page import="javax.json.JsonArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="tpm.comment.model.CommentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<CommentDTO> arr = (ArrayList)request.getAttribute("arr");
	
	JSONObject object = new JSONObject();
	JSONArray arr_comment = new JSONArray();
	
	for(int i=0; i<arr.size(); i++){
		JSONObject obj = new JSONObject();
		obj.put("member_img", arr.get(i).getMember_img());
		obj.put("member_name", arr.get(i).getMember_name());
		obj.put("member_id", arr.get(i).getMember_id());
		obj.put("comment_content", arr.get(i).getComment_content());
		obj.put("comment_date", arr.get(i).getComment_date());
		
		arr_comment.add(obj);
	}
	
	object.put("comments", arr_comment);
	
	out.clear();
	out.print(object);
	out.flush();
	
%>