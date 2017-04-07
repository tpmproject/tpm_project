<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Drag Test</title>
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<script type="text/javascript">
function init() {
 //canvas를 통해 2d 컨텍스트 생성
 var canvas = document.getElementById('imgBox');
 context = canvas.getContext('2d');
 
 //이미지 객체 생성
 var myImg = new Image();
 myImg.src = 'image/1.png';
 
 //컨텍스트에 이미지를 그린다. (x:0,y:0)위치에 가로150 세로150 크기로
 context.drawImage(myImg, 0,0,150,150);
}
 
//드래그 시작시
function drag(event) {
 //드래그중인 요소의 아이디를 저장.
 event.dataTransfer.setData("Text", event.target.id);
 //드래그 하는 동안 copy 효과 지정
 event.dataTransfer.effectAllowed="move";
}
 
//드래그 드롭시
function drop(event) {
 //드롭된 요소의 아이디를 가져온다.
 var data = event.dataTransfer.getData("Text");
 
 //드래그오버시 설정된 css 제거
 $(event.target).css('box-shadow','');
 
 //타겟의 자식으로 요소를 추가한다.
 event.target.appendChild(document.getElementById(data));
 //모든 요소는 드롭을 허용하지 않기 때문에 기본값을 취소하는 오퍼레이션.
 event.preventDefault();
}
 
//드래그 오버시
function dropSet(event) {
 //모든 요소는 드롭을 허용하지 않기 때문에 기본값을 취소하는 오퍼레이션.
 event.preventDefault();
 
 //box-shadow 옵션
 switch (event.target.id) {
 case 'div1':
//   $('#div1').css('box-shadow','fromLeft fromTop density color');
  $('#div1').css('box-shadow','5px 5px 5px #ccccff');
  $('#div2').css('box-shadow', '');
  break;
 case 'div2':
  $('#div2').css('box-shadow','5px 5px 5px #ccccff');
  $('#div1').css('box-shadow', '');
  break;
 
 default:
  break;
 }
 //드롭이 끝날 때 보여질 효과
 event.dataTransfer.dropEffect="move";
}
</script>
<style type="text/css">
div.box {
 width: 200px;
 height: 200px;
 border: 1px solid red;
}
#imgBox {
 border: 1px solid #00ff00;
}
</style>
</head>
<body onload="init();">
<div id="div1" class="box" ondrop="drop(event);" ondragover="dropSet(event);">
 <canvas id="imgBox" width="150px" height="150px" draggable="true" ondragstart="drag(event);"></canvas>
</div>
<div id="div2" class="box" ondrop="drop(event);" ondragover="dropSet(event);"></div>
</body>
 
</html>