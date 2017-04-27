<%@page import="org.springframework.web.bind.annotation.RequestParam"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset=UTF-8>
<title>TPM</title>

<%-- <%@ include file="/WEB-INF/view/include/import.jsp"%>


<!-- Slimscroll -->


<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="js/ajax_extension.js"></script>

<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>


<!-- css -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="css/flexslider.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

<!-- Theme skin -->
<link href="skins/default.css" rel="stylesheet">
<link rel="stylesheet" href="bootstrap-3.3.2-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap-3.3.2-dist/css//bootstrap-theme.min.css">
<!-- Bootstrap 3.3.2 JS -->
<link href="/tpm_project/sample/cho/main/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/tpm_project/sample/aram/jquery.mCustomScrollbar.min.css" />
<link rel="stylesheet" href="/tpm_project/sample/aram/jquery.mCustomScrollbar.css" />
<script src="/tpm_project/sample/aram/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="/tpm_project/sample/aram/jquery.mCustomScrollbar.js"></script> --%>
<!-- ----------------------------------------- -->
<link rel="stylesheet" href="bootstrap-3.3.2-dist/css/bootstrap.min.css">
<link href="/tpm_project/css/font-awesome.min.css" rel="stylesheet"
	type="text/css" />
<!-- Ionicons -->
<link
	href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css"
	rel="stylesheet" type="text/css">
<!-- Morris chart -->
<link href="/tpm_project/sample/cho/main/plugins/morris/morris.css"
	rel="stylesheet" type="text/css">
<!-- Daterange picker -->
<link
	href="/tpm_project/sample/cho/main/plugins/daterangepicker/daterangepicker-bs3.css"
	rel="stylesheet" type="text/css">
<!-- Theme style -->
<link href="/tpm_project/sample/cho/main/dist/css/AdminLTE.min.css"
	rel="stylesheet" type="text/css">
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of
    downloading all of them to reduce the load. -->
<link
	href="/tpm_project/sample/cho/main/dist/css/skins/_all-skins.min.css"
	rel="stylesheet" type="text/css">

<!-- <script src="/tpm_project/sample/cho/main/plugins/iCheck/icheck.min.js" type="text/javascript"></script> -->

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="bootstrap-3.3.2-dist/js/bootstrap.min.js"></script> -->
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


<!-- 회전 카드 -->
<!-- <link href="/tpm_project/sample/khj/css/bootstrap.css" rel="stylesheet" /> -->
<link href="/tpm_project/sample/khj/css/rotating-card.css"
	rel="stylesheet" />
<!--   <link href = "http://netdna.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"rel = "stylesheet"/> -->


