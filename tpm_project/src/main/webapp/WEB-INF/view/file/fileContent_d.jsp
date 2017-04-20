<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.groupdocs.ui.Document" %>
<%@ page import="java.io.*" %>


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
	${json}
	${doc.get(0)}
	
	
		</div>
	</div>
</article>

<nav class="navbar navbar-inverse navbar-fixed-bottom">
    <div id="navbar" class="collapse navbar-collapse">
        <ul class="nav navbar-nav">

        </ul>
    </div>
</nav>

<script src="//code.jquery.com/jquery-3.1.1.min.js"></script>

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/.3.7/js/bootstrap.min.js"></script>


