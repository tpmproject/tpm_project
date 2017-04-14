<%@page import="org.springframework.web.bind.annotation.RequestParam"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8>
<title>TPM</title>

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
<%@ include file="/sample/cho/main/import.jsp"%>
<script> 
 $(document).ready(function() { $('#myCarousel').carousel('cycle'); $('#myCarousel2').carousel('cycle'); }); 
 </script>
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
	function showf2() {
		$(f_modal2).show();
		$(smodal2).hide();
	}
	
	/**프로젝트 수정*/
	function projectUpdate(idx,name,content){
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

	function projectMemberAddResult3() {
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
				var objData=eval('('+result+')');
				var p=objData.p;
				if(p.project_idx==0){
					window.alert('오류 발생!');
				}else{
		
					var divNode=document.createElement('DIV');
					divNode.setAttribute('class','col-lg-3');
					divNode.setAttribute('style','margin-top: 15px;');
					divNode.setAttribute('id','project_div'+p.project_idx);
					
					var msg='<div class="box">';
					msg+='<div class="box-gray aligncenter" style="height:210px;">';
					msg+='<input type="hidden" id="p_idx'+p.project_idx+'" value="'+p.project_idx+'">';
					msg+='<h4 id="pn'+p.project_idx+'">'+p.project_name+'<span onclick="projectUpdate('+p.project_idx+','+p.project_name+','+p.project_content+')"><i class="glyphicon glyphicon-cog" style="margin-bottom:0px;"></i></span></h4>';
					msg+='<div class="icon"><i class="fa fa-desktop fa-3x"></i></div>';
					msg+='<p id="pc'+p.project_idx+'">'+p.project_content+'</p>';
					msg+='<td><input type="button" value="진행중"></td></div>';
					msg+='<div class="box-bottom"><a href="projectContent.do?project_idx='+p.project_idx+'">프로젝트 보기버튼</a></div></div>';
					
					divNode.innerHTML=msg;
					
					document.getElementById('contain').appendChild(divNode);
		
				}
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
			var p=objData.p;
			if(p.project_idx==0){
				window.alert('오류 발생!');
			}else{
				if(updateProject_me==0){
					$('#project_div'+p.project_idx).remove();
					updateProject_me=0;
					closem();
					return;
				}
				updateProject_me=0;
				var p_name=document.getElementById('pn'+p.project_idx);
				document.getElementById('pc'+p.project_idx).innerHTML=p.project_content;
				if(myLevel!='3000'){
					p_name.innerHTML=p.project_name;	
				}else{
					p_name.innerHTML=p.project_name+'<span onclick="projectUpdate('+p.project_idx+','+p.project_name+','+p.project_content+')"><i class="glyphicon glyphicon-cog" style="margin-bottom:0px;"></i></span>';
					
				}
				myLevel=0;
			}
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

/**결재 상태*/

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
	z-index: 4;
}

#main_modal, #main_modal2 {
	display: none;
	background: white;
	position: fixed;
	top: 10%;
	left: 30%;
	border: solid 10px white;
	border-radius: 10px;
	width: 640px;
	height: 700px;
	z-index: 5;
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
<body class="skin-blue">
	<%@ include file="/WEB-INF/view/header.jsp"%>
	<section class="callaction">
	<div class="container">
		<div class="row" style="margin-bottom: 30px;">
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
				<div class="box-gray aligncenter" style="background: #eee;">
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
			<button type="button" class="close" onclick="closem()">×</button>
			<h4 class="modal-title">프로젝트 수정</h4>

			<div id="f_modal2">
				<div class="box-gray aligncenter">
					<h4>프로젝트 수정</h4>
					<div id="btntest" class="icon">
						<div>
							<input type="hidden" name="project_idx"> 프로젝트명: <input
								type="text" name="project_name">
						</div>
						<p>
							<textarea cols="30" rows="20" name="project_content"></textarea>
						</p>
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
	<hr>
	<hr>
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		
		<ol class="carousel-indicators">
		<c:forEach var="i" items="${plist}" varStatus="status">
			<c:if test="${status.index %4 == 0}">
			<c:choose>
			<c:when test="${status.index ==0}">
				<li data-target="#carousel-example-generic" data-slide-to="${status.index/4 }" class="active"></li>
			</c:when>
			<c:otherwise>
			<li data-target="#carousel-example-generic" data-slide-to="${status.index/4 }" ></li>
			</c:otherwise>
			</c:choose>
			</c:if>
			
		</c:forEach>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">

			<div class="item active">
				<div>
					<div class="container" id="contain">
						<c:set var="plist" value="${plist}"></c:set>
						<c:choose>
							<c:when test="${empty plist}">
								등록된 프로젝트가 없습니다.
							</c:when>
							<c:otherwise>
								<c:forEach var="i" items="${plist}" varStatus="status">
									<div id="project_div${i.project_idx}" class="col-lg-3"
										style="margin-top: 15px;">
										<div class="box" style="border: 0px;">
											<div class="box-gray aligncenter" style="height: 210px;">
												<input type="hidden" id="p_idx${i.project_idx}"
													value="${i.project_idx}">
												<h4 id="pn${i.project_idx}">
													<span>${i.project_name }</span>
													<c:if test="${i.project_level eq 3000 }">
														<span
															onclick="projectUpdate(${i.project_idx},'${i.project_name }','${i.project_content}')">
															<i class="glyphicon glyphicon-cog"
															style="margin-bottom: 0px;"></i>
														</span>
														<span
															onclick="projectDelete('${i.project_idx}')">
															<i class="glyphicon glyphicon-remove"
															style="margin-bottom: 0px;"></i>
														</span>
													</c:if>
												</h4>
												<div class="icon">
													<i class="fa fa-desktop fa-3x"></i>
												</div>
												<p id="pc${i.project_idx}">${i.project_content }</p>

												<!-- 프로젝트 진행현황 -->
												<c:choose>
													<c:when test="${i.project_level == 3000 and i.project_state == 1}">
														<button type="button" onclick="sucess()">완료하기</button>
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
												<a
													href="projectContent.do?project_idx=${i.project_idx}&project_level=${i.project_level}">프로젝트
													보기버튼</a>
											</div>
										</div>
									</div>
									<!-- divider -->
									<!-- end divider -->
									<!-- Portfolio Projects -->
									
									<c:if test="${status.index %4 == 3 and not status.last}">
									</div>
										</div>
									</div>
									
										<div class="item">
									<div>
									<div class="container" id="contain">
									</c:if>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>

		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"> <span
			class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

	<%@ include file="/WEB-INF/view/footer.jsp"%>


</body>
</html>