<%@page import="org.springframework.web.bind.annotation.RequestParam"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="http://bootstraptaste.com">
<!-- css -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="css/jcarousel.css" rel="stylesheet">
<link href="css/flexslider.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<!-- Theme skin -->
<link href="skins/default.css" rel="stylesheet">
<link rel="stylesheet" href="bootstrap-3.3.2-dist/css/bootstrap.min.css">

<link rel="stylesheet"
	href="bootstrap-3.3.2-dist/css//bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-3.2.0.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="js/ajax_extension.js"></script>

<script type="text/javascript">
	window.onload = function() {
		$(main_modal).hide();
		$(smodal).hide();
	}

	function showf() {
		$(mback).fadeIn('150');
		$(main_modal).fadeIn('150');
		$(f_modal).show();
		$(smodal).hide();
	}
	//친구리스트
	function shows() {

		var pname = document.newProject.project_name.value;
		var pcontent = document.newProject.project_content.value;
		if (pname == null || pname == "" || pcontent == null || pcontent == "") {
			window.alert('프로젝트 정보 입력 부탁 드립니다!!');
			showf();
			return;
		}

		$(f_modal).fadeOut();
		$(smodal).fadeIn();
		var param = 'member_idx=' + ${s_member_idx};
		sendRequest('projectFriendList.do', param, projectMemberAddResult2,	'POST');

	}

	function closem() {
		$(mback).fadeOut('100');
		$(main_modal).fadeOut('100');
		document.newProject.reset();
	}
	//검색멤버
	function projectMemberAdd() {
		var param = 'member_idx=' + ${s_member_idx};
		param += '&member_id=' + document.newProject.member_id.value;

		sendRequest('projectMemberAdd.do', param, projectMemberAddResult,
				'POST');
		window.alert(param);
	}

	/**검색 멤버*/
	function projectMemberAddResult() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {

				var result = XHR.responseText;

				var json = JSON.parse(result);

				var msg = '';
				var members = json.members; // 맵 객체로부터 members 값인 배열을 가져온다.
				for (var i = 0; i < members.length; i++) {
					var member = members[i];

					
					msg += '<div id="modal_content'+member.member_idx+'" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)" >';
					msg += '<img height="30" width="30" class="thumb-lg img-circle bx-s" ';
					msg += 'src="/tpm_project/img/member/profile/' + member.member_img + '"> ';
					msg += member.member_name;
					msg += '<div id="plus'+member.member_idx+'" style="display:inline-block;width:30px;height:30px;" onclick="goInsert_member('
							+ member.member_idx + ')">';
					msg += '<i class="glyphicon glyphicon-plus"></i></div>';

					msg += '<input type="hidden" id="member_img' +member.member_idx  + '" value="' + member.member_img + '">';
					msg += '<input type="hidden" id="member_name' +member.member_idx+ '" value="' + member.member_name + '">';
					msg += '<p class="text-muted">' + member.member_id
							+ '</p> ';

					msg += '</div> ';
				}

				var member_search_content = document
						.getElementById('member_search_content');
				member_search_content.innerHTML = msg;

				if (result != null) {
					/* var bodyNode = document.getElementById('btntest2');
					var divNode = document.createElement('div');
					divNode.innerHTML = result;
					bodyNode.appendChild(divNode); */
				}

			}
		}
	}
	
	var temp='';
	function goInsert_member(i) {
		var member_idx = ${s_member_idx};
		var myfriend_idx = i;

		var param = 'member_idx=' + member_idx + '&myfriend_idx='
				+ myfriend_idx;
		//sendRequest('myFriendAdd.do', param, 'POST', 'FRIEND_INSERT'); // 해당 페이지로 ajax통신 시작
		sendRequest('myFriendAdd.do', param, friendAddResult, 'POST');
		temp=i;
	}

	
	function friendAddResult() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var result = XHR.responseText;
				window.alert(result);
				if (result.trim() == 'true') {
					var chil=document.getElementById('modal_content'+temp);
					var pa=document.getElementById('myFriend_List');
					if(chil.parentNode.getAttribute('id') == 'project_Member'){
						
					}else{
						pa.appendChild(chil);
					}
					$('#plus'+temp).remove();

				}

			}
		}
	}

	/**친구리스트*/
	function projectMemberAddResult2() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var result = XHR.responseText;
				var json = JSON.parse(result);

				var msg2 = '';
				var members = json.members; // 맵 객체로부터 members 값인 배열을 가져온다.
				for (var i = 0; i < members.length; i++) {
					var member = members[i];

					msg2 += '<div id="modal_content'+member.member_idx+'" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)">';
					msg2 += '<img height="30" width="30" class="thumb-lg img-circle bx-s" ';
					msg2 += 'src="/tpm_project/img/member/profile/' + member.member_img + '"> ';
					msg2 += member.member_name;

					msg2 += '<input type="hidden" id="member_img' +member.member_idx  + '" value="' + member.member_img + '">';
					msg2 += '<input type="hidden" id="member_name' +member.member_idx+ '" value="' + member.member_name + '">';
					msg2 += '<p class="text-muted">' + member.member_id
							+ '</p> ';

					msg2 += '</div> ';
				}

				var myFriend_List = document.getElementById('myFriend_List');
				myFriend_List.innerHTML = msg2;

			}
		}
	}

	//프로젝트 멤버에 임시 추가
	function insertPM(member_idx) {

		var temp = $('#modal_content' + member_idx);

		var divNode = document.createElement('div');
		divNode.setAttribute('id', 'pm' + member_idx);

		temp.hide();

		var img = $('#member_img' + member_idx).val();
		var name = $('#member_name' + member_idx).val();

		var msg = '<img height="30" width="30" class="thumb-lg img-circle bx-s" src="/tpm_project/img/member/profile/'+img+'"> ';
		msg += name;
		msg += '<select><option value="1000">읽기만</option>';
		msg += '<option value="2000">프로젝트 멤버</option>';
		msg += '<option value="3000">프로젝트 책임자</option></select>';
		msg += '<input type="hidden" name="addMember_idx" value="'+member_idx+'">';
		msg += '<a onclick="deletePM(' + member_idx
				+ ')"><i class="glyphicon glyphicon-remove"></i></a>';

		divNode.innerHTML = msg;

		var param = 'member_idx=' + member_idx;

		var pmdiv = document.getElementById('project_Member');
		pmdiv.appendChild(divNode);

	}
	function deletePM(member_idx) {
		$('#pm' + member_idx).remove();
		$('#modal_content' + member_idx).fadeIn('100');
	}

	function projectMemberAddResult3() {
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

					//그룹원 추가버튼	
					msg2 += '</a> ';
					msg2 += '<div class="pull-right btn-group-sm"> ';
					msg2 += '<a href="javascript:Insert_project_member('
							+ member.member_idx
							+ ')" class="btn btn-success tooltips" ';
					msg2 += 'data-placement="top" data-toggle="tooltip" ';
					msg2 += 'data-original-title="Add"> <i class="fa fa-user-plus"></i> ';

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
					msg2 += '<hr> ';

					msg2 += '</div> ';
					msg2 += '</div> ';
					msg2 += '</div> ';
					msg2 += '</div> '; 
					
				}

				var myFriend_List = document.getElementById('myFriend_List');
				myFriend_List.innerHTML = msg2;

			}
		}
	}

	function addP() {

		var pname = document.newProject.project_name.value;
		var pcontent = document.newProject.project_content.value;

		var param = 'project_name=' + pname;
		param += '&project_content=' + pcontent;
		var parentD = document.getElementById('project_Member');

		var childD = parentD.firstChild;
		var lastC = parentD.lastChild;
		var msg = '';
		var msg2 = '';
		while (true) {
			if(childD.nodeName=='DIV'){
				var idx=childD.getAttribute('id');
				msg+=idx.substring(13);
			}else{
				childD=childD.nextSibling
			}
			if(childD==lastC)break;
			
			
		
			msg += childD.lastChild.previousSibling.value + ',';
			msg2 += childD.lastChild.previousSibling.previousSibling.value
					+ ',';
			childD = childD.nextSibling;
		}

		var my_idx = ${s_member_idx};
		param += '&pm=' + my_idx + ',' + msg;
		param += '&level=3000,' + msg2;
		
		window.alert(param);
		//sendRequest('projectAdd.do', param, addPResult, 'POST');

	}
	function addPResult() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var result = XHR.responseText;
				window.alert(result);
				location.href = 'projectList.do';
			}
		}
	}
	/**프로젝트 수정*/
	function projectUpdate(i){
		
		window.alert(i);
		window.alert(i.project_name);
		/* 
			document.newProject.project_name.value='';
			$(mback).fadeIn('150');
			$(main_modal).fadeIn('150');
			$(f_modal).show();
			$(smodal).hide(); */
		
	}
	