<script type="text/javascript">



 	window.onload = function() {
		$(main_modal).hide();
		$(smodal).hide();
		$('.slimdiv').mCustomScrollbar({axis:"yx"});
	}	 
		
 	
 	$(window).resize(function() {
 		var wid=(window.innerWidth/2)-320;
		$('#main_modal').css('left',wid+'px');
		$('#main_modal2').css('left',wid+'px');
 	})
 	
 	function sideBar(){
 		var bNode=document.documentElement.lastChild;
 		$(bNode).toggleClass('skin-blue skin-blue sidebar-collapse sidebar-open');
 	}
 	
 	
	function showf() {
		var wid=(window.innerWidth/2)-320;
		$('#main_modal').css('left',wid+'px');
		$(mback).fadeIn('150');
		$(main_modal).fadeIn('150');
		$(f_modal).show();
		$(smodal).hide();
	}
	function showf2() {
		$(f_modal2).show();
		$(smodal2).hide();
	}
	/**슬림스크롤*/
 	
	
	/**프로젝트 수정*/
	function projectUpdate(idx,name,content){
		var wid=(window.innerWidth/2)-320;
		$('#main_modal2').css('left',wid+'px');
		
		$(mback).fadeIn('150');
		$(main_modal2).fadeIn('150');
		$(f_modal2).show();
		$(smodal2).hide();
		
		document.changeProject.project_idx.value=idx;
		document.changeProject.project_name.value=name;
		document.changeProject.project_content.value=content;
	}
	
	//프로젝트 삭제
	function projectDelete(project_idx){
		var param='project_idx='+project_idx;
		window.alert('param='+param);
		sendRequest('projectDelete.do',param,projectDelResult,'POST');
		
	}
	function projectDelResult(){
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var result = XHR.responseText;
				var objData=eval('('+result+')');
				var pson=objData.pson;
				
				if(pson.project_idx==0){
					window.alert('오류 발생!');
				}else{
									
					$('#project_div'+pson.project_idx).remove();
		
				}
				 /* history.go(0); */
				/*  location.reload(); */
				closem();
			}
		}
				
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
	function shows2() {

		var pname = document.changeProject.project_name.value;
		var pcontent = document.changeProject.project_content.value;
		if (pname == null || pname == "" || pcontent == null || pcontent == "") {
			window.alert('프로젝트 정보 입력 부탁 드립니다!!');
			return;
		}

		$(f_modal2).hide();
		$(smodal2).show();
		
		var pidx=document.changeProject.project_idx.value;
		var midx=${s_member_idx};
		sendRequest('projectFriendList.do?member_idx='+midx+'&project_idx='+pidx, null, shows2Result,'GET');

	}
	

	function closem() {
		$(mback).fadeOut('100');
		$(main_modal).fadeOut('100');
		$(main_modal2).fadeOut('100');
		document.newProject.reset();
		document.changeProject.reset();
		document.getElementById('project_Member').innerHTML='';
		document.getElementById('project_Member2').innerHTML='';
	}
	
	//검색멤버
	var addOrUpdate=0;
	function projectMemberAdd(aou) {
		addOrUpdate=aou;
		var param = 'member_idx=' + ${s_member_idx};
		param += '&member_id=' + document.newProject.member_id.value;

		sendRequest('projectMemberAdd.do', param, projectMemberAddResult,'POST');
		
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
					var dupli=0;
					
										
					if(addOrUpdate==1){
						var parN=document.getElementById('project_Member');
						var brother=parN.firstChild;
						var youngB=parN.lastChild;
						var repeat=true;
						if(brother!=null){
							do{
								if(brother.nodeName=='DIV'){
									var bro_id=brother.getAttribute('id');
									if(bro_id=='modal_content'+member.member_idx){
										dupli++;
										repeat=false;
									}
								}
								if(brother!=youngB){
									brother=brother.nextSibling;
								}else{
									repeat=false;
								}
								
							}while(repeat);
							
							if(dupli>0){
								continue;
							}
						}	
							msg += '<div id="modal_content';
						
					}else if(addOrUpdate==2){
						var parN=document.getElementById('project_Member2');
						var brother=parN.firstChild;
						var youngB=parN.lastChild;
						var repeat=true;
						do{
							if(brother.nodeName=='DIV'){
								var bro_id=brother.getAttribute('id');
								
								if(bro_id=='modal2_content'+member.member_idx){
									
									dupli++;
									repeat=false;
								}
							}
							if(brother!=youngB){
								brother=brother.nextSibling;
							}else{
								repeat=false;
							}
						}while(repeat);
						
						if(dupli>0){
							continue;
						}
						
						msg += '<div id="modal2_content';
					}
					msg+=member.member_idx+'" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)" >';
					msg += '<img height="30" width="30" class="thumb-lg img-circle bx-s" ';
					msg += 'src="/tpm_project/img/member/profile/' + member.member_img + '"> ';
					msg += member.member_name;
					msg += '<div id="plus'+member.member_idx+'" style="display:inline-block;width:30px;height:30px;" onclick="goInsert_member('
							+ member.member_idx + ')">';
					msg += '<i class="glyphicon glyphicon-plus"></i></div>';
					msg += '<p class="text-muted">' + member.member_id
							+ '</p> ';

					msg += '</div> ';
					
					
					
					
					
				}
				
				var member_search_content=member_search_content = document.getElementById('member_search_content');
				if(addOrUpdate==2){
					member_search_content = document.getElementById('member_search_content2');
				}
				
				member_search_content.innerHTML = msg;

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
				
				if (result.trim() == 'true') {
					if(addOrUpdate==1){
						var chil=document.getElementById('modal_content'+temp);
						var pa=document.getElementById('myFriend_List');
						if(chil.parentNode.getAttribute('id') == 'project_Member'){
							
						}else{
							pa.appendChild(chil);
						}
						$('#plus'+temp).remove();
					}else if(addOrUpdate==2){
						var chil=document.getElementById('modal2_content'+temp);
						var pa=document.getElementById('myFriend_List2');
						if(chil.parentNode.getAttribute('id') == 'project_Member2'){
							
						}else{
							pa.appendChild(chil);
						}
						$('#plus'+temp).remove();
					}
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

					msg2 += '<p class="text-muted">' + member.member_id
							+ '</p> ';

					msg2 += '</div> ';
				}

				var myFriend_List = document.getElementById('myFriend_List');
				myFriend_List.innerHTML = msg2;

			}
		}
	}
	//프로젝트 수정시 프로젝트 멤버 목록
	function shows2Result() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var result = XHR.responseText;
				var json = JSON.parse(result);

				var f_List_msg='';
				var pm_List_msg='';
				var msg2 ='';
				pm_List_msg+='<div id="modal2_content${s_member_idx}" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)">';
				pm_List_msg += '<img height="30" width="30" class="thumb-lg img-circle bx-s" ';
				pm_List_msg += 'src="/tpm_project/img/member/profile/${s_member_img}">${s_member_name}';
				pm_List_msg += '<p class="text-muted">${s_member_id}</p> ';	
				pm_List_msg +='<span><select id="select2${s_member_idx}"><option value="1000">읽기만</option>';
				pm_List_msg += '<option value="2000">프로젝트 멤버</option>';
				pm_List_msg += '<option value="3000" selected="selected">프로젝트 책임자</option></select></span></div> ';
				
				var members = json.members; // 맵 객체로부터 members 값인 배열을 가져온다.
				for (var i = 0; i < members.length; i++) {
					var member = members[i];
					
					
					msg2 += '<div id="modal2_content'+member.member_idx+'" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)">';
					msg2 += '<img height="30" width="30" class="thumb-lg img-circle bx-s" ';
					msg2 += 'src="/tpm_project/img/member/profile/' + member.member_img + '"> ';
					msg2 += member.member_name;

					if(member.pm<10){
						msg2 += '<div id="plus'+member.member_idx+'" style="display:inline-block;width:30px;height:30px;" onclick="goInsert_member2('+ member.member_idx + ')">';
						msg2 += '<i class="glyphicon glyphicon-plus"></i></div>';
					}
					
					msg2 += '<p class="text-muted">' + member.member_id
							+ '</p> ';
					if(member.pm%10==1){
						var lev=member.level;
						var sel='selected="selected"';
						msg2 +='<span><select id="select2'+member.member_idx+'"><option value="1000"'+(lev==1000?sel:'')+'>읽기만</option>';
						msg2 += '<option value="2000" '+(lev==2000?sel:'')+'>프로젝트 멤버</option>';
						msg2 += '<option value="3000" '+(lev==3000?sel:'')+'>프로젝트 책임자</option></select></span>';
					}
					msg2 += '</div> ';
					
					if(member.pm%10==1){
						pm_List_msg+=msg2;
					}else{
						f_List_msg+=msg2;	
					}
					msg2='';
				}

				var pm_List = document.getElementById('project_Member2');
				pm_List.innerHTML = pm_List_msg;
				var f_List = document.getElementById('myFriend_List2');
				f_List.innerHTML=f_List_msg;
				var ms_List = document.getElementById('member_search_content2');
				ms_List.innerHTML='';

			}
		}
	}
	

	//프로젝트 멤버에 임시 추가
	function insertPM(member_idx) {

		var temp = $('#modal_content' + member_idx);

		var param = 'member_idx=' + member_idx;

		var pmdiv = document.getElementById('project_Member');
		
		var spanNode=document.createElement('span');
   		var msg='<select id="select'+data.substring(13)+'"><option value="1000">읽기만</option>';
		msg += '<option value="2000">프로젝트 멤버</option>';
		msg += '<option value="3000">프로젝트 책임자</option></select>';
		
		spanNode.innerHTML=msg;
    	temp.appendChild(spanNode);
		
		pmdiv.appendChild(temp);

	}
	function deletePM(member_idx) {
		$('#pm' + member_idx).remove();
		$('#modal_content' + member_idx).fadeIn('100');
	}

	/* function projectMemberAddResult3() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var result = XHR.responseText;
				
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
 */
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
				msg+=','+idx.substring(13);
				msg2+=','+$('#select'+idx.substring(13)).val();
			}
			if(childD==lastC)break;
			childD = childD.nextSibling;
		}

		var my_idx = ${s_member_idx};
		param += '&project_member=' + my_idx + msg;
		param += '&level=3000' + msg2;
		
		
		sendRequest('projectAdd.do', param, addPResult, 'POST');

	}
	function addPResult() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var result = XHR.responseText;
				window.alert(result);
				var objData=eval('('+result+')');
				
				var pson=objData; // projectDTO
				
				if(pson.project_idx==0){
					window.alert('오류 발생!');
				}else{
					var pmarry = pson.project_member_dtos;
					var divNode=document.createElement('DIV');
					divNode.setAttribute('class','item ');
					//divNode.setAttribute('style','margin-top: 15px;');
					var cNode = document.getElementById('ptest');
					
					
					var msg='<div class="box">';
					msg+='<div class="box-gray aligncenter" style="height:210px;">';
					msg+='<input type="hidden" id="p_idx'+pson.project_idx+'" value="'+pson.project_idx+'">';
					msg+='<h4 id="pn'+pson.project_idx+'">'+pson.project_name+'<span onclick="projectUpdate('+pson.project_idx+','+pson.project_name+','+pson.project_content+')"><i class="glyphicon glyphicon-cog" style="margin-bottom:0px;"></i></span></h4>';
					msg+='<div class="icon"><i class="fa fa-desktop fa-3x"></i></div>';
					
					msg+='<p id="pc'+pson.project_idx+'">'+pson.project_content+'</p>';
					msg+='<td><input type="button" value="진행중"></td></div>';
					msg+='<div class="box-bottom"><a href="projectContent.do?project_idx='+pson.project_idx+'&member_idx=${s_member_idx}">프로젝트 보기버튼</a></div></div>';
					
					/* var pmarry = pson.project_member_dtos;
				    pmarry[i].pro_m */
				 /*   var msg=' <div id="contain" class="container-fluid ">';
				   msg+='<div id="project_div'+pson.project_idx+'" style="margin-top: 15px;">';
					   msg+='<div class="col-sm-10 col-sm-offset-1">';
						   msg+='<div class="col-md-4 col-sm-6" style="width: 500px;">';
							   msg+='<div class="card-container manual-flip">';
								   msg+='<div class="card">';
									msg+='	<div class="front">'; */
											//<!--  배경화면-->
											//msg+='<div class="cover">';
											//	<!-- <img src="/tpm_project/sample/khj/img/son.jpg" /> -->
											//		msg+='</div>';

											//<!-- 상태 아이콘 -->
											/* msg+='<div class="user">';
												msg+='<img class="img-circle"';
													msg+='	src="/tpm_project/sample/khj/img/cat.png"';
														msg+='	style="width: 140px; height: 140px;" />';
															msg+='</div>'; */

											//<!--화면단  -->
										/* 	msg+='<div class="content">';
												msg+='<div class="main">';
													msg+='<input type="hidden" id="p_idx'+pson.project_idx+'"';
														msg+='value="'+pson.project_idx+'">';
															msg+='<h4 id="pn'+pson.project_idx+'">';
																msg+='<span class="hidden-xs">'+pson.project_name+'</span>';
																	msg+='</h4>';
																		msg+='<p class="profession">TPM Project</p>';
																			msg+='<p class="text-center">';
																				msg+='<span id="pc'+pson.project_idx+'"'+pson.project_content+'</span>';
																					msg+='</p>';
																						msg+='</div>';
																							msg+='<div class="footer" rel="tooltip" title="프로젝트 확인">';
																								msg+='<button class="btn btn-simple"';
																									msg+='onclick="rotateCard(this)">';
																										msg+='<i class="fa fa-mail-forward"></i> Manual Rotation';
																											msg+='</button>';

																												msg+='</div>';
																													msg+='</div>';
																														msg+='</div>'; */
										//<!-- end front panel -->

										// <!-- 뒷화면 -->
										/*<div class="back">
											<div class="header">
												<c:forEach var="pm_dto" items="${i.project_member_dtos}">
													<c:choose>
														<c:when test="${pm_dto.project_level ==3000 }">
															<c:if
																test="${pm_dto.member_idx eq sessionScope.s_member_idx }">
																<div style="float: right;">
																	<span rel="tooltip" title="수정하기"
																		onclick="projectUpdate(${i.project_idx},'${i.project_name }','${i.project_content}')">
																		<i class="glyphicon glyphicon-cog"
																		style="margin-bottom: 0px;"></i>
																	</span> <span rel="tooltip" title="삭제하기"
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
										</div> */
										//<!-- end back panel -->
										
									//	msg+='</div>';
									//<!-- end card -->
									//msg+='</div>';
								//<!-- end card-container -->
								//msg+='</div>';
							//<!-- end col sm 3 -->

							/* sg+='<div class="space-400"></div>';
								msg+='</div>';
									msg+='</div>';
							 */			//msg+='</div>';//컨테이너-end
							
					
				
				    
				    
					divNode.innerHTML=msg;
					cNode.appendChild(divNode);
		
				}
				// history.go(0);
				/* location.reload(); */
				closem();
			}
		}
	}
