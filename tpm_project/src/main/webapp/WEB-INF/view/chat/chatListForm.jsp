<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/view/include/import.jsp"%>
<!-- <link href="/tpm_project/css/chat/chatContact.css?ver=1" rel="stylesheet" />
<script type="text/javascript" src="/tpm_project/js/chat/chatContact.js"></script> -->
<!-- JavaScrip Search Plugin -->
<!-- <script src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script> -->
<!-- Moment -->

<link href="/tpm_project/css/hr/hr-text.css?verr=3" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="/tpm_project/css/material/mdb.css?ver=1" rel="stylesheet">

<link href="/tpm_project/css/inspinia/inspinia.css?ver=2" rel="stylesheet">


<!-- Bootstrap tooltips -->
<script type="text/javascript" src="/tpm_project/js/material/tether.min.js"></script>

<script src="/tpm_project/js/date/moment.js"></script>
<!-- Slimscroll -->
<script src="/tpm_project/js/scroll/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="/tpm_project/js/sockjs.min.js"></script>

<script src="/tpm_project/js/multiselect/selectr.js"></script>

<style>
.bg-white {
	background-color: #fff;
}
.friend-list {
	list-style: none;
	margin-left: -40px;
}

.friend-list li {
	border-bottom: 1px solid #eee;
}

.friend-list li a img {
	float: left;
	width: 45px;
	height: 45px;
	margin-right: 0px;
}

.friend-list li a {
	position: relative;
	display: block;
	padding: 10px;
	transition: all .2s ease;
	-webkit-transition: all .2s ease;
	-moz-transition: all .2s ease;
	-ms-transition: all .2s ease;
	-o-transition: all .2s ease;
}

.friend-list li.active a {
	background-color: #f1f5fc;
}

.friend-list li a .friend-name, .friend-list li a .friend-name:hover {
	color: #777;
}

.friend-list li a .last-message {
	width: 65%;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}

.friend-list li a .time {
	position: absolute;
	top: 10px;
	right: 8px;
}

small, .small {
	font-size: 85%;
}

.friend-list li a .chat-alert {
	position: absolute;
	right: 8px;
	top: 27px;
	font-size: 15px;
	padding: 3px 5px;
}

.chat-message {
	padding: 10px 20px;
}

.chat {
	list-style: none;
	margin: 0;
}

#chat-box{
	/* background: #f9f9f9; */
}

.chat-message {
	/* background: #f9f9f9; */
}

.chat li img {
	width: 45px;
	height: 45px;
	border-radius: 50em;
	-moz-border-radius: 50em;
	-webkit-border-radius: 50em;
}

img {
	max-width: 100%;
}

.chat-body {
	padding-bottom: 20px;
}

.chat li.left .chat-body {
	margin-left: 70px;
	background-color: #fff;
}

