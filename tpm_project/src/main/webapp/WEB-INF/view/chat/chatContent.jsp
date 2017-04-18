<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Chat box -->
<div class="box box-success">
	<div class="box-header">
		<i class="fa fa-comments-o"></i>
		<h3 class="box-title">Chat</h3>
	</div>
	<div class="box-body chat" id="chat-box">
		<div class="chat-message" id="chat_message_div">
			<ul class="chat" id="chat_content_ul">
				<!-- <li class="left clearfix">
					<span class="chat-img pull-left">
						<img src="http://bootdey.com/img/Content/user_3.jpg"
						alt="User Avatar">
					</span>
					<div class="chat-body clearfix">
						<div class="header">
							<strong class="primary-font">John Doe</strong> <small
								class="pull-right text-muted"><i class="fa fa-clock-o"></i>
								12 mins ago</small>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
					</div></li>
				<li class="right clearfix">
					<span class="chat-img pull-right">
						<img src="http://bootdey.com/img/Content/user_1.jpg" alt="User Avatar">
					</span>
					<div class="chat-body clearfix">
						<div class="header">
							<strong class="primary-font">Sarah</strong> 
							<small class="pull-right text-muted"><i class="fa fa-clock-o"></i>13 mins ago</small>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales
							at.</p>
					</div>
				</li>
				<li class="left clearfix"><span class="chat-img pull-left">
						<img src="http://bootdey.com/img/Content/user_3.jpg"
						alt="User Avatar">
				</span>
					<div class="chat-body clearfix">
						<div class="header">
							<strong class="primary-font">John Doe</strong> <small
								class="pull-right text-muted"><i class="fa fa-clock-o"></i>
								12 mins ago</small>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
					</div></li>
				<li class="right clearfix"><span class="chat-img pull-right">
						<img src="http://bootdey.com/img/Content/user_1.jpg"
						alt="User Avatar">
				</span>
					<div class="chat-body clearfix">
						<div class="header">
							<strong class="primary-font">Sarah</strong> <small
								class="pull-right text-muted"><i class="fa fa-clock-o"></i>
								13 mins ago</small>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales
							at.</p>
					</div></li>
				<li class="left clearfix"><span class="chat-img pull-left">
						<img src="http://bootdey.com/img/Content/user_3.jpg"
						alt="User Avatar">
				</span>
					<div class="chat-body clearfix">
						<div class="header">
							<strong class="primary-font">John Doe</strong> <small
								class="pull-right text-muted"><i class="fa fa-clock-o"></i>
								12 mins ago</small>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
					</div></li>
				<li class="right clearfix"><span class="chat-img pull-right">
						<img src="http://bootdey.com/img/Content/user_1.jpg"
						alt="User Avatar">
				</span>
					<div class="chat-body clearfix">
						<div class="header">
							<strong class="primary-font">Sarah</strong> <small
								class="pull-right text-muted"><i class="fa fa-clock-o"></i>
								13 mins ago</small>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales
							at.</p>
					</div></li>
				<li class="right clearfix"><span class="chat-img pull-right">
						<img src="http://bootdey.com/img/Content/user_1.jpg"
						alt="User Avatar">
				</span>
					<div class="chat-body clearfix">
						<div class="header">
							<strong class="primary-font">Sarah</strong> <small
								class="pull-right text-muted"><i class="fa fa-clock-o"></i>
								13 mins ago</small>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales
							at.</p>
					</div></li> -->
			</ul>
		</div>
	</div>
	<!-- /.chat -->
	<div class="box-footer">
		<div class="input-group">
			<input class="form-control" placeholder="Type message..." id="input_chat_content"/>
			<div class="input-group-btn">
				<button class="btn btn-success" onclick="InsertChatContent()">
					<i class="fa fa-plus"></i>
				</button>
			</div>
		</div>
	</div>
</div>
<!-- /.box (chat box) -->