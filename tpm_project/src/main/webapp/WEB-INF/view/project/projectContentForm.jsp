<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="f"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>TPM</title>
<script type="text/javascript">
var project_idx=${param.project_idx};
var member_idx=${param.member_idx};
var skin='${sessionScope.s_member_thema}';
var skin_color='';
</script>

<link rel="stylesheet" href="bootstrap-3.3.2-dist/css/bootstrap.min.css">
<link href="/tpm_project/css/font-awesome.min.css" rel="stylesheet" type="text/css" /> 
<!-- Ionicons -->
<link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css">
<!-- Morris chart -->
<link href="/tpm_project/sample/cho/main/plugins/morris/morris.css" rel="stylesheet" type="text/css">
<!-- Daterange picker -->
<link href="/tpm_project/sample/cho/main/plugins/daterangepicker/daterangepicker-bs3.css"
	rel="stylesheet" type="text/css">
<!-- Theme style -->
<link href="/tpm_project/sample/cho/main/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css">
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of
    downloading all of them to reduce the load. -->
<link href="/tpm_project/sample/cho/main/dist/css/skins/_all-skins.min.css" rel="stylesheet"
	type="text/css">

<!-- <script src="/tpm_project/sample/cho/main/plugins/iCheck/icheck.min.js" type="text/javascript"></script> -->	

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="bootstrap-3.3.2-dist/js/bootstrap.min.js"></script> -->
<script type="text/javascript" src="js/httpRequest.js"></script>
<script src="/tpm_project/js/ajax_extension.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/jquery.timepicker.min.js"></script>
<script src="js/daterangepicker/daterangepicker.js" type="text/javascript"></script>
<link type="text/css" href="css/jquery-ui.min.css" rel="stylesheet">
<link type="text/css" href="css/jquery.timepicker.css" rel="stylesheet">
<link rel="stylesheet" href="/tpm_project/sample/aram/jquery.mCustomScrollbar.min.css" />
<link rel="stylesheet" href="/tpm_project/sample/aram/jquery.mCustomScrollbar.css" />
<script src="/tpm_project/sample/aram/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="/tpm_project/sample/aram/jquery.mCustomScrollbar.js"></script>
<script src="/tpm_project/bootstrap/js/bootstrap.js"></script>

<!-- 개인 성향  그래프-->
<script src="/tpm_project/js/graph/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/radar.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<!-- jQuery 2.1.3 -->
<script src="dist/js/app.min.js" type="text/javascript"></script>
<!--Websocket  -->
<script type="text/javascript" src="/tpm_project/js/sockjs.min.js"></script>
<script type="text/javascript" src="js/project/ws_project.js"></script>

