<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="tendency_pop">
	<%-- <c:set var="self_tendencylist" value="${self_tendency}" />
	<c:forEach var="self_tendency" items="${self_tendencylist}">
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
	</c:forEach> --%>


</div>