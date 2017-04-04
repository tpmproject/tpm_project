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
function btFriendOver(i){
	window.alert(i);
}
function goDelete(){
	window.alert('삭제');
}
</script>
</head>
<body>
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
			<ul class="users-list clearfix">
				<c:forEach var="dto" items="${arry_mdto}">
					<li>
						<img src="/tpm_project/img/member/profile/${dto.member_img}" alt="User Image">
						<span class="users-list-name">${dto.member_name}
									<i class="fa fa-fw fa-lg fa-trash-o text-danger fdel" onmouseover="btFriendOver(this)"></i>
						</span>
						<span class="users-list-date">${dto.member_id}</span>
					</li>
				</c:forEach>
			</ul>
			<!-- /.users-list -->
		</div>
	</div>
	<%@ include file="myFriendListForm_modalAdd.jsp" %>
</body>
</html>