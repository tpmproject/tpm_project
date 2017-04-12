<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/sample/cho/main/import.jsp"%>

</head>
<body class="skin-blue">
	<div class="wrapper">
		<%@ include file="/WEB-INF/view/header.jsp"%>
		<%@ include file="/WEB-INF/view/aside.jsp"%>
		
		<!-- Right side column. Contains the navbar and content of the page -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Contact<!--  <small>Control panel</small> -->
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Contact</li>
				</ol>
			</section>
			
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-md-">
						<!-- 컨텐트 삽입 -->
						
						<jsp:include page="fileListForm.jsp"></jsp:include>
					    
					</div>
				</div>
			</section>
		</div>
		
		<%@ include file="/WEB-INF/view/footer.jsp"%>
	</div>
</body>
</html>










