<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
    rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
    rel="stylesheet" type="text/css">
</head>
<body>
<h2>나의 업무페이지</h2>
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
          <a class="navbar-brand" href="#">나의 업무</a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-ex-collapse">
          <ul class="nav navbar-nav navbar-right">
            <li class="active">
              <a href="#">스케줄</a>
            </li>
            <li>
              <a href="#">타임라인</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-3">
            <table class="table">
              <thead>
                <tr>
                  <th>기간</th>
                </tr>
              </thead>
              <tbody>
                <tr></tr>
                <tr>
                  <td>
                    <select>
                      <option>30일</option>
                      <option>150일</option>
                      <option>7일</option>
                      <option>1일</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <th>필터</th>
                </tr>
                <tr>
                  <td>
                    <input type="checkbox">결재대기 업무</td>
                </tr>
                <tr>
                  <td>
                    <input type="checkbox">완료 업무</td>
                </tr>
                <tr>
                  <td>
                    <input type="checkbox">마감일 지난 업무</td>
                </tr>
                <tr>
                  <td>
                    <input type="checkbox">이번달까지 업무</td>
                </tr>
                <tr>
                  <th>프로젝트</th>
                </tr>
                <tr>
                  <td>
                    <input type="checkbox">myproject1</td>
                </tr>
                <tr>
                  <td>
                    <input type="checkbox">myproject2</td>
                </tr>
                <tr>
                  <td col="2">
                    <input value="필터 취소" type="reset">
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
</body>
</html>