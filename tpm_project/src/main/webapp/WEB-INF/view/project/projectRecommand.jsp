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

for(int i=0;i<arr.size();i++){
	JSONObject obj=new JSONObject();
	obj.put("member_idx", arr.get(i).getMember_idx());
	obj.put("member_id", arr.get(i).getMember_id());
	obj.put("member_name", arr.get(i).getMember_name());
	obj.put("member_gender", arr.get(i).getMember_gender());
	obj.put("member_tel", arr.get(i).getMember_tel());
	obj.put("member_img", arr.get(i).getMember_img());
	obj.put("member_te", arr.get(i).getTe());
	obj.put("member_ti", arr.get(i).getTi());
	obj.put("member_ts", arr.get(i).getTs());
	obj.put("member_tn", arr.get(i).getTn());
	obj.put("member_tt", arr.get(i).getTt());
	obj.put("member_tf", arr.get(i).getTf());
	obj.put("member_tj", arr.get(i).getTj());
	obj.put("member_tp", arr.get(i).getTp());
	arry_members.add(obj);
}

object.put("members", arry_members);

out.clear();
out.println(object);
out.flush();

%>