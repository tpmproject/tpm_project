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
	    function deletedo(){
	  	  var email = document.memberInfoForm.member_id.value;
	  	  
	  	  location.href='memberDel.do?email='+email;
	    }
    </script>
</head>
<body>
	<c:set var="self_tendencylist" value="${self_tendency}"/>
	<c:set var="team_tendencylist" value="${team_tendency}"/>
	
	<c:forEach var="self_tendency" items="${self_tendencylist}">
	<c:forEach var="team_tendency" items="${team_tendencylist}">
	<script>
      var chart = AmCharts.makeChart( "chartdiv", {
                "type": "radar",
                "theme": "light",
                "dataProvider": [ 
	             	{ "tendency": "E", "litres": ${self_tendency.tendency_e} },
	             	{ "tendency": "I", "litres": ${self_tendency.tendency_i} },
	                { "tendency": "S", "litres": ${self_tendency.tendency_s} },
	                { "tendency": "N", "litres": ${self_tendency.tendency_n} },
	                { "tendency": "T", "litres": ${self_tendency.tendency_t} },
	                { "tendency": "F", "litres": ${self_tendency.tendency_f} },
	                { "tendency": "J", "litres": ${self_tendency.tendency_j} },
	                { "tendency": "P", "litres": ${self_tendency.tendency_p} } ],
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
        	  { "tendency": "E", "self": ${self_tendency.tendency_e}, "team": ${team_tendency.tendency_e} },
        	  { "tendency": "I", "self": ${self_tendency.tendency_i}, "team": ${team_tendency.tendency_i} },
        	  { "tendency": "S", "self": ${self_tendency.tendency_s}, "team": ${team_tendency.tendency_s} },
        	  { "tendency": "N", "self": ${self_tendency.tendency_n}, "team": ${team_tendency.tendency_n} },
        	  { "tendency": "T", "self": ${self_tendency.tendency_t}, "team": ${team_tendency.tendency_t} },
        	  { "tendency": "F", "self": ${self_tendency.tendency_f}, "team": ${team_tendency.tendency_f} },
        	  { "tendency": "J", "self": ${self_tendency.tendency_j}, "team": ${team_tendency.tendency_j} },
        	  { "tendency": "P", "self": ${self_tendency.tendency_p}, "team": ${team_tendency.tendency_p} } ],
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
     </script>
     </c:forEach>
     </c:forEach>
	 <div class="container">
      <div class="col-md-6 col-md-offset-3"></div>
      <div class="col-md-12">
        <div class="page-header">
          <h1>개인 정보
            <small>???</small>
          </h1>
        </div>
        
        <div class="row">
          <div class="col-md-6">
            <form class="form-horizontal" name="memberInfoForm" action="memberUpdate.do" method="post">
              <div class="col-sm-offset-7">
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
              
                 <c:set var="list" value="${userInfo}"/>
                 
                 <c:forEach var="dto" items="${list}">
                 
              <div class="form-group">
                <label class="col-sm-3 control-label" for="inputEmail">이메일</label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" id="inputEmail" name="member_id" value="${dto.member_id}" readonly>
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
                  <input class="form-control" id="inputName" type="text" name="member_name" value="${dto.member_name}">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label" for="inputTel">연락처</label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" id="inputTel" name="member_tel" value="${dto.member_tel}">
                </div>
              </div>
              	<c:choose>
	                <c:when test="${dto.member_gender}=='남자'">
	                <div class="form-group">
		                <label class="col-sm-3 control-label" for="inputGender">성별</label>
		                <div class="col-sm-8">
		                  <select class="form-control" style="width:79px; float:left;" name="member_gender">
		                    <option value="남" selected="selected">남자</option>
		                    <option value="여">여자</option>
		                  </select>
		                </div>
	                </div>
	                </c:when>
	                <c:otherwise>
	                <div class="form-group">
		                <label class="col-sm-3 control-label" for="inputGender">성별</label>
		                <div class="col-sm-8">
		                  <select class="form-control" style="width:79px; float:left;" name="member_gender">
		                    <option value="남">남자</option>
		                    <option value="여" selected="selected">여자</option>
		                  </select>
		                </div>
	                </div>
	                </c:otherwise>
             	</c:choose>
              </c:forEach>
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