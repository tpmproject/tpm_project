<%@page import="tpm.work.model.MyWorkDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/view/include/import.jsp"%>
<link href="/tpm_project/css/calendar/fullcalendar.min.css?ver=1" rel="stylesheet" />
<link href="/tpm_project/css/calendar/fullcalendar.print.min.css?ver=1" rel="stylesheet" media='print' />
<!-- iCheck for checkboxes and radio inputs -->
<link rel="stylesheet" href="/tpm_project/plugins/iCheck/all.css">
<!-- daterange picker -->
<!-- <link rel="stylesheet" href="/tpm_project/plugins/daterangepicker/daterangepicker.css"> -->
<link href="/tpm_project/css/daterangepicker/daterangepicker-bs3.css"
	rel="stylesheet" type="text/css">
  
<link href="/tpm_project/css/skin/boxSkin.css?ver=2" rel="stylesheet">
<script src="/tpm_project/js/calendar/moment.min.js?ver=1"></script>
<script src="/tpm_project/js/calendar/fullcalendar.min.js?ver=1"></script>
<!-- iCheck 1.0.1 -->
<script src="/tpm_project/plugins/iCheck/icheck.min.js"></script>
<!-- <script src="/tpm_project/plugins/daterangepicker/daterangepicker.js"></script> -->
<script src="js/daterangepicker/daterangepicker.js" type="text/javascript"></script>
<!-- Slimscroll -->
<script src="/tpm_project/js/scroll/jquery.slimscroll.min.js"></script>

<style>
#loading_div{
	display:inline-block;
	position: fixed;
	background: black;
	opacity: 0.7;
	width: 110%;
	height: 110%;
	top: -10px;
	left: -10px;
	z-index: 9000;
}
#load_s{
	position: fixed;
	top: 40%;
	left: 40%;
	z-index: 9001;
}
#load_s a{
	color:white;
	font-size: 100px;
}

.show-blind{
	display: none;
}
.bg-progressing {
	color: #fff;
    border-color: #308dcc;
    background: #3498db;
}
.bg-approvalwait {
	color: #fff;
    border-color: #d67520;
    background: #e67e22;
}
.bg-closingdateexcess {
	color: #fff;
    border-color: #cf4436;
    background: #e74c3c;
}
.bg-complete {
	color: #fff;
    border-color: #29b765;
    background: #2ecc71;
}
</style>
<script type="text/javascript">
var currCalendarData;
var originalData;


