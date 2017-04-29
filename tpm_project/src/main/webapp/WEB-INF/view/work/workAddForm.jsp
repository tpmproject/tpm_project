<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="f"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>TPM</title>
<script type="text/javascript">
var project_idx=${param.project_idx};
var member_idx=${param.member_idx};
var skin='${sessionScope.s_member_thema}';
var skin_color='';
</script>

<link rel="stylesheet" href="bootstrap-3.3.2-dist/css/bootstrap.min.css">
<link href="/tpm_project/css/font-awesome.min.css" rel="stylesheet" type="text/css" /> 
<!-- Ionicons -->
<link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css">
<!-- Morris chart -->
<link href="/tpm_project/sample/cho/main/plugins/morris/morris.css" rel="stylesheet" type="text/css">
<!-- Daterange picker -->
<link href="/tpm_project/sample/cho/main/plugins/daterangepicker/daterangepicker-bs3.css"
	rel="stylesheet" type="text/css">
<!-- Theme style -->
<link href="/tpm_project/sample/cho/main/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css">
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of
    downloading all of them to reduce the load. -->
<link href="/tpm_project/sample/cho/main/dist/css/skins/_all-skins.min.css" rel="stylesheet"
	type="text/css">

<!-- <script src="/tpm_project/sample/cho/main/plugins/iCheck/icheck.min.js" type="text/javascript"></script> -->	

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="bootstrap-3.3.2-dist/js/bootstrap.min.js"></script> -->
<script type="text/javascript" src="js/httpRequest.js"></script>
<script src="/tpm_project/js/ajax_extension.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/jquery.timepicker.min.js"></script>
<script src="js/daterangepicker/daterangepicker.js" type="text/javascript"></script>
<link type="text/css" href="css/jquery-ui.min.css" rel="stylesheet">
<link type="text/css" href="css/jquery.timepicker.css" rel="stylesheet">
<link rel="stylesheet" href="/tpm_project/sample/aram/jquery.mCustomScrollbar.min.css" />
<link rel="stylesheet" href="/tpm_project/sample/aram/jquery.mCustomScrollbar.css" />
<script src="/tpm_project/sample/aram/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="/tpm_project/sample/aram/jquery.mCustomScrollbar.js"></script>
<script src="/tpm_project/bootstrap/js/bootstrap.js"></script>

<!-- 개인 성향  그래프-->
<script src="/tpm_project/js/graph/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/radar.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<!-- jQuery 2.1.3 -->
<script src="dist/js/app.min.js" type="text/javascript"></script>
<!--Websocket  -->
<script type="text/javascript" src="/tpm_project/js/sockjs.min.js"></script>
<script type="text/javascript" src="js/project/ws_project.js"></script>

<script type="text/javascript" src="js/project/projectContent.js"></script>
<link rel="stylesheet" href="css/projectContent.css">

</head>
<body class="skin-${sessionScope.s_member_thema}">
	<!-- 업무 설정 modal -->
	<form name="newWork" id="newWork" action="workAdd.do" method="post">
		<div id="workback" onclick="closem()" onmouseover="hideTen()"></div>
		<div id="work_modal">

  			<button type="button" class="close" style="padding: 10px; color:white;"onclick="closem()">×</button>	
			<h4 class="modal-title" style=" background: #222d32;  padding: 10px; border-radius: 0px; color:white;"><i class="glyphicon glyphicon-plus"></i> Add Work</h4>
			<div id="w_modal">
				<div id="btnwork">
					<div style=" padding:10px;">
						<input type="hidden" name="category_idx" value=""> <label>업무명
						</label>&nbsp;&nbsp;<input type="text" name="work_title">
					</div>
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-addon">
								<i class="fa fa-clock-o"></i>
							</div>
							<input type="text" class="form-control pull-right" placeholder="기한을 체크해주세요."
								name="workdate" id="workdate" />
						</div>
					</div>
					<div align="center" style="padding:5px;">
						<input type="checkbox"  name="work_confirm">결재여부
						<button type="button" class="btn btn-next" style="background-color:#1e282c; color:white;"  id="btn-worknext"
							onclick="shows()">다음</button>
					</div>
				</div>
			</div>
			<div id="btnwork2">
				<div align="center">
					<div class="workmember_div">
						<h4 class="text-center">프로젝트 멤버 목록</h4>
						<div id="project_m"
							style="width: 100%; height: 320px; overflow-y: scroll"
							ondrop="drop3(event)" ondragover="allowDrop(event)"
							ondragstart="drag(event)"></div>
					</div>
					<div class="workmember_div" ondrop="drop(event)"
						ondragover="allowDrop(event)" ondragstart="drag(event)">
						<h4 class="text-center">업무 담당자</h4>
						<div id="work_m"
							style="width: 100%; height: 320px; overflow-y: scroll"
							ondrop="drop2(event)" ondragover="allowDrop(event)"
							ondragstart="drag(event)"></div>
					</div>
			
				</div>
				<div align="center" style="padding:7px;">
					<button type="button" class="btn btn-next" style="background-color:#1e282c; color:white;" id="btn-workbefore"
						onclick="showf()">이전</button>
					<button type="button" class="btn btn-next" style="background-color:#1e282c; color:white;" id="btn-workok"
						onclick="addWork()">완료</button>
				</div> 
			</div>
		</div>
	</form>
	<div id="tendency_pop">
		<div id=ten></div>
		<div id="chartdiv"></div>
	</div>
</body>
</html>