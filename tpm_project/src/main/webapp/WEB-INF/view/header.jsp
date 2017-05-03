<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:if test="${ empty s_member_idx}"><c:redirect url="index.do"></c:redirect> </c:if>
<div class="wrapper">
<header class="main-header">
	<a href="projectList.do" class="logo"><b>TPM</b></a>
	<!-- Header Navbar: style can be found in header.less -->
	<nav class="navbar navbar-static-top" role="navigation">
		<!-- Sidebar toggle button-->
		<a href="javascript:sideBar()" class="sidebar-toggle" data-toggle="offcanvas"
			role="button"> <span class="sr-only">Toggle navigation</span> <span
			class="icon-bar"></span> <span class="icon-bar"></span> <span
			class="icon-bar"></span>
		</a>
		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<li class="dropdown user user-menu"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <img
						src="/tpm_project/img/member/profile/${s_member_img}" class="user-image"
						alt="User Image"> <span class="hidden-xs">${s_member_name}</span>
				</a>
					<ul class="dropdown-menu">
						<!-- User image -->
						<li class="user-header">
							<img src="/tpm_project/img/member/profile/${s_member_img}" class="img-circle" alt="User Image">
							<p>${s_member_name}</p>
						</li>
						<!-- Menu Footer-->
						<li class="user-footer">
							<div class="pull-left">
								<a href="memberInfo.do" class="btn btn-default btn-flat">Profile</a>
							</div>
							<div class="pull-right">
								<a href="memberLogOut.do" class="btn btn-default btn-flat">Sign out</a>
							</div>
						</li>
					</ul></li>
			</ul>
		</div>
	</nav>
</header>
<%@ include file="/WEB-INF/view/aside.jsp"%>
		
		<!-- Right side column. Contains the navbar and content of the page -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<!-- <section class="content-header">
				<h1>
					Contact <small>Control panel</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Contact</li>
				</ol>
			</section> -->
			
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-md-12">