function initCalenderPage(){
	initMyProjectList();
	initMyWorkListData();
	
	//Date range picker with time picker
    $('#reservationtime').daterangepicker({
    	timePicker: true, 
    	timePickerIncrement: 30, 
    	format: 'YYYY/MM/DD h:mm A'
    }); 
	
   /*  $('#reservationtime').daterangepicker({
        timePicker: false, timePickerIncrement: 30,
        //format: 'DD-MM-YYYY hh:mm:ss',
        format: 'DD-MM-YYYY',
        timePicker12Hour: false, 
        opens: 'left',
        locale: { cancelLabel: 'Clear' },
        function(start, end, label) {
			console.log(start.toLocaleString() + end.toLocaleString() + label);
        }
 	}); */
 
	
    /* $('#reservationtime').on('apply.daterangepicker', function(ev, picker) {
        //$(this).val(picker.startDate.format('MM/DD/YYYY') + ' - ' + picker.endDate.format('MM/DD/YYYY'));
        //window.alert('1');
    }); */
}
function projectIdxCheck(project_idx){
	var projectListCheckBox = $('input[name="checkBox_MyProjectList"]:checked');
	
	for(var i = 0 ; i < projectListCheckBox.length ; i++){
		if(project_idx == $(projectListCheckBox).eq(i).val()){
			return true;	
		}
	}
	return false;
}
var testDate;
function calendarReload(){
	
	var arry_pdto = originalData;
	var temp_arry = [];
	
	//window.alert($('#reservationtime').val());
	
	for(var i = 0 ; i < arry_pdto.length; i++){
		var project_name = arry_pdto[i].project_name;
		
		// 프로젝트 리스트 체크박스 체크..
		if(projectIdxCheck(arry_pdto[i].project_idx)){
			
			var arry_cdto = arry_pdto[i].arry_cdto;
			for(var j = 0 ; j < arry_cdto.length ; j++){
				var category_name = arry_cdto[j].category_name;
				
				var arry_wdto = arry_cdto[j].arry_wdto;
				for(var k = 0 ; k < arry_wdto.length ; k++){
					var work_title = arry_wdto[k].work_title;
					var work_start = arry_wdto[k].work_start;
					var work_end = arry_wdto[k].work_end;
					var work_state = arry_wdto[k].work_state;
					testDate = work_end;
					
					//window.alert(work_title + "- START : " + moment(work_start).format('YYYY-MM-DD, h:mm:ss a'));
					
					
					//window.alert(work_title + "- END : " + moment(work_end).format('YYYY-MM-DD, h:mm:ss a'));
					/* window.alert(work_title + "- START : " + new Date(work_start));
					
					if($('#reservationtime').val() != ''){
						window.alert(work_title + "- START : " + new Date($('#reservationtime').val()));
					} */
					
					var calendarInfo = {};
					calendarInfo.title = project_name + '>' + category_name + '>' + work_title;
					//calendarInfo.allDay = 'false';
					//calendarInfo.start = moment(work_start).format('YYYY-MM-DD, h:mm:ss a');
					//calendarInfo.end = moment(work_end).format('YYYY-MM-DD, h:mm:ss a');
					//calendarInfo.start = work_start;
					//calendarInfo.end = work_end;
					
					
					calendarInfo.start = new Date(work_start);
					calendarInfo.end = new Date(work_end);
					
					// 진행중인 업무
					if(work_state == '1'){
						var date = new Date();
						// 마감일 지난 업무
						if(date >= new Date(work_end)){
							calendarInfo.className = 'bg-closingdateexcess';
						} else {
							calendarInfo.className = 'bg-progressing';
						}
					// 결제 대기
					} else if(work_state == '2'){
						calendarInfo.className = 'bg-approvalwait';
					// 결제 완료 및 완료
					} else if(work_state == '3'){					
						calendarInfo.className = 'bg-complete';			
					}
					
					calendarInfo.editable = 'true';
					//temp_arry.push(calendarInfo);
					
					//기간 필터
					if($('#reservationtime').val() != ''){
						var filterDateStr = $('#reservationtime').val().split('-');
						var filterStartDateStr = filterDateStr[0].trim();
						var filterEndDateStr = filterDateStr[1].trim();
						
						var filterStartDate = Date.parse(filterStartDateStr);
						var filterEndDate = Date.parse(filterEndDateStr);
						
						if(filterStartDate <= work_end && filterEndDate >= work_end){
							temp_arry.push(calendarInfo);
						}	
					
					} else {
						temp_arry.push(calendarInfo);
					}
				}
			}
		}
	}
	
	currCalendarData = temp_arry;
	
	$('#calendar').fullCalendar( 'removeEvents');
	$.each(currCalendarData, function(i, calevent){
		$('#calendar').fullCalendar('renderEvent',
				calevent, true);
	});
	
	makePopover();
	
}
function makePopover(){
	$('.bg-progressing').eq(0).attr('data-toggle','popover');
	$('.bg-progressing').eq(0).attr('title','Popover HTML Header');
	$('.bg-progressing').eq(0).attr('data-content','<div class="jumbotron">Some HTML content inside the popover</div>');
	
	var options =
    {
      placement: function (context, source)
      {
        var position = $(source).position();
        var content_width = 515;  //Can be found from a JS function for more dynamic output
        var content_height = 110;  //Can be found from a JS function for more dynamic output

        if (position.left > content_width)
        {
          return "left";
        }

        if (position.left < content_width)
        {
          return "right";
        }

        if (position.top < content_height)
        {
          return "bottom";
        }

        return "top";
      }
      , trigger: "hover"
      , animation: "true"
      , html:"true"
    };
	$('[data-toggle="popover"]').popover(options);
}
function FilterReload(){
	
	var FilterListCheckBox = $('input[name="checkBox_FilterList"]');
	for(var i = 0 ; i < FilterListCheckBox.length; i++){
		
		if($(FilterListCheckBox).eq(i).is(':checked')){
			if($(FilterListCheckBox).eq(i).val() == 'filter_progressing'){
				$('.bg-progressing').show();
			} else if($(FilterListCheckBox).eq(i).val() == 'filter_closingdateexcess'){
				$('.bg-closingdateexcess').show();
			} else if($(FilterListCheckBox).eq(i).val() == 'filter_approvalwait'){
				$('.bg-approvalwait').show();
			} else if($(FilterListCheckBox).eq(i).val() == 'filter_complete'){
				$('.bg-complete').show();	
			}
		} else {
			if($(FilterListCheckBox).eq(i).val() == 'filter_progressing'){
				$('.bg-progressing').hide();
			} else if($(FilterListCheckBox).eq(i).val() == 'filter_closingdateexcess'){
				$('.bg-closingdateexcess').hide();
			} else if($(FilterListCheckBox).eq(i).val() == 'filter_approvalwait'){
				$('.bg-approvalwait').hide();
			} else if($(FilterListCheckBox).eq(i).val() == 'filter_complete'){
				$('.bg-complete').hide();	
			}
		}
		
		
	}
	
}
function initMyWorkListData(){
	$.ajax({
		url : 'calendarJsonList.do',
		type : 'post',
		dataType : 'json', // 제이슨 형식으로 넘어온다.
		success : function(json) {
			//window.alert(JSON.stringify(json));
			originalData = json;
			
			calendarReload();
			FilterReload();
		}
	});
	
	/* $.ajax({
	url : 'calendarJsonList.do',
	type : 'post',
	dataType : 'json', // 제이슨 형식으로 넘어온다.
	success : function(calevents) {
		window.alert(JSON.stringify(calevents));
		$.each(calevents, function(i, calevent){
			$('#calendar').fullCalendar('renderEvent',
					calevent, true);
		});
	}
	}); */
}

