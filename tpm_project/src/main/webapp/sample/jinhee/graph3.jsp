<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="chart created using amCharts live editor" />
<title>Insert title here</title>
<script type="text/javascript" src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script type="text/javascript" src="https://www.amcharts.com/lib/3/serial.js"></script>
<script type="text/javascript" src="https://www.amcharts.com/lib/3/themes/light.js"></script>
</head>
<body>
	<div id="chartdiv" style="width: 100%; height: 400px; background-color: #FFFFFF;" ></div>

<script type="text/javascript">
	AmCharts.makeChart("chartdiv",
			{
				"type": "serial",
				"categoryField": "category",
				"startDuration": 1,
				"theme": "light",
				"categoryAxis": {
					"gridPosition": "start"
				},
				"trendLines": [],
				"graphs": [
					{
						"balloonText": "[[title]] of [[category]]:[[value]]",
						"fillAlphas": 1,
						"id": "AmGraph-1",
						"title": "graph 1",
						"type": "column",
						"valueField": "column-1"
					},
					{
						"balloonText": "[[title]] of [[category]]:[[value]]",
						"fillAlphas": 1,
						"id": "AmGraph-2",
						"title": "graph 2",
						"type": "column",
						"valueField": "column-2"
					}
				],
				"guides": [],
				"valueAxes": [
					{
						"id": "ValueAxis-1",
						"title": "Axis title"
					}
				],
				"allLabels": [],
				"balloon": {},
				"legend": {
					"enabled": true,
					"useGraphSettings": true
				},
				"titles": [
					{
						"id": "Title-1",
						"size": 15,
						"text": "Chart Title"
					}
				],
				"dataProvider": [
					{
						"category": "category 1",
						"column-1": 8,
						"column-2": 5
					},
					{
						"category": "category 2",
						"column-1": 6,
						"column-2": "7"
					},
					{
						"category": "category 3",
						"column-1": 2,
						"column-2": 3
					},
					{
						"category": "category 4",
						"column-1": "5",
						"column-2": "8"
					},
					{
						"category": "category 5",
						"column-1": "3",
						"column-2": "3"
					},
					{
						"category": "category 6",
						"column-1": "6",
						"column-2": "3"
					},
					{
						"category": "category 7",
						"column-1": "1",
						"column-2": "5"
					},
					{
						"category": "category 8",
						"column-1": "3",
						"column-2": "1"
					}
				]
			}
		);
	</script>

</body>
</html>