//프로젝트 업데이트
var updateProject_me=0;
var myLevel=0;
function updateP(){
	var pname = document.changeProject.project_name.value;
	var pcontent = document.changeProject.project_content.value;
	var pidx= document.changeProject.project_idx.value;
		
	var param = 'project_name=' + pname;
		param += '&project_content=' + pcontent;
		param +='&project_idx='+pidx;
	var parentD = document.getElementById('project_Member2');

	var childD = parentD.firstChild;
	var lastC = parentD.lastChild;
	var msg = '';
	var msg2 = '';
	
	var count=0;
	var pm_exist=0;
	
	while (true) {
		
		if(childD.nodeName=='DIV'){
			
			var idx=childD.getAttribute('id');
			if(count==0){
				msg+=idx.substring(14);
				msg2+=$('#select2'+idx.substring(14)).val();
				count++;
			}else{
				msg+=','+idx.substring(14);
				msg2+=','+$('#select2'+idx.substring(14)).val();	
			}
			
			if(idx.substring(14)=='${s_member_idx}'){
				updateProject_me++;
				myLevel=$('#select2'+idx.substring(14)).val();
			}
			if($('#select2'+idx.substring(14)).val()==3000){
				pm_exist++;
			}
			
		}
		if(childD==lastC)break;
		childD = childD.nextSibling;
	}

	var my_idx = ${s_member_idx};
	param += '&project_member='+ msg;
	param += '&level=' + msg2;
	
	if(pm_exist==0){
		window.alert('프로젝트 책임자가 없습니다.');
	}else{
		sendRequest('projectUpdate.do', param, updatePResult, 'POST');
	}
}
function updatePResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;
			var objData=eval('('+result+')');
			var pson=objData.pson;
			if(pson.project_idx==0){
				window.alert('오류 발생!');
			}else{
				if(updateProject_me==0){
					$('#project_div'+pson.project_idx).remove();
					updateProject_me=0;
					closem();
					return;
				}
				updateProject_me=0;
				var p_name=document.getElementById('pn'+pson.project_idx);
				document.getElementById('pc'+pson.project_idx).innerHTML=pson.project_content;
				if(myLevel!='3000'){
					p_name.innerHTML=pson.project_name;	
				}else{
					p_name.innerHTML=pson.project_name+'<span onclick="projectUpdate('+pson.project_idx+','+pson.project_name+','+pson.project_content+')"><i class="glyphicon glyphicon-cog" style="margin-bottom:0px;"></i></span>';
					
				}
				myLevel=0;
			}
			location.reload();
			closem();
		}
	}
	
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function allowDrop(ev) {
    ev.preventDefault();
}

