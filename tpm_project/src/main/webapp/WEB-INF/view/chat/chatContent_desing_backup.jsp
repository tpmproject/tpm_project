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
		<!-- chat item -->
		<div class="item">
			<img src="dist/img/user4-128x128.jpg" alt="user image" class="online" />
			<p class="message">
				<a href="#" class="name"> <small class="text-muted pull-right"><i
						class="fa fa-clock-o"></i> 2:15</small> Mike Doe
				</a> I would like to meet you to discuss the latest news about the
				arrival of the new theme. They say it is going to be one the best
				themes on the market
			</p>
		</div>
		<!-- chat item -->
		<div class="item">
			<span class="chat-img pull-left"> <img
				src="dist/img/user4-128x128.jpg" style="width: 40px; height: 40px; border-radius: 50% !important; border: 2px solid #00a65a;" alt="User Avatar"
				class="online">
			</span>
			<div class="chat-body clearfix" style="margin-left: 60px;">
				<div class="header">
					<strong class="primary-font"  style="color: #3c8dbc;">Jack Sparrow</strong> <small
						class="pull-right text-muted"> <span
						class="glyphicon glyphicon-time"></span>12 mins ago
					</small>
				</div>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
					Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.</p>
			</div>
		</div>
		<!-- /.item -->
		<!-- chat item -->
		<div class="item">
			<span class="chat-img pull-right"> <img
				src="dist/img/user4-128x128.jpg" style="width: 40px; height: 40px; border-radius: 50% !important; border: 2px solid #dd4b39;" alt="User Avatar"
				class="online">
			</span>
			<div class="chat-body clearfix" style="margin-right: 20px;max-width: 70%; float: right;">
			<div class="header">
				<small class=" text-muted"><span
					class="glyphicon glyphicon-time"></span>13 mins ago</small> <strong
					class="pull-right primary-font" style="color: #3c8dbc;">Bhaumik Patel</strong>
			</div>
			<p style="text-align: right;">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
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