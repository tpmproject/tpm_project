<%@page import="org.springframework.web.bind.annotation.RequestParam"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset=UTF-8>
<title>TPM</title>
<script src="bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="bootstrap-3.3.2-dist/css/bootstrap.min.css">
<link href="/tpm_project/css/font-awesome.min.css" rel="stylesheet"	type="text/css" />
<!-- Ionicons -->
<link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css">
<!-- Morris chart -->
<link href="/tpm_project/sample/cho/main/plugins/morris/morris.css"	rel="stylesheet" type="text/css">
<!-- Daterange picker -->
<link href="/tpm_project/sample/cho/main/plugins/daterangepicker/daterangepicker-bs3.css"	rel="stylesheet" type="text/css">
<!-- Theme style -->
<link href="/tpm_project/sample/cho/main/dist/css/AdminLTE.min.css"	rel="stylesheet" type="text/css">
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of
    downloading all of them to reduce the load. -->
<link href="/tpm_project/sample/cho/main/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="js/httpRequest.js"></script>
<script src="/tpm_project/js/ajax_extension.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/jquery.timepicker.min.js"></script>
<!-- <script src="/tpm_project/plugins/daterangepicker/daterangepicker.js"
	type="text/javascript"></script> -->
<link type="text/css" href="css/jquery-ui.min.css" rel="stylesheet">
<link type="text/css" href="css/jquery.timepicker.css" rel="stylesheet">
<link rel="stylesheet"
	href="/tpm_project/sample/aram/jquery.mCustomScrollbar.min.css" />
<link rel="stylesheet"
	href="/tpm_project/sample/aram/jquery.mCustomScrollbar.css" />
<script
	src="/tpm_project/sample/aram/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="/tpm_project/sample/aram/jquery.mCustomScrollbar.js"></script>
<script src="/tpm_project/bootstrap/js/bootstrap.js"></script>
<script src="dist/js/app.min.js" type="text/javascript"></script>

<!-- Placed at the end of the document so the pages load faster -->
	<!-- <script src="js/jquery.js"></script> -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- <script src="js/bootstrap.min.js"></script> -->
	<script src="js/jquery.fancybox.pack.js"></script>
	<script src="js/jquery.fancybox-media.js"></script>
	<script src="js/google-code-prettify/prettify.js"></script>
	<script src="js/portfolio/jquery.quicksand.js"></script>
	<script src="js/portfolio/setting.js"></script>
	<script src="js/jquery.flexslider.js"></script>
	<script src="js/animate.js"></script>
	<script src="js/custom.js"></script>


<!-- 회전 카드 -->
<!-- <link href="/tpm_project/sample/khj/css/bootstrap.css" rel="stylesheet" /> -->
<link href="/tpm_project/sample/khj/css/rotating-card.css"
	rel="stylesheet" />
<!--   <link href = "http://netdna.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"rel = "stylesheet"/> -->
<script>
var skin='${s_member_thema}';
var member_idx=${s_member_idx};
var member_id='${s_member_id}';
var member_img='${s_member_img}';
var member_name='${s_member_name}';
</script>
<script type="text/javascript" src="js/project/projectList.js"></script>
<style>
#mback {
	position: fixed;
	top: -10%;
	left: -10%;
	width: 110%;
	height: 110%;
	background: gray;
	opacity: 0.7;
	display: none;
	z-index: 820;
}

#main_modal, #main_modal2 {
	display: none;
	background: white;
	position: fixed;
	top: 10%;
	border: solid 10px white;
	border-radius: 10px;
	width: 640px;
	z-index: 830;
}

.content {
	height: 780px;
}

.sd {
	display: inline-block;
	height: 600px;
	width: 48%;
	float: left;
	text-align: center;
}

.carousel-inner {
	margin: auto;
	width: 50%;
}

.content {
	height: 780px;
	overflow: auto;
}

/* Add rounded  corners to the top left and the top right corner of the image */
img {
	border-radius: 5px 5px 0 0;
}

