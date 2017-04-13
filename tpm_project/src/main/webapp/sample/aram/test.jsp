<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>TPM</title>
<script type="text/javascript" src="/tpm_project/js/jquery-3.2.0.js"></script>

<script>

//ondragstart 드래그할 때 id값 가져오기!
function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

//ondrop =>나 위에 드랍했을 때 일어나는 이벤트 ->data는 드래그 당한 컴포넌트
function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    
    window.alert(data);
}

//ondragover 드래그 완료시 해당 엘리먼트의 기본 동작 막아줌
function allowDrop(ev) {
    ev.preventDefault();
}

</script>

</head>

<body>
<p>
휴지와 휴지통으로 비교하자면~
드래그 하는 애(휴지)는 
아래 속성을 주고
draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)"

휴지통은 
draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)"
에다가 
ondrop="drop(event)"
까지 줍니다.

drop(event)에다가 드롭했을 때 발생하는 이벤트를 자바스크립트로 적으면 됩니다~
물론 function 이름을 바꿔도 노 상관 ex) mamdero(event) 로 해서 ㅋㅋ
이 jsp에 있는게 가장 기본?! ㅋㅋ
휴지통에 휴지를 넣으면 
휴지의 id값을 가져올 수 있으니 하고 싶은대로 처리하시면 됩니다~

아래 예제에는 id를 알림으로 띄우고
초록이에만 휴지통으로 설정해놨슴다~

유효성 검사 잘하시길... 
초록이도 초록이에 넣을수가 있어서..
</p>
<div id="gree" style="width:50px;height:50px;background: green;" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)" ondrop="drop(event)"></div>
<div id="yell" style="width:50px;height:50px;background: yellow;" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)"></div>
<div id="blu" style="width:50px;height:50px;background: blue;" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)"></div>
<div id="gra" style="width:50px;height:50px;background: gray;" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)"></div>



</body>
</html>