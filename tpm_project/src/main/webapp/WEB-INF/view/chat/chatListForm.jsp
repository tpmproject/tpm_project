<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap 3.3.2 -->
<link href="/tpm_project/sample/cho/main/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<!-- Font Awesome Icons -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- Ionicons -->
<link
	href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css"
	rel="stylesheet" type="text/css">
	
<!-- Theme style -->
<link href="/tpm_project/sample/cho/main/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css">
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of
    downloading all of them to reduce the load. -->
<link href="/tpm_project/sample/cho/main/dist/css/skins/_all-skins.min.css" rel="stylesheet"
	type="text/css">
	
<link href="/tpm_project/css/chat/chatContact.css" rel="stylesheet" />

<!-- jQuery 2.1.3 -->
<script src="/tpm_project/sample/cho/main/plugins/jQuery/jQuery-2.1.3.min.js"></script>
<script src="/tpm_project/js/jquery-3.2.0.js"></script>
<!-- jQuery UI 1.11.1 -->

<script src="/tpm_project/sample/cho/main/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<!-- AdminLTE App -->
<script src="/tpm_project/sample/cho/main/dist/js/app.min.js" type="text/javascript"></script>

<script type="text/javascript" src="/tpm_project/js/chat/chatContact.js"></script>
<!-- JavaScrip Search Plugin -->
<script
	src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script>
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
					Contact
					<!--  <small>Control panel</small> -->
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Contact</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<!-- 컨텐트 삽입 -->
						<div class="col-md-4">
							<div class="panel panel-default">
								<div class="panel-heading c-list">
									<span class="title">Contacts</span>
									<ul class="pull-right c-controls">
									
										<li><button class="btn btn-box-tool">
												<i class="glyphicon glyphicon-plus" data-toggle="modal"
													data-target="#myModal"></i>
											</button>
											<!-- <a href="#cant-do-all-the-work-for-you"
											data-toggle="tooltip" data-placement="top"
											title="Add Contact"><i class="glyphicon glyphicon-plus"></i></a> --></li>
										<li><a href="#" class="hide-search"
											data-command="toggle-search" data-toggle="tooltip"
											data-placement="top" title="Toggle Search"><i
												class="fa fa-ellipsis-v"></i></a></li>
									</ul>
								</div>

								<div class="row" style="display: none;">
									<div class="col-xs-12">
										<div class="input-group c-search">
											<input type="text" class="form-control"
												id="contact-list-search"> <span
												class="input-group-btn">
												<button class="btn btn-default" type="button">
													<span class="glyphicon glyphicon-search text-muted"></span>
												</button>
											</span>
										</div>
									</div>
								</div>

								<ul class="list-group" id="contact-list">
									<li class="list-group-item">
										<div class="col-xs-12 col-sm-3">
											<img src="http://api.randomuser.me/portraits/men/49.jpg"
												alt="Scott Stevens" class="img-responsive img-circle" />
										</div>
										<div class="col-xs-12 col-sm-9">
											<span class="name">Scott Stevens</span><br /> <span
												class="glyphicon glyphicon-map-marker text-muted c-info"
												data-toggle="tooltip" title="5842 Hillcrest Rd"></span> <span
												class="visible-xs"> <span class="text-muted">5842
													Hillcrest Rd</span><br /></span> <span
												class="glyphicon glyphicon-earphone text-muted c-info"
												data-toggle="tooltip" title="(870) 288-4149"></span> <span
												class="visible-xs"> <span class="text-muted">(870)
													288-4149</span><br /></span> <span
												class="fa fa-comments text-muted c-info"
												data-toggle="tooltip" title="scott.stevens@example.com"></span>
											<span class="visible-xs"> <span class="text-muted">scott.stevens@example.com</span><br /></span>
										</div>
										<div class="clearfix"></div>
									</li>
									<li class="list-group-item">
										<div class="col-xs-12 col-sm-3">
											<img src="http://api.randomuser.me/portraits/men/97.jpg"
												alt="Seth Frazier" class="img-responsive img-circle" />
										</div>
										<div class="col-xs-12 col-sm-9">
											<span class="name">Seth Frazier</span><br /> <span
												class="glyphicon glyphicon-map-marker text-muted c-info"
												data-toggle="tooltip" title="7396 E North St"></span> <span
												class="visible-xs"> <span class="text-muted">7396
													E North St</span><br /></span> <span
												class="glyphicon glyphicon-earphone text-muted c-info"
												data-toggle="tooltip" title="(560) 180-4143"></span> <span
												class="visible-xs"> <span class="text-muted">(560)
													180-4143</span><br /></span> <span
												class="fa fa-comments text-muted c-info"
												data-toggle="tooltip" title="seth.frazier@example.com"></span>
											<span class="visible-xs"> <span class="text-muted">seth.frazier@example.com</span><br /></span>
										</div>
										<div class="clearfix"></div>
									</li>
									<li class="list-group-item">
										<div class="col-xs-12 col-sm-3">
											<img src="http://api.randomuser.me/portraits/women/90.jpg"
												alt="Jean Myers" class="img-responsive img-circle" />
										</div>
										<div class="col-xs-12 col-sm-9">
											<span class="name">Jean Myers</span><br /> <span
												class="glyphicon glyphicon-map-marker text-muted c-info"
												data-toggle="tooltip" title="4949 W Dallas St"></span> <span
												class="visible-xs"> <span class="text-muted">4949
													W Dallas St</span><br /></span> <span
												class="glyphicon glyphicon-earphone text-muted c-info"
												data-toggle="tooltip" title="(477) 792-2822"></span> <span
												class="visible-xs"> <span class="text-muted">(477)
													792-2822</span><br /></span> <span
												class="fa fa-comments text-muted c-info"
												data-toggle="tooltip" title="jean.myers@example.com"></span>
											<span class="visible-xs"> <span class="text-muted">jean.myers@example.com</span><br /></span>
										</div>
										<div class="clearfix"></div>
									</li>
									<li class="list-group-item">
										<div class="col-xs-12 col-sm-3">
											<img src="http://api.randomuser.me/portraits/men/24.jpg"
												alt="Todd Shelton" class="img-responsive img-circle" />
										</div>
										<div class="col-xs-12 col-sm-9">
											<span class="name">Todd Shelton</span><br /> <span
												class="glyphicon glyphicon-map-marker text-muted c-info"
												data-toggle="tooltip" title="5133 Pecan Acres Ln"></span> <span
												class="visible-xs"> <span class="text-muted">5133
													Pecan Acres Ln</span><br /></span> <span
												class="glyphicon glyphicon-earphone text-muted c-info"
												data-toggle="tooltip" title="(522) 991-3367"></span> <span
												class="visible-xs"> <span class="text-muted">(522)
													991-3367</span><br /></span> <span
												class="fa fa-comments text-muted c-info"
												data-toggle="tooltip" title="todd.shelton@example.com"></span>
											<span class="visible-xs"> <span class="text-muted">todd.shelton@example.com</span><br /></span>
										</div>
										<div class="clearfix"></div>
									</li>
									<li class="list-group-item">
										<div class="col-xs-12 col-sm-3">
											<img src="http://api.randomuser.me/portraits/women/34.jpg"
												alt="Rosemary Porter" class="img-responsive img-circle" />
										</div>
										<div class="col-xs-12 col-sm-9">
											<span class="name">Rosemary Porter</span><br /> <span
												class="glyphicon glyphicon-map-marker text-muted c-info"
												data-toggle="tooltip" title="5267 Cackson St"></span> <span
												class="visible-xs"> <span class="text-muted">5267
													Cackson St</span><br /></span> <span
												class="glyphicon glyphicon-earphone text-muted c-info"
												data-toggle="tooltip" title="(497) 160-9776"></span> <span
												class="visible-xs"> <span class="text-muted">(497)
													160-9776</span><br /></span> <span
												class="fa fa-comments text-muted c-info"
												data-toggle="tooltip" title="rosemary.porter@example.com"></span>
											<span class="visible-xs"> <span class="text-muted">rosemary.porter@example.com</span><br /></span>
										</div>
										<div class="clearfix"></div>
									</li>
									<li class="list-group-item">
										<div class="col-xs-12 col-sm-3">
											<img src="http://api.randomuser.me/portraits/women/56.jpg"
												alt="Debbie Schmidt" class="img-responsive img-circle" />
										</div>
										<div class="col-xs-12 col-sm-9">
											<span class="name">Debbie Schmidt</span><br /> <span
												class="glyphicon glyphicon-map-marker text-muted c-info"
												data-toggle="tooltip" title="3903 W Alexander Rd"></span> <span
												class="visible-xs"> <span class="text-muted">3903
													W Alexander Rd</span><br /></span> <span
												class="glyphicon glyphicon-earphone text-muted c-info"
												data-toggle="tooltip" title="(867) 322-1852"></span> <span
												class="visible-xs"> <span class="text-muted">(867)
													322-1852</span><br /></span> <span
												class="fa fa-comments text-muted c-info"
												data-toggle="tooltip" title="debbie.schmidt@example.com"></span>
											<span class="visible-xs"> <span class="text-muted">debbie.schmidt@example.com</span><br /></span>
										</div>
										<div class="clearfix"></div>
									</li>
									<li class="list-group-item">
										<div class="col-xs-12 col-sm-3">
											<img src="http://api.randomuser.me/portraits/women/76.jpg"
												alt="Glenda Patterson" class="img-responsive img-circle" />
										</div>
										<div class="col-xs-12 col-sm-9">
											<span class="name">Glenda Patterson</span><br /> <span
												class="glyphicon glyphicon-map-marker text-muted c-info"
												data-toggle="tooltip" title="5020 Poplar Dr"></span> <span
												class="visible-xs"> <span class="text-muted">5020
													Poplar Dr</span><br /></span> <span
												class="glyphicon glyphicon-earphone text-muted c-info"
												data-toggle="tooltip" title="(538) 718-7548"></span> <span
												class="visible-xs"> <span class="text-muted">(538)
													718-7548</span><br /></span> <span
												class="fa fa-comments text-muted c-info"
												data-toggle="tooltip" title="glenda.patterson@example.com"></span>
											<span class="visible-xs"> <span class="text-muted">glenda.patterson@example.com</span><br /></span>
										</div>
										<div class="clearfix"></div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		
		<%@ include file="chatListForm_contact_modal.jsp"%>
		<%@ include file="/WEB-INF/view/footer.jsp"%>
	</div>
</body>
</html>