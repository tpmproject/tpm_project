<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>TPM</title>
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
function categoryAdd() {
	var param = 'project_idx=' + ${param.project_idx}
	+'&category_name=' + document.newCategory.category_name.value;
	sendRequest('categoryAdd.do', param, categoryAddResult, 'POST');
}
function categoryAddResult() {
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;
			if (result != null) {
				var cbodyNode = document.getElementById('cbody');
				var cateNode = document.getElementById('addCate');
				var divNode = document.createElement('div');
				divNode.innerHTML = result;
				cbodyNode.insertBefore(divNode, cateNode);
				cbodyNode.style.width = parseInt(cbodyNode.style.width)+200+"px";
			}
		}
	}
}

//업무추가
window.onload=function(){
	$(work_modal).hide();
	$(btnwork2).hide();
}
function showf(){
	$(workback).fadeIn('150');
	$(work_modal).fadeIn('150');
	$(w_modal).show();
	$(btnwork2).hide();
}
function shows(){
	$(w_modal).fadeOut();
	$(btnwork2).fadeIn();
	var p=${pdto.project_idx};
	sendRequest('workAdd.do?project_idx='+p,null,showsResult,'GET');
}
function showsResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;
			window.alert(result);
			
			var json = JSON.parse(result);		
			var msg2 = '';
			var members = json.members; // 맵 객체로부터 members 값인 배열을 가져온다.
			for (var i = 0; i < members.length; i++) {
				var member = members[i];
				msg2 += '<div class="col-sm-12" id="modal_content">';
				msg2 += '<div class="col-sm-12"> ';
				msg2 += '<div class="panel"> ';
				msg2 += '<div class="panel-body p-t-10"> ';
				msg2 += '<div class="media-main"> ';
				msg2 += '<a class="pull-left" href="#"> <img height="30" width="30"';
				msg2 += 				'class="thumb-lg img-circle bx-s" ';
				msg2 += 				'src="/tpm_project/img/member/profile/' + member.member_img + '" alt=""> ';
				msg2 += '</a> ';
				msg2 += '</a> ';
				msg2 += '</div> ';
				msg2 += '<div class="info"> ';
				msg2 += '<input type="hidden" id="add_project_member_idx_' + i + '" value="' + member.member_idx + '">'
				msg2 += '<h4>' + member.member_name + '</h4> ';
				msg2 += '<p class="text-muted">' + member.member_id
						+ '</p> ';
				msg2 += '</div> ';
				msg2 += '</div> ';
				msg2 += '<div class="clearfix"></div> ';
				msg2 += '</div> ';
				msg2 += '</div> ';
				msg2 += '</div> ';
				msg2 += '</div> ';
			}
			var project_m = document.getElementById('project_m');
			project_m.innerHTML = msg2;		
		}
	}
}
function closem() {
	$(workback).fadeOut('100');
	$(work_modal).fadeOut('100');
	document.newWork.reset();
}
 
function check(ch){
	var param='checklist_idx='+ch;
	sendRequest('checkUpdate.do', param, checkResult, 'POST');
}
function checkResult() {
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;
			result=parseInt(result);
			
			var ch=document.getElementById('ch'+result);
			var ch_s=document.getElementById('ch_state'+result);
			var ch_sv=document.getElementById('ch_state'+result).value;
			
			if(ch_sv=='1'){
				ch.className='glyphicon glyphicon-unchecked';
				ch_s.value='0';
			}else if(ch_sv=='0'){
				ch.className='glyphicon glyphicon-ok';
				ch_s.value='1';
			}
			
		}
	}
}


function addCheck(work_idx){
	
	var cont=$('#content'+work_idx).val();
	var param='work_idx='+work_idx+'&checklist_content='+cont;
	if(cont==null ||cont==''){
		window.alert('체크리스트를 작성해주세요.');
	}else{
		sendRequest('checkAdd.do', param, addCheckResult, 'POST');
	}
}
function addCheckResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			
			var strData=XHR.responseText;
			var chData=eval('('+strData+')');
	
			var wi=chData.checklist.work_idx;
			var chc=chData.checklist.checklist_content;
			var chi=chData.checklist.checklist_idx;
			
			var chAdd="<a onclick='javascript:check("+chi+")'>"
					+"<i id='ch"+chi+"' class='glyphicon glyphicon-unchecked'>"
					+"</i>"+chc+"</a><br>";
			
			var spanNode = document.createElement('span');
			spanNode.innerHTML = chAdd;
			
			document.getElementById('content'+wi).value='';
			document.getElementById('check_div'+wi).appendChild(spanNode);
			
			
		}
	}
}

</script>
<style>
#workback {
	position: absolute;
	top: -10%;
	left: -10%;
	width: 110%;
	height: 110%;
	background: gray;
	opacity: 0.7;
	display: none;
}

#work_modal {
	display: none;
	background: white;
	position: fixed;
	top: 20%;
	left: 20%;
	border: solid 10px white;
	border-radius: 10px;
	width: 600px;
	height: 700px;
}

.category {
	display: inline-block;
	width: 200px;
	float: left;
}

.cate_table {
	border: solid 1px black;
	width: 200px;
	margin: 4px;
}

.cate_table thead td {
	padding: 4px;
}

.cate_table tbody td {
	padding-left: 4px;
}

.category_head {
	padding-top: 7px;
	padding-bottom: 7px;
	text-align: center;
}

.table_i {
	display: inline-block;
	height: 18px;
	vertical-align: text-top;
}