function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function allowDrop(ev) {
    ev.preventDefault();
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    if(data.startsWith('modal_content')){
    	var comp=document.getElementById(data);
    	var img=document.getElementById('member_img'+data.substring(13));
    	
    	var spanNode=document.createElement('span');
    	
   		var msg='<select><option value="1000">읽기만</option>';
		msg += '<option value="2000">프로젝트 멤버</option>';
		msg += '<option value="3000">프로젝트 책임자</option></select>';
		msg += '<input type="hidden" name="addMember_idx" value="'+data.substring(13)+'">';
		
		spanNode.innerHTML=msg;
    	comp.insertBefore(spanNode,img);
    	document.getElementById('project_Member').appendChild(comp);
    }
}
function drop2(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    if(data.startsWith('modal_content')){
    	var nofriend=document.getElementById('plus'+data.substring(13));
    	var comp=document.getElementById(data);
    	if(nofriend==null){
	    	document.getElementById('myFriend_List').appendChild(comp);
    	}else{
    		document.getElementById('member_search_content').appendChild(comp);
    	}
    }
}

</script>

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
}

#main_modal {
	display: none;
	background: white;
	position: fixed;
	top: 10%;
	left: 10%;
	border: solid 10px white;
	border-radius: 10px;
	width: 640px;
	height: 700px;
}

