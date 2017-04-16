<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Chat box -->
<div class="box box-success">
	<div class="box-header">
		<i class="fa fa-comments-o"></i>
		<h3 class="box-title">Chat</h3>
	</div>
	<div class="box-body chat" id="chat-box">
		<!-- 왼쪽 아이템 -->
		<div class="item">
			<span class="chat-img pull-left"> <img
				src="dist/img/user4-128x128.jpg" class="chat_content_user_img" alt="User Avatar"
				class="online">
			</span>
			<div class="chat-body clearfix chat_content_body_div_left">
				<div class="header">
					<strong class="primary-font chat_content_user_name">Jack Sparrow</strong> <small
						class="pull-right text-muted"> <span
						class="glyphicon glyphicon-time"></span>12 mins ago
					</small>
				</div>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
					Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.</p>
			</div>
		</div>
		<!-- 오른쪽 아이템 -->
		<div class="item">
			<span class="chat-img pull-right"> <img
				src="dist/img/user4-128x128.jpg" class="chat_content_user_img" alt="User Avatar"
				class="online">
			</span>
			<div class="chat-body clearfix chat_content_body_div_right">
			<div class="header">
				<small class=" text-muted"><span
					class="glyphicon glyphicon-time"></span>13 mins ago</small> <strong
					class="pull-right primary-font chat_content_user_name">Bhaumik Patel</strong>
			</div>
			<p class="chat_content_p_right">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
				Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.</p>
			</div>
		</div>
		<!-- /.item -->
	</div>
	<!-- /.chat -->
	<div class="box-footer">
		<div class="input-group">
			<input class="form-control" placeholder="Type message..." />
			<div class="input-group-btn">
				<button class="btn btn-success">
					<i class="fa fa-plus"></i>
				</button>
			</div>
		</div>
	</div>
</div>
<!-- /.box (chat box) -->