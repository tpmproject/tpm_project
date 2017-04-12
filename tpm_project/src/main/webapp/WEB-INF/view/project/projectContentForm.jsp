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
<script type="text/javascript" src="js/jquery.timepicker.min.js"></script>
<link type="text/css" href="css/jquery-ui.min.css" rel="stylesheet">
<link type="text/css" href="css/jquery.timepicker.css" rel="stylesheet">
<script>
function cateName(idx){
	$('#cate'+idx).show();
	$('#a_cate'+idx).hide();
}
function cateNameRe(idx){
	$('#cate'+idx).hide();
	$('#a_cate'+idx).show();
	var ac=document.getElementById('a_cate'+idx);
	$('#cateIn'+idx).val(ac.firstChild.innerHTML);
	
}

function categoryUpdate(idx){
	
	var param='project_idx='+${param.project_idx}+'&category_idx='+idx;
	var di=$('#cateIn'+idx).val();
	param+='&category_name='+di;
	
	sendRequest('categoryUpdate.do', param, categoryUpdateResult, 'POST');
}
function categoryUpdateResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;
			result=parseInt(result); //cate_idx
			
			var ac=document.getElementById('a_cate'+result);
			ac.firstChild.innerHTML=$('#cateIn'+result).val();
			
			$('#cate'+result).hide();
			$('#a_cate'+result).show();
			
		}
	}
}

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
function showf(category_idx){
	$(workback).fadeIn('150');
	$(work_modal).fadeIn('150');
	$(w_modal).show();
	$(btnwork2).hide();
	document.newWork.category_idx.value=category_idx;
}
function shows(){
	$(w_modal).fadeOut();
	$(btnwork2).fadeIn();
	var p=${pdto.project_idx};
	
	if(document.newWork.work_confirm.checked){
		document.newWork.work_confirm.value=10;
	}else{
		document.newWork.work_confirm.value=20;
	}
	
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
				msg2 += '<div class="panel-body p-t-10" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)"> ';
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
function addWork(){
	var param = 'category_idx=' + document.newWork.category_idx.value
	+'&work_title=' + document.newWork.work_title.value
	+'&work_start=' + document.newWork.work_start.value
	+'&work_end=' + document.newWork.work_end.value + document.newWork.work_time.value
	+'&work_confirm=' + document.newWork.work_confirm.value;
	
	window.alert(param);
	sendRequest('workAdd.do', param, addWorkResult, 'POST');

}
function addWorkResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;	
			if (result>0) {

			}
			$(workback).fadeOut('100');
			$(work_modal).fadeOut('100');
			location.reload();
		}
	}
}
 
function check(ch){
	var param='checklist_idx='+ch;
	sendRequest('checkUpdate.do', param, checkResult, 'POST');
}
function checkResult() {
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;
			result=parseInt(result); //checklist_idx
			
			var ch=document.getElementById('ch'+result);
			var ch_s=document.getElementById('ch_state'+result);
			var ch_sv=document.getElementById('ch_state'+result).value;
			
			var div_ch=document.getElementById('div_ch'+result);
			div_ch=div_ch.parentNode.lastChild.previousSibling;
			
			if(ch_sv=='1'){
				$(ch).hide();
				ch.className='glyphicon glyphicon-unchecked';
				$(ch).fadeIn('50');
				ch_s.value='0';
			}else if(ch_sv=='0'){
				
				if(div_ch.value=='0'){
					ch.className='glyphicon glyphicon-ok';
					$('#div_ch'+result).hide('100');
				}else{
					$(ch).hide();
					ch.className='glyphicon glyphicon-ok';
					$(ch).fadeIn('50');
				}
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
					+"</i>&nbsp;"+chc+"</a>"
					+"<input type='hidden' id='ch_state"+chi+"' value='0'>";
					
			var dNode = document.createElement('div');
			dNode.setAttribute('id','div_ch'+chi);
			dNode.setAttribute('draggable','true');
			dNode.setAttribute('ondragover','allowDrop(event)');
			dNode.setAttribute('ondragstart','drag(event)');
			
			dNode.innerHTML = chAdd;
			
			document.getElementById('content'+wi).value='';
			
			var div=document.getElementById('check_div'+wi);
			var in_ch=div.lastChild.previousSibling;
			div.insertBefore(dNode,in_ch);
			
			
		}
	}
}

