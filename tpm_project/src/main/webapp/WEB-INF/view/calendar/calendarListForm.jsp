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
<link href="/tpm_project/css/skin/boxSkin.css?ver=2" rel="stylesheet">
<script src="/tpm_project/js/calendar/moment.min.js?ver=1"></script>
<script src="/tpm_project/js/calendar/fullcalendar.min.js?ver=1"></script>
<!-- iCheck 1.0.1 -->
<script src="/tpm_project/plugins/iCheck/icheck.min.js"></script>

<script type="text/javascript">
function calendarReload(){
	$.ajax({
		url : 'calendarList.do',
		type : 'post',
		dataType : 'json', // 제이슨 형식으로 넘어온다.
		success : function(calevents) {
			window.alert(JSON.stringify(calevents));
			$.each(calevents, function(i, calevent){
				$('#calendar').fullCalendar('renderEvent',
						calevent, true);
			});
		}
	});
}

	$(document).ready(function() {
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
	    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
	      checkboxClass: 'icheckbox_flat-green',
	      radioClass: 'iradio_flat-green'
	    });

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
<body class="skin-${sessionScope.s_member_thema}" onload="calendarReload()">
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
								<h3 class="box-title">필터</h3>
								<div class="box-tools">
									<div class="input-group">
										<input type="text" name="table_search"
											onkeyup="startSuggest('channel_list_table', this)"
											class="form-control input-sm pull-right" style="width: 100px;"
											placeholder="Search" />
										<div class="input-group-btn">
											<button class="btn btn-sm btn-default">
												<i class="fa fa-search"></i>
											</button>
											<button class="btn btn-sm btn-default"
												onclick="showCreateChannelModal()">
												<i class="fa fa-plus"></i>
											</button>
										</div>
	
									</div>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body table-responsive no-padding"
								id="chat_channel_list_div">
								<table class="table table-hover" id="channel_list_table">
									<tr>
										<th>
											<div>
											<label><input type="checkbox" class="flat-red">&nbsp;진행 중 업무</label>
											</div>
										</th>
									</tr>
									<tr>
										<th>
											<div>
											<label><input type="checkbox" class="flat-red">&nbsp;마감일 지난 업무</label>
											</div>
										</th>
									</tr>
									<tr>
										<th>
											<div>
											<label><input type="checkbox" class="flat-red">&nbsp;결재 미요청 업무</label>
											</div>
										</th>
									</tr>
									<tr>
										<th>
											<div>
											<label><input type="checkbox" class="flat-red">&nbsp;결재 대기 업무</label>
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
								<h3 class="box-title">프로젝트</h3>
								<div class="box-tools">
									<div class="input-group">
										<input type="text" name="table_search"
											onkeyup="startSuggest('channel_list_table', this)"
											class="form-control input-sm pull-right" style="width: 100px;"
											placeholder="Search" />
										<div class="input-group-btn">
											<button class="btn btn-sm btn-default">
												<i class="fa fa-search"></i>
											</button>
											<button class="btn btn-sm btn-default"
												onclick="showCreateChannelModal()">
												<i class="fa fa-plus"></i>
											</button>
										</div>
	
									</div>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body table-responsive no-padding"
								id="calendar_project_list_div">
								<table class="table table-hover" id="calendar_project_list_table">
									<tr>
										<th>
											<div>
											<label><input type="checkbox" class="flat-red">&nbsp;진행 중 업무</label>
											</div>
										</th>
									</tr>
									<tr>
										<th>
											<div>
											<label><input type="checkbox" class="flat-red">&nbsp;마감일 지난 업무</label>
											</div>
										</th>
									</tr>
									<tr>
										<th>
											<div>
											<label><input type="checkbox" class="flat-red">&nbsp;결재 미요청 업무</label>
											</div>
										</th>
									</tr>
									<tr>
										<th>
											<div>
											<label><input type="checkbox" class="flat-red">&nbsp;결재 대기 업무</label>
											</div>
										</th>
									</tr>
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
						<div class="box box-primary">
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