/**캐러셀 css*/
.glyphicon-triangle-right {
	font-size: 50px;
}

.glyphicon-triangle-left {
	font-size: 50px;
}

/**연습용*/
</style>
</head>
<body class="skin-${sessionScope.s_member_thema}">
	<%@ include file="/WEB-INF/view/header.jsp"%>

	

	<!-- ajax div -->
	<form name="newProject" action="projectAdd.do" method="post">
		<div id="mback" onclick="closem()"></div>
		<div id="main_modal">
			<div class="modal-header">
				<button type="button" class="close" onclick="closem()">×</button>
				<h4 class="modal-title w-100">프로젝트 생성</h4>
			</div>

			<div id="f_modal">
				<div class="modal-body">
					<div class="md-form">
						<label for="form22">Project name</label> <i
							class="fa fa-user prefix"></i> <input type="text"
							name="project_name" class="form-control">
					</div>
					<div class="md-form">
						<label for="form32">Project Content</label> <i
							class="fa fa-envelope prefix"></i> <input type="text"
							name="project_content" class="form-control">
					</div>
					<hr>
					<div style="float: right;">
						<button type="button" class="btn btn-next" id="btn-next"
							onclick="shows()">다음</button>
					</div>
				</div>
			</div>

			<div id="smodal">
				<div class="sd">
					<h4>친구목록</h4>
					<div id="myFriend_List"
						style="width: 300px; height: 200px; overflow-y: scroll"
						ondrop="drop2(event)" ondragover="allowDrop(event)"
						ondragstart="drag(event)"></div>
					<h4>검색 멤버</h4>
					<div>
						<input type="text" name="member_id" placeholder="Search" size="15">
						<button type="button" class="btn" onclick="projectMemberAdd(1)">검색</button>
					</div>
					<div id="member_search_content" ondrop="drop2(event)"
						ondragover="allowDrop(event)" ondragstart="drag(event)"
						style="width: 300px; height: 200px; overflow-y: scroll"></div>

				</div>
				<div class="sd">
					<h4>초대 멤버</h4>
					<div id="project_Member"
						style="width: 95%; height: 480px; overflow-y: scroll"
						ondrop="drop(event)" ondragover="allowDrop(event)"
						ondragstart="drag(event)"></div>
					<button type="button" class="btn btn-next" id="btn-workbefore"
						onclick="showf()">이전</button>
					<button type="button" class="btn btn-next" onclick="addP()">완료</button>
				</div>
			</div>
		</div>
	</form>

	<form name="changeProject" action="projectUpdate.do" method="post">
		<div id="main_modal2">
			<div class="modal-header">
				<button type="button" class="close" onclick="closem()">×</button>
				<h4 class="modal-title w-100">프로젝트 수정</h4>
			</div>
			<div id="f_modal2">
				<div class="modal-body">
					<div class="md-form">
						<input type="hidden" name="project_idx"> <label
							for="form22">Project name</label> <i class="fa fa-user prefix"></i>
						<input type="text" name="project_name" class="form-control">
					</div>
					<div class="md-form">
						<label for="form32">Project Content</label> <i
							class="fa fa-envelope prefix"></i> <input type="text"
							name="project_content" class="form-control">
					</div>
					<hr>
					<div style="float: right;">
						<button type="button" class="btn btn-next" id="btn-next"
							onclick="shows2()">다음</button>
					</div>
				</div>
			</div>

			<div id="smodal2">
				<div class="sd">
					<h4>친구목록</h4>
					<div id="myFriend_List2"
						style="width: 300px; height: 200px; overflow-y: scroll"
						ondrop="drop4(event)" ondragover="allowDrop(event)"
						ondragstart="drag(event)"></div>
					<h4>검색 멤버</h4>
					<div>
						<input type="text" name="member_id" placeholder="Search" size="15">
						<button type="button" class="btn" onclick="projectMemberAdd(2)">검색</button>
					</div>
					<div id="member_search_content2" ondrop="drop4(event)"
						ondragover="allowDrop(event)" ondragstart="drag(event)"
						style="width: 300px; height: 200px; overflow-y: scroll"></div>

				</div>


				<div class="sd">
					<h4>프로젝트 멤버</h4>
					<div id="project_Member2"
						style="width: 95%; height: 480px; overflow-y: scroll"
						ondrop="drop3(event)" ondragover="allowDrop(event)"
						ondragstart="drag(event)"></div>
					<button type="button" class="btn btn-next" onclick="showf2()">이전</button>
					<button type="button" class="btn btn-next" onclick="updateP()">완료</button>
				</div>
			</div>
		</div>
	</form>






	<div class="cta-text" style="background: white;">
		<h2>
			TPM.<a class="glyphicon glyphicon-plus-sign" onclick="showf()"
				style="size: 600px;">프로젝트 추가</a>
		</h2>
	</div>

	<div id="carousel-example-generic" class="carousel slide center-block"
		data-ride="carousel" data-interval="false">

		<%-- <!-- Indicators 페이징-->
		<ol class="carousel-indicators" style="bottom: -15px; color: black;">
			<c:forEach var="i" items="${plist}" varStatus="status">

				<li data-target="#carousel-example-generic"
					${status.first?'class="active"':'' }
					data-slide-to="${status.index}" style="background: white;"></li>

			</c:forEach>
		</ol>
 --%>
		<!-- 앞화면 -->
		<c:set var="plist" value="${plist}"></c:set>
		<c:choose>
			<c:when test="${empty plist}">
								등록된 프로젝트가 없습니다.
						</c:when>

			<c:otherwise>
				<div id="becontent" style="background: white;">
					<div id="ptest" class="carousel-inner" role="listbox">
						<!-- 	<div class="carousel-inner" role="listbox  -->
						<c:forEach var="i" items="${plist}" varStatus="status">
							<div class="item ${status.first?'active':'' }">
								<div id="contain" class="container-fluid ">
									<div id="project_div${i.project_idx}" style="margin-top: 15px;">
										<div class="col-sm-10 col-sm-offset-1">
											<div class="col-md-4 col-sm-6" style="width: 500px;">
												<div class="card-container manual-flip">
													<div class="card">
														<div class="front">
															<!--  배경화면-->
															<div class="cover">
																 <!-- <img src="/tpm_project/sample/khj/img/son.jpg"/> -->
															</div>

															<!-- 상태 아이콘 -->
															<!-- <div class="user">
																<img class="img-circle"
																	src="/tpm_project/sample/khj/img/cat.png"
																	style="width: 140px; height: 140px;" />
															</div> -->

															<!--화면단  -->
															<div class="content">
																<div class="main">
																	<input type="hidden" id="p_idx${i.project_idx}"
																		value="${i.project_idx}">
																	<h3 id="pn${i.project_idx}" style="text-align: center; ">
																		<span class="hidden-xs">${i.project_name }</span>
																	</h3>
																	<p class="profession">TPM Project</p>
																	<p class="text-center">
																		<span id="pc${i.project_idx}">${i.project_content }</span>
																	</p>
																</div>
																<div class="footer">
																	<button class="btn btn-simple"
																		onclick="rotateCard(this)">
																		<i class="fa fa-mail-forward"></i>&nbsp; 프로젝트 확인
																	</button>

																</div>
															</div>
														</div>
														<!-- end front panel -->

														<!-- 뒷화면 -->
														<div class="back">
															<div class="header">
																<c:forEach var="pm_dto" items="${i.project_member_dtos}">
																	<c:choose>
																		<c:when test="${pm_dto.project_level ==3000 }">
																			<c:if
																				test="${pm_dto.member_idx eq sessionScope.s_member_idx }">
																				<div style="float: right;">
																					<span rel="tooltip" title="수정"
																						onclick="projectUpdate('${i.project_idx}','${i.project_name }','${i.project_content}')">
																						<i class="glyphicon glyphicon-cog"
																						style="margin-bottom: 0px;"></i>
																					</span> <span rel="tooltip" title="삭제"
																						onclick="projectDelete('${i.project_idx}')">
																						<i class="glyphicon glyphicon-remove"
																						style="margin-bottom: 0px;"></i>
																					</span>
																				</div>
																			</c:if>
																		</c:when>
																	</c:choose>

																</c:forEach>
																<h5 class="motto">"프로젝트는 우리의 미래입니다."</h5>
															</div>
															<div class="content">
																<div class="main">
																	<h4 class="text-center">${i.project_name }</h4>
																	<hr>

																	<c:forEach var="pm_dto"
																		items="${i.project_member_dtos}">
																		<h5 class="text-center">${pm_dto.mdtos.member_id}</h5>
																	</c:forEach>
																	<hr>
																	<div class="stats-container">
																		<div class="stats" align="center" rel="tooltip"
																			title="업무확인">
																			<a class="btn btn-link"
																				href="projectContent.do?project_idx=${i.project_idx}&member_idx=${s_member_idx}"><i
																				class="fa fa-clone left"></i>업무확인</a>
																		</div>
																		<c:forEach var="pm_dto"
																			items="${i.project_member_dtos}">
																			<c:choose>
																				<c:when
																					test="${pm_dto.project_level == 3000 and i.project_state == 3}">
																					<c:if
																						test="${pm_dto.member_idx eq sessionScope.s_member_idx }">

																						<div class="stats">
																							<span class="print" rel="tooltip" title="완료상태">
																								<a href="#" class="btn btn-link"
																								style="color: green;"><i
																									class="glyphicon glyphicon-ok-circle"></i>완료</a>
																							</span>
																						</div>

																					</c:if>
																				</c:when>
																				<c:when
																					test="${pm_dto.project_level == 3000 and i.project_state == 2 }">
																					<c:if
																						test="${pm_dto.member_idx eq sessionScope.s_member_idx }">
																						<div class="stats">
																							평가하기 <span class="print" rel="tooltip"
																								title="평가하기"> <a
																								onclick="location.href='projectEvaluation.do?project_idx=${i.project_idx}&project_level=${pm_dto.project_level}&member_idx=${s_member_idx}'"
																								class="btn btn-link"><i
																									class="glyphicon glyphicon-check"></i>평가하기</a>
																							</span>
																						</div>

																					</c:if>
																				</c:when>
																				<c:when test="${i.project_state == 1 }">
																					<c:if
																						test="${pm_dto.member_idx eq sessionScope.s_member_idx }">
																						<div class="stats">
																							<span class="print" rel="tooltip" title="진행중">
																								<a href="#" class="btn btn-link"
																								style="color: red;"><i
																									class="glyphicon glyphicon-time"></i>진행중</a>
																							</span>
																						</div>

																					</c:if>
																				</c:when>
																			</c:choose>
																		</c:forEach>
																	</div>
																</div>
															</div>
															<div class="footer">
																<button class="btn btn-simple" rel="tooltip"
																	title="되돌아가기" onclick="rotateCard(this)">
																	<i class="fa fa-reply"></i> Back
																</button>

															</div>
														</div>
														<!-- end back panel -->
													</div>
													<!-- end card -->
												</div>
												<!-- end card-container -->
											</div>
											<!-- end col sm 3 -->

											<div class="space-400"></div>
										</div>
									</div>
								</div>
							</div>


						</c:forEach>

					</div>
				</div>
				<!--완료된 프로젝트 리스트  -->


			</c:otherwise>
		</c:choose>
	</div>
	<!--end carousel-inner -->
	<!-- Controls -->
	<div class="controls">
		<a id="leftcon" class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"
			style="width: 100px; margin-top: 15%;" > <span
			class="glyphicon glyphicon-triangle-left" aria-hidden="true">
		</span> <span class="sr-only">Previous</span>
		</a> <a id="rightcon" class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next"
			style="width: 100px; margin-top: 15%;"> <span
			class="glyphicon glyphicon-triangle-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>




	<%@ include file="/WEB-INF/view/footer.jsp"%>
</body>
</html>