/*완료한 체크리스트 목록 보기 */
function showCheck(work_idx){
	
	var div=document.getElementById('check_div'+work_idx);
	
	var in_ch=document.getElementById('checkHide'+work_idx);
	
	var fc=div.firstChild;
	
	if(in_ch.value=='1'){
		in_ch.value='0';
		
		while(fc!=in_ch){
			
			if(fc.nodeName == 'DIV'){
				var ch_state=fc.lastChild.previousSibling.value;
				var nch_state=fc.lastChild.value;
				if(ch_state=='1'||nch_state=='1'){
					$(fc).hide('100');
				}
			}
			fc=fc.nextSibling;
		}
		
		document.getElementById('aCheck'+work_idx).innerHTML='완료한 체크리스트 보기';
		
	}else if(in_ch.value=='0'){
		in_ch.value='1';
		
		while(fc!=in_ch){
			if(fc.nodeName == 'DIV'){
				$(fc).show('100');
			}
				fc=fc.nextSibling;
		}
		
		document.getElementById('aCheck'+work_idx).innerHTML='완료한 체크리스트 숨기기';
	}
}

//ondragstart 드래그할 때 id값 가져오기!
function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

//ondragover
function allowDrop(ev) {
    ev.preventDefault();
}
function trashColor(){
	document.getElementById('trash_i').style.color='red';
}
function trashColorReturn(){
	document.getElementById('trash_i').style.color='black';
}

//ondrop =>나 위에 드랍했을 때 일어나는 이벤트 ->data는 드래그 당한 컴포넌트
//휴지통
function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    document.getElementById('trash_i').style.color='black';
    
    //유효성 검사
    if(document.getElementById(data)==null){
    	window.alert('잘못된 접근입니다.');
    	return;
    }
    
    if(data.startsWith('div_ch')){
	    
    	data=data.substring(6);
    	var param='checklist_idx='+data;
    	sendRequest('checkDelete.do', param, delResult, 'POST');    
    }else if(data.startsWith('wdiv')){
    	data=data.substring(4);
    	var param='work_idx='+data;
    	sendRequest('workDelete.do', param, workDelResult, 'POST');
    }else if(data.startsWith('c')){
		data=data.substring(1);
    	var param='category_idx='+data;
    	sendRequest('categoryDel.do', param, cateDelResult, 'POST');
    }
}

//ondrop =>나 위에 드랍했을 때 일어나는 이벤트 ->data는 드래그 당한 컴포넌트
function workDrop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    
    
}
//checklist 삭제 콜백 함수
function delResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result=XHR.responseText; //지운 idx
			result=parseInt(result);
			$('#div_ch'+result).remove();
		}
	}
}
//work 삭제 콜백 함수
function workDelResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			
		}
	}
}
//카테고리 삭제 콜백 함수
function cateDelResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result=XHR.responseText; //지운 idx
			result=parseInt(result);
			$('#cp'+result).remove();
		}
	}
}

</script>
<style>
#workback {
	position: fixed;
	z-index:0;
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
	z-index:5;
	top: 20%;
	left: 20%;
	border: solid 10px white;
	border-radius: 10px;
	width: 600px;
	height: 500px;
}