.sd {
	display: inline-block;
	background: #f8f8f8;
	height: 600px;
	width: 48%;
	float: left;
	text-align: center;
}
</style>
</head>


<body>
<%@include file="../index.jsp" %>
	
	<section class="callaction">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="big-cta">
					<div class="cta-text">
						<h2>
							<span>TPM</span>.PROJECT
						</h2>
						<h5>
							<a onclick="showf()">프로젝트추가</a>
						</h5>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>

	<section id="content">
	<div class="container">
		<c:set var="plist" value="${plist}"></c:set>
		<c:choose>
			<c:when test="${empty plist}">
			등록된 프로젝트가 없습니다.
		</c:when>
			<c:otherwise>
				<c:forEach var="i" items="${plist}">
					<div class="row" >
						<div class="col-lg-12">
							<div class="row">
								<div class="col-lg-3">
									<div class="box">
										<div class="box-gray aligncenter">
											<input type="hidden" value="plist.get(i).member_idx">
											<h4>${i.project_name }<a href="javascript:projectUpdate(${i})"><i class="glyphicon glyphicon-cog"></i></a></h4>
											<div class="icon">
												<i class="fa fa-desktop fa-3x"></i>
											</div>
											<p>${i.project_content } 내용</p>

											<!-- 프로젝트 진행현황 -->
											<c:choose>
												<c:when test="${i.project_state == 3 }">
													<td><input type="button" value="완료"></td>
												</c:when>
												<c:when test="${i.project_state == 2 }">
													<td><input type="button" value="평가 대기"></td>
												</c:when>
												<c:when test="${i.project_state == 1 }">
													<td><input type="button" value="진행중"></td>
												</c:when>
											</c:choose>
										</div>
										<div class="box-bottom">
											<a href="#">프로젝트 보기버튼</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- divider -->
					<!-- end divider -->
					<!-- Portfolio Projects -->
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	</section>
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.fancybox.pack.js"></script>
	<script src="js/jquery.fancybox-media.js"></script>
	<script src="js/google-code-prettify/prettify.js"></script>
	<script src="js/portfolio/jquery.quicksand.js"></script>
	<script src="js/portfolio/setting.js"></script>
	<script src="js/jquery.flexslider.js"></script>
	<script src="js/animate.js"></script>
	<script src="js/custom.js"></script>

	<!-- ajax div -->
	<form name="newProject" action="projectAdd.do" method="post">
		<div id="mback" onclick="closem()"></div>
		<div id="main_modal">
			<button type="button" class="close" onclick="closem()">×</button>
			<h4 class="modal-title">프로젝트 생성</h4>

			<div id="f_modal">
				<div class="box-gray aligncenter">
					<h4>프로젝트1</h4>
					<div id="btntest" class="icon">
						<div>
							프로젝트명: <input type="text" name="project_name">
						</div>
						<p>
							<textarea cols="30" rows="20" name="project_content"></textarea>
						</p>
						<button type="button" class="btn btn-next" id="btn-next"
							onclick="shows()">다음</button>
					</div>

				</div>
			</div>

			<div id="smodal">



				<div class="sd">
					<h4>친구목록</h4>
					<div id="myFriend_List"
						style="width: 300px; height: 200px; overflow-y: scroll" ondrop="drop2(event)" ondragover="allowDrop(event)" ondragstart="drag(event)"></div>
					<h4>검색 멤버</h4>
					<div>
						<input type="text" name="member_id" placeholder="Search" size="15">
						<button type="button" class="btn" onclick="projectMemberAdd()">검색</button>
					</div>
					<div id="member_search_content" ondrop="drop2(event)" ondragover="allowDrop(event)" ondragstart="drag(event)"
						style="width: 300px; height: 200px; overflow-y: scroll"></div>

				</div>


				<div class="sd">
					<h4>초대 멤버</h4>
					<div id="project_Member" style="width: 95%; height: 480px; overflow-y: scroll" ondrop="drop(event)" ondragover="allowDrop(event)" ondragstart="drag(event)" >
					</div>
					<button type="button" class="btn btn-next" id="btn-workbefore"
						onclick="showf()">이전</button>
					<button type="button" class="btn btn-next" onclick="addP()">완료</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>