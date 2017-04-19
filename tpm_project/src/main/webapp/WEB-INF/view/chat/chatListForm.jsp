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
<script src="/tpm_project/js/date/moment.js"></script>
<!-- Slimscroll -->
<script src="/tpm_project/js/scroll/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="/tpm_project/js/sockjs.min.js"></script>
<link href="/tpm_project/css/hr/hr-text.css?var=3" rel="stylesheet">
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
    
    //페이지 시작시 소켓 연결
    connect();
    
    $('#input_chat_content').keypress(function(event){
		var keycode = (event.keyCode ? event.keyCode : event.which);
		if(keycode == '13'){
			InsertChatContent();
		}
		event.stopPropagation();
	});
});

function connect() {
	wsocket = new SockJS(
			"http://localhost:9090/tpm_project/tpm-sockjs.do");
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
		<%@ include file="/WEB-INF/view/include/footer.jsp"%>
	</div>
</body>
</html>