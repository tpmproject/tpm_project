var wsocket;
var ws_msg;
var wsCount=0;
function connect(project_idx) {
	wsocket = new SockJS(
			"http://localhost:9090/tpm_project/project-sockjs.do?project_idx="+project_idx);
	wsocket.onmessage = onMessage; // 서버에서 메세지가 푸시될때 처리
	wsocket.onclose = onClose;
}
function onClose(){
	if(wsCount==0){
		var temp=window.confirm('연결이 끊겼습니다.\n다시 연결하시겠습니까?');
		if(temp){
			location.reload();
		}else{
			location.href="/tpm_project/projectList.do";
		}
	wsCount++;
	}
}
function disconnect() {
	wsocket.close();
}
function onMessage(evt) {
	var data = evt.data;
	data=data.split(',');
}

function updateWS(ws_msg) {
	wsocket.send(ws_msg);
}