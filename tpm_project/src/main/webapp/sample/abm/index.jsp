<%@ page import="com.groupdocs.ui.Document" %>
<%@ page import="java.io.*" %>
<%
	int pageNumber = 1;
    String filename = "h.jpg";
	
   	if (filename.substring(filename.indexOf(".")).equals(".java")) {
		FileInputStream fis = null;
		FileOutputStream fos = null;

		try {
			
			fis = new FileInputStream("C:/Users/abm79/workspace/mya/storage/"+filename); // 원본파일
			String file1 = filename.substring(0, filename.indexOf("."));
			fos = new FileOutputStream("C:/Users/abm79/workspace/mya/storage/"+file1+".txt"); // 복사위치

			byte[] buffer = new byte[1024];
			int readcount = 0;

			while ((readcount = fis.read(buffer)) != -1) {

				fos.write(buffer, 0, readcount); // 파일 복사 

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
<!DOCTYPE html>
<html>
<head>
    <title>GroupDocs.Viewer for Java</title>
    <style>
        article.content {
            margin-bottom: 70px;
            width:100px;
        }
        .navbar .navbar-nav {
            display: inline-block;
            float: none;
        }
        .navbar .navbar-collapse {
            text-align: center;
        }
        /* api copylight 문구 숨기기 css  */
        .doc-page-trial{
        	display:none;
        }
      	.pg1-text1{
      	 	display:none;
      	}
    </style>
</head>
<body>

<article class="content">
    <%=doc.getHtmlContent() %>
 
</article>

<nav class="navbar navbar-inverse navbar-fixed-bottom">
    <div id="navbar" class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
            <li><a href="index.jsp?page=1">First</a></li>
            <li><a href="index.jsp?page=<%= pageNumber - 1 %>">Previous</a></li>
            <li><a href="index.jsp?page=<%= pageNumber + 1 %>">Next</a></li>
            <li><a href="index.jsp?page=<%= doc.getPageCount() %>">Last</a></li>
        </ul>
    </div>
</nav>

<script src="//code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>
