/**
 * 
 * readyState 프로퍼티 값
 *  0 (UNINITIALZED) : 객체만 생성되고 아직 초기화 되지 않은 상태 (open 메서드가 호출되지 않음)
 *  1 (LOADING) : open 메서드가 호출되고 아직 send 메서드가 호출되지 않은 상태
 *  2 (LOADED) : send 메서드가 호출되었지만 status 와 header 정보가 도착하지 않은 상태
 *  3 (INTERACTIVE) : 데이터의 일부를 받은 상태
 *  4 (COMPLETED) :데이터를 전부 받은 상태. 테이터를 활용 결과 조직이 가능함.
 * 
 * status 상태코드
 *  200 : OK (요청 성공)
 *  403 : Forbidden (접근 거부)
 *  404 : Not Found (페이지 없음)
 *  500 : Internal Server Error  
 *  
 * 
 */
function getXMLHttpRequest() {// XMLHttpRequest 객체 얻기
	
	if (window.XMLHttpRequest) { // IE 이외의 브라우저(Firefox, Chrome, Opera, Safari 등)
		return new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		try {
			return new ActiveXObject("Msxml2.XMLHTTP"); // IE 상위 버젼
		} catch(e) {
			try {
				return new ActiveXObject("Microsoft.XMLHTTP");// IE 하위 버젼
			} catch(e1) { 
				return null; 
			}
		}
	} else {
		return null;
	}
}
function sendRequest_extension(url, params, callback, method, ctype) {
	var httpRequest = getXMLHttpRequest(); // XMLHttpRequest 객체 얻기
	var httpMethod = method ? method : 'GET'; // 넘어온 method 가 없으면 기본값으로 GET
	if (httpMethod != 'GET' && httpMethod != 'POST') { // 이외의 문자열도 GET으로 초기화
		httpMethod = 'GET';
	}
	var httpParams = (params == null || params == '') ? null : params; // parms 셋팅
	var httpUrl = url;
	if (httpMethod == 'GET' && httpParams != null) { // GET 방식일 경우 URL에 추가적으로 파라미터를 삽입해 준다.
		httpUrl = httpUrl + "?" + httpParams;
	}               // method,  url,  동기 or 비동기(true)
	httpRequest.open(httpMethod, httpUrl, true); // 연결 (POST 또는 GET)
	httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); // POST 방식일 때 등록
	httpRequest.onreadystatechange = callback(httpRequest, ctype); // 콜백 함수 등록
	httpRequest.send(httpMethod == 'POST' ? httpParams : null); // POST 방식일 경우 파라미터값을 인자로, GET방식일 경우 NULL로
}

function sendRequest_uplaod_extension(url, fmid, callback, method, ctype) { // 파일 업로드 관련 아작스
	var httpRequest = getXMLHttpRequest(); // XMLHttpRequest 객체 얻기
	var httpMethod = method ? method : 'POST'; // 넘어온 method 가 없으면 기본값으로 GET
	if (httpMethod != 'GET' && httpMethod != 'POST') { // 이외의 문자열도 GET
		httpMethod = 'POST';
	}
	var fd = new FormData(document.getElementById(fmid));
	var httpUrl = url;
	
	httpRequest.open(httpMethod, httpUrl, true); // 연결 (POST)
	
	httpRequest.onreadystatechange = callback(httpRequest, ctype); // 콜백 함수 등록
	httpRequest.send(fd); // FormData를 인자로 Multipart 형식으로 보낸다.
}