<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>TPM</title>
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/radar.js"></script>
<script
	src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet"
	href="https://www.amcharts.com/lib/3/plugins/export/export.css"
	type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>

<!-- Chart code -->
<script>
var chart = AmCharts.makeChart( "chartdiv", {
  "type": "radar",
  "theme": "light",
  "dataProvider": [ {
    "ten": "11",
    "litres": 5
  }, {
    "ten": "Ireland",
    "litres": 5
  }, {
    "ten": "Germany",
    "litres": 5
  }, {
    "ten": "Australia",
    "litres": 4
  }, {
    "ten": "Austria",
    "litres": 1
  }, {
    "ten": "UK",
    "litres": 1
  } ],
  "valueAxes": [ {
    "axisTitleOffset": 20,
    "minimum": 0,
    "axisAlpha": 0.15
  } ],
  "startDuration": 2,
  "graphs": [ {
    "balloonText": "[[value]]",
    "bullet": "round",
    "lineThickness": 2,
    "valueField": "litres"
  } ],
  "categoryField": "ten"
} );
</script>
<script>
var chart = AmCharts.makeChart( "chartdiv2", {
  "type": "radar",
  "theme": "light",
  "dataProvider": [ {
    "te": "11",
    "litres": 1
  }, {
    "te": "Ireland",
    "litres": 1
  }, {
    "te": "Germany",
    "litres": 2
  }, {
    "te": "Australia",
    "litres": 2
  }, {
    "te": "Austria",
    "litres": 3
  }, {
    "te": "UK",
    "litres": 3
  } ],
  "valueAxes": [ {
    "axisTitleOffset": 20,
    "minimum": 0,
    "axisAlpha": 0.15
  } ],
  "startDuration": 2,
  "graphs": [ {
    "balloonText": "[[value]]",
    "bullet": "round",
    "lineThickness": 2,
    "valueField": "litres"
  } ],
  "categoryField": "te"
} );
function test(){
	var chart = AmCharts.React( "chartdiv", {
		  "type": "radar",
		  "theme": "light",
		  "dataProvider": [ {
		    "te": "11",
		    "litres": 6
		  }, {
		    "te": "Ireland",
		    "litres": 6
		  }, {
		    "te": "Germany",
		    "litres": 5
		  }, {
		    "te": "Australia",
		    "litres": 5
		  }, {
		    "te": "Austria",
		    "litres": 5
		  }, {
		    "te": "UK",
		    "litres": 5
		  } ],
		  "valueAxes": [ {
		    "axisTitleOffset": 20,
		    "minimum": 0,
		    "axisAlpha": 0.15
		  } ],
		  "startDuration": 2,
		  "graphs": [ {
		    "balloonText": "[[value]]",
		    "bullet": "round",
		    "lineThickness": 2,
		    "valueField": "litres"
		  } ],
		  "categoryField": "te"
		} );
}
function test2(){
	var chart = AmCharts.React( "chartdiv2", {
		  "type": "radar",
		  "theme": "light",
		  "dataProvider": [ {
		    "te": "11",
		    "litres": 1
		  }, {
		    "te": "Ireland",
		    "litres": 1
		  }, {
		    "te": "Germany",
		    "litres": 1
		  }, {
		    "te": "Australia",
		    "litres": 1
		  }, {
		    "te": "Austria",
		    "litres": 1
		  }, {
		    "te": "UK",
		    "litres": 1
		  } ],
		  "valueAxes": [ {
		    "axisTitleOffset": 20,
		    "minimum": 0,
		    "axisAlpha": 0.15
		  } ],
		  "startDuration": 2,
		  "graphs": [ {
		    "balloonText": "[[value]]",
		    "bullet": "round",
		    "lineThickness": 2,
		    "valueField": "litres"
		  } ],
		  "categoryField": "te"
		} );
}
</script>
</head>
<body>
<div id="chartdiv" style="width:300px;height: 300px;"></div>
<div id="chartdiv2" style="width:300px;height: 300px;"></div>
<div onclick="test()">클릭 1</div>
<div onclick="test2()">클릭 2</div>




</body>
</html>