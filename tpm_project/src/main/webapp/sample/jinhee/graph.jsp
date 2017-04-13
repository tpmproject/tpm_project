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
     	{ "tendency": "외향적", "litres": 5 },
     	{ "tendency": "내향적", "litres": 3 },
        { "tendency": "감각적", "litres": 1 },
        { "tendency": "직관적", "litres": 2 },
        { "tendency": "사고적", "litres": 3 },
        { "tendency": "감정적", "litres": 4 },
        { "tendency": "판단적", "litres": 2 },
        { "tendency": "인식적", "litres": 1 } ],
    "valueAxes": [
    	{ "axisTitleOffset": 20, "minimum": 0, "axisAlpha": 0.15 } ],
    "startDuration": 2,
    "graphs": [
    	{ "balloonText": "[[value]]",
      	  "bullet": "round",
      	  "lineThickness": 2,
      	  "valueField": "litres" } ] ,
    "categoryField": "tendency" }) ;
</script>
<div id="chartdiv">
</div>
</body>
</html>