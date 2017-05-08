<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
    rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
    rel="stylesheet" type="text/css">
    <script type="text/javascript"></script>
    <style>
   /*  input[type=radio]
	{
 	 /* Double-sized Checkboxes */
  	-ms-transform: scale(2); /* IE */
 	 -moz-transform: scale(2); /* FF */
  	-webkit-transform: scale(2); /* Safari and Chrome */
  	-o-transform: scale(2); /* Opera */
  	padding: 10px;
	}
     */
    </style>
    <script>
    function signBack(){
    	history.back(-1);
    }
    </script>
  </head>
  
  <body>
  
   
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="page-header">
              <h1>성향조사
                <small>Umfrage</small>
              </h1>
              
        
        
						
            </div>
            <form name="tendencyForm" action="memberAdd.do" method="post">
            	<input type="hidden" name="member_id" value="${mdto.member_id }">
			  	<input type="hidden" name="member_pwd" value="${mdto.member_pwd }">
			  	<input type="hidden" name="member_name" value="${mdto.member_name }">
			  	<input type="hidden" name="member_gender" value="${mdto.member_gender }">
			  	<input type="hidden" name="member_tel" value="${mdto.member_tel }">
			  	<input type="hidden" name="member_img" value="${mdto.member_img}">
			            
			    <!--설문 시작 -->
				<div style="margin: 90px 290px;">
					<div class="container">
						<div class="row">
							<div class="col-md-6">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h4 class="text-center">외향성</h4>
									</div>
									<div class="panel-body text-center" style="height: 150px;">
										<p class="lead">
											<strong style="font-size: 16px; text-align: center;">혼자
												일하기 보다는 사람들과 일하는 것을 좋아하며 타인들과 개인적인 유대관계를 형성한다.</strong>
										</p>
										<hr style="border-top: 1px solid #988c8c;">
									</div>
									<div style="margin: -30px 35px; position: absolute;">
										<label class="radio"
											style="display: inline; float: left; margin-left: 40px; margin-top: -5px;">
											<input value="5" type="radio" name="tendency_e">매우그렇다
										</label>
										<label class="radio"
											style="display: inline; float: left; margin-left: 30px;">
											<input value="4" type="radio" name="tendency_e">&nbsp;그렇다
										</label> 
										<label class="radio"
											style="display: inline; float: left; margin-left: 30px;">
											<input value="3" type="radio" name="tendency_e">&nbsp;보통이다
										</label> 
										<label class="radio"
											style="display: inline; float: left; margin-left: 20px;">&nbsp;
											<input value="2" type="radio" name="tendency_e">&nbsp;아니다
										</label> 
										<label class="radio"
											style="display: inline; float: left; margin-left: 20px;">&nbsp;
											<input value="1" type="radio" name="tendency_e">&nbsp;매우
											아니다
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>


			<!-- -->
						
          <!--설문 시작 -->

					<div class="container">
						<div class="row">
							<div class="col-md-6">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h4 class="text-center">내향성</h4>
									</div>
									<div class="panel-body text-center" style="height: 150px;">
										<p class="lead">
											<strong style="font-size: 16px; text-align: center;">
											사소한 부분까지도 주의 깊고 업무를 철저히 완수한다.</strong>
										</p>
										<hr style="border-top: 1px solid #988c8c;">
									</div>
									<div style="margin: -30px 35px; position: absolute;">
										<label class="radio"
											style="display: inline; float: left; margin-left: 40px; margin-top: -5px;">
											<input value="5" type="radio" name="tendency_i">매우그렇다
										</label>
										<label class="radio"
											style="display: inline; float: left; margin-left: 30px;">
											<input value="4" type="radio" name="tendency_i">&nbsp;그렇다
										</label> 
										<label class="radio"
											style="display: inline; float: left; margin-left: 30px;">
											<input value="3" type="radio" name="tendency_i">&nbsp;보통이다
										</label> 
										<label class="radio"
											style="display: inline; float: left; margin-left: 20px;">&nbsp;
											<input value="2" type="radio" name="tendency_i">&nbsp;아니다
										</label> 
										<label class="radio"
											style="display: inline; float: left; margin-left: 20px;">&nbsp;
											<input value="1" type="radio" name="tendency_i">&nbsp;매우
											아니다
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>


			<!-- -->
			
          <!--설문 시작 -->

					<div class="container">
						<div class="row">
							<div class="col-md-6">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h4 class="text-center">감각형</h4>
									</div>
									<div class="panel-body text-center" style="height: 150px;">
										<p class="lead">
											<strong style="font-size: 16px; text-align: center;">
											직접 경험하고 있는 일을 중시하며 관찰능력이 뛰어나고 세세한 것까지 기억을 잘한다.</strong>
										</p>
										<hr style="border-top: 1px solid #988c8c;">
									</div>
									<div style="margin: -30px 35px; position: absolute;">
										<label class="radio"
											style="display: inline; float: left; margin-left: 40px; margin-top: -5px;">
											<input value="5" type="radio" name="tendency_s">매우그렇다
										</label>
										<label class="radio"
											style="display: inline; float: left; margin-left: 30px;">
											<input value="4" type="radio" name="tendency_s">&nbsp;그렇다
										</label> 
										<label class="radio"
											style="display: inline; float: left; margin-left: 30px;">
											<input value="3" type="radio" name="tendency_s">&nbsp;보통이다
										</label> 
										<label class="radio"
											style="display: inline; float: left; margin-left: 20px;">&nbsp;
											<input value="2" type="radio" name="tendency_s">&nbsp;아니다
										</label> 
										<label class="radio"
											style="display: inline; float: left; margin-left: 20px;">&nbsp;
											<input value="1" type="radio" name="tendency_s">&nbsp;매우
											아니다
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>


			<!-- -->
			
          <!--설문 시작 -->

					<div class="container">
						<div class="row">
							<div class="col-md-6">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h4 class="text-center">직관형</h4>
									</div>
									<div class="panel-body text-center" style="height: 150px;">
										<p class="lead">
											<strong style="font-size: 16px; text-align: center;">상상력이 풍부하고, 이론적이고, 추상적이고, 미래지향적이며 창조적이다.</strong>
										</p>
										<hr style="border-top: 1px solid #988c8c;">
									</div>
									<div style="margin: -30px 35px; position: absolute;">
										<label class="radio"
											style="display: inline; float: left; margin-left: 40px; margin-top: -5px;">
											<input value="5" type="radio" name="tendency_n">매우그렇다
										</label>
										<label class="radio"
											style="display: inline; float: left; margin-left: 30px;">
											<input value="4" type="radio" name="tendency_n">&nbsp;그렇다
										</label> 
										<label class="radio"
											style="display: inline; float: left; margin-left: 30px;">
											<input value="3" type="radio" name="tendency_n">&nbsp;보통이다
										</label> 
										<label class="radio"
											style="display: inline; float: left; margin-left: 20px;">&nbsp;
											<input value="2" type="radio" name="tendency_n">&nbsp;아니다
										</label> 
										<label class="radio"
											style="display: inline; float: left; margin-left: 20px;">&nbsp;
											<input value="1" type="radio" name="tendency_n">&nbsp;매우
											아니다
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>


			<!-- -->
			
          <!--설문 시작 -->

					<div class="container">
						<div class="row">
							<div class="col-md-6">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h4 class="text-center">사고형</h4>
									</div>
									<div class="panel-body text-center" style="height: 150px;">
										<p class="lead">
											<strong style="font-size: 16px; text-align: center;">
											객관적인 기준을 바탕으로 정보를 비교 분석하고 논리적 결과를 바탕으로 판단을 한다.</strong>
										</p>
										<hr style="border-top: 1px solid #988c8c;">
									</div>
									<div style="margin: -30px 35px; position: absolute;">
										<label class="radio"
											style="display: inline; float: left; margin-left: 40px; margin-top: -5px;">
											<input value="5" type="radio" name="tendency_t">매우그렇다
										</label>
										<label class="radio"
											style="display: inline; float: left; margin-left: 30px;">
											<input value="4" type="radio" name="tendency_t">&nbsp;그렇다
										</label> 
										<label class="radio"
											style="display: inline; float: left; margin-left: 30px;">
											<input value="3" type="radio" name="tendency_t">&nbsp;보통이다
										</label> 
										<label class="radio"
											style="display: inline; float: left; margin-left: 20px;">&nbsp;
											<input value="2" type="radio" name="tendency_t">&nbsp;아니다
										</label> 
										<label class="radio"
											style="display: inline; float: left; margin-left: 20px;">&nbsp;
											<input value="1" type="radio" name="tendency_t">&nbsp;매우
											아니다
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>


			<!-- -->
			
          <!--설문 시작 -->

					<div class="container">
						<div class="row">
							<div class="col-md-6">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h4 class="text-center">감정형</h4>
									</div>
									<div class="panel-body text-center" style="height: 170px;">
										<p class="lead">
											<strong style="font-size: 16px; text-align: center;">친화적이고, 따뜻한 조화로운 인간관계를 중시한다. 객관적인 기준보다는 자기자신과 다른 사람들이 부여하는 가치를 중시하여 판단을 한다. 
											</strong>
										</p>
										<hr style="border-top: 1px solid #988c8c;">
									</div>
									<div style="margin: -30px 35px; position: absolute;">
										<label class="radio"
											style="display: inline; float: left; margin-left: 40px; margin-top: -5px;">
											<input value="5" type="radio" name="tendency_f">매우그렇다
										</label>
										<label class="radio"
											style="display: inline; float: left; margin-left: 30px;">
											<input value="4" type="radio" name="tendency_f">&nbsp;그렇다
										</label> 
										<label class="radio"
											style="display: inline; float: left; margin-left: 30px;">
											<input value="3" type="radio" name="tendency_f">&nbsp;보통이다
										</label> 
										<label class="radio"
											style="display: inline; float: left; margin-left: 20px;">&nbsp;
											<input value="2" type="radio" name="tendency_f">&nbsp;아니다
										</label> 
										<label class="radio"
											style="display: inline; float: left; margin-left: 20px;">&nbsp;
											<input value="1" type="radio" name="tendency_f">&nbsp;매우
											아니다
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>


			<!-- -->
			
          <!--설문 시작 -->

					<div class="container">
						<div class="row">
							<div class="col-md-6">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h4 class="text-center">판단형</h4>
									</div>
									<div class="panel-body text-center" style="height: 150px;">
										<p class="lead">
											<strong style="font-size: 16px; text-align: center;">의사를 결정하고 종결을 짓고 활동을 계획하고 어떤 일이든 조직적 체계적으로 진행시키기를 좋아한다
											</strong>
										</p>
										<hr style="border-top: 1px solid #988c8c;">
									</div>
									<div style="margin: -30px 35px; position: absolute;">
										<label class="radio"
											style="display: inline; float: left; margin-left: 40px; margin-top: -5px;">
											<input value="5" type="radio" name="tendency_j">매우그렇다
										</label>
										<label class="radio"
											style="display: inline; float: left; margin-left: 30px;">
											<input value="4" type="radio" name="tendency_j">&nbsp;그렇다
										</label> 
										<label class="radio"
											style="display: inline; float: left; margin-left: 30px;">
											<input value="3" type="radio" name="tendency_j">&nbsp;보통이다
										</label> 
										<label class="radio"
											style="display: inline; float: left; margin-left: 20px;">&nbsp;
											<input value="2" type="radio" name="tendency_j">&nbsp;아니다
										</label> 
										<label class="radio"
											style="display: inline; float: left; margin-left: 20px;">&nbsp;
											<input value="1" type="radio" name="tendency_j">&nbsp;매우
											아니다
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>


			<!-- -->
			
          <!--설문 시작 -->

					<div class="container">
						<div class="row">
							<div class="col-md-6">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h4 class="text-center">인식형</h4>
									</div>
									<div class="panel-body text-center" style="height: 170px;">
										<p class="lead">
											<strong style="font-size: 16px; text-align: center;">상황에 맞추어 자율적으로 살아가기를 원한다. 또한 자발적이고 호기심이 많고 적응력이 높으며, 새로운 사건이나 변화를 추구한다.</strong>
										</p>
										<hr style="border-top: 1px solid #988c8c;">
									</div>
									<div style="margin: -30px 35px; position: absolute;">
										<label class="radio"
											style="display: inline; float: left; margin-left: 40px; margin-top: -5px;">
											<input value="5" type="radio" name="tendency_p">매우그렇다
										</label>
										<label class="radio"
											style="display: inline; float: left; margin-left: 30px;">
											<input value="4" type="radio" name="tendency_p">&nbsp;그렇다
										</label> 
										<label class="radio"
											style="display: inline; float: left; margin-left: 30px;">
											<input value="3" type="radio" name="tendency_p">&nbsp;보통이다
										</label> 
										<label class="radio"
											style="display: inline; float: left; margin-left: 20px;">&nbsp;
											<input value="2" type="radio" name="tendency_p">&nbsp;아니다
										</label> 
										<label class="radio"
											style="display: inline; float: left; margin-left: 20px;">&nbsp;
											<input value="1" type="radio" name="tendency_p">&nbsp;매우
											아니다
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
              <div style="margin-left: 490px;">
                <button class="btn btn-danger btn-lg" type="button" onclick="signBack()">이전
                  <i class="fa fa-check spaceLeft"></i>
                </button>
                <button class="btn btn-lg btn-primary" type="submit">완료
                  <i class="fa fa-check spaceLeft"></i>
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    
  </body>

</html>