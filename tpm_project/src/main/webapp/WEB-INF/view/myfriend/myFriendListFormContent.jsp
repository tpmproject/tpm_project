<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="box box-danger">
	<div class="box-header with-border">
		<h3 class="box-title">My Friend</h3>
		<div class="box-tools pull-right">
			<span class="label label-danger">Members</span>
			<button class="btn btn-box-tool">
				<i class="fa fa-lg fa-plus" data-toggle="modal"
					data-target="#myModal"></i>
			</button>
		</div>
	</div>
	<!-- /.box-header -->
	<div class="box-body no-padding">
		<!-- <i class="fa fa-fw fa-lg fa-trash-o text-danger fdel"></i> -->
		<ul class="users-list clearfix" id="myfriend_content_list">
			<c:forEach var="i" begin="0" end="${arry_mdto.size() - 1}" step="1">
				<li><input type="hidden" id="del_myfriend_idx_${i}"
					value="${arry_mdto.get(i).member_idx}"> <img
					src="/tpm_project/img/member/profile/${arry_mdto.get(i).member_img}"
					alt="User Image"> <span class="users-list-name">${arry_mdto.get(i).member_name}
						<a href="javascript:goDelete_member(${i})"><i
							class="fa fa-fw fa-lg fa-trash-o text-danger"></i></a>
				</span> <span class="users-list-date">${arry_mdto.get(i).member_id}</span>
				</li>
			</c:forEach>
		</ul>
		<!-- /.users-list -->
	</div>
</div>
<%@ include file="myFriendListForm_modalAdd.jsp"%>