<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap-3.3.2-dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="bootstrap-3.3.2-dist/css//bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-3.2.0.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="js/ajax_extension.js" ></script>
<script type="text/javascript">

window.onload=function(){
	$(main_modal).hide();
	$(smodal).hide();
}

function showf(){
	$(mback).fadeIn('150');
	$(main_modal).fadeIn('150');
	$(f_modal).show();
	$(smodal).hide();
}

function shows(){
	$(f_modal).fadeOut();
	$(smodal).fadeIn();

}

function closem() {
	$(mback).fadeOut('100');
	$(main_modal).fadeOut('100');
}

function projectMemberAdd() {
	var param = 'member_id=' + document.newProject.member_id.value;
	sendRequest('projectMemberAdd.do', param, projectMemberAddResult,
			'POST');

}

function projectMemberAddResult() {
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var result = XHR.responseText;

			var json = JSON.parse(result);

			var msg = '';
			var members = json.members; // 맵 객체로부터 members 값인 배열을 가져온다.
			for (var i = 0; i < members.length; i++) {
				var member = members[i];

				msg += '<div class="col-sm-12" id="modal_content">';
				msg += '<div class="col-sm-12"> ';
				msg += '<div class="panel"> ';
				msg += '<div class="panel-body p-t-10"> ';
				msg += '<div class="media-main"> ';
				msg += '<a class="pull-left" href="#"> <img ';
				msg += 				'class="thumb-lg img-circle bx-s" ';
				msg += 				'src="/tpm_project/img/member/profile/' + member.member_img + '" alt=""> ';

				msg += '</a> ';
				msg += '<div class="pull-right btn-group-sm"> ';
				msg += '<a href="javascript:goInsert_member(' + i
						+ ')" class="btn btn-success tooltips" ';
				msg += 'data-placement="top" data-toggle="tooltip" ';
				msg += 'data-original-title="Add"> <i class="fa fa-user-plus"></i> ';

				msg += '</a> ';
				msg += '</div> ';
				msg += '<div class="info"> ';
				msg += '<input type="hidden" id="add_member_idx_' + i + '" value="' + member.member_idx + '">'
				msg += '<h4>' + member.member_name + '</h4> ';
				msg += '<p class="text-muted">' + member.member_id
						+ '</p> ';
				msg += '</div> ';
				msg += '</div> ';
				msg += '<div class="clearfix"></div> ';
				msg += '<hr> ';

				msg += '</div> ';
				msg += '</div> ';
				msg += '</div> ';
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




</script>

<style>
#mback {
	position: absolute;
	top: -10%;
	left: -10%;
	width: 110%;
	height: 110%;
	background: gray;
	opacity: 0.7;
	display: none;
}

#main_modal{
	display: inline-block;
	background: white;
	position: fixed;
	top: 20%;
	left: 20%;
	border: solid 10px white;
	border-radius: 10px;
	width:600px;
	height:700px;
}

</style>
</head>
<body>
	<h2>프로젝트 리스트 폼</h2>
	<button class="btn btn-default" onclick="showf()">모달출력버튼</button>
	<br />
	<form name="newProject" action="projectAdd.do" method="post">
		<div id="mback" onclick="closem()"></div>
		<div id="main_modal">
			<button type="button" class="close" onclick="closem()">×</button>
			<h4 class="modal-title">프로젝트 생성</h4>
			
			<div id="f_modal">
				<div id="btntest">
					<div>
						프로젝트명: <input type="text" name="project_name">
					</div>
					<div>
						프로젝트 설명:
						<textarea cols="30" rows="20" name="project_content"></textarea>
					</div>
					<button type="button" class="btn btn-next" id="btn-next"
						onclick="shows()">다음</button>
				</div>
			</div>
			
			<div id="smodal">
				<div class="section">
					<div class="container">
						<div class="row">
							<div class="col-md-3">
								<h4>친구목록</h4>
								친구 리스트
								</ul>
								<h4>검색 멤버</h4>
								<div>
									<input type="text" name="member_id" placeholder="Search">
									<button type="button" class="btn" onclick="projectMemberAdd()">검색</button>
								</div>
								<div id="member_search_content"
									style="width:550px; height: 300px; overflow-y: scroll"></div>
							</div>
							<div class="col-md-3">
								<h4>초대 멤버</h4>
								<ul class="media-list">
									<li class="media"><a class="pull-left" href="#"><img
											class="media-object"
											src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
											height="64" width="64"></a></li>
									<li class="media"><a class="pull-left" href="#"><img
											class="media-object"
											src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
											height="64" width="64"></a>
										<div class="media-body"></div></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<button type="button" class="btn btn-next" id="btn-workbefore"
					onclick="showf()">이전</button>
				<input type="submit" class="btn" value="완료">
			</div>



		</div>
	</form>
	<hr>
</html>