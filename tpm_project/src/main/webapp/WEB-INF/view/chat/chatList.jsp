<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="box box-success">
	<div class="box-header">
		<h3 class="box-title">프로젝트</h3>
		<div class="box-tools">
			<div class="input-group">
				<input type="text" name="table_search"
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
		<table class="table table-hover">
			<c:forEach var="pdto" items="${arry_pdto}">
				<tr>
					<th><a href="javascript:showChatContent('P','${pdto.project_idx}')">${pdto.project_name},${pdto.project_idx}</a></th>
				</tr>		
			</c:forEach>
		</table>
	</div>
	<!-- /.box-body -->
</div>

<!-- /.box -->
<div class="box box-success">
	<div class="box-header">
		<h3 class="box-title">채널</h3>
		<div class="box-tools">
			<div class="input-group">
				<input type="text" name="table_search"
					class="form-control input-sm pull-right" style="width: 100px;"
					placeholder="Search" />
				<div class="input-group-btn">
					<button class="btn btn-sm btn-default">
						<i class="fa fa-search"></i>
					</button>
					<button class="btn btn-sm btn-success" onclick="showCreateChannelModal()">
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
				<tr>
					<th><a href="javascript:showChatContent('C','${chdto.channel_idx}')">${chdto.channel_name},${chdto.channel_idx}</a></th>
				</tr>		
			</c:forEach>
		</table>
	</div>
	<!-- /.box-body -->
</div>
<!-- /.box -->