<script type="text/javascript" src="js/project/projectContent.js"></script>
<link rel="stylesheet" href="css/projectContent.css">
<style>
#fileCon img{
   vertical-align: middle; width: 130%; margin: auto 340px;
}
</style>
</head>
<body class="skin-${sessionScope.s_member_thema}">
<div id="loading_div"></div><span id="load_s"><h1>Loading...</h1></span>
<!-- 모달 시작 -->
  <div class="row">
		<div class="modal fade" id="layerpop" style="z-index:2500">

		      <!-- header -->
		      <div class="modal-header">
		        <!-- 닫기(x) 버튼 -->
		        <label style="color:white; font-size:30px; margin:auto 20px; font-family:serif; opacity:.80;" id="f_name"> </label>
		        <button type="button" class="close" data-dismiss="modal" style="font-size:40px; color:white; opacity:.80;">X</button>
		        <!-- header title -->
		       
		      </div>
		      <!-- body -->
		     	 <div class="modal-body" >
		     	
		     	 <div class="row" id="fileContent" >
		     	 	
		     	 	<div class="col-lg-6" id="fileCon" style="margin: auto -30px;">
		     	 		
		     	 	

		      		</div>
		         </div>
		         
		      </div>
		 </div>
   </div>

  <!--모달 끝  -->
	<%@include file="/WEB-INF/view/header.jsp"%>
	
	<div id="cbody" style="margin-left:20px; width:${(pdto.category_num +2)*220+100}px">
		<div class="projectTitle">
			<h3><i class="glyphicon glyphicon-chevron-right"></i>${pdto.project_name}
			<c:if test="${pdto.project_level != 1000 }">
				<div id="trash" ondrop="drop(event)" class="btn-lg"
					ondragenter="trashColor()" ondragleave="trashColorReturn()"
					ondragstart="drag(event)" ondragover="allowDrop(event)">
					<span id="trash_i" class="glyphicon glyphicon-trash"
						aria-hidden="true" ondragover="trashColor()"></span>
				</div>
			</c:if>
			</h3>
		</div>
		<c:set var="pdto" value="${pdto}"></c:set>
		<c:choose>
			<c:when
				test="${(empty pdto.category_dtos) or pdto.category_dtos[0].category_idx == 0}"></c:when>
			<c:otherwise>
				<c:forEach var="cdto" items="${pdto.category_dtos}">
					<div class="category" id="cp${cdto.category_idx}">

						<!--카테고리 이름  -->
						<div class="category_head" id="c${cdto.category_idx}"
							draggable="true" ondragover="allowDrop(event)"
							ondragstart="drag(event)">
							<c:choose>
								<c:when test="${pdto.project_level eq 1000 }">
									<span>${cdto.category_name }</span>
								</c:when>
								<c:otherwise>
									<form name="cateUp" action="javascript:categoryUpdate(${cdto.category_idx})">
										<div id="cate${cdto.category_idx}" class="cateName">
											<input id="cateIn${cdto.category_idx}" type="text" value="${cdto.category_name }" size="16px">
											&nbsp;&nbsp; <i class="glyphicon glyphicon-remove"
												onclick="cateNameRe(${cdto.category_idx})"></i>
										</div>
										<div id="a_cate${cdto.category_idx}">
											<a id="aa_cate${cdto.category_idx}" href="javascript:cateName(${cdto.category_idx})">${cdto.category_name }</a>
											&nbsp;&nbsp; <i class="glyphicon glyphicon-plus"
												onclick="showf(${cdto.category_idx})"></i>

										</div>
									</form>
								</c:otherwise>
							</c:choose>
						</div>

						<c:if test="${not empty cdto.work_dtos}">
							<c:forEach var="wdto" items="${cdto.work_dtos }">
							<c:choose>
								<c:when test="${wdto.work_state eq 1}"><c:set var="pan" value="panel-info"></c:set></c:when>
								<c:when test="${wdto.work_state eq 2}"><c:set var="pan" value="panel-warning"></c:set></c:when>
								<c:when test="${wdto.work_state eq 3}"><c:set var="pan" value="panel-success"></c:set></c:when>
							</c:choose> 
								<div class="panel ${pan}">
								<div id="wdiv${wdto.work_idx}" class="wdiv panel-heading" draggable="true"
									ondragover="allowDrop(event)" ondragstart="drag(event)">
									<i id="showWork${wdto.work_idx}" ${wdto.work_state eq 3?'class="glyphicon glyphicon-menu-right"' :'class="glyphicon glyphicon-menu-down"' }></i>
									&nbsp;<span onclick="showWorkTable(${wdto.work_idx})">${wdto.work_title}</span>
							<c:set var="wstart"><f:formatDate value="${wdto.work_start}" type="both" pattern="yyyy/MM/dd  hh:mm a"/></c:set>
							<c:set var="wend"><f:formatDate value="${wdto.work_end}" type="both" pattern="yyyy/MM/dd  hh:mm a"/></c:set>
									<c:if test="${pdto.project_level != 1000 }">
										<span onclick="workUpdate(${wdto.work_idx},'${wstart}','${wend}','${wdto.work_confirm}')">
										<i class="glyphicon glyphicon-cog"></i></span>
									</c:if>

								</div>
								<div class="panel-body" style="padding: 0px;">
								<table id="workTable${wdto.work_idx}" class="cate_table" ${wdto.work_state eq 3?'style="display:none;"' :'' } >
									<tbody>
										<tr>
											<td colspan="2">
												<div class="table_i glyphicon glyphicon-calendar"></div>
												&nbsp;${wstart}<br>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												~${wend}
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<div class="table_i glyphicon glyphicon-user"></div> <c:forEach
													var="mdto" items="${marr}">
													<c:if test="${mdto.work_idx eq wdto.work_idx}">
														<span>${mdto.member_name}</span>
													</c:if>
												</c:forEach>

											</td>
										</tr>
										<tr>
											<td colspan="2">
												<form action="javascript:addCheck(${wdto.work_idx})">
												<div class="table_i glyphicon glyphicon-check" onclick="showChecklist(${wdto.work_idx})"></div>
											<c:choose>
													<c:when test="${pdto.project_level != 1000 }">
															<input type="text" id="content${wdto.work_idx}" placeholder="체크리스트" style="width: 60%;" required="required">
															&nbsp;<i class="glyphicon glyphicon-plus" onclick="addCheck(${wdto.work_idx})"></i>
													</c:when>
													<c:otherwise>
														<span>체크리스트</span>
													</c:otherwise>
												</c:choose>
												</form>
											</td>
										</tr>
										<tr>
											<td colspan="2">
											<div class="scr">
												<div class="check_div" id="check_div${wdto.work_idx}">
													<c:set var="chTotal" value="0"></c:set>
													<c:set var="chChecked" value="0"></c:set>
													<c:forEach var="chdto" items="${wdto.checklist_dtos}"
														varStatus="status">
														<div id="div_ch${chdto.checklist_idx }"
															style="display:${chdto.checklist_state eq '1' ? 'none' : 'block' }"
															draggable="true" ondragover="allowDrop(event)"
															ondragstart="drag(event)">
															<c:choose>
																<c:when test="${pdto.project_level != 1000 }">
																	<a onclick="javascript:check(${chdto.checklist_idx })">
																</c:when>
																<c:otherwise>
																	<a>
																</c:otherwise>
															</c:choose>
															<i id="ch${chdto.checklist_idx }"
																class="${chdto.checklist_state eq '1' ? 'glyphicon glyphicon-ok' : 'glyphicon glyphicon-unchecked' }">
															</i> ${chdto.checklist_content} </a> <input type="hidden"
																id="ch_state${chdto.checklist_idx}"
																value="${chdto.checklist_state}">
														</div>
														<c:if test="${status.last}">
															<c:set var="chTotal" value="${status.count}"></c:set>
														</c:if>
														<c:if test="${chdto.checklist_state eq '1'}">
															<c:set var="chChecked" value="${chChecked+1}"></c:set>
														</c:if>
													</c:forEach>
													<input type="hidden" id="checkHide${wdto.work_idx}"
														value="0">
												</div>
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="2" align="right"><a
												id="aCheck${wdto.work_idx}"
												href="javascript:showCheck(${wdto.work_idx})">완료한 체크리스트
													보기</a>&nbsp;</td>
										</tr>
										<tr>
											<td colspan="2">
												<div class="progress"
													style="margin-bottom: 2px; height: 12px;">
													<div id="chBar${wdto.work_idx}"
														class="progress-bar progress-bar-primary "
														style="width: ${chChecked/chTotal * 100}%;"></div>
												</div> <input type="hidden" id="chTotal${wdto.work_idx}"
												value="${chTotal}"> <input type="hidden"
												id="chChecked${wdto.work_idx}" value="${chChecked}">
											</td>
										</tr>
										<c:remove var="chTotal" />
										<c:remove var="chChecked" />
										<tr>
											<td><div class="work_btn" id="workState${wdto.work_idx}">												
												<i name="1" class="glyphicon glyphicon-play-circle" ${wdto.work_state eq 1?'style="color:#367fa9;"':''} data-toggle="tooltip" data-placement="bottom" title="업무 진행 중" onclick="workDone(${wdto.work_idx},1)"></i>
											<c:if test="${wdto.work_confirm ==10}">
												<i name="2" class="glyphicon glyphicon-record" ${wdto.work_state eq 2?'style="color:#f0ad4e;" data-toggle="tooltip" data-placement="bottom" title="결재 대기"':'data-toggle="tooltip" data-placement="bottom" title="결재 요청"'} onclick="workDone(${wdto.work_idx},2)"></i>
											</c:if>
												<i name="3" class="glyphicon glyphicon-ok-circle" ${wdto.work_state eq 3?'style="color:green;"':''} data-toggle="tooltip" data-placement="bottom" title="완료된 업무" onclick="workDone(${wdto.work_idx},3)"></i>
											</div></td>
											<%-- <c:choose>
												<c:when test="${wdto.work_state == 3 }">
													<td><div class="work_btn"><i class="glyphicon glyphicon-ok-sign" style="color: green;"></i></div></td>
												</c:when>
												<c:when test="${wdto.work_state + wdto.work_confirm == 11 }">
													<c:choose>
														<c:when test="${pdto.project_level == 3000 }">
															<td>
																<td><div class="work_btn">업무 완료</div>
															</td>
														</c:when>
														<c:otherwise>
															<td><div class="work_btn">결재 요청</div></td>
														</c:otherwise>
													</c:choose>
												</c:when>
												<c:when test="${wdto.work_state + wdto.work_confirm == 12 }">
													<c:choose>
													<c:when test="${pdto.project_level == 3000 }">
													<td>
														<div class="work_btn">결재 승인</div>
														<div class="work_btn">결재 거절</div>
													</td>
													</c:when>
													<c:otherwise>
													<td><div class="work_btn">결재 대기 중</div></td>
													</c:otherwise>
													</c:choose>
												</c:when>
												<c:when test="${wdto.work_state + wdto.work_confirm == 21 }">
													<td><div class="work_btn">업무 완료</div></td>
												</c:when>
											</c:choose> --%>

											<td align="right">
												<a href="#" onclick="workSide('${wdto.work_idx}','${project_idx}')" class="menu-toggle">코멘트</a>/ 
												<a href="#" onclick="workSide('${wdto.work_idx}','${project_idx}')" class="menu-toggle">첨부파일</a>	
											</td>
										</tr>
									</tbody>
								</table>
								</div>
							</div>
							</c:forEach>
						</c:if>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>


		<c:if test="${pdto.project_level !=1000 }">
			<!-- category add -->
			<div class="category" id="addCate" style="padding-left: 10px;">
				<form name="newCategory" action="javascript:categoryAdd()">
					<input type="text" class="form-control" name="category_name"
						placeholder="새로운 카테고리">
				</form>
			</div>
		</c:if>
	</div>