function initMyProjectList(){
	$.ajax({
		url : 'calendarMyProjectList.do',
		type : 'post',
		dataType : 'json', // 제이슨 형식으로 넘어온다.
		success : function(json) {
			//window.alert(JSON.stringify(json));
			
			var innerMsg = '';
			for(var i = 0 ; i < json.length; i++){
				innerMsg += '<tr>';
				innerMsg += 	'<th>';
				innerMsg += 		'<div>';
				innerMsg += 			'<label><input type="checkbox" name="checkBox_MyProjectList" class="flat-red" value="' + json[i].project_idx +'" checked>&nbsp;' + json[i].project_name + '</label>';
				innerMsg += 		'</div>';
				innerMsg += 	'</th>';
				innerMsg += '</tr>';
			}
			
			$('#calendar_project_list_table').html(innerMsg);
			
			iCheckPlugin();
			
			$('#calendar_project_list_div').slimScroll({
		        height: '296px' // 스크롤 처리할 div 의 길이
		    }).bind('slimscrolling', function(e, pos) {
		    	//window.alert("Scroll value: " + pos + "px");
		       // $('#testDivOut2').append("Scroll value: " + pos + "px");
		    });
			
			/* $('.applyBtn').click(function (){
				calendarReload();
			}); */
			//$('.applyBtn$('input[name="checkBox_MyProjectList"]:checked')
		}
	});
}

function iCheckPlugin(){
	$('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
	    checkboxClass: 'icheckbox_flat-green',
	    radioClass: 'iradio_flat-green'
  	});
	
	
	$('input[name="checkBox_MyProjectList"]').on('ifChanged', function (e) {
		calendarReload();
	});
	
	$('input[name="checkBox_FilterList"]').on('ifChanged', function (e) {
		FilterReload();
		
	});
}

