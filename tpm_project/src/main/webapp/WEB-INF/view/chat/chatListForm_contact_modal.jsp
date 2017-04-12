<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Friend Search</h4>
			</div>
			<div class="modal-body">
				<div class="modal_container">
					<div class="container bootstrap snippet" style="width: 100%;">
						<div class="row">
							<div class="col-lg-12">
								<div class="panel panel-default">
									<div class="panel-body p-t-0">
										<div class="input-group">
											<input type="text" id="fkey_text" onkeydown="startSuggest()" 
												name="example-input1-group2" class="form-control"
												placeholder="Search"> <span class="input-group-btn">
												<button type="button"
													class="btn btn-effect-ripple btn-primary" onclick="goSearch_member()">
													<i class="fa fa-search"></i>
												</button>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="row" id="content_row" style="height: 609px; overflow-y:scroll;">
							<!-- <div class="col-sm-12" id="modal_content">
								<!-- <div class="col-sm-12">
									<div class="panel">
										<div class="panel-body p-t-10">
											<div class="media-main">
												<a class="pull-left" href="#"> <img
													class="thumb-lg img-circle bx-s"
													src="/tpm_project/img/member/profile/whwns5@naver.com.jpg" alt="">

												</a>
												<div class="pull-right btn-group-sm">
													<a href="javascript:goAdd_member()" class="btn btn-success tooltips"
														data-placement="top" data-toggle="tooltip"
														data-original-title="Add"> <i class="fa fa-user-plus"></i>

													</a>
												</div>
												<div class="info">
													<input type="hidden" id="add_member_idx" value="1">
													<h4>Jonathan Smith</h4>
													<p class="text-muted">Graphics Designer</p>
												</div>
											</div>
											<div class="clearfix"></div>
											<hr>

										</div>
									</div>
								</div> -->
								<!-- <div class="col-sm-12">
									<div class="panel">
										<div class="panel-body p-t-10">
											<div class="media-main">
												<a class="pull-left" href="#"> <img
													class="thumb-lg img-circle bx-s"
													src="http://bootdey.com/img/Content/user_2.jpg" alt="">

												</a>
												<div class="pull-right btn-group-sm">
													<a href="#" class="btn btn-success tooltips"
														data-placement="top" data-toggle="tooltip"
														data-original-title="Edit"> <i class="fa fa-pencil"></i>

													</a> <a href="#" class="btn btn-danger tooltips"
														data-placement="top" data-toggle="tooltip"
														data-original-title="Delete"> <i class="fa fa-close"></i>

													</a>
												</div>
												<div class="info">
													<h4>Jonathan Smith</h4>
													<p class="text-muted">Graphics Designer</p>
												</div>
											</div>
											<div class="clearfix"></div>
											<hr>

										</div>
									</div>
								</div>
								<div class="col-sm-12">
									<div class="panel">
										<div class="panel-body p-t-10">
											<div class="media-main">
												<a class="pull-left" href="#"> <img
													class="thumb-lg img-circle bx-s"
													src="http://bootdey.com/img/Content/user_3.jpg" alt="">

												</a>
												<div class="pull-right btn-group-sm">
													<a href="#" class="btn btn-success tooltips"
														data-placement="top" data-toggle="tooltip"
														data-original-title="Edit"> <i class="fa fa-pencil"></i>

													</a> <a href="#" class="btn btn-danger tooltips"
														data-placement="top" data-toggle="tooltip"
														data-original-title="Delete"> <i class="fa fa-close"></i>

													</a>
												</div>
												<div class="info">
													<h4>Jonathan Smith</h4>
													<p class="text-muted">Graphics Designer</p>
												</div>
											</div>
											<div class="clearfix"></div>
											<hr>

										</div>
									</div>
								</div>
								<div class="col-sm-12">
									<div class="panel">
										<div class="panel-body p-t-10">
											<div class="media-main">
												<a class="pull-left" href="#"> <img
													class="thumb-lg img-circle bx-s"
													src="http://bootdey.com/img/Content/user_1.jpg" alt="">

												</a>
												<div class="pull-right btn-group-sm">
													<a href="#" class="btn btn-success tooltips"
														data-placement="top" data-toggle="tooltip"
														data-original-title="Edit"> <i class="fa fa-pencil"></i>

													</a> <a href="#" class="btn btn-danger tooltips"
														data-placement="top" data-toggle="tooltip"
														data-original-title="Delete"> <i class="fa fa-close"></i>

													</a>
												</div>
												<div class="info">
													<h4>Jonathan Smith</h4>
													<p class="text-muted">Graphics Designer</p>
												</div>
											</div>
											<div class="clearfix"></div>
											<hr>

										</div>
									</div>
								</div> -->
								<!-- <div class="col-sm-12">
									<div class="panel">
										<div class="panel-body p-t-10">
											<div class="media-main">
												<a class="pull-left" href="#"> <img
													class="thumb-lg img-circle bx-s"
													src="http://bootdey.com/img/Content/user_2.jpg" alt="">

												</a>
												<div class="pull-right btn-group-sm">
													<a href="#" class="btn btn-success tooltips"
														data-placement="top" data-toggle="tooltip"
														data-original-title="Edit"> <i class="fa fa-pencil"></i>

													</a> <a href="#" class="btn btn-danger tooltips"
														data-placement="top" data-toggle="tooltip"
														data-original-title="Delete"> <i class="fa fa-close"></i>

													</a>
												</div>
												<div class="info">
													<h4>Jonathan Smith</h4>
													<p class="text-muted">Graphics Designer</p>
												</div>
											</div>
											<div class="clearfix"></div>
											<hr>

										</div>
									</div>
								</div> -->
								<!-- <div class="col-sm-12">
									<div class="panel">
										<div class="panel-body p-t-10">
											<div class="media-main">
												<a class="pull-left" href="#"> <img
													class="thumb-lg img-circle bx-s"
													src="http://bootdey.com/img/Content/user_3.jpg" alt="">

												</a>
												<div class="pull-right btn-group-sm">
													<a href="#" class="btn btn-success tooltips"
														data-placement="top" data-toggle="tooltip"
														data-original-title="Edit"> <i class="fa fa-pencil"></i>

													</a> <a href="#" class="btn btn-danger tooltips"
														data-placement="top" data-toggle="tooltip"
														data-original-title="Delete"> <i class="fa fa-close"></i>

													</a>
												</div>
												<div class="info">
													<h4>Jonathan Smith</h4>
													<p class="text-muted">Graphics Designer</p>
												</div>
											</div>
											<div class="clearfix"></div>
											<hr>

										</div>
									</div>
								</div> 
							</div>-->
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" onclick="modalClose()">Close</button>
				<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
			</div>
		</div>
	</div>
</div>