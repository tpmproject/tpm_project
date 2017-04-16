<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
<!-- Bootstrap 3.3.2 -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />    
<!-- FontAwesome 4.3.0 -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- Ionicons 2.0.0 -->
<!-- <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" />  -->   
<!-- Theme style -->
<link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins 
     folder instead of downloading all of them to reduce the load. -->
<link href="dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
<!-- iCheck -->
<link href="plugins/iCheck/flat/blue.css" rel="stylesheet" type="text/css" />
<!-- Morris chart -->
<link href="plugins/morris/morris.css" rel="stylesheet" type="text/css" />
<!-- jvectormap -->
<link href="plugins/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
<!-- Date Picker -->
<link href="plugins/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
<!-- Daterange picker -->
<link href="plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
<!-- bootstrap wysihtml5 - text editor -->
<link href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />


<!-- jQuery 2.1.3 -->
<script src="plugins/jQuery/jQuery-2.1.3.min.js"></script>
<!-- jQuery UI 1.11.2 -->
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.min.js" type="text/javascript"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.2 JS -->
<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>    
<!-- Morris.js charts -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="plugins/morris/morris.min.js" type="text/javascript"></script>
<!-- Sparkline -->
<script src="plugins/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
<!-- jvectormap -->
<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
<!-- jQuery Knob Chart -->
<script src="plugins/knob/jquery.knob.js" type="text/javascript"></script>
<!-- daterangepicker -->
<script src="plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
<!-- datepicker -->
<script src="plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>
<!-- iCheck -->
<script src="plugins/iCheck/icheck.min.js" type="text/javascript"></script>
<!-- Slimscroll -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- FastClick -->
<script src='plugins/fastclick/fastclick.min.js'></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js" type="text/javascript"></script>

<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard.js" type="text/javascript"></script>

<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js" type="text/javascript"></script>


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
	
	function modalInit(){
		document.getElementById('fkey_text').value = '';
		document.getElementById('content_row').innerHTML = '';
	}
  	
	function search_modal_setting(responseText){
		//document.getElementById("ajax_qna_div").innerHTML = responseText;//보여주기
		

		
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
		window.alert(responseText);
		var json = JSON.parse(responseText);
		var msg = '';
		var members = json.members; // 맵 객체로부터 members 값인 배열을 가져온다.
		for(var i = 0 ; i < members.length; i++){
			var member = members[i];
			
			msg += '<li>'
				msg += '<input type="hidden" id="del_myfriend_idx_' + i + '" value="' + member.member_idx + '">'
				msg += '<img src="/tpm_project/img/member/profile/' + member.member_img + '" alt="User Image">'
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
	
	function result_process(responseText, ctype) {
		//var json = JSON.parse(responseText);
		//var qdto = json.QnaDTO;
		//var docStr = '';

		//dotStr +=  qdto[0].qna_idx;
		
		if(ctype == 'MEMBER_SEARCH'){
			search_modal_setting(responseText);
			checkFirst = false;
		} else if(ctype == 'FRIEND_LIST'){
			myfriendList_setting(responseText);
		} else if(ctype == 'FRIEND_DELETE'){
			if(responseText.trim() == 'true'){
				action_ajax('myFriendList.do', null, 'POST', 'FRIEND_LIST');
			}
		} else if(ctype == 'FRIEND_INSERT'){
			if(responseText.trim() == 'true'){
				action_ajax('myFriendList.do', null, 'POST', 'FRIEND_LIST');
				goSearch_member();
			}
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
	
	var checkFirst = false;
	
	function startSuggest(){
		if(checkFirst == false){
			setTimeout('goSearch_member()', 100);
		}
		checkFirst = true;
	}
	
</script>
</head>
<body class="skin-blue">
	<input type="hidden" id="my_member_idx" value="${sessionScope.s_member_idx}">
		<%@ include file="/WEB-INF/view/header.jsp"%>
		
						<!-- 컨텐트 삽입 -->
						<%@ include file="myFriendListFormContent.jsp"%>
					
		<%@ include file="/WEB-INF/view/footer.jsp"%>
	

	
	<%-- <div class="box box-danger">
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
			<ul class="users-list clearfix" id="myfriend_content_list">
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
	<%@ include file="myFriendListForm_modalAdd.jsp" %> --%>
</body>
</html>