//프로젝트 생성 시 멤버 추가 드랍
function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    if(data.startsWith('modal_content')){
    	var comp=document.getElementById(data);
    	
    	var select=document.getElementById('select'+data.substring(13));
    	if(select==null){
    		var spanNode=document.createElement('span');
	   		var msg='<select id="select'+data.substring(13)+'" value="2000"><option value="1000">읽기만</option>';
			msg += '<option value="2000" selected="selected">프로젝트 멤버</option>';
			msg += '<option value="3000">프로젝트 책임자</option></select>';
			
			spanNode.innerHTML=msg;
	    	comp.appendChild(spanNode);
    	}
    	document.getElementById('project_Member').appendChild(comp);
    }
}
//프로젝트 생성 시 멤버 빼기 드랍
function drop2(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    if(data.startsWith('modal_content')){
    	var nofriend=document.getElementById('plus'+data.substring(13));
    	
    	var select=document.getElementById('select'+data.substring(13));
    	var comp=document.getElementById(data);
    	
    	if(select!=null){
    		var select=select.parentNode;	
	    	comp.removeChild(select);
    	}
    	
    	if(nofriend==null){
	    	document.getElementById('myFriend_List').appendChild(comp);
    	}else{
    		document.getElementById('member_search_content').appendChild(comp);
    	}
    }
}
//프로젝트 수정 시 멤버 추가 드랍
function drop3(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    if(data.startsWith('modal2_content')){
    	var comp=document.getElementById(data);
    	
    	var select=document.getElementById('select2'+data.substring(14));
    	if(select==null){
    		var spanNode=document.createElement('span');
	   		var msg='<select id="select2'+data.substring(14)+'"><option value="1000">읽기만</option>';
			msg += '<option value="2000">프로젝트 멤버</option>';
			msg += '<option value="3000">프로젝트 책임자</option></select>';
			
			spanNode.innerHTML=msg;
	    	comp.appendChild(spanNode);
    	}
    	document.getElementById('project_Member2').appendChild(comp);
    }
}
//프로젝트 수정 시 멤버 빼기 드랍
function drop4(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    if(data.startsWith('modal2_content')){
    	var nofriend=document.getElementById('plus'+data.substring(14));
    	
    	var select=document.getElementById('select2'+data.substring(14));
    	var comp=document.getElementById(data);
    	
    	if(select!=null){
    		var select=select.parentNode;	
	    	comp.removeChild(select);
    	}
    	
    	if(nofriend==null){
	    	document.getElementById('myFriend_List2').appendChild(comp);
    	}else{
    		document.getElementById('member_search_content2').appendChild(comp);
    	}
    }
}
/**카드회전*/
$().ready(function(){
    $('[rel="tooltip"]').tooltip();

});

