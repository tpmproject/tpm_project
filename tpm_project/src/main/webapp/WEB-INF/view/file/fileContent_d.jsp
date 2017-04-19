<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.groupdocs.ui.Document" %>
<%@ page import="java.io.*" %>

<%
	System.out.println("d_jsp들어옴");
	
    String filename = "aba.html";  //getAttribute는 객채로 들어옴 , requestParamter는 문자로만
    if(filename!=null){
    
    	
    System.out.println("if문 안쪽 들어옴");
	System.out.println("fileContent_d쪽에 들어온 값= "+filename);
	
	int pageNumber = 1;
   	if (filename.substring(filename.indexOf(".")).equals(".java")) {
		FileInputStream fis = null;
		FileOutputStream fos = null;

		try {
			
			fis = new FileInputStream("C:/Users/abm79/workspace/mya/storage/"+filename);
			String file1 = filename.substring(0, filename.indexOf("."));
			fos = new FileOutputStream("C:/Users/abm79/workspace/mya/storage/"+file1+".txt");//
			
			byte[] buffer = new byte[1024];
			int readcount = 0;

			while ((readcount = fis.read(buffer)) != -1) {

				fos.write(buffer, 0, readcount); 

			}
			filename=file1+".txt";
		} catch (Exception e) {

			e.printStackTrace();

		} finally {

			fis.close();
			fos.close();

		}
	
	}
	
	if (request.getParameterMap().containsKey("page")) {
		pageNumber = Integer.valueOf(request.getParameter("page"));
	}
	if (request.getParameterMap().containsKey("filename")) {
		filename = request.getParameter("filename");
	}

	Document doc = new Document();
	doc.setFilename(filename);
	doc.setPageNumber(pageNumber);

%>

    <title>GroupDocs.Viewer for Java</title>
    <style>
        article.content {
            margin: -30px 50px;
            width:400px;
            height:200px
        }
        .navbar .navbar-nav {
            display: inline-block;
            float: none;
        }
        .navbar .navbar-collapse {
            text-align: center;
        }
    
        .doc-page-trial{
        	display:none;
        }
      	.pg1-text1{
      	 	display:none;
      	}
      	
    </style>



<article class="content" >
	<div class="row">
		<div class="col-lg-12">
	<%=doc.getHtmlContent() %>
		</div>
	</div>
</article>

<nav class="navbar navbar-inverse navbar-fixed-bottom">
    <div id="navbar" class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
            <li><a href="fileContent_d.jsp?page=1">First</a></li>
            <li><a href="fileContent_d.jsp?page=<%= pageNumber - 1 %>">Previous</a></li>
            <li><a href="fileContent_d.jsp?page=<%= pageNumber + 1 %>">Next</a></li>
            <li><a href="fileContent_d.jsp?page=<%= doc.getPageCount() %>">Last</a></li>
        </ul>
    </div>
</nav>

<script src="//code.jquery.com/jquery-3.1.1.min.js"></script>

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/.3.7/js/bootstrap.min.js"></script>
<% } %>
