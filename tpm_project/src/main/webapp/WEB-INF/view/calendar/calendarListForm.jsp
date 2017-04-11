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
<%@ include file="/sample/cho/main/calender_import.jsp"%>
<link href='fullcalendar.min.css' rel='stylesheet' />
<link href='fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='moment.min.js'></script>
<script src='jquery.min.js'></script>
<script src='fullcalendar.min.js'></script>

<script type="text/javascript">
function calendarReload(){
	$.ajax({
		url : 'calendarList.do',
		type : 'post',
		dataType : 'json', // 제이슨 형식으로 넘어온다.
		success : function(calevents) {
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
		function ini_events(ele) {
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
		ini_events($('#external-events div.external-event'));

		/* initialize the calendar
		 -----------------------------------------------------------------*/
		//Date for the calendar events (dummy data)
		/* var date = new Date();
		var d = date.getDate(), m = date.getMonth(), y = date.getFullYear();
		var date2 = new Date(y, m, d - 5);
		var date2 = new Date(2017, 03, 05);
		var date2 = new Date("2017-04-06");
		console.log(date2); */
		
		$('#calendar').fullCalendar({
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
					slotLabelFormat: 'tt hh',
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

		/* ADDING EVENTS */
		var currColor = "#3c8dbc"; //Red by default
		//Color chooser button
		var colorChooser = $("#color-chooser-btn");
		$("#color-chooser > li > a").click(function(e) {
			e.preventDefault();
			//Save color
			currColor = $(this).css("color");
			//Add color effect to button
			$('#add-new-event').css({
				"background-color" : currColor,
				"border-color" : currColor
			});
		});
		$("#add-new-event").click(function(e) {
			e.preventDefault();
			//Get value and make sure it is not null
			var val = $("#new-event").val();
			if (val.length == 0) {
				return;
			}

			//Create events
			var event = $("<div />");
			event.css({
				"background-color" : currColor,
				"border-color" : currColor,
				"color" : "#fff"
			}).addClass("external-event");
			event.html(val);
			$('#external-events').prepend(event);

			//Add draggable funtionality
			ini_events(event);

			//Remove event from text input
			$("#new-event").val("");
		});
	});
</script>
</head>
<body class="skin-blue" onload="calendarReload()">
	<div class="wrapper">
		<%@ include file="/WEB-INF/view/header.jsp"%>
		<%@ include file="/WEB-INF/view/aside.jsp"%>

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
					<div class="col-md-3">
						<div class="box box-solid">
							<div class="box-header with-border">
								<h4 class="box-title">Draggable Events</h4>
							</div>
							<div class="box-body">
								<!-- the events -->
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
							<!-- /.box-body -->
						</div>
						<!-- /. box -->
						<div class="box box-solid">
							<div class="box-header with-border">
								<h3 class="box-title">Create Event</h3>
							</div>
							<div class="box-body">
								<div class="btn-group" style="width: 100%; margin-bottom: 10px;">
									<!--<button type="button" id="color-chooser-btn" class="btn btn-info btn-block dropdown-toggle" data-toggle="dropdown">Color <span class="caret"></span></button>-->
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
								<!-- /btn-group -->
								<div class="input-group">
									<input id="new-event" type="text" class="form-control"
										placeholder="Event Title">
									<div class="input-group-btn">
										<button id="add-new-event" type="button"
											class="btn btn-primary btn-flat">Add</button>
									</div>
									<!-- /btn-group -->
								</div>
								<!-- /input-group -->
							</div>
						</div>
					</div>
					<!-- /.col -->
					<div class="col-md-9">
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

		<%@ include file="/WEB-INF/view/footer.jsp"%>
	</div>
</body>
</html>