.category {
	display: inline-block;
	width: 200px;
	float: left;
}
.wdiv{
	width: 200px;
	padding-left: 10px;
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
	height: 34px;
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
.cateName{
	display: none;
}
#trash{
	width: 55px;
	height: 45px;
	display: inline-block;
	position: fixed;
	left: 50%;
	top:10px;
	border: 1px solid black;
}
</style>
</head>
<%-- <%@include file="/WEB-INF/view/header.jsp" %> --%>
<body>
	<div id="trash" ondrop="drop(event)" class="btn-lg" ondragenter="trashColor()" ondragleave="trashColorReturn()" ondragstart="drag(event)" ondragover="allowDrop(event)">
		<span id="trash_i" class="glyphicon glyphicon-trash" aria-hidden="true" ondragover="trashColor()" ></span>
	</div>
	
	<div id="cbody" style="width:${(pdto.category_num +2)*200}px">
		<div>
			<br>&nbsp;&nbsp;<span class="glyphicon glyphicon-chevron-right"></span>${pdto.project_name}
		</div>
		<c:set var="pdto" value="${pdto}"></c:set>
		<c:choose>
			<c:when test="${(empty pdto.category_dtos) or pdto.category_dtos[0].category_idx == 0}"></c:when>
			<c:otherwise>
				<c:forEach var="cdto" items="${pdto.category_dtos}">
					<div class="category" id="cp${cdto.category_idx}">
						<div class="category_head" id ="c${cdto.category_idx}" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)">
<!--카테고리 이름  -->						
							<form action="javascript:categoryUpdate(${cdto.category_idx})">
								<div id="cate${cdto.category_idx}" class="cateName">
									<input id="cateIn${cdto.category_idx}" type="text" value="${cdto.category_name }" size="16px">
									&nbsp;&nbsp;
								<i class="glyphicon glyphicon-remove" onclick="cateNameRe(${cdto.category_idx})"></i>
								</div>
								<div id="a_cate${cdto.category_idx}"><a href="javascript:cateName(${cdto.category_idx})">${cdto.category_name }</a>
								&nbsp;&nbsp;
								<i class="glyphicon glyphicon-plus" onclick="showf(${cdto.category_idx})"></i>
								</div>
							</form>
						</div>

						<c:if test="${not empty cdto.work_dtos}">
							<c:forEach var="wdto" items="${cdto.work_dtos }">
								<div id="wdiv_${wdto.work_idx}" class="wdiv" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)">
									<span>${wdto.work_title }</span>
									<span><i class="glyphicon glyphicon-cog" onclick="showu()"></i></span>
								</div>
								<table class="cate_table">
									<tbody>
										<tr>
											<td colspan="2"><div
													class="table_i glyphicon glyphicon-calendar"></div>&nbsp;${wdto.work_start}~${wdto.work_end}</td>
										</tr>
										<tr>
											<td colspan="2">
												<div class="table_i glyphicon glyphicon-user"></div>
												<c:forEach var="mdto" items="${marr}">
													<c:if test="${mdto.work_idx eq wdto.work_idx}">
														<span>${mdto.member_name}</span>
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
														<div id="div_ch${chdto.checklist_idx }" style="display:${chdto.checklist_state eq '1' ? 'none' : 'block' }" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)" >
															<a onclick="javascript:check(${chdto.checklist_idx })">
															<i id="ch${chdto.checklist_idx }"
															class="${chdto.checklist_state eq '1' ? 'glyphicon glyphicon-ok' : 'glyphicon glyphicon-unchecked' }">
															</i> ${chdto.checklist_content}
															</a>
															<input type="hidden" id="ch_state${chdto.checklist_idx}" value="${chdto.checklist_state}">
														</div>
													</c:forEach>
												<input type="hidden" id="checkHide${wdto.work_idx}" value="0">
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="2" align="right"><a id="aCheck${wdto.work_idx}" href="javascript:showCheck(${wdto.work_idx})">완료한 체크리스트 보기</a>&nbsp;</td>
										</tr>
										<tr>
											<td>진행률</td>
											<td>막대그래프</td>
										</tr>
										<tr>
											<c:choose>
											<c:when test="${wdto.work_state == 3 }">
												<td><input type="button" value="업무 완료됨"></td>
											</c:when>
											<c:when test="${wdto.work_state + wdto.work_confirm == 11 }">
												<td><input type="button" value="결재 요청"></td>
											</c:when>
											<c:when test="${wdto.work_state + wdto.work_confirm == 12 }">
												<td><input type="button" value="결재 대기 중"></td>
											</c:when>
											<c:when test="${wdto.work_state + wdto.work_confirm == 21 }">
												<td><input type="button" value="업무 완료"></td>
											</c:when>
											</c:choose>
											
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


		<div class="category" id="addCate" style="padding-left: 10px;">
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
						<h2></h2>
						<input type="hidden" name="category_idx" value="">
						업무명 : <input type="text" name="work_title">
					</div>
					<div>기한</div>
					<div>
						<input type="text" id="work_start" name="work_start"
							rel="stylesheet" /> ~<input type="text" id="work_end"
							name="work_end" rel="stylesheet" />
							<input type="text" name="work_time" value="" placeholder="시간선택"  id="work_time" required size="8" maxlength="5">
					</div>
					<div>
						<input type="checkbox" name="work_confirm" value="20">결재여부
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
							<div class="col-md-3" ondrop="workDrop(event)">
								<h4 class="text-center">업무 담당자</h4>
								<ul class="media-list">
									<li class="media"><a class="pull-left" href="#"><img
											class="media-object"
											src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
											height="30" width="30"></a>
										<div class="media-body">
											<h6 class="media-heading">Media heading</h6>
										</div></li>
								</ul>
							</div>
							<div class="col-md-3">
								<h4 class="text-center">추천 목록</h4>
								<div id="project_m" style="width:300px; height: 300px; overflow-y: scroll"></div>
								<p></p>
								<p></p>
							</div>
						</div>
					</div>
				</div>
				<button type="button" class="btn btn-next" id="btn-workbefore"
					onclick="showf()">이전</button>
				<c:if test=""></c:if>
				<button type="button" class="btn btn-next" id="btn-workok" onclick="addWork()">완료</button>
			</div>
		</div>
	</form>




