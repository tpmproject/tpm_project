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
<div id="gree" style="width:50px;height:50px;background: green;" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)" ondrop="drop(event)"></div>
<div id="yell" style="width:50px;height:50px;background: yellow;" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)"></div>
<div id="blu" style="width:50px;height:50px;background: blue;" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)"></div>
<div id="gra" style="width:50px;height:50px;background: gray;" draggable="true" ondragover="allowDrop(event)" ondragstart="drag(event)"></div>



</body>
</html>