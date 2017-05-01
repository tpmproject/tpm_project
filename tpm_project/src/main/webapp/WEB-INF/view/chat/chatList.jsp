<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="box skin-border-top-color-${sessionScope.s_member_thema}">
	<div class="box-header">
		<i class="fa fa-list-ul" aria-hidden="true"></i>
		<h3 class="box-title">프로젝트</h3>
		<div class="box-tools">
			<div class="input-group">
				<input type="text" name="table_search" onkeyup="startSuggest('project_list_table', this)"
					class="form-control input-sm pull-right" style="width: 100px;"
					placeholder="Search" />
				<div class="input-group-btn">
					<button class="btn btn-sm btn-default">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /.box-header -->
	<div class="box-body table-responsive no-padding" id="chat_project_list_div">
		<table class="table table-hover" id="project_list_table">		
			<c:forEach var="pdto" items="${arry_pdto}">
				<tr class="list-border-left" onclick="showChatContent('P','${pdto.project_idx}','${pdto.project_name}',this)" style="cursor: pointer;">
					<th><div>${pdto.project_name}</div></th>
				</tr>		
			</c:forEach>
		</table>
	</div>
	<!-- /.box-body -->
</div>

<!-- /.box -->
<div class="box skin-border-top-color-${sessionScope.s_member_thema}">
	<div class="box-header">
		<i class="fa fa-twitch" aria-hidden="true"></i>
		<h3 class="box-title">채널</h3>
		<div class="box-tools">
			<div class="input-group">
				<input type="text" name="table_search" onkeyup="startSuggest('channel_list_table', this)" 
					class="form-control input-sm pull-right" style="width: 100px;"
					placeholder="Search" />
				<div class="input-group-btn">
					<button class="btn btn-sm btn-default">
						<i class="fa fa-search"></i>
					</button>
					<button class="btn btn-sm btn-default" onclick="showCreateChannelModal()">
						<i class="fa fa-plus"></i>
					</button>
				</div>
				
			</div>
		</div>
	</div>
	<!-- /.box-header -->
	<div class="box-body table-responsive no-padding" id="chat_channel_list_div">
		<table class="table table-hover" id="channel_list_table">
			<c:forEach var="chdto" items="${arry_chdto}">
				<tr class="list-border-left" onclick="showChatContent('C','${chdto.channel_idx}','${chdto.channel_name}',this)" style="cursor: pointer;">
					<th><div>${chdto.channel_name}</div></th>
				</tr>		
			</c:forEach>
		</table>
	</div>
	<!-- /.box-body -->
</div>
<!-- /.box -->
<!-- /.box -->
<div class="box skin-border-top-color-${sessionScope.s_member_thema}">
	<div class="box-header">
		<i class="fa fa-users" aria-hidden="true"></i>
		<h3 class="box-title">구성원</h3>
		<div class="box-tools">
			<div class="input-group">
				<input type="text" name="table_search" onkeyup="startSuggest_memberList('cpmember_list_table', this)" 
					class="form-control input-sm pull-right" style="width: 100px;"
					placeholder="Search" />
				<div class="input-group-btn">
					<button class="btn btn-sm btn-default">
						<i class="fa fa-search"></i>
					</button>
				</div>
				
			</div>
		</div>
	</div>
	<!-- /.box-header -->
	<div class="box-body table-responsive no-padding" id="chat_member_list_div">
		<table class="table" id="cpmember_list_table">
			<%-- <c:forEach var="chdto" items="${arry_chdto}">
				<tr class="list-border-left" style="cursor: pointer;">
					<th><div class="option-name">
							<div class="feed-element">
								<a href="profile.html" class="pull-left"><img alt="image" class="img-circle"
									src="/tpm_project/img/member/profile/hanjin@naver.com.jpg"></a>
								<div class="media-body ">
									<strong>한진희</strong><br>
									<small class="text-muted">hanjin@naver.com</small>
								</div>
							</div>
						</div></th>
				</tr>
			</c:forEach> --%>
		</table>
	</div>
	<!-- /.box-body -->
</div>
<!-- /.box -->