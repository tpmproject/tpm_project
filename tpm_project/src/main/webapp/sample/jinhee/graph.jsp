<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
	<script src="https://www.amcharts.com/lib/3/radar.js"></script>
	<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
	<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
	<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<title>Insert title here</title>
<style>
 #chartdiv {
                width: 70%;
                height: 250px;
      }
</style>


</head>
<body>
<script>
var chart = AmCharts.makeChart( "chartdiv", {
	    "type": "radar",
	    "theme": "light",
	    "dataProvider": [ 
	     	{ "tendency": "외향적", "point": ${self_tendency.tendency_e} },
	        { "tendency": "감각적", "point": ${self_tendency.tendency_s} },
	        { "tendency": "사고적", "point": ${self_tendency.tendency_t} },
	        { "tendency": "판단적", "point": ${self_tendency.tendency_j} },
	        { "tendency": "내향적", "point": ${self_tendency.tendency_i} },
	        { "tendency": "직관적", "point": ${self_tendency.tendency_n} },
	        { "tendency": "감정적", "point": ${self_tendency.tendency_f} },
	        { "tendency": "인식적", "point": ${self_tendency.tendency_p} } ],
	    "valueAxes": [
	    	{ "axisTitleOffset": 20, "minimum": 0, "axisAlpha": 0.15 } ],
	    "startDuration": 2,
	    "graphs": [
	    	{ "balloonText": "[[value]]",
	      	  "bullet": "round",
	      	  "lineThickness": 2,
	      	  "valueField": "point" } ] ,
 			  "categoryField": "tendency" }) ;
</script>
<div id="chartdiv">
</div>
</body>
</html>