<!--옵션,코멘트, 첨부 파일 div 시작  -->
													
<div id="right-side">
	
	<div id="sidebar-wrapper">
	    
		<div>
			<%@include file="projectRightSide.jsp"%>
		</div>
	
	</div>
</div>
<!--옵션,코멘트, 첨부 파일 div 끝  -->


	<!-- 업무 설정 modal -->
	<form name="newWork" id="newWork" action="workAdd.do" method="post">
		<div id="workback" onclick="closem()" onmouseover="hideTen()"></div>
		<div id="work_modal">
<%-- 		<%@include file="/WEB-INF/view/work/workAddForm.jsp"%> --%>
  			<button type="button" class="close" style="padding: 10px; color:white;"onclick="closem()">×</button>	
			<h4 class="modal-title" style=" background: #222d32;  padding: 10px; border-radius: 0px; color:white;"><i class="glyphicon glyphicon-plus"></i> Add Work</h4>
			<div id="w_modal">
				<div id="btnwork">
					<div style=" padding:10px;">
						<input type="hidden" name="category_idx" value=""> <label>업무명
						</label>&nbsp;&nbsp;<input type="text" name="work_title">
					</div>
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-addon">
								<i class="fa fa-clock-o"></i>
							</div>
							<input type="text" class="form-control pull-right" placeholder="기한을 체크해주세요."
								name="workdate" id="workdate" />
						</div>
					</div>
					<div align="center" style="padding:5px;">
						<input type="checkbox"  name="work_confirm">결재여부
						<button type="button" class="btn btn-next" style="background-color:#1e282c; color:white;"  id="btn-worknext"
							onclick="shows()">다음</button>
					</div>
				</div>
			</div>
			<div id="btnwork2">
				<div align="center">
					<div class="workmember_div">
						<h4 class="text-center">프로젝트 멤버 목록</h4>
						<div id="project_m"
							style="width: 100%; height: 320px; overflow-y: scroll"
							ondrop="drop3(event)" ondragover="allowDrop(event)"
							ondragstart="drag(event)"></div>
					</div>
					<div class="workmember_div" ondrop="drop(event)"
						ondragover="allowDrop(event)" ondragstart="drag(event)">
						<h4 class="text-center">업무 담당자</h4>
						<div id="work_m"
							style="width: 100%; height: 320px; overflow-y: scroll"
							ondrop="drop2(event)" ondragover="allowDrop(event)"
							ondragstart="drag(event)"></div>
					</div>
			
				</div>
				<div align="center" style="padding:7px;">
					<button type="button" class="btn btn-next" style="background-color:#1e282c; color:white;" id="btn-workbefore"
						onclick="showf()">이전</button>
					<button type="button" class="btn btn-next" style="background-color:#1e282c; color:white;" id="btn-workok"
						onclick="addWork()">완료</button>
				</div> 
			</div>
		</div>
	</form>
	<!-- 업무 수정 modal -->
	<form name="changeWork" action="workUpdate.do" method="post">
		<div id="workback2" onclick="closem()" onmouseover="hideTen()"></div>
		<div id="work_modal2">
 		<%-- <%@include file="/WEB-INF/view/work/workUpdateForm.jsp"%> --%>
  			<button type="button" class="close" style="padding: 10px; color:white;" onclick="closem()">×</button>
			<h4 class="modal-title" style=" background: #222d32;  padding: 10px; border-radius: 0px; color:white;">업무 수정</h4>
			<div id="w_modal2">
				<div id="btnwork3">
					<div style=" padding:10px;">
						<input type="hidden" name="work_idx"> <label>업무명 </label>&nbsp;&nbsp;<input type="text" name="work_title">
					</div>
					<div class="form-group">
						<label>기한 </label>
						<div class="input-group">
							<div class="input-group-addon">
								<i class="fa fa-clock-o"></i>
							</div>
							<div>
								<input type="text" class="form-control pull-right"
									name="workdateup" id="workdateup" />
							</div>
						</div>
					</div>
					<div align="right">
						<input type="checkbox" name="work_confirm">결재여부
						<button type="button" class="btn btn-next" id="btn-worknext"
							onclick="shows2()" style="background-color:#1e282c; color:white;" >다음</button>
					</div>
				</div>
			</div>
			<div id="btnwork4">
				<div align="center">
					<div class="workmember_div">
						<h4 class="text-center">프로젝트 멤버 목록</h4>
						<div id="project_m2"
							style="width: 100%; height: 320px; overflow-y: scroll"
							ondrop="drop5(event)" ondragover="allowDrop(event)"
							ondragstart="drag(event)"></div>
					</div>
					<div class="workmember_div" ondrop="drop(event)"
						ondragover="allowDrop(event)" ondragstart="drag(event)">
						<h4 class="text-center">업무 담당자</h4>
						<div id="work_m2"
							style="width: 100%; height: 320px; overflow-y: scroll"
							ondrop="drop4(event)" ondragover="allowDrop(event)"
							ondragstart="drag(event)"></div>
					</div>
				</div>
				<div align="center">
					<button type="button" style="background-color:#1e282c; color:white;"  class="btn btn-next" id="btn-workbefore"
						onclick="showf2()">이전</button>
					<button type="button" style="background-color:#1e282c; color:white;"  class="btn btn-next" id="btn-workok"
						onclick="updateWork()">완료</button>
				</div>
			</div>
		</div>
		
	</form>
	<div id="tendency_pop">
		<div id=ten></div>
		<div id="chartdiv"></div>
	</div>
	
	<%@include file="/WEB-INF/view/footer.jsp"%>
</body>
<script>
/* 첨부파일 관련 */
$("#menu-close").click(function(e) {
  e.preventDefault();
  $("#sidebar-wrapper").toggleClass("active");
});
$(".menu-toggle").click(function(e) {
  e.preventDefault();
  $("#sidebar-wrapper").toggleClass("active");
});

</script>
</html>