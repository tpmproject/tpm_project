<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Modal -->
<script>
	(function($) {
		$(window).on("load", function() {

			$("#myModal #modal_content").mCustomScrollbar({
				setHeight : 609,
				theme : "minimal-dark"
			});

		});
	})(jQuery);
	
	function result_process(responseText, ctype) {
		//var json = JSON.parse(responseText);
		//var qdto = json.QnaDTO;
		//var docStr = '';

		//dotStr +=  qdto[0].qna_idx;
		
		if(ctype == 'MEMBER_SEARCH'){
			//document.getElementById("ajax_qna_div").innerHTML = responseText;//보여주기
			window.alert(responseText);
		} else {
			window.alert('잘못된 경로');
		}
	}

	function ajax_result(httpRequest, ctype) {
		return function() {
			if(httpRequest.readyState == 4){
				if(httpRequest.status == 200){
					if(!httpRequest.responseText.match(null)){
						var responseText = httpRequest.responseText;
						result_process(responseText, ctype);
					}
				}
			}
		}
	}
	
	function action_ajax(url, param, method, ctype) {
		sendRequest_extension(url, param, ajax_result, method, ctype);
		return false;
	}
	
	function goSearch(){
		var fkey = document.getElementById('fkey_text').value;
		var param = 'fkey=' + fkey;
		action_ajax('memberIdAndNameSearch.do', param, 'POST', 'MEMBER_SEARCH'); // 해당 페이지로 ajax통신 시작
	}
</script>
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
											<input type="text" id="fkey_text"
												name="example-input1-group2" class="form-control"
												placeholder="Search"> <span class="input-group-btn">
												<button type="button"
													class="btn btn-effect-ripple btn-primary" onclick="goSearch()">
													<i class="fa fa-search"></i>
												</button>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-12" id="modal_content">
								<!-- <div class="col-sm-12">
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
														data-original-title="Add"> <i class="fa fa-user-plus"></i>

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
								</div> -->
								<!-- <div class="col-sm-12">
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
								</div> -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>