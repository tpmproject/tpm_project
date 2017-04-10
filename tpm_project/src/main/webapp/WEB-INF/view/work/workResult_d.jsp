<%@page import="tpm.work.model.WorkDTO"%>
<%@page import="tpm.member.model.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONObject" %>
<%@page import="org.json.simple.JSONArray" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%=request.getAttribute("result") %>
<%

ArrayList<MemberDTO> arr=(ArrayList)request.getAttribute("arr");
ArrayList<WorkDTO> arr_w=(ArrayList)request.getAttribute("arr_w");
ArrayList<MemberDTO> arr_m=(ArrayList)request.getAttribute("arr_m");

JSONObject object=new JSONObject();
JSONArray arry_members=new JSONArray();
for(int i=0;i<arr.size();i++){
	JSONObject obj=new JSONObject();
	obj.put("member_idx", arr.get(i).getMember_idx());
	obj.put("member_id", arr.get(i).getMember_id());
	obj.put("member_name", arr.get(i).getMember_name());
	obj.put("member_gender", arr.get(i).getMember_gender());
	obj.put("member_tel", arr.get(i).getMember_tel());
	obj.put("member_img", arr.get(i).getMember_img());
	arry_members.add(obj);
}

object.put("members", arry_members);

out.clear();
out.println(object);
out.flush();

%>
