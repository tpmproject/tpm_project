<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- <link href="css/myfriend_modal.css" rel="stylesheet"
	type="text/css"> -->
<!-- Bootstrap 3.3.2 -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<!-- Font Awesome Icons -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- Ionicons -->
<link
	href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css"
	rel="stylesheet" type="text/css">
<!-- Morris chart -->
<link href="plugins/morris/morris.css" rel="stylesheet" type="text/css">
<!-- jvectormap -->
<link href="plugins/jvectormap/jquery-jvectormap-1.2.2.css"
	rel="stylesheet" type="text/css">
<!-- Daterange picker -->
<link href="plugins/daterangepicker/daterangepicker-bs3.css"
	rel="stylesheet" type="text/css">
<!-- Theme style -->
<link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css">
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of
    downloading all of them to reduce the load. -->
<link href="dist/css/skins/_all-skins.min.css" rel="stylesheet"
	type="text/css">
<!-- jQuery 2.1.3 -->
<script src="plugins/jQuery/jQuery-2.1.3.min.js"></script>
<!-- Bootstrap 3.3.2 JS -->
<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js" type="text/javascript"></script>
<!-- Sparkline -->
<script src="plugins/sparkline/jquery.sparkline.min.js"
	type="text/javascript"></script>
<!-- jvectormap -->
<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"
	type="text/javascript"></script>
<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"
	type="text/javascript"></script>
<!-- daterangepicker -->
<script src="plugins/daterangepicker/daterangepicker.js"
	type="text/javascript"></script>
<!-- datepicker -->
<script src="plugins/datepicker/bootstrap-datepicker.js"
	type="text/javascript"></script>
<!-- iCheck -->
<script src="plugins/iCheck/icheck.min.js" type="text/javascript"></script>
<!-- SlimScroll 1.3.0 -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"
	type="text/javascript"></script>
<!-- ChartJS 1.0.1 -->
<script src="plugins/chartjs/Chart.min.js" type="text/javascript"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes)
    -->
<script src="dist/js/pages/dashboard2.js" type="text/javascript"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js" type="text/javascript"></script>
<script>

</script>
</head>
<body>
	<div class="box box-danger">
		<div class="box-header with-border">
			<h3 class="box-title">My Friend</h3>
			<div class="box-tools pull-right">
				<span class="label label-danger">8 Members</span>
				<button class="btn btn-box-tool">
					<i class="fa fa-lg fa-plus" data-toggle="modal" data-target="#myModal"></i>
				</button>
			</div>
		</div>
		<!-- /.box-header -->
		<div class="box-body no-padding">
			<ul class="users-list clearfix">
				<li><img src="dist/img/user1-128x128.jpg" alt="User Image">
					<a class="users-list-name" href="#">AIQ</a> <span
					class="users-list-date">Today</span></li>
				<li><img src="dist/img/user8-128x128.jpg" alt="User Image">
					<a class="users-list-name" href="#">Cho Jun Hyun</a> <span
					class="users-list-date">Yesterday</span></li>
				<li><img src="dist/img/user7-128x128.jpg" alt="User Image">
					<a class="users-list-name" href="#">Jane</a> <span
					class="users-list-date">12 Jan</span></li>
				<li><img src="dist/img/user6-128x128.jpg" alt="User Image">
					<a class="users-list-name" href="#">John</a> <span
					class="users-list-date">12 Jan</span></li>
				<li><img src="/tpm_project/img/member/temp_member.jpg"
					alt="User Image"> <a class="users-list-name" href="#">Alexander</a>
					<span class="users-list-date">13 Jan</span></li>
				<li><img src="/tpm_project/img/member/temp_member.jpg"
					alt="User Image"> <a class="users-list-name" href="#">Sarah</a>
					<span class="users-list-date">14 Jan</span></li>
				<li><img src="dist/img/user4-128x128.jpg" alt="User Image">
					<a class="users-list-name" href="#">Nora</a> <span
					class="users-list-date">15 Jan</span></li>
				<li><img src="dist/img/user3-128x128.jpg" alt="User Image">
					<a class="users-list-name" href="#">Nadia</a> <span
					class="users-list-date">15 Jan</span></li>
			</ul>
			<!-- /.users-list -->
		</div>
	</div>
	<%@ include file="/sample/cho/main/myfriend_modal.jsp" %>
</body>
</html>