.check_div {
	padding-left: 19px;
	height: 100px;
	overflow-y:scroll;
}
</style>
</head>
<%-- <%@include file="/WEB-INF/view/header.jsp" %> --%>
<body>

	<div id="cbody" style="width:${(pdto.category_num +2)*200}px">
		<div>
			<br>&nbsp;&nbsp;<span class="glyphicon glyphicon-chevron-right"></span>${pdto.project_name}
		</div>
		<c:set var="pdto" value="${pdto}"></c:set>
		<c:choose>
			<c:when test="${empty pdto}"></c:when>
			<c:otherwise>
				<c:forEach var="cdto" items="${pdto.category_dtos}">
					<div class="category">
						<div class="category_head">
							${cdto.category_name }&nbsp;&nbsp;<i
								class="glyphicon glyphicon-plus" onclick="showf()"></i> &nbsp;&nbsp;<i
								class="glyphicon glyphicon-cog"></i>
						</div>

						<c:if test="${not empty cdto.work_dtos}">
							<c:forEach var="wdto" items="${cdto.work_dtos }">
								<table class="cate_table">
									<thead>
										<tr>
											<td>${wdto.work_title }</td>
											<td align="right"><i class="glyphicon glyphicon-cog" onclick="showu()"></i>&nbsp;&nbsp;&nbsp;</td>
										</tr>
									</thead>

									<tbody>
										<tr>
											<td colspan="2"><div
													class="table_i glyphicon glyphicon-calendar"></div>&nbsp;${wdto.work_start}~${wdto.work_end}</td>
										</tr>
										<tr>
											<td colspan="2">
												<div class="table_i glyphicon glyphicon-user"></div> <c:forEach
													var="mdto" items="${marr}">
													<c:if test="${mdto.work_idx eq wdto.work_idx}">${mdto.member_name}
									</c:if>
												</c:forEach>

											</td>
										</tr>
										<tr>
											<td colspan="2">
												<form action="javascript:addCheck(${wdto.work_idx})">
												<div class="table_i glyphicon glyphicon-check"></div>
												&nbsp;<input type="text" id="content${wdto.work_idx}" placeholder="체크리스트" style="width:60%;" required="required">
												&nbsp;<i class="glyphicon glyphicon-plus" onclick="addCheck(${wdto.work_idx})"></i>
												</form>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<div class="check_div" id="check_div${wdto.work_idx}">
													<c:forEach var="chdto" items="${wdto.checklist_dtos}">
														<a onclick="javascript:check(${chdto.checklist_idx })">
															<i id="ch${chdto.checklist_idx }"
															class="${chdto.checklist_state eq '1' ? 'glyphicon glyphicon-ok' : 'glyphicon glyphicon-unchecked' }">
														</i> ${chdto.checklist_content}
														<input type="hidden" id="ch_state${chdto.checklist_idx}" value="${chdto.checklist_state}">
														</a>
														<br>
													</c:forEach>
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="2" align="left">표시하기</td>
										</tr>
										<tr>
											<td>진행률</td>
											<td>막대그래프</td>
										</tr>
										<tr>
											<td><input type="button" value="결재요청"></td>
											<td align="right">코멘트|첨부파일</td>
										</tr>
									</tbody>
								</table>
							</c:forEach>
						</c:if>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>


		<div class="category" id="addCate">
			<form name="newCategory" action="javascript:categoryAdd()">
				<input type="text" class="form-control" name="category_name"
					placeholder="새로운 카테고리">
			</form>
		</div>
	</div>


	<!-- 업무 설정 modal -->
	<form name="newWork" action="workAdd.do" method="post">
		<div id="workback" onclick="closem()"></div>
		<div id="work_modal">
			<button type="button" class="close" onclick="closem()">×</button>
			<h4 class="modal-title">업무 추가</h4>

			<div id="w_modal">
				<div id="btnwork">
					<div>
						업무명 : <input type="text" name="work_title">
					</div>
					<div>기한</div>
					<div>
						<input type="text" id="calendar" name="work_start"
							rel="stylesheet" /> ~<input type="text" id="calendar2"
							name="work_end" rel="stylesheet" />
					</div>
					<div>
						<input type="checkbox" name="work_confirm" value="on">결재여부
						<button type="button" class="btn btn-next" id="btn-worknext"
							onclick="shows()">다음</button>

					</div>

				</div>
			</div>

			<div id="btnwork2">
				<div class="section">
					<div class="container">
						<div class="row">
							<div class="col-md-3">
								<h4 class="text-center">프로젝트 멤버 목록</h4>
								<div id="project_m" style="width:300px; height: 300px; overflow-y: scroll"></div>
								<p></p>
								<p></p>
							</div>
							<div class="col-md-3">
								<h4 class="text-center">업무 담당자</h4>
								<ul class="media-list">
									<li class="media"><a class="pull-left" href="#"><img
											class="media-object"
											src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
											height="30" width="30"></a>
										<div class="media-body">
											<h6 class="media-heading">Media heading</h6>
										</div></li>
									<li class="media"><a class="pull-left" href="#"><img
											class="media-object"
											src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
											height="30" width="30"></a>
										<div class="media-body">
											<h6 class="media-heading">Media heading</h6>
										</div></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<button type="button" class="btn btn-next" id="btn-workbefore"
					onclick="showf()">이전</button>
				<c:if test=""></c:if>
				<input type="submit" class="btn" value="완료">
			</div>
		</div>
	</form>




</body>
<script>
$("#calendar").datepicker({
	changeMonth:true,
	changeYear:true,
	showButtonPanel:true,
	dateFormat:"yy-mm-dd"
});
$("#calendar2").datepicker({
	changeMonth:true,
	changeYear:true,
	showButtonPanel:true,
	dateFormat:"yy-mm-dd"
});
</script>
</html>