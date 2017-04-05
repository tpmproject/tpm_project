<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<link type="text/css" href="css/jquery-ui.min.css" rel="stylesheet">
<script type="text/javascript">
var p1=document.getElementById('btnwork');
var p2=document.getElementById('btnwork2');
function next(){
	p1.style.display='none';
	p2.style.display='block';
}
function before(){
	p1.style.display='block';
	p2.style.display='none';
}
</script>
</head>
<body>

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal">x</button>
	<h4 class="modal-title">업무자 추가</h4>
</div>

<div class="modal-body">
	<form name="newWork" action="workAdd.do" method="post">
	<div id="btnwork">
	<table>
		<tr>
			<td>업무명</td>
			<td><input type="text" name="work_title"></td>
		</tr>
		<tr>
			<td colspan="2">기한</td>
		</tr>
		<tr>
			<td><input type="text" id="calendar" name="work_start" rel="stylesheet"/></td>
			<td>~<input type="text" id="calendar2" name="work_end" rel="stylesheet"/></td>
		</tr>
		<tr>
			<td><input type="checkbox" name="work_confirm" value="on">결재여부</td>
			<td><button type="button" class="btn btn-next" id="btn-worknext" onclick="next()">다음</button></td>
		</tr>
	</table>
	</div>
	<div id="btnwork2" style="display:none;">
	    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-3">
            <h4 class="text-center">프로젝트 멤버 목록</h4>
            <ul class="media-list">
              <li class="media">
                <a class="pull-left" href="#"><img class="media-object" src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png" height="30" width="30"></a>
                <div class="media-body">
                  <h5 class="media-heading">Media heading</h5>
                </div>
              </li>
              <li class="media">
                <a class="pull-left" href="#"><img class="media-object" src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png" height="30" width="30"></a>
                <div class="media-body">
                  <h6 class="media-heading">Media heading</h6>
                </div>
              </li>
            </ul>
            <p></p>
            <p></p>
          </div>
          <div class="col-md-3">
            <h4 class="text-center">업무 담당자</h4>
            <ul class="media-list">
              <li class="media">
                <a class="pull-left" href="#"><img class="media-object" src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png" height="30" width="30"></a>
                <div class="media-body">
                  <h6 class="media-heading">Media heading</h6>
                </div>
              </li>
              <li class="media">
                <a class="pull-left" href="#"><img class="media-object" src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png" height="30" width="30"></a>
                <div class="media-body">
                  <h6 class="media-heading">Media heading</h6>
                </div>
              </li>
            </ul>
            <p></p>
            <p></p>
          </div>
        </div>
      </div>
    </div>
		<button type="button" class="btn btn-next" id="btn-workbefore" onclick="before()">이전</button>
		<input type="submit" class="btn" value="완료">
	</div>
	</form>
</div>
</body>
<script>
$("#calendar").datepicker({
	changeMonth:true,
	changeYear:true,
	showButtonPanel:true,
	dateFormat:"yy-mm-dd"
});
$("#calendar2").datepicker({
	changeMonth:true,
	changeYear:true,
	showButtonPanel:true,
	dateFormat:"yy-mm-dd"
});
</script>
</html>