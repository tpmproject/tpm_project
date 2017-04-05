<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script src="/tpm_project/js/ajax_extension.js" type="text/javascript"></script>
<script type="text/javascript">
	var p1 = document.getElementById('btntest');
	var p2 = document.getElementById('btntest2');
	
	function show() {
		p1.style.display = 'none';
		p2.style.display = 'block';
		
	}
	function before() {
		p1.style.display = 'block';
		p2.style.display = 'none';
		
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
</head>
<body id="body">
	<!-- header -->
	<div class="modal-header">
		<!-- 닫기(x) 버튼 -->
		<button type="button" class="close" data-dismiss="modal">×</button>
		<!-- header title -->
		<h4 class="modal-title">프로젝트 생성</h4>
	</div>

	<!-- body -->

	<div class="modal-body" id="modal_body">
		<form name="newProject" action="projectAdd.do" method="post">
			<div id="btntest">
				<div>
					프로젝트명: <input type="text" name="project_name">
				</div>
				<div>
					프로젝트 설명:
					<textarea cols="30" rows="20" name="project_content"></textarea>
				</div>
				<button type="button" class="btn btn-next" id="btn-next"
					onclick="show()">다음</button>
			</div>
			<div id="btntest2" style="display: none;">
				<div class="section">
					<div class="container">
						<div class="row">
							<div class="col-md-3">
								<h4>친구목록</h4>
								<ul class="media-list">
									<li class="media"><a class="pull-left" href="#"><img
											class="media-object"
											src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
											height="64" width="64"></a></li>
									<li class="media"><a class="pull-left" href="#"><img
											class="media-object"
											src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
											height="64" width="64"></a></li>
								</ul>
								<h4>검색 멤버</h4>
								<div>
									<input type="text" name="member_id" placeholder="Search">
									<button type="button" class="btn" onclick="projectMemberAdd()">검색</button>
								</div>
								<div id="member_search_content"
									style="height: 300px; overflow-y: scroll"></div>
								<ul class="media-list">
									<li class="media"><a class="pull-left" href="#"><img
											class="media-object"
											src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
											height="64" width="64"></a></li>
									<li class="media"><a class="pull-left" href="#"><img
											class="media-object"
											src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
											height="64" width="64"></a></li>
								</ul>
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
					onclick="before()">이전</button>
				<input type="submit" class="btn" value="완료">
			</div>

		</form>
	</div>
</body>
</html>