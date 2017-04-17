<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>TPM</title>
<link rel="stylesheet" href="bootstrap-3.3.2-dist/css/bootstrap.min.css">
<%@ include file="/sample/cho/main/import.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script src="/tpm_project/js/ajax_extension.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/jquery.timepicker.min.js"></script>
<script src="/tpm_project/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
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
			
			var chData=eval('('+result+')');
			
			if (result != null) {
				var cate=chData.category;
				
			
				var cbodyNode = document.getElementById('cbody');
				var cateNode = document.getElementById('addCate');
				var dNode = document.createElement('div');
				
				var idx=cate.category_idx;
				var name=cate.category_name;
				dNode.setAttribute('class','category');
				dNode.setAttribute('id','cp'+idx);
				
				var innerH='<div class="category_head" id ="c'+idx+'" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)">';			
				innerH+='<form action="javascript:categoryUpdate('+idx+')">';
				innerH+='<div id="cate'+idx+'" class="cateName">';
				innerH+='<input id="cateIn='+idx+'" type="text" value="'+name+'" size="16px">&nbsp;&nbsp;';
				innerH+='<i class="glyphicon glyphicon-remove" onclick="cateNameRe('+idx+'+)"></i></div>';
				innerH+='<div id="a_cate'+idx+'"><a href="javascript:cateName('+idx+')">'+name+'</a>&nbsp;&nbsp;';
				innerH+='<i class="glyphicon glyphicon-plus" onclick="showf('+idx+')"></i></div></form></div>';
				
				dNode.innerHTML=innerH;
				cbodyNode.insertBefore(dNode,cateNode);
				cbodyNode.style.width = parseInt(cbodyNode.style.width)+200+"px";
				document.newCategory.category_name.value='';
			}
		}
	}
}