function startSuggest_projectList(id, me){
	
	   var list = $('#' + id).find('tbody tr');
	  
	   for(var i = 0 ; i < list.length; i++){
		   
		   // 포함 되어있지 않다면 -1 리턴
		   if($(list).find('th div label').eq(i).text().trim().indexOf($(me).val().trim()) == -1){
			   $(list).eq(i).addClass('show-blind');  
		   }else{
			   $(list).eq(i).removeClass('show-blind');
		   }
	   }
		/* if(checkFirst == false){
			setTimeout('goSearch_member()', 100);
		}
		checkFirst = true; */
}

	$(document).ready(function() {
		
		$('#loading_div').hide();
	
		$('#load_s').hide();
		
		
	  
		/* initialize the external events
		 -----------------------------------------------------------------*/
		/* function ini_events(ele) {
			ele.each(function() {

				// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
				// it doesn't need to have a start or end
				var eventObject = {
					title : $.trim($(this).text())
				// use the element's text as the event title
				};

				// store the Event Object in the DOM element so we can get to it later
				$(this).data('eventObject', eventObject);

				// make the event draggable using jQuery UI
				$(this).draggable({
					zIndex : 1070,
					revert : true, // will cause the event to go back to its
					revertDuration : 0
				//  original position after the drag
				});

			});
		}
		ini_events($('#external-events div.external-event')); */
		//Flat red color scheme for iCheck
	  
		
		
		$('#calendar').fullCalendar({
			
					/* height: 650, */
					header: {
						left: 'prev,next today',
						center: 'title',
						right: 'month,agendaWeek,agendaDay,listMonth'
					},
					buttonText : {
					    today:    '오늘',
					    month:    '월간',
					    week:     '주간',
					    day:      '일간',
					    list:     '리스트'
					}, 
					//slotLabelFormat: 'tt hh',
					navLinks: true, // can click day/week names to navigate views
					businessHours: true, // display business hours
					eventLimit: true, // allow "more" link when too many events
					dragscroll: true,
					editable: true, // 업무 수정 이동 여부
					eventDrop: function(event, delta, revertFunc) {

				        alert(event.title + " was dropped on " + event.start.format());

				        if (!confirm("Are you sure about this change?")) {
				            revertFunc();
				        }

				    },eventResize: function(event, delta, revertFunc) {

				        alert(event.title + " end is now " + event.end.format());

				        if (!confirm("is this okay?")) {
				            revertFunc();
				        }

				    },
				    
				    weekNumbers: true, // 주간별 번호 표시 클릭시 해당 주간 이동
					weekNumbersWithinDays: true,
					weekNumberCalculation: 'local',
					
					selectable: true, 
					selectHelper: true,
					select: function(start, end) { // 빈 날짜 선택시 이벤트
						var title = prompt('Event Title:');
						var eventData;
						if (title) {
							eventData = {
								title: title,
								start: start,
								end: end
							};
							$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
						}
						$('#calendar').fullCalendar('unselect');
					},
					
					droppable : true, // this allows things to be dropped onto the calendar !!!
					drop : function(date, allDay) { // this function is called when something is dropped

						// retrieve the dropped element's stored Event Object
						var originalEventObject = $(this).data('eventObject');

						// we need to copy it, so that multiple events don't have a reference to the same object
						var copiedEventObject = $.extend({},
								originalEventObject);

						// assign it the date that was reported
						copiedEventObject.start = date;
						window.alert(date);
						copiedEventObject.allDay = allDay;
						copiedEventObject.backgroundColor = $(this).css(
								"background-color");
						copiedEventObject.borderColor = $(this).css(
								"border-color");

						// render the event on the calendar
						// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
						$('#calendar').fullCalendar('renderEvent',
								copiedEventObject, true);

						// is the "remove after drop" checkbox checked?
						if ($('#drop-remove').is(':checked')) {
							// if so, remove the element from the "Draggable Events" list
							$(this).remove();
						}

					}
				});
	});
