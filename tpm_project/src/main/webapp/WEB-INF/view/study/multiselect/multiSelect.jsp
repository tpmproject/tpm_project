<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/view/include/import.jsp"%>
<script src="/tpm_project/js/multiselect/selectr.js"></script>

<script>
   $(document).ready(function () {
       $("select").selectr({
           title: 'What would you like to drink?',
           placeholder: 'Search beverages'
       });
   });
</script>

</head>
<body style="padding: 0px 20px;">
	<h1>selectr demo</h1>
	<h4>Turn ordinary select boxes into these neat guys</h4>
	<br>
	<br>

	<div class="row">
		<div class="col-sm-3">
			<h4>Multi-select</h4>
			<!-- Using data attributes -->
			<select name="foods"
				data-selectr-opts='{ "title": "What&#39;s for breakfast? (max 5)", "placeholder": "Search foods", "maxSelection": 5 }'
				multiple>
				<option data-selectr-color="rgb(0, 163, 0)" value="bacon">Bacon
					(Extra long name foo bar baz quz)</option>
				<option data-selectr-color="rgb(255, 0, 151)" value="eggs" selected>Eggs</option>
				<option data-selectr-color="rgb(159, 0, 167)" value="toast">Toast</option>
				<option data-selectr-color="rgb(185, 29, 71)" value="oatmeal">Oatmeal</option>
				<option data-selectr-color="rgb(227, 162, 26)" value="steak"
					selected>Steak</option>
				<option data-selectr-color="rgb(218, 83, 44)" value="sausage">Sausage</option>
				<option data-selectr-color="rgb(45, 137, 239)" value="fruit">Fresh
					Fruit</option>
			</select>
		</div>

		<div class="col-sm-3">
			<h4>Single-select</h4>
			<!-- Using opts object from .selectr() call above -->
			<select name="beverages">
				<option data-selectr-color="rgb(96, 60, 186)" value="coffee">Coffee</option>
				<option data-selectr-color="rgb(0, 171, 169)" value="milk" selected>Milk</option>
				<option value="juice">Juice (no color coding)</option>
			</select>
		</div>
	</div>

</body>
</html>