<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="tpm.work.model.WorkDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


try{
	String msg=(String)request.getAttribute("msg");
	WorkDTO dto = new WorkDTO();
	if(msg==null||msg.equals("error")||msg.equals("")){
		
	}else{
		dto=(WorkDTO)request.getAttribute("mdto");
		int widx=dto.getWork_idx();
		String title=dto.getWork_title();
		Timestamp start=dto.getWork_start();
		Timestamp end=dto.getWork_end();
		Date ts= new Date(start.getDate());
		Date te=new Date(end.getDate());
		int confirm=dto.getWork_confirm();
		int cidx=dto.getCategory_idx();
		
		out.print("{w:{work_idx:"+widx+",work_title:"+title+",work_start:"+start+",work_end:"+end+",work_confirm:"+confirm+",category_idx:"+cidx+"'}}");
		
	}
	
}catch(Exception e){
	
}

%>
