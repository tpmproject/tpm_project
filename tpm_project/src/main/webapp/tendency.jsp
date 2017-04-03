<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Styles -->
<style>
#chartdiv {
  width: 100%;
  height: 500px;
}				
</style>

<!-- Resources -->
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/radar.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>

<!-- Chart code -->
<script>
var chart = AmCharts.makeChart( "chartdiv", {
  "type": "radar",
  "theme": "light",
  "dataProvider": [ {
    "country": "Czech Republic",
    "litres": 156.9
  }, {
    "country": "Ireland",
    "litres": 131.1
  }, {
    "country": "Germany",
    "litres": 115.8
  }, {
    "country": "Australia",
    "litres": 109.9
  }, {
    "country": "Austria",
    "litres": 108.3
  }, {
    "country": "UK",
    "litres": 99
  } ],
  "valueAxes": [ {
    "axisTitleOffset": 20,
    "minimum": 0,
    "axisAlpha": 0.15
  } ],
  "startDuration": 2,
  "graphs": [ {
    "balloonText": "[[value]] litres of beer per year",
    "bullet": "round",
    "lineThickness": 2,
    "valueField": "litres"
  } ],
  "categoryField": "country",
  "export": {
    "enabled": true
  }
} );
</script>

<!-- HTML -->
<div id="chartdiv"></div>		