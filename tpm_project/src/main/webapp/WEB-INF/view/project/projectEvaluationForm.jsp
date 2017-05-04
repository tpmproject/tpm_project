<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap-3.3.2-dist/css/bootstrap.min.css">
<link href="/tpm_project/sample/cho/main/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css">
<link href="/tpm_project/sample/cho/main/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css">
<link type="text/css" href="css/jquery-ui.min.css" rel="stylesheet">
<link href="/tpm_project/css/font-awesome.min.css" rel="stylesheet" type="text/css" /> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script src="/tpm_project/js/ajax_extension.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script src="dist/js/app.min.js" type="text/javascript"></script>
<script>
function addTendency(member_idx){

	var tendency_e = document.getElementById("tendency_e");
	var e_idx = tendency_e.selectedIndex;
	var e_val = tendency_e.options[e_idx].value;

	var tendency_i = document.getElementById("tendency_i");
	var i_idx = tendency_i.selectedIndex;
	var i_val = tendency_i.options[i_idx].value;
	
	var tendency_s = document.getElementById("tendency_s");
	var s_idx = tendency_s.selectedIndex;
	var s_val = tendency_s.options[s_idx].value;
	
	var tendency_n = document.getElementById("tendency_n");
	var n_idx = tendency_n.selectedIndex;
	var n_val = tendency_n.options[n_idx].value;
	
	var tendency_t = document.getElementById("tendency_t");
	var t_idx = tendency_t.selectedIndex;
	var t_val = tendency_t.options[t_idx].value;
	
	var tendency_f = document.getElementById("tendency_f");
	var f_idx = tendency_f.selectedIndex;
	var f_val = tendency_f.options[f_idx].value;
	
	var tendency_j = document.getElementById("tendency_j");
	var j_idx = tendency_j.selectedIndex;
	var j_val = tendency_j.options[j_idx].value;	
	
	var tendency_p = document.getElementById("tendency_p");
	var p_idx = tendency_p.selectedIndex;
	var p_val = tendency_p.options[p_idx].value;
	
	var param = 'member_idx=' + member_idx
	+'&project_idx=' + ${param.project_idx}
	+'&appraiser_idx=' + ${sessionScope.s_member_idx}
	+'&tendency_e=' + e_val
	+'&tendency_i=' + i_val
	+'&tendency_s=' + s_val
	+'&tendency_n=' + n_val
	+'&tendency_t=' + t_val
	+'&tendency_f=' + f_val
	+'&tendency_j=' + j_val
	+'&tendency_p=' + p_val;

	//window.alert(param);

	sendRequest('projectEvaluation.do', param, addTendencyResult, 'POST');

}
function addTendencyResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;
			result=parseInt(result);
			//window.alert(result);

			/* if (result>0) {
				$('#bt'+result).hide();
			} */
			location.reload();
		}
	}
}
function addTendency_l(member_idx){

	var tendency_e = document.getElementById("tendency_e");
	var e_idx = tendency_e.selectedIndex;
	var e_val = tendency_e.options[e_idx].value;

	var tendency_i = document.getElementById("tendency_i");
	var i_idx = tendency_i.selectedIndex;
	var i_val = tendency_i.options[i_idx].value;
	
	var tendency_s = document.getElementById("tendency_s");
	var s_idx = tendency_s.selectedIndex;
	var s_val = tendency_s.options[s_idx].value;
	
	var tendency_n = document.getElementById("tendency_n");
	var n_idx = tendency_n.selectedIndex;
	var n_val = tendency_n.options[n_idx].value;
	
	var tendency_t = document.getElementById("tendency_t");
	var t_idx = tendency_t.selectedIndex;
	var t_val = tendency_t.options[t_idx].value;
	
	var tendency_f = document.getElementById("tendency_f");
	var f_idx = tendency_f.selectedIndex;
	var f_val = tendency_f.options[f_idx].value;
	
	var tendency_j = document.getElementById("tendency_j");
	var j_idx = tendency_j.selectedIndex;
	var j_val = tendency_j.options[j_idx].value;	
	
	var tendency_p = document.getElementById("tendency_p");
	var p_idx = tendency_p.selectedIndex;
	var p_val = tendency_p.options[p_idx].value;
	
	var param = 'member_idx=' + member_idx
	+'&project_idx=' + ${param.project_idx}
	+'&appraiser_idx=' + ${sessionScope.s_member_idx}
	+'&tendency_e=' + e_val
	+'&tendency_i=' + i_val
	+'&tendency_s=' + s_val
	+'&tendency_n=' + n_val
	+'&tendency_t=' + t_val
	+'&tendency_f=' + f_val
	+'&tendency_j=' + j_val
	+'&tendency_p=' + p_val

	window.alert(param);

	sendRequest('projectState.do', param, addTendency_lResult, 'POST');

}
function addTendency_lResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;
			result=parseInt(result);
			location.href='projectList.do';
		}
	}
}
</script>
</head>
<body class="skin-${sessionScope.s_member_thema}">
	<c:if test="${count == 0}">
		<c:redirect url="projectList.do"></c:redirect>
	</c:if>
	<%@include file="/WEB-INF/view/header.jsp"%>
	<section class="content">
	<div id="pebody" style=" width:100%; height:780px;">
		<div style="margin-bottom: 30px;">
			<h3><i class="glyphicon glyphicon-chevron-right"></i>${pdto.project_name}</span>
			</h3>
		</div>
		<c:set var="pdto" value="${pdto}"></c:set>
		<c:set var="count" value="${count}"></c:set>
		<c:forEach var="arr" items="${arr}">
		<div id="tendency_m" class="col-md-12" >
			<form class="form-horizontal" name="memberTendency" action="memberUpdate.do">
			<div class="col-md-5" style="width: 250px; margin-bottom:25px;" id="bt${arr.member_idx}" >
			<img src="/tpm_project/img/member/profile/${arr.member_img}" style="width: 115px; height: 115px; border-radius: 50%; margin-left: 35%; margin-top: 5%;">
				<h5 style="margin-left: 32%;">${arr.member_name}</br>(${arr.member_id})</h5>
				</div>
				<div class="col-md-6" style="margin-top: 2%; margin-left: 5%;">
					<a class="btn btn-default disabled" style="color:black; opacity: .9; background-color: #f6d15c; margin-bottom: 8px;">외향성</a> 
					<select id="tendency_e">
						<option value="5">5</option>
						<option value="4">4</option>
						<option value="3">3</option>
						<option value="2">2</option>
						<option value="1">1</option>
					</select>
					<a class="btn btn-default disabled" style="color:black; opacity: .9; background-color: #eccfc9; margin-left: 8px; margin-bottom: 8px;">내향성</a>
					<select id="tendency_i">
						<option value="5">5</option>
						<option value="4">4</option>
						<option value="3">3</option>
						<option value="2">2</option>
						<option value="1">1</option>
					</select>
					<a class="btn btn-default disabled" style="color:black; opacity: .9; background-color: #687ac8; margin-left: 8px; margin-bottom: 8px;">감각형</a>
					<select id="tendency_s">
						<option value="5">5</option>
						<option value="4">4</option>
						<option value="3">3</option>
						<option value="2">2</option>
						<option value="1">1</option>
					</select>
					<a class="btn btn-default disabled" style="color:black; opacity: .9; background-color: #98b446; margin-left: 8px; margin-bottom: 8px;">직감형</a>
					<select id="tendency_n">
						<option value="5">5</option>
						<option value="4">4</option>
						<option value="3">3</option>
						<option value="2">2</option>
						<option value="1">1</option>
					</select></br>
					<a class="btn btn-default disabled" style="color:black; opacity: .9; background-color: #f27025;">사고형</a>
					<select id="tendency_t">
						<option value="5">5</option>
						<option value="4">4</option>
						<option value="3">3</option>
						<option value="2">2</option>
						<option value="1">1</option>
					</select>
					<a class="btn btn-default disabled" style="color:black; opacity: .9; background-color: #d6317d; margin-left: 8px;">감정형</a>
					<select id="tendency_f">
						<option value="5">5</option>
						<option value="4">4</option>
						<option value="3">3</option>
						<option value="2">2</option>
						<option value="1">1</option>
					</select>
					<a class="btn btn-default disabled" style="color:black; opacity: .9; background-color: #41919d; margin-left: 8px;">판단형</a>
					<select id="tendency_j">
						<option value="5">5</option>
						<option value="4">4</option>
						<option value="3">3</option>
						<option value="2">2</option>
						<option value="1">1</option>
					</select>
					<a class="btn btn-default disabled" style="color:black; opacity: .9; background-color: #2780bf; margin-left: 8px;">인식형</a>
					<select id="tendency_p">
						<option value="5">5</option>
						<option value="4">4</option>
						<option value="3">3</option>
						<option value="2">2</option>
						<option value="1">1</option>
					</select>
				</div>
				<br>
				<div class="col-md-7" style="margin-top: 33px;">
					<c:if test="${count==1}">
					<button type="reset" class="btn btn-reset" style="margin-left: 28%; background-color:#1e282c; color:white;" id="btn_reset" name="btn_reset">초기화</button>
					<button type="button" class="btn btn-next" style="background-color:#1e282c; color:white;" id="btn_tb" name="btn_tendencyok" onclick="addTendency_l(${arr.member_idx})">완료</button>
					</c:if>
					<c:if test="${count>1 }">
					<button type="reset" class="btn btn-reset" style="margin-left: 28%; background-color:#1e282c; color:white;" id="btn_reset" name="btn_reset">초기화</button>
					<button type="button" class="btn btn-next" style="background-color:#1e282c; color:white;" id="btn_tb" name="btn_tendencyok" onclick="addTendency(${arr.member_idx})">완료</button>
					</c:if>
				</div>
			</form>
			</div>
		</c:forEach>
	</div>
	</section>
	<%@include file="/WEB-INF/view/footer.jsp"%>
</body>
</html>