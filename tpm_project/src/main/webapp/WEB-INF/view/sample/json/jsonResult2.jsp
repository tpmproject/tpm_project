<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="tpm.member.model.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
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