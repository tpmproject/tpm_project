<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap-3.3.2-dist/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script src="/tpm_project/js/ajax_extension.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<link type="text/css" href="css/jquery-ui.min.css" rel="stylesheet">
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

	window.alert(param);

	sendRequest('projectEvaluation.do', param, addTendencyResult, 'POST');

}
function addTendencyResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;
			window.alert(result);

			if (result>0) {

			}
		}
	}
}
</script>
</head>
<body>
	<div id="cbody" style="width:${(pdto.category_num +2)*200}px">
		<div>
			<br>&nbsp;&nbsp;<span class="glyphicon glyphicon-chevron-right"></span>
			<h3>${pdto.project_name}</h3>
		</div>
		<c:set var="pdto" value="${pdto}"></c:set>
		<c:forEach var="arr" items="${arr}">
			<form class="form-horizontal" name="memberTendency" action="memberUpdate.do">

			<div>
			<img src="/tpm_project/img/member/profile/${arr.member_img}">
				<h4>${arr.member_name}(${arr.member_id})</h4>
				</div>
				<div class="col-sm-offset-7">
					<a class="btn btn-default disabled">외향성</a> 
					<select id="tendency_e">
						<option value="5">5</option>
						<option value="4">4</option>
						<option value="3">3</option>
						<option value="2">2</option>
						<option value="1">1</option>
					</select>
					<a class="btn btn-default disabled">사고형</a>
					<select id="tendency_i">
						<option value="5">5</option>
						<option value="4">4</option>
						<option value="3">3</option>
						<option value="2">2</option>
						<option value="1">1</option>
					</select>
					<a class="btn btn-default disabled">내향성</a>
					<select id="tendency_s">
						<option value="5">5</option>
						<option value="4">4</option>
						<option value="3">3</option>
						<option value="2">2</option>
						<option value="1">1</option>
					</select>
					<a class="btn btn-default disabled">감정형</a>
					<select id="tendency_n">
						<option value="5">5</option>
						<option value="4">4</option>
						<option value="3">3</option>
						<option value="2">2</option>
						<option value="1">1</option>
					</select>
					<a class="btn btn-default disabled">감각형</a>
					<select id="tendency_t">
						<option value="5">5</option>
						<option value="4">4</option>
						<option value="3">3</option>
						<option value="2">2</option>
						<option value="1">1</option>
					</select>
					<a class="btn btn-default disabled">판단형</a>
					<select id="tendency_f">
						<option value="5">5</option>
						<option value="4">4</option>
						<option value="3">3</option>
						<option value="2">2</option>
						<option value="1">1</option>
					</select>
					<a class="btn btn-default disabled">직감형</a>
					<select id="tendency_j">
						<option value="5">5</option>
						<option value="4">4</option>
						<option value="3">3</option>
						<option value="2">2</option>
						<option value="1">1</option>
					</select>
					<a class="btn btn-default disabled">인식형</a>
					<select id="tendency_p">
						<option value="5">5</option>
						<option value="4">4</option>
						<option value="3">3</option>
						<option value="2">2</option>
						<option value="1">1</option>
					</select>
				</div>
				<br>
				<div>
					<button type="reset" class="btn btn-reset" id="btn-reset" name="btn_reset">초기화</button>
					<button type="button" class="btn btn-next" id="btn-tendencyok" name="btn_tendencyok" onclick="addTendency(${arr.member_idx})">완료</button>
					<hr>
				</div>
			</form>

		</c:forEach>
	</div>
</body>
</html>