//업무추가
window.onload=function(){
	$(work_modal).hide();
	$(btnwork2).hide();
	$(work_modal2).hide();
	$(btnwork4).hide();
}
function showf(category_idx){
	$(workback).fadeIn('150');
	$(work_modal).fadeIn('150');
	$(w_modal).show();
	$(btnwork2).hide();
	document.newWork.category_idx.value=category_idx;
}
function showf2() {
	$(w_modal2).show();
	$(btnwork4).hide();
}
function workUpdate(work_idx,work_title,work_start,work_end,work_confirm){
	$(workback2).fadeIn('150');
	$(work_modal2).fadeIn('150');
	$(w_modal2).show();
	$(btnwork4).hide();
	window.alert(work_confirm);
	document.changeWork.work_idx.value=work_idx;
	document.changeWork.work_title.value=work_title;
	document.changeWork.workdateup.value=work_start+"-"+work_end;
	if(work_confirm==10){
		document.changeWork.work_confirm.setAttribute('checked','checked');
	}
}
function shows(){
	var wtit=document.newWork.work_title.value;
	var wsta=document.newWork.workdate.value;
	
	if (wtit == null || wtit == "" || !wsta ) {
		window.alert('업무명과 기한 모두 입력 부탁 드립니다.');
		showf();
		return;
	}
	
	$(w_modal).fadeOut();
	$(btnwork2).fadeIn();
	var p=${pdto.project_idx};
	
	sendRequest('workAdd.do?project_idx='+p,null,showsResult,'GET');
	
}
function shows2(){
	var wtit=document.changeWork.work_title.value;
	var wsta=document.changeWork.workdateup.value;
	
 	if (wtit == null || wtit == "" || !wsta ) {
		window.alert('업무명과 기한 모두 입력 부탁 드립니다.');
		return;
	}
	
	$(w_modal2).hide();
	$(btnwork4).show();
	
	var p=${pdto.project_idx};
	var w=document.changeWork.work_idx.value;
	var m= ${s_member_idx}
	sendRequest('workUpdate.do?project_idx='+p+'&work_idx='+w+'&member_idx='+m,null,shows2Result,'GET');
	
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
				msg2 += '<div id="work_member'+member.member_idx+'" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)">';
				msg2 += '<img height="30" width="30" class="thumb-lg img-circle bx-s" ';
				msg2 += 'src="/tpm_project/img/member/profile/' + member.member_img + '"> ';
				msg2 += member.member_name;
				msg2 += '<p class="text-muted">' + member.member_id	+ '</p> ';
				msg2 += '</div> ';
			}
			var project_m = document.getElementById('project_m');
			project_m.innerHTML = msg2;		
		}
	}
}
function shows2Result(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;
			var json = JSON.parse(result);	
			window.alert(result);
			var w_msg='';
			var p_msg='';
			var msg2 = '';
			var members = json.members; // 맵 객체로부터 members 값인 배열을 가져온다.
			for (var i = 0; i < members.length; i++) {
				var member = members[i];
				
				msg2 += '<div id="work2_member'+member.member_idx+'" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)">';
				msg2 += '<img height="30" width="30" class="thumb-lg img-circle bx-s" ';
				msg2 += 'src="/tpm_project/img/member/profile/' + member.member_img + '"> ';
				msg2 += member.member_name;
				msg2 += '<p class="text-muted">' + member.member_id	+ '</p> ';
				msg2 += '</div> ';
				
				if(member.pm==1){
					w_msg+=msg2;
				}else{
					p_msg+=msg2;
				}
				msg2='';
			}
			
			var w_List=document.getElementById('work_m2');
			w_List.innerHTML = w_msg;
			var p_List=document.getElementById('project_m2');
			p_List.innerHTML=p_msg;	
		}
	}
}
function closem() {
	$(workback).fadeOut('100');
	$(workback2).fadeOut('100');
	$(work_modal).fadeOut('100');
	$(work_modal2).fadeOut('100');
	document.newWork.reset();
	document.changeWork.reset();
}
function addWork(){

 	var work_member=document.getElementById('work_m');
	var fch = work_member.firstChild;
	var lch = work_member.lastChild;
	if(document.newWork.work_confirm.checked==true){
		document.newWork.work_confirm.value='10';
	}else{
		document.newWork.work_confirm.value='20';
	}
	var msg='';
	var count=0;
	while(true){
		if(fch.nodeName=='DIV'){
			var idx=fch.getAttribute('id');
			if(count==0){
				msg+=idx.substring(11);
				count++;
			}else{
			msg+=','+idx.substring(11);
			}
		}
		if(fch==lch)break;
		fch=fch.nextSibling;
	}
	var my_idx=${s_member_idx};
	var param = 'category_idx=' + document.newWork.category_idx.value
	+'&work_title=' + document.newWork.work_title.value
	+'&workdate=' + document.newWork.workdate.value 
	+'&work_confirm=' + document.newWork.work_confirm.value
	+'&member_idx=' + msg;
	window.alert(param);
	sendRequest('workAdd.do', param, addWorkResult, 'POST');

}
function addWorkResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;	
			$(workback).fadeOut('100');
			$(work_modal).fadeOut('100');
			location.reload();
		}
	}
}
function updateWork(){
 	var work_member=document.getElementById('work_m2');
	var fch = work_member.firstChild;
	var lch = work_member.lastChild;
	if(document.changeWork.work_confirm.checked==true){
		document.changeWork.work_confirm.value='10';
	}else{
		document.changeWork.work_confirm.value='20';
	}
	var msg='';
	var count=0;
	while(true){
		if(fch.nodeName=='DIV'){
			var idx=fch.getAttribute('id');
			if(count==0){
				msg+=idx.substring(12);
				count++;
			}else{
			msg+=','+idx.substring(12);
			}
		}
		if(fch==lch)break;
		fch=fch.nextSibling;
	}
	var my_idx=${s_member_idx};
	var param = 'work_idx=' + document.changeWork.work_idx.value
	+'&work_title=' + document.changeWork.work_title.value
	+'&workdateup=' + document.changeWork.workdateup.value 
	+'&work_confirm=' + document.changeWork.work_confirm.value 
	+'&member_idx=' + msg;
	window.alert(param);
	sendRequest('workUpdate.do', param, updateWorkResult, 'POST');
}
function updateWorkResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;	
			$(workback2).fadeOut('100');
			$(work_modal2).fadeOut('100');
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
			var work_idx=div_ch.parentNode.getAttribute('id').substring(9);
			var chTotal=$('#chTotal'+work_idx).val();
			var chChecked=$('#chChecked'+work_idx);
			
			div_ch=div_ch.parentNode.lastChild.previousSibling;
			
			if(ch_sv=='1'){
				$(ch).hide();
				ch.className='glyphicon glyphicon-unchecked';
				$(ch).fadeIn('50');
				ch_s.value='0';
				
				chChecked.val(chChecked.val()-1);
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
				
				chChecked.val(parseInt(chChecked.val())+1);
			}
			
			document.getElementById('chBar'+work_idx).style.width=chChecked.val()/chTotal *100+'%';
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