function rotateCard(btn){
    var $card = $(btn).closest('.card-container');
    console.log($card);
    if($card.hasClass('hover')){
        $card.removeClass('hover');
    } else {
        $card.addClass('hover');
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

/* Add rounded corners to the top left and the top right corner of the image */
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


	<%-- <div id="carousel-example-generic" class="carousel slide center-block"
		data-ride="carousel" data-interval="false">


		<!-- Indicators 페이징-->
		<ol class="carousel-indicators" style="bottom: -15px;">
			<c:forEach var="i" items="${plist}" varStatus="status">

				<li data-target="#carousel-example-generic"
					${status.first?'class="active"':'' }
					data-slide-to="${status.index}"></li>

			</c:forEach>
		</ol>



		<!-- Wrapper for slides -->

		<c:set var="plist" value="${plist}"></c:set>

		<c:choose>
			<c:when test="${empty plist}">
								등록된 프로젝트가 없습니다.
						</c:when>

			<c:otherwise>
				<div class="carousel-inner" role="listbox">
					<c:forEach var="i" items="${plist}" varStatus="status">

						<div class="item ${status.first?'active':'' }">
							<div id="contain" class="container-fluid ">
								<div id="project_div${i.project_idx}" style="margin-top: 15px;"
									align="center">
									<div class="row" id="red">

										<div class="panel panel-danger coupon"
											style="width: 550px; height: 100%; border-color: #fff">
											<c:choose>
												<c:when test="${i.project_state == 3}">
													<!-- 완료 -->
													<c:set var="ininin">class="panel-heading" id="head" style="color:#fff; background:#dff0d8; border-color:#fff;"</c:set>
												</c:when>
												<c:when test="${i.project_state == 2 }">
													<!-- 평가하기 -->
													<c:set var="ininin">class="panel-heading" id="head" style="color:#fff; background:#d9edf7; border-color:#fff;"</c:set>

												</c:when>
												<c:otherwise>
													<!-- 진행중 -->
													<c:set var="ininin">class="panel-heading" id="head"</c:set>
												</c:otherwise>
											</c:choose>
											<div ${ininin} style="margin: auto;">

												<div class="panel-title" id="title">
													<i class="fa fa-github fa-2x"></i> <input type="hidden"
														id="p_idx${i.project_idx}" value="${i.project_idx}">
													<h4 id="pn${i.project_idx}">
														<span class="hidden-xs">${i.project_name }</span>

														<!--수정 버튼 -->
														<c:if test="${pm_dto.project_level eq 3000 }">

															<span
																onclick="projectUpdate(${i.project_idx},'${i.project_name }','${i.project_content}')">
																<i class="glyphicon glyphicon-cog"
																style="margin-bottom: 0px;"></i>
															</span>

															<span onclick="projectDelete('${i.project_idx}')">
																<i class="glyphicon glyphicon-remove"
																style="margin-bottom: 0px;"></i>
															</span>
														</c:if>
													</h4>

												</div>
											</div>
											<div class="panel-body">
												<div class="col-md-6" align="center"
													style="margin-left: 30%;">
													<div class="items">

														<c:forEach var="pm_dto" items="${i.project_member_dtos}">

															<div class="col-md-2" align="center">


																<img
																	src="/tpm_project/img/member/profile/${pm_dto.mdtos.member_img}"
																	style="width: 65px; height: 65px; margin-left: 100px;">


															</div>

														</c:forEach>

													</div>

												</div>

												<!--프로젝트 내용  -->
												<div class="col-md-12">
													<hr>
													<div class="slimdiv" style="width: 100px; height: 100px;">
														<span id="pc${i.project_idx}">${i.project_content }</span>
													</div>
												</div>
											</div>

											<div class="panel-footer">
												<div class="coupon-code">

													<a class="btn btn-link"
														href="projectContent.do?project_idx=${i.project_idx}&member_idx=${s_member_idx}"><i
														class="fa fa-clone left"></i>업무확인</a>

													<!-- 프로젝트 진행현황 -->
													<c:forEach var="pm_dto" items="${i.project_member_dtos}">
														<c:if test=" ${pm_dto.member_idx eq sessionScope.s_member_idx}">

														<c:choose>
															<c:when
																test="${pm_dto.project_level == 3000 and i.project_state == 3}">
																<c:if
																	test="${pm_dto.member_idx eq sessionScope.s_member_idx }">
																	<span class="print"> <a href="#"
																		class="btn btn-link" style="color: green;"><i
																			class="glyphicon glyphicon-ok-circle"></i>완료</a></span>
																	<span
																		onclick="projectUpdate(${i.project_idx},'${i.project_name }','${i.project_content}')">
																		<i class="glyphicon glyphicon-cog"
																		style="margin-bottom: 0px;"></i>
																	</span>

																	<span onclick="projectDelete('${i.project_idx}')">
																		<i class="glyphicon glyphicon-remove"
																		style="margin-bottom: 0px;"></i>
																	</span>
																</c:if>
															</c:when>
															<c:when
																test="${pm_dto.project_level == 3000 and i.project_state == 2 }">
																<c:if
																	test="${pm_dto.member_idx eq sessionScope.s_member_idx }">
																	<span class="print"> <a
																		onclick="location.href='projectEvaluation.do?project_idx=${i.project_idx}&project_level=${pm_dto.project_level}&member_idx=${s_member_idx}'"
																		class="btn btn-link"><i
																			class="glyphicon glyphicon-check"></i>평가하기</a></span>
																	<span
																		onclick="projectUpdate(${i.project_idx},'${i.project_name }','${i.project_content}')">
																		<i class="glyphicon glyphicon-cog"
																		style="margin-bottom: 0px;"></i>
																	</span>

																	<span onclick="projectDelete('${i.project_idx}')">
																		<i class="glyphicon glyphicon-remove"
																		style="margin-bottom: 0px;"></i>
																	</span>
																</c:if>
															</c:when>
															<c:when test="${i.project_state == 1 }">
																<c:if
																	test="${pm_dto.member_idx eq sessionScope.s_member_idx }">
																	<span class="print"> <a href="#"
																		class="btn btn-link" style="color: red;"><i
																			class="glyphicon glyphicon-time"></i>진행중</a></span>
																	<span
																		onclick="projectUpdate(${i.project_idx},'${i.project_name }','${i.project_content}')">
																		<i class="glyphicon glyphicon-cog"
																		style="margin-bottom: 0px;"></i>
																	</span>

																	<span onclick="projectDelete('${i.project_idx}')">
																		<i class="glyphicon glyphicon-remove"
																		style="margin-bottom: 0px;"></i>
																	</span>
																</c:if>
															</c:when>
														</c:choose>
													</c:forEach>
												</div>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:otherwise>
			
		</c:choose>

		<!-- carousel-inner -->


		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"
			style="width: 50px; color: red; float: left;"> <span
			class="glyphicon glyphicon-triangle-left" aria-hidden="true">
		</span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next" style="width: 30px; color: red;">
			<span class="glyphicon glyphicon-triangle-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<hr>
	<hr>
	<hr> --%>


	<div id="carousel-example-generic" class="carousel slide center-block"
		data-ride="carousel" data-interval="false">

		<!-- Indicators 페이징-->
		<ol class="carousel-indicators" style="bottom: -15px; color: black;">
			<c:forEach var="i" items="${plist}" varStatus="status">

				<li data-target="#carousel-example-generic"
					${status.first?'class="active"':'' }
					data-slide-to="${status.index}" style="background: red;"></li>

			</c:forEach>
		</ol>

		<!-- 앞화면 -->
		<c:set var="plist" value="${plist}"></c:set>
		<c:choose>
			<c:when test="${empty plist}">
								등록된 프로젝트가 없습니다.
						</c:when>

			<c:otherwise>
				<div style="background: white;">
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
																<!-- <img src="/tpm_project/sample/khj/img/son.jpg" /> -->
															</div>

															<!-- 상태 아이콘 -->
															<div class="user">
																<img class="img-circle"
																	src="/tpm_project/sample/khj/img/cat.png"
																	style="width: 140px; height: 140px;" />
															</div>

															<!--화면단  -->
															<div class="content">
																<div class="main">
																	<input type="hidden" id="p_idx${i.project_idx}"
																		value="${i.project_idx}">
																	<h4 id="pn${i.project_idx}">
																		<span class="hidden-xs">${i.project_name }</span>
																	</h4>
																	<p class="profession">TPM Project</p>
																	<p class="text-center">
																		<span id="pc${i.project_idx}">${i.project_content }</span>
																	</p>
																</div>
																<div class="footer" rel="tooltip" title="프로젝트 확인">
																	<button class="btn btn-simple"
																		onclick="rotateCard(this)">
																		<i class="fa fa-mail-forward"></i> Manual Rotation
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
																					<span rel="tooltip" title="수정하기"
																						onclick="projectUpdate(${i.project_idx},'${i.project_name }','${i.project_content}')">
																						<i class="glyphicon glyphicon-cog"
																						style="margin-bottom: 0px;"></i>
																					</span> <span rel="tooltip" title="삭제하기"
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
		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"
			style="width: 100px; color: red; margin-top: 15%;"> <span
			class="glyphicon glyphicon-triangle-left" aria-hidden="true">
		</span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next"
			style="width: 100px; color: red; margin-top: 15%;"> <span
			class="glyphicon glyphicon-triangle-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>




	<%@ include file="/WEB-INF/view/footer.jsp"%>
</body>
</html>