.chat li .chat-body {
	position: relative;
	font-size: 15px;
	padding: 10px;
	border: 1px solid #f1f5fc;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
	-moz-box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
	-webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.chat li .chat-body .header {
	padding-bottom: 5px;
	border-bottom: 1px solid #f1f5fc;
}

.chat li .chat-body p {
	margin: 0;
}

.chat li.left .chat-body:before {
	position: absolute;
	top: 10px;
	left: -8px;
	display: inline-block;
	background: #fff;
	width: 16px;
	height: 16px;
	border-top: 1px solid #f1f5fc;
	border-left: 1px solid #f1f5fc;
	content: '';
	transform: rotate(-45deg);
	-webkit-transform: rotate(-45deg);
	-moz-transform: rotate(-45deg);
	-ms-transform: rotate(-45deg);
	-o-transform: rotate(-45deg);
}

.chat li.right .chat-body:before {
	position: absolute;
	top: 10px;
	right: -8px;
	display: inline-block;
	background: #fff;
	width: 16px;
	height: 16px;
	border-top: 1px solid #f1f5fc;
	border-right: 1px solid #f1f5fc;
	content: '';
	transform: rotate(45deg);
	-webkit-transform: rotate(45deg);
	-moz-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	-o-transform: rotate(45deg);
}

.chat li {
	margin: 15px 0;
}

.chat li.right .chat-body {
	margin-right: 70px;
	background-color: #fff;
}

.chat-box {
	position: fixed;
	bottom: 0;
	left: 444px;
	right: 0;
	padding: 15px;
	border-top: 1px solid #eee;
	transition: all .5s ease;
	-webkit-transition: all .5s ease;
	-moz-transition: all .5s ease;
	-ms-transition: all .5s ease;
	-o-transition: all .5s ease;
}

.primary-font {
	color: #3c8dbc;
}

a:hover, a:active, a:focus {
	text-decoration: none;
	outline: 0;
}
.modal {
  text-align: center;
  padding: 0!important;
}

.modal:before {
  content: '';
  display: inline-block;
  height: 100%;
  vertical-align: middle;
  margin-right: -4px;
}

.modal-dialog {
  display: inline-block;
  text-align: left;
  vertical-align: middle;
}

.modal-dialog.modal-fullsize {
  width: 800px;
  height: 800px;
  margin: 0;
  padding: 0;
}
.modal-content.modal-fullsize {
  height: auto;
  min-height: 100%;
  border-radius: 0; 
}

.btMoveSelect_div{
  margin-top: 196.5px;
  text-align: center;
}




/* .chat_content_user_img_left{
	width: 40px; height: 40px; border-radius: 50% !important; border: 2px solid #00a65a;
}
.chat_content_user_img_right{
	width: 40px; height: 40px; border-radius: 50% !important; border: 2px solid #dd4b39;
}
.chat_content_body_div_left{
	width: 70%; float: left; margin-left: 10px;
}
.chat_content_body_div_right{
	width: 70%; float: right; margin-right: 20px; 
}
.chat_content_user_name{
	color: #3c8dbc;
}
.chat_content_p_right{
	text-align: right;
}
.chat_content_p_left{
	text-align: left;
} */
</style>
<script>
var currCpCode;
var currCpValue;
var s_member_idx = <%=session.getAttribute("s_member_idx")%>;
var s_member_img = '<%=session.getAttribute("s_member_img")%>';
var wsocket;

$(function(){
    $('#chat-box').slimScroll({
        height: '650px', // 스크롤 처리할 div 의 길이
        start: 'bottom' // 스크롤의 시작 위치
    }).bind('slimscrolling', function(e, pos) {
    	//window.alert("Scroll value: " + pos + "px");
       // $('#testDivOut2').append("Scroll value: " + pos + "px");
    });
    
    $('#chat_project_list_div').slimScroll({
        height: '296px' // 스크롤 처리할 div 의 길이
    }).bind('slimscrolling', function(e, pos) {
    	//window.alert("Scroll value: " + pos + "px");
       // $('#testDivOut2').append("Scroll value: " + pos + "px");
    });
    
    $('#chat_channel_list_div').slimScroll({
        height: '296px' // 스크롤 처리할 div 의 길이
    }).bind('slimscrolling', function(e, pos) {
    	//window.alert("Scroll value: " + pos + "px");
       // $('#testDivOut2').append("Scroll value: " + pos + "px");
    });
    
    
    //페이지 시작시 소켓 연결
    connect();
    
    $('#input_chat_content').keypress(function(event){
		var keycode = (event.keyCode ? event.keyCode : event.which);
		if(keycode == '13'){
			InsertChatContent();
		}
		event.stopPropagation();
	});
    
    
    /* $("#createChannelModal").modal('show').css({
	    'margin-top': function () { //vertical centering
	        return -($(this).height() / 2);
	    },
	    'margin-left': function () { //Horizontal centering
	        return -($(this).width() / 2);
	    }
	}); */
});


function connect() {
	wsocket = new SockJS(
			"http://192.168.20.46:9090/tpm_project/tpm-sockjs.do?code="+ currCpCode + currCpValue);
	/* wsocket = new SockJS(
			"http://192.168.0.38:9090/tpm_project/tpm-sockjs.do?code="+ currCpCode + currCpValue); */
	wsocket.onopen = onOpen; // 연결 후 결과 메세지
	wsocket.onmessage = onMessage; // 서버에서 메세지가 푸시될때 처리
	wsocket.onclose = onClose; // 연결 해체 후 메세지
}
function disconnect() {
	wsocket.close();
}
function onOpen(evt) {
	window.alert('연결되었습니다.');
}
function onMessage(evt) {
	var data = evt.data;
	if (data.substring(0, 4) == "msg:") {
		var jsonStr = data.substring(4);
		var json = JSON.parse(jsonStr);
		
		appendChatMessage(json);
	}
}
function onClose(evt) {
	window.alert('연결을 끊었습니다.');
}

//function chatSend(chat_idx, member_idx, member_name, chat_content, chat_date) {
function chatSend(json) {
	var sendMsg = 'msg:'+ JSON.stringify(json);
	wsocket.send(sendMsg);
	$("#input_chat_content").val("");
}

function appendChatMessage(json) {
	var msg = '';
	if(json.mdto.member_idx == s_member_idx){
		msg += makeRightChatContent(json);
	} else { // 타인의 글인 경우.
		msg += makeLeftChatContent(json);
	}
	
	$('#chat_content_ul').append(msg);
	$('#chat-box').slimScroll({ scrollTo: $("#chat_message_div").height() });
}

/* $(document).ready(function() {
	$('#message').keypress(function(event){
		var keycode = (event.keyCode ? event.keyCode : event.which);
		if(keycode == '13'){
			send();	
		}
		event.stopPropagation();
	});
	$('#sendBtn').click(function() { send(); });
	$('#enterBtn').click(function() { connect(); });
	$('#exitBtn').click(function() { disconnect(); });
}); */


function showChatContent(cpCode, cpValue){
	
	currCpCode = cpCode;
	currCpValue = cpValue;
	
	$.ajax({
		url : 'chatList.do',
		type : 'post',
		data : { chat_cp_code : cpCode,
				 chat_cp_value : cpValue },
		dataType : 'json', // 제이슨 형식으로 넘어온다.
		success : function(json) {
			//window.alert(JSON.stringify(json));
			var msg = '<li> <hr class="hr-text" data-content="2017-04-14"> </li>';
			for(var i = 0 ; i < json.length ; i++){
				// 내가 쓴 글일 경우
				if(json[i].mdto.member_idx == s_member_idx){
					msg += makeRightChatContent(json[i]);
				} else { // 타인의 글인 경우.
					msg += makeLeftChatContent(json[i]);
				}	
			}
			$('#chat_content_ul').html(msg);
			
			//window.alert($("#chat-box").height());
			$('#chat-box').slimScroll({ scrollTo: $("#chat_message_div").height() });
		}
	});
	
	disconnect();
	connect();
	
	
}

function makeRightChatContent(ctdto) {
	var temp_msg = '';
	temp_msg +=	'<li class="right clearfix">';
	temp_msg +=		'<span class="chat-img pull-right">';
	temp_msg +=			'<img src="/tpm_project/img/member/profile/' + ctdto.mdto.member_img + '" alt="User Avatar">';
	temp_msg +=		'</span>';
	temp_msg +=		'<div class="chat-body clearfix">';
	temp_msg +=			'<div class="header">';
	temp_msg +=				'<strong class="primary-font">' + ctdto.mdto.member_name + '</strong> ';
	temp_msg +=				'<small class="pull-right text-muted"><i class="fa fa-clock-o"></i>' + moment(ctdto.chat_date).format('YYYY-MM-DD h:mm:ss a') + '</small>';
	temp_msg +=			'</div>';
	temp_msg +=			'<p>' + ctdto.chat_content + '</p>';
	temp_msg +=		'</div>';
	temp_msg +=	'</li>';
	/* temp_msg += '<div class="item">';
	temp_msg += 	'<span class="chat-img pull-right"> <img '
		temp_msg +=		'src="/tpm_project/img/member/profile/' + ctdto.mdto.member_img + '" class="chat_content_user_img_left" alt="User Avatar" '
		temp_msg +=		'class="online"> '
		temp_msg +=	'</span> '
		temp_msg +=	'<div class="chat-body clearfix chat_content_body_div_right"> '
			temp_msg +=	'<div class="header"> '
			temp_msg +=		'<small class=" text-muted"><span '
		temp_msg +=			'class="glyphicon glyphicon-time"></span>' + moment(ctdto.chat_date).format('YYYY-MM-DD h:mm:ss a') + '</small> '
		temp_msg +=			'<strong class="pull-right primary-font chat_content_user_name">' + ctdto.mdto.member_name + '</strong>'
			temp_msg +=	'</div>'
			temp_msg +=	'<p class="chat_content_p_right">' + ctdto.chat_content + '</p>';
		temp_msg +=	'</div>'
	temp_msg +='</div>' */
	
	return temp_msg;
}

function makeLeftChatContent(ctdto) {
	var temp_msg = '';
	temp_msg += '<li class="left clearfix">'; 
	temp_msg += 	'<span class="chat-img pull-left"> ';
	temp_msg += 		'<img src="/tpm_project/img/member/profile/' + ctdto.mdto.member_img + '" alt="User Avatar"> ';
	temp_msg += 	'</span>';
	temp_msg += 	'<div class="chat-body clearfix"> ';
	temp_msg += 		'<div class="header"> ';
	temp_msg += 			'<strong class="primary-font">' + ctdto.mdto.member_name + '</strong> ';
	temp_msg += 			'<small class="pull-right text-muted"><i class="fa fa-clock-o"></i>' + moment(ctdto.chat_date).format('YYYY-MM-DD h:mm:ss a') + '</small> ';
	temp_msg += 		'</div> ';
	temp_msg += 		'<p>' + ctdto.chat_content +'</p>';
	temp_msg += 	'</div>';
	temp_msg += '</li>';
	
	/* temp_msg += '<div class="item">';
	temp_msg += 	'<span class="chat-img pull-left"> <img '
		temp_msg +=		'src="/tpm_project/img/member/profile/' + ctdto.mdto.member_img + '" class="chat_content_user_img_right" alt="User Avatar" '
		temp_msg +=		'class="online">'
		temp_msg +=	'</span> '
		temp_msg +=	'<div class="chat-body clearfix chat_content_body_div_left"> '
			temp_msg +=	'<div class="header"> '
		temp_msg +=			'<strong class="primary-font chat_content_user_name">' + ctdto.mdto.member_name + '</strong> '
			temp_msg +=		'<small class="pull-right text-muted"><span '
		temp_msg +=			'class="glyphicon glyphicon-time"></span>' + moment(ctdto.chat_date).format('YYYY-MM-DD h:mm:ss a') + '</small> '
			temp_msg +=	'</div>'
			temp_msg +=	'<p class="chat_content_p_left">' + ctdto.chat_content + '</p>';
		temp_msg +=	'</div>'
	temp_msg +='</div>' */
	
	return temp_msg;
}

function InsertChatContent() {
	var currInsertChatContent = $('#input_chat_content').val();
	if(currInsertChatContent != ''){
		$.ajax({
			url : 'chatAdd.do',
			type : 'post',
			data : { 
					 chat_cp_code : currCpCode,
					 chat_cp_value : currCpValue,
					 chat_content : currInsertChatContent
			},
			dataType : 'json',
			success : function(json) {
				// 입력 성공시..
				window.alert(JSON.stringify(json));
				if(json != false){
					// 소켓을 통해 메세지를 전달한다.
					//chatSend(json.chat_idx, json.member_idx, json.mdto.member_name, json.chat_content, json.chat_date);
					chatSend(json);
				}
			}
		});
	}
	
}

function InsertChannel(){
	
	var channel_name = $('#channel_name').val();
	var selected_member_idxs =$('#chat_myfriend_list_selectAfterDiv').find('input[name="member_idx"]');
	// name이 같은 체크박스의 값들을 배열에 담는다.
    var member_idxValues = [];
    $(selected_member_idxs).each(function(i) {
        member_idxValues.push($(this).val());
    });
	
	
	$.ajax({
		url : 'channelAdd.do',
		type : 'post',
		data : { 
				 channel_name : channel_name,
				 selected_member_idxs : member_idxValues
		},
		dataType : 'json',
		success : function(json) {
			// 입력 성공시..
			//window.alert(JSON.stringify(json));
			if(json != false){
				// 소켓을 통해 메세지를 전달한다.
				//chatSend(json.chat_idx, json.member_idx, json.mdto.member_name, json.chat_content, json.chat_date);
				reLoadChannelList();
				
				$('#createChannelModal').modal().hide();
			} 
		}
	});
}

function reLoadChannelList(){
	$.ajax({
		url : 'chatChannelList.do',
		type : 'post',
		data : { 		
		},
		dataType : 'json',
		success : function(json) {
			// 입력 성공시..
			window.alert(JSON.stringify(json));
			var innerMsg = '';
			for(var i = 0 ; i < json.length; i++){
				innerMsg += '<tr>';
				innerMsg += '<th><a href="javascript:showChatContent(\'C\',\'' + json[i].channel_idx + '\')">' + json[i].channel_name + ',' + json[i].channel_idx + '</a></th>';
				innerMsg += '</tr>';
			}
			
			$('#channel_list_table').html(innerMsg);
		}
	});
}

function showCreateChannelModal(){
	//$('#createChannelModal').modal('show');
	//reLoadCreateChannelModal();
	
	$.ajax({
			url : 'myFriendList.do',
			type : 'post',
			dataType : 'json', 
			success : function(json) {
				window.alert(JSON.stringify(json));
				initCreateChannelModal(json);
			}
		});
}
function initCreateChannelModal(json){
	initCreateChannel_Selectr_plugin(json);
	reCreateSeletr();
	$('#createChannelModal').modal('show');
}

function initCreateChannel_Selectr_plugin(json){
	
	$('#chat_myfriend_list_selectBefore').remove();
	$('#chat_myfriend_list_selectAfter').remove();
	$('.selectr').remove();
	
	$('#chat_myfriend_list_selectBeforeDiv').html('<select id="chat_myfriend_list_selectBefore" multiple></select>');
	$('#chat_myfriend_list_selectAfterDiv').html('<select id="chat_myfriend_list_selectAfter" multiple></select>');
	
	var innerMsg = '';
	for(var i = 0 ; i < json.length ; i++){
		innerMsg += '<option id="friend_op_' + json[i].member_idx + '" value="' + json[i].member_idx + '">' + json[i].member_idx + ':' + json[i].member_id + ':' + json[i].member_name + ':' + json[i].member_img + '</option>';
	}
	$("#chat_myfriend_list_selectBefore").html(innerMsg);

	$("#chat_myfriend_list_selectBefore").selectr({
    	title: '친구 목록',
    	placeholder: 'Search',
    	resetText: 'Clear All',
    	width: '600px',
    	maxListHeight: NaN,
    	tooltipBreakpoint: 25,
    	maxSelection: NaN
    });
    
    $("#chat_myfriend_list_selectAfter").selectr({
    	title: '선택 목록',
    	placeholder: 'Search',
    	resetText: 'Clear All',
    	/* width: '150px', */
    	maxListHeight: NaN,
    	tooltipBreakpoint: 25,
    	maxSelection: NaN
    });
}

function reCreateChannel_Selectr_plugin(){
	var left_select_html = $('#chat_myfriend_list_selectBefore').html();
	var right_select_html = $('#chat_myfriend_list_selectAfter').html();
	
	$('#chat_myfriend_list_selectBefore').remove();
	$('#chat_myfriend_list_selectAfter').remove();
	$('.selectr').remove();
	
	$('#chat_myfriend_list_selectBeforeDiv').html('<select id="chat_myfriend_list_selectBefore" multiple></select>');
	$('#chat_myfriend_list_selectAfterDiv').html('<select id="chat_myfriend_list_selectAfter" multiple></select>');

	$('#chat_myfriend_list_selectBefore').html(left_select_html);
	$('#chat_myfriend_list_selectAfter').html(right_select_html);
	
	$("#chat_myfriend_list_selectBefore").selectr({
    	title: '친구 목록',
    	placeholder: 'Search',
    	resetText: 'Clear All',
    	width: '600px',
    	maxListHeight: NaN,
    	tooltipBreakpoint: 25,
    	maxSelection: NaN
    });
    
    $("#chat_myfriend_list_selectAfter").selectr({
    	title: '선택 목록',
    	placeholder: 'Search',
    	resetText: 'Clear All',
    	/* width: '150px', */
    	maxListHeight: NaN,
    	tooltipBreakpoint: 25,
    	maxSelection: NaN
    });
}

function reCreateSeletr(){
	var list_groups = $('.list-group');
	var left_list_group = list_groups[0];
	var right_list_group = list_groups[1];
	
	$(left_list_group).attr('ondragover','allowDrop(event)');
	$(left_list_group).attr('ondrop','leftdrop(event)');
	
	$(right_list_group).attr('ondragover','allowDrop(event)');
	$(right_list_group).attr('ondrop','rightdrop(event)');
	
	var option_name_div = document.getElementsByClassName('option-name');
	
	for(var i = 0 ; i < option_name_div.length; i++){
		
		$(option_name_div).eq(i).removeAttr('title');
		var member_info = $(option_name_div).eq(i).html().split(':');
	
		var innerMsg = '';
		innerMsg += '<div class="feed-element" id="feed_element_' + member_info[0] + '" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)">';
		innerMsg += 	'<input type="hidden" name="member_idx" value="' + member_info[0] + '" >';
		innerMsg += 	'<a href="profile.html" class="pull-left">';
		innerMsg += 		'<img alt="image" class="img-circle" src="/tpm_project/img/member/profile/' + member_info[3] + '">';
		innerMsg += 	'</a>';
		innerMsg += 	'<div class="media-body ">';
		innerMsg += 		'<strong>' + member_info[2] + '</strong><br>';
		innerMsg += 		'<small class="text-muted">' + member_info[1] + '</small>';
		innerMsg += 	'</div>';
		innerMsg += '</div>';
		
		$(option_name_div[i]).html(innerMsg);
	}
	
	$('.list-group').slimScroll({
        height: '290px' // 스크롤 처리할 div 의 길이
    }).bind('slimscrolling', function(e, pos) {

    });
}

function moveSeleted(direction){
	//list_groups = document.getElementsByClassName('list-group');
	/* var list_groups = $('.list-group');
	var left_list_group = list_groups[0];
	var right_list_group = list_groups[1];
	
	if(direction == 'right'){
		var left_list_group_seleted = $('.list-group').eq(0).find('li.selected');
		for(var i = 0 ; i < left_list_group_seleted.length ; i++){
			var innerMsg = '';
			innerMsg += '<li class="list-group-item">';
			innerMsg += left_list_group_seleted.eq(i).html();
			innerMsg += '</li>';
			$(right_list_group).append(innerMsg);
			
			left_list_group_seleted.eq(i).remove();
			
			$('.panel-footer').eq(0).addClass('hidden');
			$('.current-selection').eq(0).html('');
		}
	} else if(direction == 'left'){
		var right_list_group_seleted = $('.list-group').eq(1).find('li.selected');
		for(var i = 0 ; i < right_list_group_seleted.length ; i++){
			var innerMsg = '';
			innerMsg += '<li class="list-group-item">';
			innerMsg += right_list_group_seleted.eq(i).html();
			innerMsg += '</li>';
			$(left_list_group).append(innerMsg);
			
			right_list_group_seleted.eq(i).remove();
			
			$('.panel-footer').eq(1).addClass('hidden');
			$('.current-selection').eq(1).html('');
		}
	} */
	
	var list_groups = $('.list-group');
	var left_list_group = list_groups[0];
	var right_list_group = list_groups[1];
	var deleteIdArry = new Array();
	
	if(direction == 'right'){
		var left_list_group_item = $(left_list_group).find('li.list-group-item');
		for(var i = 0 ; i < left_list_group_item.length ; i++){
		 	if($(left_list_group_item[i]).hasClass('selected') == true){
		 		$('#chat_myfriend_list_selectAfter').append($('#chat_myfriend_list_selectBefore').find('option').eq(i).clone().wrapAll('<option/>').parent().html());
		 		deleteIdArry.push($('#chat_myfriend_list_selectBefore').find('option').eq(i).attr('id'));
		 	}
		}
		for(var i = 0 ; i < deleteIdArry.length ; i++){
			$('#chat_myfriend_list_selectBefore').find('#'+deleteIdArry[i]).remove();
		}
	} else if(direction == 'left'){
		var right_list_group_item = $(right_list_group).find('li.list-group-item');
		for(var i = 0 ; i < right_list_group_item.length ; i++){
		 	if($(right_list_group_item[i]).hasClass('selected') == true){		 	
		 		$('#chat_myfriend_list_selectBefore').append($('#chat_myfriend_list_selectAfter').find('option').eq(i).clone().wrapAll('<option/>').parent().html());
		 		deleteIdArry.push($('#chat_myfriend_list_selectAfter').find('option').eq(i).attr('id'));
		 	}
		}
		for(var i = 0 ; i < deleteIdArry.length ; i++){
			$('#chat_myfriend_list_selectAfter').find('#'+deleteIdArry[i]).remove();
		}
	} 
	
	reCreateChannel_Selectr_plugin();
	reCreateSeletr();
}

//ondragstart 드래그할 때 id값 가져오기!
function drag(ev) {
    ev.dataTransfer.setData("evid", ev.target.id);
    
}

//ondrop =>나 위에 드랍했을 때 일어나는 이벤트 ->data는 드래그 당한 컴포넌트
function rightdrop(ev) {
    ev.preventDefault();
    var evid = ev.dataTransfer.getData("evid");
    var ev_idx = evid.split('_')[2];
    var dropSeletedItem = $('#chat_myfriend_list_selectBefore').find('#friend_op_'+ev_idx);
    
    $('#chat_myfriend_list_selectAfter').append($(dropSeletedItem).clone().wrapAll('<option/>').parent().html());
    $(dropSeletedItem).remove();
    
    reCreateChannel_Selectr_plugin();
	reCreateSeletr();
   
}

function leftdrop(ev) {
    ev.preventDefault();
    var evid = ev.dataTransfer.getData("evid");
    var ev_idx = evid.split('_')[2];
    var dropSeletedItem = $('#chat_myfriend_list_selectAfter').find('#friend_op_'+ev_idx);
    
    $('#chat_myfriend_list_selectBefore').append($(dropSeletedItem).clone().wrapAll('<option/>').parent().html());
    $(dropSeletedItem).remove();
   
    reCreateChannel_Selectr_plugin();
	reCreateSeletr();
}

//ondragover 드래그 완료시 해당 엘리먼트의 기본 동작 막아줌
function allowDrop(ev) {
    ev.preventDefault();
}
</script>
</head>
<c:choose>
	<c:when test="${!empty arry_pdto}">
		<body class="skin-blue" onload="showChatContent('P','${arry_pdto.get(0).project_idx}')">
	</c:when>
	<c:otherwise>
		<c:choose>
			<c:when test="${!empty arry_chdto}">
				<body class="skin-blue" onload="showChatContent('C','${arry_chdto.get(0).channel_idx}')">
			</c:when>
			<c:otherwise>
				<body class="skin-blue">
			</c:otherwise>
		</c:choose>
	</c:otherwise>
</c:choose>
	<div class="wrapper">
		<%@ include file="/WEB-INF/view/include/header.jsp"%>
		<%@ include file="/WEB-INF/view/include/aside.jsp"%>

		<!-- Right side column. Contains the navbar and content of the page -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Contact
					<!--  <small>Control panel</small> -->
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Contact</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
				<div class="col-md-12">
					<!-- 컨텐트 삽입 -->
					<div class="col-md-4">
						<%@ include file="chatList.jsp"%>
					</div>
					
					<div class="col-md-8">
						<%@ include file="chatContent.jsp"%>
					</div>	
				</div>
			</div>
			</section>
		</div>
		
		<%@ include file="chatListForm_contact_modal.jsp"%>
		<%@ include file="chatCreateChannelModal.jsp"%>
		<%@ include file="/WEB-INF/view/include/footer.jsp"%>
	</div>
	
<!-- MDB core JavaScript -->
<script type="text/javascript" src="/tpm_project/js/material/mdb.min.js"></script>
</body>
</html>