<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/sample/cho/main/import.jsp" %>
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