//업무 생성 시 멤버 추가 드랍
function drop2(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    if(data.startsWith('work_member')){
    	var comp=document.getElementById(data);
    	document.getElementById('work_m').appendChild(comp);
    }
}

//업무 생성 시 멤버 빼기 드랍
function drop3(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    if(data.startsWith('work_member')){
    	var comp=document.getElementById(data);
	  	document.getElementById('project_m').appendChild(comp);
    }
}

//업무 수정 멤버 추가 드랍
function drop4(ev){
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    if(data.startsWith('work2_member')){
    	var comp=document.getElementById(data);
    	document.getElementById('work_m2').appendChild(comp);
    }
}
//업무 수정 멤버 빼기 드랍
function drop5(ev){
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    if(data.startsWith('work2_member')){
    	var comp=document.getElementById(data);
	  	document.getElementById('project_m2').appendChild(comp);
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
			var result=XHR.responseText;
			result=parsInt(result);
			$('#wdiv'+result).remove();
		}
		location.reload();
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

//추천 목록
function tendencyList(){
	var param = 'tendency='+document.newWork.tendency.value
	+"&project_idx="+ ${param.project_idx};
	window.alert(param);
	sendRequest('recommand.do',param,tendencyListResult,'GET');
}

function tendencyListResult(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;
			window.alert(result);
			
			var json = JSON.parse(result);		
			var msg2 = '';
			var members = json.members; // 맵 객체로부터 members 값인 배열을 가져온다.
			for (var i = 0; i < members.length; i++) {
				var member = members[i];
				if(member.member_td>3){
					document.getElementById('work_member'+member.member_idx).style.color='blue';
				}else{
					document.getElementById('work_member'+member.member_idx).style.color='black';
				}
			}
		}
	}
}
function tendencyList2(){
	var param = 'tendency='+document.changeWork.tendency.value
	+"&project_idx="+ ${param.project_idx};
	window.alert(param);
	sendRequest('recommand.do',param,tendencyListResult2,'GET');
}

function tendencyListResult2(){
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;
			window.alert(result);
			
			var json = JSON.parse(result);		
			var msg2 = '';
			var members = json.members; // 맵 객체로부터 members 값인 배열을 가져온다.
			for (var i = 0; i < members.length; i++) {
				var member = members[i];
				if(member.member_td>3){
					document.getElementById('work2_member'+member.member_idx).style.color='blue';
				}else{
					document.getElementById('work2_member'+member.member_idx).style.color='black';
				}
			}
		}
	}
}

/* 첨부파일 업로드 */
function fileUp(work_idx){
	var project_idx='${pdto.project_idx}';
	window.open('fileUploadForm.do?work_idx='+work_idx+'&project_idx='+project_idx,"window", "width=500,height=700");

}

</script>

 <!-- 임시) 여기부터 첨부파일   -->  
<style type="text/css">
    
    #right-side #sidebar-wrapper {
    margin-right: -250px;
    right: 0;
    width: 250px;
    background: rgb(0,0,0);
    position: fixed;
    height: 100%;
    overflow-y: auto;
    z-index: 1000;
    transition: all 0.5s ease-in 0s;
    -webkit-transition: all 0.5s ease-in 0s;
    -moz-transition: all 0.5s ease-in 0s;
    -ms-transition: all 0.5s ease-in 0s;
    -o-transition: all 0.5s ease-in 0s;
  }

  #right-side .sidebar-nav {
    position: absolute;
    top: 0;
    width: 250px;
    list-style: none;
    margin: 0;
    padding: 0;
  }

  #right-side .sidebar-nav li {
    line-height: 50px;
    text-indent: 20px;
  }

  #right-side .sidebar-nav li a {
    color: #999999;
    display: block;
    text-decoration: none;
  }

  #right-side .sidebar-nav li a:hover {
    color: #fff;
    background: rgba(255,255,255,0.2);
    text-decoration: none;
  }

  #right-side .sidebar-nav li a:active, .sidebar-nav li a:focus {
    text-decoration: none;
  }

  #right-side .sidebar-nav > .sidebar-brand {
    height: 55px;
    line-height: 55px;
    font-size: 18px;
  }

  #right-side .sidebar-nav > .sidebar-brand a {
    color: #999999;
  }

  #right-side .sidebar-nav > .sidebar-brand a:hover {
    color: #fff;
    background: none;
  }

  #right-side #menu-toggle {
    top: 0;
    right: 0;
    position: fixed;
    z-index: 1;
  }

  #right-side #sidebar-wrapper.active {
    right: 250px;
    width: 250px;
    transition: all 0.5s ease-out 0s;
    -webkit-transition: all 0.5s ease-out 0s;
    -moz-transition: all 0.5s ease-out 0s;
    -ms-transition: all 0.5s ease-out 0s;
    -o-transition: all 0.5s ease-out 0s;
  }

  .toggle {
    margin: 5px 5px 0 0;
  }
  
 </style>
 <script type="text/javascript">
  $("#menu-close").click(function(e) {
    e.preventDefault();
    $("#sidebar-wrapper").toggleClass("active");
  });
  $("#menu-toggle").click(function(e) {
    e.preventDefault();
    $("#sidebar-wrapper").toggleClass("active");
  });
