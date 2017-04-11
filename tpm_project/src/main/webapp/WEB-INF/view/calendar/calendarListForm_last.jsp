<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<!-- <link rel='stylesheet' href='../lib/cupertino/jquery-ui.min.css' /> -->
<link href="/tpm_project/css/calendar/fullcalendar.min.css?ver=1" rel="stylesheet" />
<link href="/tpm_project/css/calendar/fullcalendar.print.min.css?ver=1" rel="stylesheet" media='print' />
<script src="/tpm_project/js/calendar/moment.min.js?ver=1"></script>
<script src="/tpm_project/js/jquery.min.js?ver=1"></script>
<script src="/tpm_project/js/calendar/fullcalendar.min.js?ver=1"></script>




<script>

	$(document).ready(function() {

		$('#calendar').fullCalendar({
			//theme: true,
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
			defaultDate: '2017-04-14',
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

		    },
		    eventResize: function(event, delta, revertFunc) {

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
			events: [
				{
					title: 'Business Lunch',
					start: '2017-04-03T13:00:00',
					constraint: 'businessHours'
				},
				{
					title: 'Meeting',
					start: '2017-04-13T11:00:00',
					constraint: 'availableForMeeting', // defined below
					color: '#257e4a'
				},
				{
					title: 'Conference',
					start: '2017-04-18',
					end: '2017-04-20'
				},
				{
					title: 'Party1',
					start: '2017-04-28T12:30:00',
					end: '2017-04-28T13:30:00'
				},
				{
					title: 'Party',
					start: '2017-04-29T20:00:00'
				},
				{
					title: 'Party',
					start: '2017-04-29T20:00:00'
				},
				{
					title: 'Party',
					start: '2017-04-29T20:00:00'
				},
				{
					title: 'Party',
					start: '2017-04-29T20:00:00'
				},
				{
					title: 'Party',
					start: '2017-04-29T20:00:00'
				},
				{
					title: 'Party',
					start: '2017-04-29T20:00:00'
				},
				{
					title: 'Party',
					start: '2017-04-29T20:00:00'
				},
			
				// areas where "Meeting" must be dropped
				{
					id: 'availableForMeeting',
					start: '2017-04-11T10:00:00',
					end: '2017-04-11T16:00:00',
					rendering: 'background'
				},
				{
					id: 'availableForMeeting',
					start: '2017-04-13T10:00:00',
					end: '2017-04-13T16:00:00',
					rendering: 'background'
				},

				// red areas where no events can be dropped
				{
					start: '2017-04-24',
					end: '2017-04-28',
					overlap: false,
					rendering: 'background',
					color: '#ff9f89'
				},
				{
					start: '2017-04-06',
					end: '2017-04-08',
					overlap: false,
					rendering: 'background',
					color: '#ff9f89'
				}
			]
		});
		
	});

</script>
<style>

	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}

</style>
</head>
<body>

	<div id='calendar'></div>

</body>
</html>
