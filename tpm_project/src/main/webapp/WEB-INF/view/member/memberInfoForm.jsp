<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<%@ include file="/WEB-INF/view/include/import.jsp"%>

	<script type="text/javascript" src="js/httpRequest.js"></script>
	
    <script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <!-- 개인 성향  그래프-->
    <script src="/tpm_project/js/graph/amcharts.js"></script>
	<script src="https://www.amcharts.com/lib/3/radar.js"></script>
	<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
	<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
	<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
	<!-- 업무 성향 그래프-->
	<script type="text/javascript" src="https://www.amcharts.com/lib/3/serial.js"></script>
	<!-- 업무 분석 도넛 그래프 -->
	<script src="https://www.amcharts.com/lib/3/pie.js"></script>
	<!-- 프로필 이미지 미리보기 -->
	
<title>Insert title here</title>

	<style>
      #chartdiv {
                width: 70%;
                height: 250px;
      }
      #chartdiv2 {
				width		: 100%;
				height		: 200px;
				font-size	: 11px;
	  }
	  #chartdiv3 {
			width		: 50%;
			height		: 140px;
			font-size	: 11px;
	}	
    </style>
    <script>
	    window.onload = function(){
	    	/* settingThema(); */
	    	selectProfile();
	    	getProjectIdx();
	    }
    	
	    function deletedo(){
	  	  var id = document.memberInfoForm.member_id.value;
	  	  
	  	  location.href='memberDel.do?id='+id;
	    }
	    
	    function selectProfile(){
	    	$('#select_profile').on('change', function() {
	      	        
	      	        ext = $(this).val().split('.').pop().toLowerCase(); //확장자
	      	        
	      	        if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
	      	            resetFormElement($(this)); //폼 초기화
	      	            window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
	      	        } else {
	      	            file = $('#select_profile').prop("files")[0];
	      	            blobURL = window.URL.createObjectURL(file);
	      	            $('#profile_img').attr('src', blobURL);
	      	        }
	      	        return false;
	      	    });
	    }
	    
	    function selectThema(){
	    	var selected = $('#themaSelect').val();
	    	//var selectclass = $('body').attr('class');
	    	//window.alert(selectclass);
	    	//window.alert(selected);
	    	
	    	var param  = 'member_idx='+${sessionScope.s_member_idx}+'&member_thema='+ selected;
	    	
	    	sendRequest('memberSetThema.do?'+param, null, changeThema, 'GET');
	    }
	    
	    function changeThema(){
	    	if(XHR.readyState==4){
	    		if(XHR.status==200){
	    			var result = XHR.responseText.trim();
	    			//window.alert(result);
	    			
	    			if(!result){
	    				$('body').attr('class','skin-blue');
	    			}else{
	    				$('body').attr('class','skin-'+result+'');	
	    			}
	    		}
	    	}
	    }
	    
	    function getProjectIdx(){
	    	var projectidx = $('#getProject').val();

	    	var param = 'project_idx='+projectidx+'&member_idx='+${sessionScope.s_member_idx};
	    	
	    	sendRequest('getWork.do?'+param, null, setProjectidx, 'GET');
	    }
	    
	    function setProjectidx(){
	    	if(XHR.readyState==4){
	    		if(XHR.status==200){
	    			var result = XHR.responseText.trim();
	    			var resultArray = result.split(',');
	    			var intArray = new Array(resultArray.length);
	    			
	    			var workING = 0;
	    			var workTotal = 0;
	    			var workState = 0;
	    			
	    			for(var i=0;i<resultArray.length;i++){
	    				workING = resultArray[0];
	    				workTotal = resultArray[1];
	    				
	    				if(workING==0 || workTotal==0){
	    					workState = 0;
	    				} else{
	    					workState = 100-((workING/workTotal)*100);
	    					workState = workState.toFixed(2);
	    				}
	    			}
	    			
	    			var INGId = document.getElementById('myworkING');
	    			INGId.innerHTML = workING;
	    			var StateId = document.getElementById('myworkState');
	    			StateId.innerHTML = workState;
	    			
	    			var workComplete = workTotal - workING;
	    			
	    			var chart = AmCharts.makeChart( "chartdiv3", {
	    				
	  				  "type": "pie",
	  				  "theme": "light",
	  				  "dataProvider": [ {
	  				    "title": "남은 업무",
	  				    "value": workING
	  				  }, {
	  				    "title": "완료된 업무",
	  				    "value": workComplete
	  				  } ],
	  				  "titleField": "title",
	  				  "valueField": "value",
	  				  "labelRadius": 5,

	  				  "radius": "40%",
	  				  "innerRadius": "70%",
	  				  "labelText": "[[title]]",
	  			} );
	    		}
	    	}
	    }
	    
    </script>
