<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/sample/cho/main/import.jsp" %>
<script src="/tpm_project/js/ajax_extension.js" type="text/javascript"></script>
<script>
	/* (function($) {
		$(window).on("load", function() {

			$("#myModal #modal_content").mCustomScrollbar({
				setHeight : 609,
				theme : "minimal-dark"
			});

		});
	})(jQuery); */
	
	
	function search_modal_setting(responseText){
		//document.getElementById("ajax_qna_div").innerHTML = responseText;//보여주기
		window.alert(responseText);
		var json = JSON.parse(responseText);
		//var json = eval('('+responseText+')'); // 객체화
		//var json = responseText;
		
		var msg = '';
		var members = json.members; // 맵 객체로부터 members 값인 배열을 가져온다.
		for(var i = 0 ; i < members.length; i++){
			var member = members[i];
			
			msg += '<div class="col-sm-12" id="modal_content">';
			msg += '<div class="col-sm-12"> ';
			msg += '<div class="panel"> ';
			msg += 	'<div class="panel-body p-t-10"> ';
			msg += 		'<div class="media-main"> ';
			msg += 			'<a class="pull-left" href="#"> <img ';
			msg += 				'class="thumb-lg img-circle bx-s" ';
			msg += 				'src="/tpm_project/img/member/profile/' + member.member_img + '" alt=""> ';

			msg += 			'</a> ';
			msg += 			'<div class="pull-right btn-group-sm"> ';
			msg += 				'<a href="javascript:goInsert_member(' + i + ')" class="btn btn-success tooltips" ';
			msg += 					'data-placement="top" data-toggle="tooltip" ';
			msg += 					'data-original-title="Add"> <i class="fa fa-user-plus"></i> ';

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
	
	function myfriendList_setting(responseText) {
		if(responseText.trim() == 'true'){
			
		}
	}
	
	function result_process(responseText, ctype) {
		//var json = JSON.parse(responseText);
		//var qdto = json.QnaDTO;
		//var docStr = '';

		//dotStr +=  qdto[0].qna_idx;
		
		if(ctype == 'MEMBER_SEARCH'){
			search_modal_setting(responseText);
		} else if(ctype == 'FRIEND_DELETE'){
			
		} else if(ctype == 'FRIEND_INSERT'){
			myfriendList_setting(responseText);
		} else {
			window.alert('잘못된 경로');
		}
	}

	function ajax_result(httpRequest, ctype) {
		return function() {
			if(httpRequest.readyState == 4){
				if(httpRequest.status == 200){
					if(!httpRequest.responseText.match(null)){
						var responseText = httpRequest.responseText;
						result_process(responseText, ctype);
					}
				}
			}
		}
	}
	
	function action_ajax(url, param, method, ctype) {
		sendRequest_extension(url, param, ajax_result, method, ctype);
		return false;
	}
	
	function goSearch_member(){
		var fkey = document.getElementById('fkey_text').value;
		var param = 'fkey=' + fkey;
		action_ajax('memberIdAndNameSearch.do', param, 'POST', 'MEMBER_SEARCH'); // 해당 페이지로 ajax통신 시작
	}
	
	function goDelete_member(i){
		var member_idx = document.getElementById('my_member_idx').value;
		var myfriend_idx = document.getElementById('del_myfriend_idx_' + i).value;
		
		var param = 'member_idx=' + member_idx + '&myfriend_idx=' + myfriend_idx;
		action_ajax('myFriendDel.do', param, 'POST', 'FRIEND_DELETE'); // 해당 페이지로 ajax통신 시작
		//location.href = 'myFriendDel.do?' + param;	
	}
	
	function goInsert_member(i){
		var member_idx = document.getElementById('my_member_idx').value;
		var myfriend_idx = document.getElementById('add_member_idx_' + i).value;
		
		var param = 'member_idx=' + member_idx + '&myfriend_idx=' + myfriend_idx;
		action_ajax('myFriendAdd.do', param, 'POST', 'FRIEND_INSERT'); // 해당 페이지로 ajax통신 시작
	}
</script>
</head>
<body>
	<input type="hidden" id="my_member_idx" value="6">
	<div class="box box-danger">
		<div class="box-header with-border">
			<h3 class="box-title">My Friend</h3>
			<div class="box-tools pull-right">
				<span class="label label-danger">Members</span>
				<button class="btn btn-box-tool">
					<i class="fa fa-lg fa-plus" data-toggle="modal" data-target="#myModal"></i>
				</button>
			</div>
		</div>
		<!-- /.box-header -->
		<div class="box-body no-padding">
			<!-- <i class="fa fa-fw fa-lg fa-trash-o text-danger fdel"></i> -->	
			<ul class="users-list clearfix">
				<c:forEach var="i" begin="0" end="${arry_mdto.size() - 1}" step="1">
					<li>
						<input type="hidden" id="del_myfriend_idx_${i}" value="${arry_mdto.get(i).member_idx}">
						<img src="/tpm_project/img/member/profile/${arry_mdto.get(i).member_img}" alt="User Image">
						<span class="users-list-name">${arry_mdto.get(i).member_name}
							<a href="javascript:goDelete_member(${i})"><i class="fa fa-fw fa-lg fa-trash-o text-danger"></i></a>
						</span>
						<span class="users-list-date">${arry_mdto.get(i).member_id}</span>
					</li>
				</c:forEach>
			</ul>
			<!-- /.users-list -->
		</div>
	</div>
	<%@ include file="myFriendListForm_modalAdd.jsp" %>
</body>
</html>