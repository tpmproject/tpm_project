<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>Insert title here</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="css/ttttt2222.css"
    rel="stylesheet" type="text/css">
    <link href="css/ttttt2222.css"
    rel="stylesheet" type="text/css">
<script type="text/javascript">
function workAdd(){
    $("#popbutton").click(function(){
        $('div.modal').modal({remote : 'workAdd.do'});
    })
}
</script>
<style>
#category td{
color:black;
height:35px;
font:bold 15px "맑은 고딕";
border-top:1px solid;
}
</style>
</head>
<body>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-2">
            <table class="table">
              <tbody>
                <tr>
                  <td>카테고리명</td>
                  <td align="right">설정</td>
                </tr>
                <tr>
                  <td>업무명</td>
                  <td align="right">
                    <a onclick="workAdd()">설정</a>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">기간</td>
                </tr>
                <tr>
                  <td colspan="2">멤버1, 멤버2</td>
                </tr>
                <tr>
                  <td colspan="2">체크리스트+</td>
                </tr>
                <tr>
                  <td colspan="2">
                    <textarea rows="7">업무2</textarea>
                  </td>
                </tr>
                <tr>
                  <td colspan="2" align="left">표시하기</td>
                </tr>
                <tr>
                  <td>진행률</td>
                  <td>막대그래프</td>
                </tr>
                <tr>
                  <td>
                    <input type="button" value="결재요청">
                  </td>
                  <td align="right">코멘트|첨부파일</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>