</body>
<script>
              //검색 날짜제한 
             $(function() {              
                 
               //datepicker 한국어로 사용하기 위한 언어설정
               $.datepicker.setDefaults($.datepicker.regional['ko']); 

               //시작일.
               $('#work_start').datepicker({
                    //dateFormat: "yy-mm-dd",
                    //monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
                    //dayNamesMin:["일","월","화","수","목","금","토"],
                   //buttonImage: "/jdAdmin/images/calendar.png", // 버튼 이미지
                   //buttonImageOnly : true,             // 버튼 이미지만 표시할지 여부
                   //buttonText: "날짜선택",             // 버튼의 대체 텍스트
                   dateFormat: "yy-mm-dd",             // 날짜의 형식
                   changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
                   onClose: function( selectedDate ) {    
                       // 시작일(fromDate) datepicker가 닫힐때
                       // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                       $("#work_end").datepicker( "option", "minDate", selectedDate );
                   }                
               });
 
               //종료일
               $('#work_end').datepicker({
                    //dateFormat: "yy-mm-dd",
                    //monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
                    //dayNamesMin:["일","월","화","수","목","금","토"], 
                   dateFormat: "yy-mm-dd",
                   changeMonth: true,
                   onClose: function( selectedDate ) {
                       // 종료일(toDate) datepicker가 닫힐때
                       // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                       $("#work_start").datepicker( "option", "maxDate", selectedDate );
                   }                
               });
               
               
               
           });

$("#work_time").timepicker({
	step: 30,            //시간간격 : 5분
	timeFormat: "A H:i"    //시간:분 으로표시
});
$(document).ready(function(){
	$("#work_time").timepicker('setTime', "17:30");

});
</script>
</html>