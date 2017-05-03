<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
<%@ include file="/WEB-INF/view/include/import.jsp"%>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
body{
font-family: 'Noto Sans KR', sans-serif;
}
</style>
<script>
	/* (function($) {
		$(window).on("load", function() {

			$("#myModal #modal_content").mCustomScrollbar({
				setHeight : 609,
				theme : "minimal-dark"
			});

		});
	})(jQuery); */
	
	function modalInit(){
		document.getElementById('fkey_text').value = '';
		document.getElementById('content_row').innerHTML = '';
	}
  	
	function search_modal_setting(json){
		//document.getElementById("ajax_qna_div").innerHTML = responseText;//보여주기
		
		//var json = eval('('+responseText+')'); // 객체화
		//var json = responseText;
		
		var msg = '';
		var members = json; // 맵 객체로부터 members 값인 배열을 가져온다.
		for(var i = 0 ; i < members.length; i++){
			var member = members[i];
			
			msg += '<div class="col-sm-12" id="modal_content">';
			msg += '<div class="col-sm-12"> ';
			msg += '<div class="panel"> ';
			msg += 	'<div class="panel-body p-t-10"> ';
			msg += 		'<div class="media-main"> ';
			msg += 			'<a class="pull-left" href="#"> <img ';
			msg += 				'class="thumb-lg img-circle bx-s" style="width: 128px; height: 128px;"';
			msg += 				'src="/tpm_project/img/member/profile/' + member.member_img + '" alt=""> ';

			msg += 			'</a> ';
			msg += 			'<div class="pull-right btn-group-sm"> ';
			msg += 				'<a href="javascript:goInsert_member(' + i + ')" class="btn btn-success tooltips" ';
			msg += 					'data-placement="top" data-toggle="tooltip" ';
			msg += 					' > <i class="fa fa-user-plus"></i> ';

			msg += 				'</a> ';
			msg += 			'</div> ';
			msg += 			'<div class="info"> ';
			msg +=				'<input type="hidden" id="add_member_idx_' + i + '" value="' + member.member_idx + '">'
			msg += 				'<h4>' + member.member_name + '</h4> ';
			msg += 				'<p class="text-muted">' + member.member_id + '</p> ';
			msg += 			'</div> ';
			msg += 		'</div> ';
			msg += 		'<div class="clearfix"></div> ';
			msg += 		'<hr> ';

			msg += 	'</div> ';
			msg += '</div> ';
			msg += '</div> ';
			msg += '</div> ';
		}
		
		var content_row = document.getElementById('content_row');
		content_row.innerHTML = msg;
		
	}
	
	function myfriendList_setting(json) {

		var msg = '';
		var members = json; // 맵 객체로부터 members 값인 배열을 가져온다.
		for(var i = 0 ; i < members.length; i++){
			var member = members[i];
			
			msg += '<li>'
				msg += '<input type="hidden" id="del_myfriend_idx_' + i + '" value="' + member.member_idx + '">'
				msg += '<img src="/tpm_project/img/member/profile/' + member.member_img + '" style="width: 128px; height: 128px;" alt="User Image">'
				msg += '<span class="users-list-name">' + member.member_name
					msg += '<a href="javascript:goDelete_member(' + i + ')"><i class="fa fa-fw fa-lg fa-trash-o text-danger"></i></a>'
				msg += '</span>'
				msg += '<span class="users-list-date">' + member.member_id + '</span>'
			msg += '</li>'
		}
		
		var myfriend_content_list = document.getElementById('myfriend_content_list');
		myfriend_content_list.innerHTML = '';
		myfriend_content_list.innerHTML = msg;
		
	}
	
	function goSearch_member(){
		var fkey = document.getElementById('fkey_text').value;
		var param = 'fkey=' + fkey;
		$.ajax({
			url : 'memberIdAndNameSearch.do',
			type : 'post',
			data : param,
			dataType : 'json', // 제이슨 형식으로 넘어온다.
			success : function(json) {
				//window.alert(JSON.stringify(json));
				search_modal_setting(json);
				checkFirst = false;
			}
		});
	}
	
	function goDelete_member(i){
		var member_idx = document.getElementById('my_member_idx').value;
		var myfriend_idx = document.getElementById('del_myfriend_idx_' + i).value;
		var param = 'member_idx=' + member_idx + '&myfriend_idx=' + myfriend_idx;
		
		$.ajax({
			url : 'myFriendDel.do',
			type : 'post',
			data : param,
			dataType : 'text', 
			success : function(responseText) {
				if(responseText.trim() == 'true'){	
					goReload_member();
				}
			}
		});
	}
	
	function goInsert_member(i){
		var member_idx = document.getElementById('my_member_idx').value;
		var myfriend_idx = document.getElementById('add_member_idx_' + i).value;
		var param = 'member_idx=' + member_idx + '&myfriend_idx=' + myfriend_idx;
		$.ajax({
			url : 'myFriendAdd.do',
			type : 'post',
			data : param,
			dataType : 'text', 
			success : function(responseText) {
				if(responseText.trim() == 'true'){
					goReload_member();
					goSearch_member();
				}
			}
		});
		
		
		action_ajax('myFriendAdd.do', param, 'POST', 'FRIEND_INSERT'); // 해당 페이지로 ajax통신 시작
	}
	
	function goReload_member(){
		$.ajax({
			url : 'myFriendList.do',
			type : 'post',
			dataType : 'json', 
			success : function(json) {
				myfriendList_setting(json);
			}
		});	
	}
	
	var checkFirst = false;
	
	function startSuggest(){
		if(checkFirst == false){
			setTimeout('goSearch_member()', 100);
		}
		checkFirst = true;
	}
	
</script>
</head>
<body class="skin-${sessionScope.s_member_thema}">
	<input type="hidden" id="my_member_idx" value="${sessionScope.s_member_idx}">
	<div class="wrapper">
		<%@ include file="/WEB-INF/view/header.jsp"%>
			
		<%@ include file="myFriendListFormContent.jsp"%>
					
		<%@ include file="/WEB-INF/view/footer.jsp"%>
	</div>
</body>
</html>