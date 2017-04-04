<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
    rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
    rel="stylesheet" type="text/css">
  </head>
<script>
function cancle(){
	location.href='memberLogin.do';
}
	function check(){
		var email = document.memberAddForm.inputEmail.value;
		
		if(!email){
			window.alert('이메일을 입력해주세요');
		} else{
			window.open('memberSendEmail.do?email='+email, 'emailcheck','width=350, height=250');	
		}
	}
</script>
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
          <a class="navbar-brand" href="#"><span>TPM</span></a>
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
	<article class="container">
            <div class="col-md-6 col-md-offset-3"></div>
            <div class="col-md-12">
                <div class="page-header">
                    <h1>회원가입
                        <small>horizontal</small>
                    </h1>
                </div>
                <form class="form-horizontal" name="memberAddForm" action="memberAdd.do" method="post">
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="inputEmail">이메일</label>
                        <div class="col-sm-6">
                            <input class="form-control" id="inputEmail" type="email" name="member_id" placeholder="이메일">
                        </div>
                        <button class="btn btn-success" type="button" onclick="check()">이메일 인증
                            <i class="fa fa-times spaceLeft"></i>
                        </button>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
                        <div class="col-sm-6">
                            <input class="form-control" id="inputPassword" type="password" name="member_pwd" placeholder="비밀번호">
                            <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호 확인</label>
                        <div class="col-sm-6">
                            <input class="form-control" id="inputPasswordCheck" type="password" name="member_pwd_ch"placeholder="비밀번호 확인">
                            <p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="inputName">이름</label>
                        <div class="col-sm-6">
                            <input class="form-control" id="inputName" type="text" name="member_name" placeholder="이름">
                        </div>
                    </div>
                    
                    <div class="form-group">
           			 <label class="col-sm-3 control-label" for="inputName">연락처</label>
           			 <div class="col-sm-6">
             		 <input class="form-control" id="inputName" type="text" name="member_tel" placeholder="전화번호">
           			 </div>
       			    </div>
       			    
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="inputName">성별</label>
                        <div class="col-sm-6">
                            <select class="form-control" style="width:79px; float:left;" name="member_gender">
                                <option value="남">남자</option>
                                <option value="여">여자</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="inputAgree">약관 동의</label>
                        <div class="col-sm-6" data-toggle="buttons">
                            <label class="btn btn-warning active">
                                <input id="agree" type="checkbox" autocomplete="off" chacked="">
                                <span class="fa fa-check"></span>
                            </label>
                            <a href="#">이용약관</a>에 동의 합니다.</div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12 text-center">
                            <button class="btn btn-primary" type="submit">회원가입
                                <i class="fa fa-check spaceLeft"></i>
                            </button>
                            <button class="btn btn-danger" type="button" onclick="cancle();">가입취소
                                <i class="fa fa-times spaceLeft"></i>
                            </button>
                        </div>
                    </div>
                </form>
                <hr>
            </div>
        </article>
        <footer class="section" style="background-color:black; margin-top:170px">
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