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
  </head>
  
  <body>
  
    <div class="navbar navbar-default navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-ex-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">TPM</a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-ex-collapse">
          <ul class="nav navbar-nav navbar-right">
            <li class="active">
              <a href="#">Home</a>
            </li>
            <li>
              <a href="#">Contacts</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="page-header">
              <h1>성향조사
                <small>Umfrage</small>
              </h1>
            <!--  -->  
              
 <!-- 


    <div class="container">
      Pricing Tables - START
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <div class="panel panel-primary">
              <div class="panel-heading">
                <h4 class="text-center">외향성</h4>
              </div>
              <div class="panel-body text-center">
                <p class="lead">
                  <strong>$20 / month</strong>
                </p>
                <hr style="border-top: 1px solid #988c8c;">
              </div>
              <div>
                 <label class="radio">
                     <input value="5" type="radio" name="tendency_e">매우그렇다</label>
               
                 <label class="radio">
                     <input value="4" type="radio" name="tendency_e">&nbsp;그렇다</label>
               
                 <label class="radio">
                     <input value="3" type="radio" name="tendency_e">&nbsp;보통이다</label>

                 <label class="radio">&nbsp;
                     <input value="2" type="radio" name="tendency_e">&nbsp;아니다</label>
               
                 <label class="radio">&nbsp; 
                	 <input value="1" type="radio" name="tendency_e">&nbsp;매우 아니다</label>
              </div>
            </div>
          </div>
        </div>
      </div>
      Pricing Tables - END
    </div>
  
               	 
                  
                  -->
              
              
              
              
              
              
              
           <!--   //////////////////  -->
            </div>
            <form name="tendencyForm" action="memberAdd.do" method="post">
            	<input type="hidden" name="member_id" value="${mdto.member_id }">
			  	<input type="hidden" name="member_pwd" value="${mdto.member_pwd }">
			  	<input type="hidden" name="member_name" value="${mdto.member_name }">
			  	<input type="hidden" name="member_gender" value="${mdto.member_gender }">
			  	<input type="hidden" name="member_tel" value="${mdto.member_tel }">
			  	<input type="hidden" name="member_img" value="${mdto.member_img}">
			            
              <div class="alert alert-info" style="color:black; background-color:white">
                <div class="form-inline">
                  <label class="control-label">외향성</label>
                  <br>
                  <br>
                  <label class="radio">&nbsp;
                    <input value="1" type="radio" name="tendency_e">&nbsp;매우 아니다</label>
                  <label class="radio">&nbsp;
                    <input value="2" type="radio" name="tendency_e">&nbsp;아니다</label>
                  <label class="radio">
                    <input value="3" type="radio" name="tendency_e">&nbsp;보통이다</label>
                  <label class="radio">
                    <input value="4" type="radio" name="tendency_e">&nbsp;그렇다</label>
                  <label class="radio">
                    <input value="5" type="radio" name="tendency_e">매우그렇다</label>
                </div>
              </div>
              <div class="alert alert-info" style="color:black; background-color:white">
                <div class="form-inline">
                  <label class="control-label">내향성</label>
                  <br>
                  <br>
                  <label class="radio">&nbsp;
                    <input value="1" type="radio" name="tendency_i">&nbsp;매우 아니다</label>
                  <label class="radio">&nbsp;
                    <input value="2" type="radio" name="tendency_i">&nbsp;아니다</label>
                  <label class="radio">
                    <input value="3" type="radio" name="tendency_i">&nbsp;보통이다</label>
                  <label class="radio">
                    <input value="4" type="radio" name="tendency_i">&nbsp;그렇다</label>
                  <label class="radio">
                    <input value="5" type="radio" name="tendency_i">매우그렇다</label>
                </div>
              </div>
              <div class="alert alert-info" style="color:black; background-color:white">
                <div class="form-inline">
                  <label class="control-label">감각형</label>
                  <br>
                  <br>
                  <label class="radio">&nbsp;
                    <input value="1" type="radio" name="tendency_s">&nbsp;매우 아니다</label>
                  <label class="radio">&nbsp;
                    <input value="2" type="radio" name="tendency_s">&nbsp;아니다</label>
                  <label class="radio">
                    <input value="3" type="radio" name="tendency_s">&nbsp;보통이다</label>
                  <label class="radio">
                    <input value="4" type="radio" name="tendency_s">&nbsp;그렇다</label>
                  <label class="radio">
                    <input value="5" type="radio" name="tendency_s">매우그렇다</label>
                </div>
              </div>
              <div class="alert alert-info" style="color:black; background-color:white">
                <div class="form-inline">
                  <label class="control-label">직감형</label>
                  <br>
                  <br>
                  <label class="radio">&nbsp;
                    <input value="1" type="radio" name="tendency_n">&nbsp;매우 아니다</label>
                  <label class="radio">&nbsp;
                    <input value="2" type="radio" name="tendency_n">&nbsp;아니다</label>
                  <label class="radio">
                    <input value="3" type="radio" name="tendency_n">&nbsp;보통이다</label>
                  <label class="radio">
                    <input value="4" type="radio" name="tendency_n">&nbsp;그렇다</label>
                  <label class="radio">
                    <input value="5" type="radio" name="tendency_n">매우그렇다</label>
                </div>
              </div>
              <div class="alert alert-info" style="color:black; background-color:white">
                <div class="form-inline">
                  <label class="control-label">사고형</label>
                  <br>
                  <br>
                  <label class="radio">&nbsp;
                    <input value="1" type="radio" name="tendency_t">&nbsp;매우 아니다</label>
                  <label class="radio">&nbsp;
                    <input value="2" type="radio" name="tendency_t">&nbsp;아니다</label>
                  <label class="radio">
                    <input value="3" type="radio" name="tendency_t">&nbsp;보통이다</label>
                  <label class="radio">
                    <input value="4" type="radio" name="tendency_t">&nbsp;그렇다</label>
                  <label class="radio">
                    <input value="5" type="radio" name="tendency_t">매우그렇다</label>
                </div>
              </div>
              <div class="alert alert-info" style="color:black; background-color:white">
                <div class="form-inline">
                  <label class="control-label">감정형</label>
                  <br>
                  <br>
                  <label class="radio">&nbsp;
                    <input value="1" type="radio" name="tendency_f">&nbsp;매우 아니다</label>
                  <label class="radio">&nbsp;
                    <input value="2" type="radio" name="tendency_f">&nbsp;아니다</label>
                  <label class="radio">
                    <input value="3" type="radio" name="tendency_f">&nbsp;보통이다</label>
                  <label class="radio">
                    <input value="4" type="radio" name="tendency_f">&nbsp;그렇다</label>
                  <label class="radio">
                    <input value="5" type="radio" name="tendency_f">매우그렇다</label>
                </div>
              </div>
              <div class="alert alert-info" style="color:black; background-color:white">
                <div class="form-inline">
                  <label class="control-label">판단형</label>
                  <br>
                  <br>
                  <label class="radio">&nbsp;
                    <input value="1" type="radio" name="tendency_j">&nbsp;매우 아니다</label>
                  <label class="radio">&nbsp;
                    <input value="2" type="radio" name="tendency_j">&nbsp;아니다</label>
                  <label class="radio">
                    <input value="3" type="radio" name="tendency_j">&nbsp;보통이다</label>
                  <label class="radio">
                    <input value="4" type="radio" name="tendency_j">&nbsp;그렇다</label>
                  <label class="radio">
                    <input value="5" type="radio" name="tendency_j">매우그렇다</label>
                </div>
              </div>
              <div class="alert alert-info" style="color:black; background-color:white">
                <div class="form-inline">
                  <label class="control-label">인식형</label>
                  <br>
                  <br>
                  <label class="radio">&nbsp;
                    <input value="1" type="radio" name="tendency_p">&nbsp;매우 아니다</label>
                  <label class="radio">&nbsp;
                    <input value="2" type="radio" name="tendency_p">&nbsp;아니다</label>
                  <label class="radio">
                    <input value="3" type="radio" name="tendency_p">&nbsp;보통이다</label>
                  <label class="radio">
                    <input value="4" type="radio" name="tendency_p">&nbsp;그렇다</label>
                  <label class="radio">
                    <input value="5" type="radio" name="tendency_p">매우그렇다</label>
                </div>
              </div>
              <div style="margin:auto 450px">
                <button class="btn btn-danger btn-lg" type="button">이전
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
    <footer class="section" style="background-color:black; margin-top:">
      <div class="container">
        <div class="row">
          <div class="col-sm-6">
            <h1 class="text-muted" style="color:white;">Team Project Manager</h1>
            <p class="text-muted" style="color:white;">Lorem ipsum dolor sit amet, consectetur adipisici elit,
              <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
              <br>Ut enim ad minim veniam, quis nostrud</p>
          </div>
          <div class="col-sm-6">
            <p class="text-muted text-right">
              <br>
              <br>
            </p>
            <div class="row">
              <div class="col-md-12 hidden-lg hidden-md hidden-sm text-left">
                <a href="#"><i class="fa fa-3x fa-fw fa-instagram text-inverse"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-twitter text-inverse"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-facebook text-inverse"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-github text-inverse"></i></a>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12 hidden-xs text-right">
                <a href="#"><i class="fa fa-3x fa-fw fa-instagram text-inverse"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-twitter text-inverse"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-facebook text-inverse"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-github text-inverse"></i></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </footer>
  </body>

</html>