</script>
<!-- 임시) 여기까지 첨부파일   -->

<style>

#workback {
	position: fixed;
	z-index:4;
	top: -10%;
	left: -10%;
	width: 110%;
	height: 110%;
	background: gray;
	opacity: 0.7;
	display: none;
}

#work_modal, #work_modal2 {
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
	margin-right: 10px;
}
.wdiv{
	width: 200px;
	padding-left: 10px;
	background: #ecf0f5;
}
.cate_table {
	background:white;
	width: 200px;
	padding: 4px;
	margin-bottom: 4px;
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
	background: #3c8dbc;
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
a{
	color: black;
}

</style>
</head>
<body class="skin-blue">
<%@include file="/WEB-INF/view/header.jsp" %>
	<c:if test="${param.project_level != 1000 }">
	<div id="trash" ondrop="drop(event)" class="btn-lg" ondragenter="trashColor()" ondragleave="trashColorReturn()" ondragstart="drag(event)" ondragover="allowDrop(event)">
		<span id="trash_i" class="glyphicon glyphicon-trash" aria-hidden="true" ondragover="trashColor()" ></span>
	</div>
	</c:if>
	
	<div id="cbody" style="width:${(pdto.category_num +2)*210}px">
		<div>
			<br>&nbsp;&nbsp;<span class="glyphicon glyphicon-chevron-right"></span>${pdto.project_name}
		</div>
		<c:set var="pdto" value="${pdto}"></c:set>
		<c:choose>
			<c:when test="${(empty pdto.category_dtos) or pdto.category_dtos[0].category_idx == 0}"></c:when>
			<c:otherwise>
				<c:forEach var="cdto" items="${pdto.category_dtos}">
					<div class="category" id="cp${cdto.category_idx}">
						
						<!--카테고리 이름  -->
						<div class="category_head" id ="c${cdto.category_idx}" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)">
						<c:choose>
						<c:when test="${param.project_level eq 1000 }">
							<span>${cdto.category_name }</span>
						</c:when>
						<c:otherwise>
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
						</c:otherwise>
						</c:choose>
						</div>

						<c:if test="${not empty cdto.work_dtos}">
							<c:forEach var="wdto" items="${cdto.work_dtos }">
								<div id="wdiv${wdto.work_idx}" class="wdiv" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)">
									<span>${wdto.work_title }</span>
							
									<c:if test="${param.project_level != 1000 }">
									<span onclick="workUpdate(${wdto.work_idx},'${wdto.work_start}','${wdto.work_end}','${wdto.work_confirm}')"><i class="glyphicon glyphicon-cog"></i></span>
									</c:if>
									
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
											<c:choose>
											<c:when test="${param.project_level != 1000 }">
												<form action="javascript:addCheck(${wdto.work_idx})">
												<div class="table_i glyphicon glyphicon-check"></div>
												<input type="text" id="content${wdto.work_idx}" placeholder="체크리스트" style="width:60%;" required="required">
												&nbsp;<i class="glyphicon glyphicon-plus" onclick="addCheck(${wdto.work_idx})"></i>
												</form>
											</c:when>
											<c:otherwise>
												<div class="table_i glyphicon glyphicon-check"></div>
												<span>체크리스트</span>
											</c:otherwise>
											</c:choose>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<div class="check_div" id="check_div${wdto.work_idx}">
													<c:set var="chTotal" value="0"></c:set>
													<c:set var="chChecked" value="0"></c:set>
													<c:forEach var="chdto" items="${wdto.checklist_dtos}" varStatus="status">
														<div id="div_ch${chdto.checklist_idx }" style="display:${chdto.checklist_state eq '1' ? 'none' : 'block' }" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)" >
													<c:choose>
													<c:when test="${param.project_level != 1000 }">
															<a onclick="javascript:check(${chdto.checklist_idx })">
													</c:when>
													<c:otherwise>
															<a>
													</c:otherwise>
													</c:choose>
															<i id="ch${chdto.checklist_idx }"
															class="${chdto.checklist_state eq '1' ? 'glyphicon glyphicon-ok' : 'glyphicon glyphicon-unchecked' }">
															</i> ${chdto.checklist_content}
															</a>
															<input type="hidden" id="ch_state${chdto.checklist_idx}" value="${chdto.checklist_state}">
														</div>
													<c:if test="${status.last}">
														<c:set var="chTotal" value="${status.count}"></c:set>
													</c:if>
													<c:if test="${chdto.checklist_state eq '1'}">
													<c:set var="chChecked" value="${chChecked+1}"></c:set>
													</c:if>
													</c:forEach>
												<input type="hidden" id="checkHide${wdto.work_idx}" value="0">
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="2" align="right"><a id="aCheck${wdto.work_idx}" href="javascript:showCheck(${wdto.work_idx})">완료한 체크리스트 보기</a>&nbsp;</td>
										</tr>
										<tr>
											<td colspan="2">
											<div class="progress" style="margin-bottom: 2px; height: 12px;">
											<div id="chBar${wdto.work_idx}" class="progress-bar progress-bar-primary " style="width: ${chChecked/chTotal * 100}%;">			    
											</div>
											</div>
											<input type="hidden" id="chTotal${wdto.work_idx}" value="${chTotal}">
											<input type="hidden" id="chChecked${wdto.work_idx}" value="${chChecked}">
											</td>
										</tr>
										<c:remove var="chTotal"/>
										<c:remove var="chChecked"/>
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
											
											<td align="right"><a href="javascript:comment(${wdto.work_idx})">코멘트</a>/<a href="#" onclick="fileUp('${wdto.work_idx}')">첨부파일</a></td>
										</tr>
									</tbody>
								</table>
							</c:forEach>
						</c:if>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>

		<c:if test="${param.project_level !=1000 }">
		<!-- category add -->
		<div class="category" id="addCate" style="padding-left: 10px;">
			<form name="newCategory" action="javascript:categoryAdd()">
				<input type="text" class="form-control" name="category_name"
					placeholder="새로운 카테고리">
			</form>
		</div>
		</c:if>
		
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
					<div class="form-group">
						<label>기한:</label>
						<div class="input-group">
							<div class="input-group-addon">
								<i class="fa fa-clock-o"></i>
							</div>
								<input type="text" class="form-control pull-right" name="workdate" id="workdate" />
						</div>
						<!-- /.input group -->
					</div>
					<div>
						<input type="checkbox" name="work_confirm">결재여부
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
								<select id="tendency" onchange="tendencyList()">
									<option>--성향--</option>
									<option value="tendency_e">외향적</option>
									<option value="tendency_i">내향적</option>
									<option value="tendency_s">감각적</option>
									<option value="tendency_n">직관적</option>
									<option value="tendency_t">사고적</option>
									<option value="tendency_f">감정적</option>
									<option value="tendency_j">판단적</option>
									<option value="tendency_p">인식적</option>
								</select>
								<div id="project_m" style="width:100%; height: 320px; overflow-y: scroll"ondrop="drop3(event)" ondragover="allowDrop(event)" ondragstart="drag(event)"></div>
							</div>
							<div class="col-md-3" ondrop="drop(event)" ondragover="allowDrop(event)" ondragstart="drag(event)">
								<h4 class="text-center">업무 담당자 </h4>
								<div id="work_m" style="width: 100%; height: 320px; overflow-y: scroll" ondrop="drop2(event)" ondragover="allowDrop(event)" ondragstart="drag(event)" ></div>
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

	<!-- 업무 수정 modal -->
	<form name="changeWork" action="workUpdate.do" method="post">
		<div id="workback2" onclick="closem()"></div>
		<div id="work_modal2">
			<button type="button" class="close" onclick="closem()">×</button>
			<h4 class="modal-title">업무 수정</h4>

			<div id="w_modal2">
				<div id="btnwork3">
					<div>
						<h2></h2>
						<input type="hidden" name="work_idx">
						업무명 : <input type="text" name="work_title">
					</div>
					<div>기한</div>
					<div>
						<input type="text" class="form-control pull-right" name="workdateup" id="workdateup" />
					</div>
					<div>
						<input type="checkbox" name="work_confirm">결재여부
						<button type="button" class="btn btn-next" id="btn-worknext"
							onclick="shows2()">다음</button>

					</div>

				</div>
			</div>

			<div id="btnwork4">
				<div class="section">
					<div class="container">
						<div class="row">
							<div class="col-md-3">
								<h4 class="text-center">프로젝트 멤버 목록</h4>
								<select id="tendency" onchange="tendencyList2()">
									<option>--성향--</option>
									<option value="tendency_e">외향적</option>
									<option value="tendency_i">내향적</option>
									<option value="tendency_s">감각적</option>
									<option value="tendency_n">직관적</option>
									<option value="tendency_t">사고적</option>
									<option value="tendency_f">감정적</option>
									<option value="tendency_j">판단적</option>
									<option value="tendency_p">인식적</option>
								</select>
								<div id="project_m2" style="width:100%; height: 320px; overflow-y: scroll"ondrop="drop5(event)" ondragover="allowDrop(event)" ondragstart="drag(event)"></div>
							</div>
							<div class="col-md-3" ondrop="drop(event)" ondragover="allowDrop(event)" ondragstart="drag(event)">
								<h4 class="text-center">업무 담당자 </h4>
								<div id="work_m2" style="width: 100%; height: 320px; overflow-y: scroll" ondrop="drop4(event)" ondragover="allowDrop(event)" ondragstart="drag(event)" ></div>
							</div>
						</div>
					</div>
				</div>
				<button type="button" class="btn btn-next" id="btn-workbefore"
					onclick="showf2()">이전</button>
				<button type="button" class="btn btn-next" id="btn-workok" onclick="updateWork()">완료</button>
			</div>
		</div>
	</form>
	
	<div id="right-side">
		<a id="menu-toggle" href="#" class="btn btn-primary btn-lg toggle"><i
			class="glyphicon glyphicon-bookmark"></i></a>
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<a id="menu-close" href="#"
					class="btn btn-default btn-lg pull-right toggle"><i
					class="glyphicon glyphicon-remove"></i></a>
				<li class="sidebar-brand"><a href="#">Project name</a></li>
				<li><a href="#">Home</a></li>
				<li><a href="#about">About</a></li>
				<li><a href="#contact">Contact</a></li>
			</ul>
		</div>
	</div>
	