</head>
<body class="skin-${sessionScope.s_member_thema}">
<%@ include file="/WEB-INF/view/header.jsp"%>
	 <div class="container">
      <div class="col-md-6 col-md-offset-3"></div>
      <div class="col-md-12">
        <div class="page-header">
          <h1>개인 정보
            <small>???</small>
          </h1>
        </div>
        <c:set var="list" value="${userInfo}"/>
        <div class="row">
          <div class="col-md-6">
            <form class="form-horizontal" name="memberInfoForm" action="memberUpdate.do" method="post" enctype="multipart/form-data">
            <input type="hidden" id="my_member_idx" value="${sessionScope.s_member_idx}">
             <c:forEach var="dto" items="${list}">
	              <div class="col-sm-offset-7">
	                <a class="btn btn-default disabled">테마 선택</a>&nbsp;&nbsp;&nbsp;
	                <select id="themaSelect" onchange="selectThema()">
	                  <option value="black"> black </option>
	                  <option value="black-light"> black-light </option>
	                  <option value="blue"> blue </option>
	                  <option value="blue-light"> blue-light </option>
	                  <option value="green"> green </option>
	                  <option value="green-light"> green-light </option>
	                  <option value="purple"> purple </option>
	                  <option value="purple-light"> purple-light </option>
	                  <option value="red"> red </option>
	                  <option value="red-light"> red-light </option>
	                  <option value="yellow"> yellow </option>
	                  <option value="yellow-light"> yellow-light </option>
	                </select>
	              </div>
	              <br>
	              <br>
	              <!-- 프로필 사진 -->
	              <div class="form-group">
	                <div class="col-sm-3 col-md-offset-1">
	                  <img class="img-circle bx-s" id="profile_img" src="/tpm_project/img/member/profile/${dto.member_img}" width="130" height="130">
	                </div>
	                <div class="col-sm-6">
	                	<input class="btn btn-default" type="file" name="member_img_file" id="select_profile">	                
	                </div>
	              </div>&nbsp;
	              
	              <!-- 정보 입력 -->
	              <div class="form-group">
	                <label class="col-sm-3 control-label" for="inputEmail">이메일</label>
	                <div class="col-sm-8">
	                  <input type="text" class="form-control" id="inputEmail" name="member_id" value="${dto.member_id}" readonly>
	                </div>
	              </div>
	              <div class="form-group">
	                <label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
	                <div class="col-sm-8">
	                  <input type="password" class="form-control" id="inputPassword" placeholder="비밀번호" name="member_pwd" required>
	                  <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
	                </div>
	              </div>
	              <div class="form-group">
	                <label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호 확인</label>
	                <div class="col-sm-8">
	                  <input type="password" class="form-control" id="inputPasswordCheck" placeholder="비밀번호 확인" name="member_pwd_ch" required>
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
		                <c:when test="${dto.member_gender=='남자'}">
		                <div class="form-group">
			                <label class="col-sm-3 control-label" for="inputGender">성별</label>
			                <div class="col-sm-8">
			                  <select class="form-control" style="width:79px; float:left;" name="member_gender">
			                    <option value="남자" selected="selected">남자</option>
			                    <option value="여자">여자</option>
			                  </select>
			                </div>
		                </div>
		                </c:when>
		                <c:otherwise>
		                <div class="form-group">
			                <label class="col-sm-3 control-label" for="inputGender">성별</label>
			                <div class="col-sm-8">
			                  <select class="form-control" style="width:79px; float:left;" name="member_gender">
			                    <option value="남자">남자</option>
			                    <option value="여자" selected="selected">여자</option>
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
          
          <c:set var="workcount" value="${myworkcount}"/>
          <c:set var="workcomplete" value="${myworkcomplete}"/>
          <c:set var="totalwork" value="${workcomplete/workcount*100}" />
          <c:if test="${workcount==0 || workcomplete==0}">
          	<c:set var="totalwork" value="0"/>
          </c:if>
          
         <div class="col-md-6">
            <div>
              <div>
                <a class="col-sm-12 btn btn-default disabled"> 총 업무 달성률 : <fmt:formatNumber value="${totalwork}" pattern=".00"/>%</a>
              </div>
              <br>
              <br>
              <br>
              <c:set var="myproject" value="${myprojectlist}"/>
              <div>
                <a class="btn btn-default disabled">프로젝트 명</a> &nbsp;&nbsp;&nbsp;
                <select id="getProject" onchange="getProjectIdx()">
                	<!-- <option value="select"> 선택 </option> -->
                <c:forEach var="project" items="${myproject}">
                  	<option value="${project.project_idx}">${project.project_name}</option>
                </c:forEach>
                </select>
              	<br>
              	<br>
                <div class="col-md-12" style="height: 200px;">
                	<div class="col-md-5" id="chartdiv3"></div>	
	                <div>
	                	<a class="col-md-6 btn btn-default disabled"> 진행중인 업무 : <span id="myworkING"></span>건</a>
	              	</div>
	              	<br>
              		<br>
	              	<div>
	                	<a class="col-md-6 btn btn-default disabled"> 진행률 : <span id="myworkState"></span>% </a>
	              	</div>
                </div>
              </div>
            </div>
            <br>
            <br>
			<br>
            <br>
            <br>
            <br>
            <br>
            <div>
              <a class="col-sm-3 btn btn-default disabled">개인 성향</a>
              <div id="chartdiv" class="col-md-offset-3"></div>
            </div>
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
    <c:set var="self_tendencylist" value="${self_tendency}"/>
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
          
		<c:set var="team_tendencylist" value="${team_tendency}"/>
			<c:forEach var="team_tendency" items="${team_tendencylist}">
			<script>
				var chart = AmCharts.makeChart("chartdiv2",	{
					"type": "serial",
					"categoryField": "category",
					"startDuration": 1,
					"theme": "light",
					"categoryAxis": { "gridPosition": "start" },
					"trendLines": [],
					"graphs": [
						{
							"balloonText": "[[title]] of [[category]]:[[value]]",
							"fillAlphas": 1,
							"id": "AmGraph-1",
							"title": "self_tendency",
							"type": "column",
							"valueField": "column-1" 							},
						{
							"balloonText": "[[title]] of [[category]]:[[value]]",
							"fillAlphas": 1,
							"id": "AmGraph-2",
							"title": "work_tendency",
							"type": "column",
							"valueField": "column-2"							}
					],
					"guides": [],
					"valueAxes": [
						{
							"id": "ValueAxis-1",
							"title": "tendency"
						}
					],
					"allLabels": [],
					"balloon": {},
					"legend": {
						"enabled": true,
						"useGraphSettings": true
					},
					"dataProvider": [
						{ "category": "외향적", "column-1": ${self_tendency.tendency_e}, "column-2": ${team_tendency.tendency_e} },
						{ "category": "내향적", "column-1": ${self_tendency.tendency_i}, "column-2": ${team_tendency.tendency_i} },
						{ "category": "감각적", "column-1": ${self_tendency.tendency_s}, "column-2": ${team_tendency.tendency_s} },
						{ "category": "직관적", "column-1": ${self_tendency.tendency_n}, "column-2": ${team_tendency.tendency_n} },
						{ "category": "사고적", "column-1": ${self_tendency.tendency_t}, "column-2": ${team_tendency.tendency_t} },
						{ "category": "감정적", "column-1": ${self_tendency.tendency_f}, "column-2": ${team_tendency.tendency_f} },
						{ "category": "판단적", "column-1": ${self_tendency.tendency_j}, "column-2": ${team_tendency.tendency_j} },
						{ "category": "인식적", "column-1": ${self_tendency.tendency_p}, "column-2": ${team_tendency.tendency_p} },
					]
				}
			);
	     </script>
     </c:forEach>
     </c:forEach>
	 <%@ include file="/WEB-INF/view/footer.jsp"%>
</body>
</html>