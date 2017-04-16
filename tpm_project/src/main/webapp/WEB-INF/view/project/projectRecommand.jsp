<%@page import="net.sf.json.JSONObject"%>
<%@page import="tpm.member.model.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

ArrayList<MemberDTO> arr=(ArrayList)request.getAttribute("arr");

JSONObject object=new JSONObject();
JSONArray arry_members=new JSONArray();
JSONArray arry_tendency=new JSONArray();
for(int i=0;i<arr.size();i++){
	JSONObject obj=new JSONObject();
	obj.put("member_idx", arr.get(i).getMember_idx());
	obj.put("member_id", arr.get(i).getMember_id());
	obj.put("member_name", arr.get(i).getMember_name());
	obj.put("member_gender", arr.get(i).getMember_gender());
	obj.put("member_tel", arr.get(i).getMember_tel());
	obj.put("member_img", arr.get(i).getMember_img());
	obj.put("member_td", arr.get(i).getTd());
	arry_members.add(obj);
}

object.put("members", arry_members);

out.clear();
out.println(object);
out.flush();

%>