<%@include file="/WEB-INF/view/comment/comment.jsp" %>
<%@include file="/WEB-INF/view/footer.jsp" %>
</body>
<script>
/*               //검색 날짜제한 
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
               
               //시작일.
               $('#work_upstart').datepicker({
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
	                       $("#work_upend").datepicker( "option", "minDate", selectedDate );
	                   }                
	               });
	 
	               //종료일
	               $('#work_upend').datepicker({
	                    //dateFormat: "yy-mm-dd",
	                    //monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
	                    //dayNamesMin:["일","월","화","수","목","금","토"], 
	                   dateFormat: "yy-mm-dd",
	                   changeMonth: true,
	                   onClose: function( selectedDate ) {
	                       // 종료일(toDate) datepicker가 닫힐때
	                       // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
	                       $("#work_upstart").datepicker( "option", "maxDate", selectedDate );
	                   }                
	               });
               
           });

$("#work_time").timepicker({
	step: 30,            //시간간격 
	timeFormat: "H:i"    //시간:분 으로표시
});
$(document).ready(function(){
	$("#work_time").timepicker('setTime', "17:30");

}); */
$(function () {
	 //Date range picker with time picker
 $('#workdate').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
});	
$(function () {
	 //Date range picker with time picker
$('#workdateup').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
});
</script>
</html>