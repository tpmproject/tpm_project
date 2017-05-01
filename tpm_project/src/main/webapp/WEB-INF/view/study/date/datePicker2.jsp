<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap 3.3.2 -->
<link href="/tpm_project/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
 <!-- daterange picker -->
<!--  <link rel="stylesheet" href="/tpm_project/plugins/daterangepicker/daterangepicker.css"> -->
<link href="/tpm_project/css/daterangepicker/daterangepicker-bs3.css"
	rel="stylesheet" type="text/css">

<!-- jQuery 2.1.3 -->
<script src="/tpm_project/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/tpm_project/js/calendar/moment.min.js?ver=1"></script>
<!-- Bootstrap 3.3.2 JS -->
<script src="/tpm_project/js/bootstrap.min.js" type="text/javascript"></script>
<!-- date-range-picker -->
<!-- <script src="/tpm_project/plugins/daterangepicker/daterangepicker.js"></script> -->
<script src="js/daterangepicker/daterangepicker.js" type="text/javascript"></script>
<script>
$(function () {
	 //Date range picker with time picker
    $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'YYYY/MM/DD h:mm A'});
});	

function goController() {
	$('#datePickerForm').submit();
}
</script>
</head>
<body>
	<!-- Date and time range -->
	<div class="form-group">
		<label>Date and time range:</label>
		<div class="input-group">
			<div class="input-group-addon">
				<i class="fa fa-clock-o"></i>
			</div>
			<form id="datePickerForm" action="dateStudy5.do" method="post">
				<input type="text" class="form-control pull-right" name="t_date"
					id="reservationtime" />
			</form>
		</div>
		<!-- /.input group -->
	</div>
	<!-- /.form group -->
	<button class="btn btn-block btn-success" onclick="goController()">Success</button>
	
</body>
</html>