<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
    rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
    rel="stylesheet" type="text/css">
    <script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
    <script src="https://www.amcharts.com/lib/3/radar.js"></script>
    <script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
    <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css"
    type="text/css" media="all">
    <script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
	<script src="https://www.amcharts.com/lib/3/serial.js"></script>
	<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
	<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
    
<title>Insert title here</title>
	<style>
      #chartdiv {
                width: 50%;
                height: 250px;
      }
      #chartdiv2 {
				width		: 100%;
				height		: 200px;
				font-size	: 11px;
	  }	
    </style>
    <script>
      var chart = AmCharts.makeChart( "chartdiv", {
                "type": "radar",
                "theme": "light",
                "dataProvider": [ 
	             	{ "tendency": "E", "litres": 5 },
	             	{ "tendency": "I", "litres": 2 },
	                { "tendency": "S", "litres": 3 },
	                { "tendency": "N", "litres": 5 },
	                { "tendency": "T", "litres": 1 },
	                { "tendency": "F", "litres": 4 },
	                { "tendency": "J", "litres": 2 },
	                { "tendency": "P", "litres": 5 } ],
                "valueAxes": [
                	{ "axisTitleOffset": 20, "minimum": 0, "axisAlpha": 0.15 } ],
                "startDuration": 2,
                "graphs": [
                	{ "balloonText": "[[value]]",
                  	  "bullet": "round",
                  	  "lineThickness": 2,
                  	  "valueField": "litres" } ] ,
                "categoryField": "tendency" } );
      
      var chart = AmCharts.makeChart("chartdiv2", {
    	  "theme": "light",
          "type": "serial",
          "dataProvider": [
        	  { "tendency": "E", "self": 3, "team": 4 },
        	  { "tendency": "I", "self": 1, "team": 3 },
        	  { "tendency": "S", "self": 2, "team": 2 },
        	  { "tendency": "N", "self": 2, "team": 4 },
        	  { "tendency": "T", "self": 1, "team": 2 },
        	  { "tendency": "F", "self": 5, "team": 4 },
        	  { "tendency": "J", "self": 2, "team": 4 },
        	  { "tendency": "P", "self": 3, "team": 1 } ],
          "valueAxes": [
        	  { "position": "left",
              	"title": "tendency" }],
          "startDuration": 2,
          "graphs": [
        	  { "balloonText": "check tendency <b>[[category]] (team)</b> : <b>[[value]]</b>",
              	"fillAlphas": 0.9,
              	"title": "team",
              	"type": "column",
              	"valueField": "team" },
              { "balloonText": "check tendency <b>[[category]] (self)</b> : <b>[[value]]</b>",
              	"fillAlphas": 0.9,
              	"title": "self",
              	"type": "column",
              	"clustered":false,
              	"columnWidth":0.5,
              	"valueField": "self" }],
          "plotAreaFillAlphas": 0.1,
          "categoryField": "tendency",
          "categoryAxis": { "gridPosition": "start" }
      });
      
      function deletedo(){
    	  var email = document.memberInfoForm.member_id.value;
    	  
    	  location.href='memberDel.do?email='+email;
      }
      
      </script>
</head>
<body>
	 <div class="container">
      <div class="col-md-6 col-md-offset-3"></div>
      <div class="col-md-12">
        <div class="page-header">
          <h1>개인 정보
            <small>???</small>
          </h1>
        </div>
        
        <c:set var="memberDTO" value="${list}"/>
        
        <div class="row">
          <div class="col-md-6">
            <form class="form-horizontal" name="memberInfoForm" action="memberUpdate.do" method="post">
              <div class="col-sm-offset-7 col-sm-5">
                <a class="btn btn-default disabled">테마 선택</a>&nbsp;&nbsp;&nbsp;
                <select>
                  <option>색상1</option>
                  <option>색상2</option>
                </select>
              </div>
              <br>
              <br>
              <br>
              <div class="form-group">
                <div class="col-md-4">
                  <img src="http://pingendo.github.io/pingendo-bootstrap/assets/user_placeholder.png"
                  class="img-circle img-responsive">
                </div>
                <div class="col-md-8">파일 선택 들어갈 곳</div>
              </div>&nbsp;
              <div class="form-group">
                <label class="col-sm-3 control-label" for="inputEmail">이메일</label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" id="inputEmail" placeholder="이메일" name="member_id" readonly>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
                <div class="col-sm-8">
                  <input type="password" class="form-control" id="inputPassword" placeholder="비밀번호" name="member_pwd">
                  <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호 확인</label>
                <div class="col-sm-8">
                  <input type="password" class="form-control" id="inputPasswordCheck" placeholder="비밀번호 확인" name="member_pwd_ch">
                  <p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label" for="inputName">이름</label>
                <div class="col-sm-8">
                  <input class="form-control" id="inputName" type="text" name="member_name" placeholder="이름">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label" for="inputTel">연락처</label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" id="inputTel" placeholder="전화번호" name="member_tel">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label" for="inputGender">성별</label>
                <div class="col-sm-8">
                  <select class="form-control" style="width:79px; float:left;" name="member_gender">
                    <option value="남">남자</option>
                    <option value="여">여자</option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-offset-4 col-sm-10">
                  <button type="submit" class="btn btn-default">수정</button>
                  <button type="button" class="btn btn-default" onclick="deletedo()">회원 탈퇴</button>
                </div>
              </div>
            </form>
          </div>
         <div class="col-md-6">
            <div>
              <div>
                <a class="btn btn-default disabled">총 업무 달성률1111111111111111111111111111111111111111</a>
              </div>
              <br>
              <div>
                <a class="btn btn-default disabled">프로젝트 명</a> &nbsp;&nbsp;&nbsp;
                <select>
                  <option>프로젝트1</option>
                  <option>프로젝트2</option>
                </select>
                <br>
                <br>
                <div>
                  <a class="btn btn-default disabled">진행중인 업무1111111111111111111111111111111111111111111111</a>
                </div>
                <br>
                <div>
                  <a class="btn btn-default disabled">진행률 11111111111111111111111111111111111111111111111111</a>
                </div>
              </div>
            </div>
            <hr>
            <div>
              <a class="col-sm-3 btn btn-default disabled">개인 성향</a>
              <div id="chartdiv" class="col-md-offset-4"></div>
            </div>
            <hr>
            <div>
              <div>
                <a class="col-sm-3 btn btn-default disabled">업무 성향</a>
                <div id="chartdiv2"></div>
              </div>
            </div>
      </div>
    </div>
    </div>
    </div>
</body>
</html>