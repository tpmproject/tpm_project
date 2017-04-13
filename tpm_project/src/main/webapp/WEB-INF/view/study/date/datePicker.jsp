<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap 3.3.2 -->
<link href="/tpm_project/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />    
<!-- Ionicons -->
<link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" />
<!-- daterange picker -->
<link href="/tpm_project/css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />


<!-- jQuery 2.1.3 -->
<script src="/tpm_project/js/jQuery-2.1.3.min.js" type="text/javascript"></script>
<!-- Bootstrap 3.3.2 JS -->
<script src="/tpm_project/js/bootstrap.min.js" type="text/javascript"></script>
<!-- date-range-picker -->
<script src="/tpm_project/js/daterangepicker/daterangepicker.js" type="text/javascript"></script>
<script>
$('#daterange-btn').daterangepicker(
		{
          ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract('days', 1), moment().subtract('days', 1)],
            'Last 7 Days': [moment().subtract('days', 6), moment()],
            'Last 30 Days': [moment().subtract('days', 29), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
          },
          startDate: moment().subtract('days', 29),
          endDate: moment()
       	},
		function (start, end) {
	  		$('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
		}
);
</script>
</head>
<body>
	<!-- Date and time range -->
	<div class="form-group">
		<label>Date range button:</label>
		<div class="input-group">
			<button class="btn btn-default pull-right" id="daterange-btn">
				<i class="fa fa-calendar"></i> Date range picker 
				<i class="fa fa-caret-down"></i>
			</button>
		</div>
	</div>
	<!-- /.form group -->
</body>
</html>