</script>
</head>
<body class="skin-${sessionScope.s_member_thema}" onload="initCalenderPage()">
<div id="loading_div"></div><span id="load_s"><a>Loading...</a></span>
	<div class="wrapper">
		<%@ include file="/WEB-INF/view/include/header.jsp"%>
		<%@ include file="/WEB-INF/view/include/aside.jsp"%>

		<!-- Right side column. Contains the navbar and content of the page -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Calendar <small>Control panel</small>
				</h1>

				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Calendar</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-md-4">
						<div class="box skin-border-top-color-${sessionScope.s_member_thema}">
							<div class="box-header">
								<i class="fa fa-filter" aria-hidden="true"></i>
								<h3 class="box-title">필터</h3>
								
							</div>
							<!-- /.box-header -->
							<div class="box-body table-responsive no-padding"
								id="chat_channel_list_div">
								<table class="table table-hover" id="channel_list_table">
									<tr>
										<th>
											<a id="try_ppover" href="#" data-toggle="popover" title="Popover HTML Header" data-content="<div class='jumbotron'>Some HTML content inside the popover</div>">Toggle popover</a>
										</th>
									</tr>
									<tr>
										<th>
											<!-- Date and time range -->
								              <div class="form-group">
								                <label>기간 선택:</label>
								
								                <div class="input-group">
								                  <div class="input-group-addon">
								                    <i class="fa fa-clock-o"></i>
								                  </div>
								                  <input type="text" class="form-control pull-right" id="reservationtime" >
								                  <div class="input-group-addon btn btn-sm btn-default" onclick="calendarReload()">
								                    <i class="fa fa-search" style="cursor: pointer" ></i>
								                  </div>
								                </div>
								                <!-- /.input group -->
								              </div>
								              <!-- /.form group -->
										</th>
									</tr>
									<tr>
										<th>
											<div>
											<label><input type="checkbox" name="checkBox_FilterList" class="flat-red" value="filter_progressing" checked>&nbsp;진행중인 업무</label>
											</div>
										</th>
									</tr>
									<tr>
										<th>
											<div>
											<label><input type="checkbox" name="checkBox_FilterList" class="flat-red" value="filter_closingdateexcess" checked>&nbsp;마감일 지난 업무</label>
											</div>
										</th>
									</tr>
									<tr>
										<th>
											<div>
											<label><input type="checkbox" name="checkBox_FilterList" class="flat-red" value="filter_approvalwait" checked>&nbsp;결제 대기 업무</label>
											</div>
										</th>
									</tr>
									<tr>
										<th>
											<div>
											<label><input type="checkbox" name="checkBox_FilterList" class="flat-red" value="filter_complete" checked>&nbsp;완료된 업무</label>
											</div>
										</th>
									</tr>
								</table>
							</div>
							<!-- /.box-body -->	
						</div>
						<!-- /.box -->
						
						<div class="box skin-border-top-color-${sessionScope.s_member_thema}">
							<div class="box-header">
								<i class="fa fa-list-ul" aria-hidden="true"></i>
								<h3 class="box-title">프로젝트</h3>
								<div class="box-tools">
									<div class="input-group">
										<input type="text" name="table_search"
											onkeyup="startSuggest_projectList('calendar_project_list_table', this)"
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
							<div class="box-body table-responsive no-padding" id="calendar_project_list_div"
								id="calendar_project_list_div">
								<table class="table table-hover" id="calendar_project_list_table">
									<!-- 프로젝트 리스트 데이터가 들어갈 곳 -->
								</table>
							</div>
							<!-- /.box-body -->	
						</div>
						<!-- /.box -->
					</div>
					<!-- <div class="col-md-3">
						<div class="box box-solid">
							<div class="box-header with-border">
								<h4 class="box-title">Draggable Events</h4>
							</div>
							<div class="box-body">
								the events
								<div id='external-events'>
									<div class='external-event bg-green'>Lunch</div>
									<div class='external-event bg-yellow'>Go home</div>
									<div class='external-event bg-aqua'>Do homework</div>
									<div class='external-event bg-light-blue'>Work on UI
										design</div>
									<div class='external-event bg-red'>Sleep tight</div>
									<div class="checkbox">
										<label for='drop-remove'> <input type='checkbox'
											id='drop-remove' /> remove after drop
										</label>
									</div>
								</div>
							</div>
							/.box-body
						</div>
						/. box
						<div class="box box-solid">
							<div class="box-header with-border">
								<h3 class="box-title">Create Event</h3>
							</div>
							<div class="box-body">
								<div class="btn-group" style="width: 100%; margin-bottom: 10px;">
									<button type="button" id="color-chooser-btn" class="btn btn-info btn-block dropdown-toggle" data-toggle="dropdown">Color <span class="caret"></span></button>
									<ul class="fc-color-picker" id="color-chooser">
										<li><a class="text-aqua" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-blue" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-light-blue" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-teal" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-yellow" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-orange" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-green" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-lime" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-red" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-purple" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-fuchsia" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-muted" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-navy" href="#"><i
												class="fa fa-square"></i></a></li>
									</ul>
								</div>
								/btn-group
								<div class="input-group">
									<input id="new-event" type="text" class="form-control"
										placeholder="Event Title">
									<div class="input-group-btn">
										<button id="add-new-event" type="button"
											class="btn btn-primary btn-flat">Add</button>
									</div>
									/btn-group
								</div>
								/input-group
							</div>
						</div>
					</div> -->
					<!-- /.col -->
					<div class="col-md-8">
						<div class="box skin-border-top-color-${sessionScope.s_member_thema}">
							<div class="box-body no-padding">
								<!-- THE CALENDAR -->
								<div id="calendar"></div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /. box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<%@ include file="/WEB-INF/view/include/footer.jsp"%>
	</div>
</body>
</html>