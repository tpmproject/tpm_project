<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
    rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
    rel="stylesheet" type="text/css">
</head>
<body>
  
    <div class="cover hidden-xs">
      
      <div class="background-image-fixed cover-image" style="background-image : url('/tpm_project/img/member/login_background.jpg')"></div>
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center">
            <form class="form-horizontal text-center" name="loginForm" action="memberLogin.do" method="post"
             role="form" style="width: 450px; height: 310px; margin: auto; background-color: white;">
             
              <h3 style="margin:30px auto; padding-top:20px">Log In</h3>
              <div class="form-group" style="margin:20px 35px">
                <div class="col-sm-10">
                  <input type="email" class="form-control" id="inputEmail3" placeholder="Email" name="member_id"
                  style="width:350px" value="${cookie.ck_saveid.value}">
                </div>
              </div>
              <div class="form-group" style="margin:20px 35px">
                <div class="col-sm-10">
                  <input type="password" class="form-control" id="inputPassword3" placeholder="Password" name="member_pwd"
                  style="width:350px">
                </div>
              </div>
              <div class="col-sm-10 col-sm-offset-2 text-left">
                <button type="submit" class="btn btn-success" style="width:350px; margin:auto -40px">로그인</button>
              </div>
              <div class="col-sm-10 col-sm-offset-2 text-left" style="margin:30px 30px; width:620px; font-size:18px;">
                <div class="checkbox">
                  <label style="margin:auto 5px; float:left;">
                    <input type="checkbox" name="cb_saveid" value="on" ${empty cookie.ck_saveid.value?'':'checked'}>Remember me</label>
                  <div style="margin:auto 140px; font-size:18px; float:left;"><a href="memberAdd.do">Sign Up</a></div>
                </div>
              </div> 
            </form>
            <br>
            <br>
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