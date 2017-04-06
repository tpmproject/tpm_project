<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tpm.file.model.FileDTO" %>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%
	ArrayList<FileDTO> fileList = (ArrayList) request.getAttribute("fileList");
	JSONObject object = new JSONObject();

	JSONArray arry_files = new JSONArray();
	for(int i = 0 ; i < fileList.size() ; i++){
		JSONObject obj = new JSONObject();
		obj.put("file_idx", fileList.get(i).getFile_idx());
		obj.put("member_idx", fileList.get(i).getMember_idx());
		obj.put("project_idx", fileList.get(i).getProject_idx());
		obj.put("work_idx", fileList.get(i).getWork_idx());
		obj.put("file_name", fileList.get(i).getFile_name());
		obj.put("file_date", fileList.get(i).getFile_date().toString());
		obj.put("file_size", fileList.get(i).getFile_size());
		obj.put("file_path", fileList.get(i).getFile_path());
		arry_files.add(obj);
	}
	
	object.put("files", arry_files);
	
	out.clear();
	out.println(object);
	out.flush();
	
%>
