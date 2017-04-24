package tpm.socket;

import java.util.Date;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ProjectSocketHandler extends TextWebSocketHandler{
	
	private Map<String, Map> pMap = new ConcurrentHashMap<String, Map>();
	
	 /**
   * 클라이언트 연결 이후에 실행되는 메소드
   */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		String uri=session.getUri().toString();
		String project_idx=uri.substring(uri.lastIndexOf('=')+1);
		if(pMap.get(project_idx) == null){
			Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
			pMap.put(project_idx, users);
			System.out.println(project_idx + " 소켓룸 생성");
		}
		
		Map<String, WebSocketSession> umap = pMap.get(project_idx);
		umap.put(session.getId(), session);
		System.out.println(pMap.get(project_idx).get(session.getId()));
		System.out.println("프로젝트:"+project_idx + " 소켓룸 에 " + session.getId() + " 가 접속.");
		
	}

	/**
   * 클라이언트가 연결을 끊었을 때 실행되는 메소드
   */
	@Override
	public void afterConnectionClosed(
			WebSocketSession session, CloseStatus status) throws Exception {
		Set<String> keys = pMap.keySet();
		for (String key : keys) {
			Map<String, WebSocketSession> umap = pMap.get(key);
			if(umap.get(session.getId()) != null){
				umap.remove(session.getId());
				System.out.println(key + " 소켓룸 에 " + session.getId() + " 가 접속종료.");
				
				if(umap.size() == 0){
					pMap.remove(key);
					System.out.println(key + " 소켓룸에 아무도 없으므로 해당 소켓룸 삭제.");
				}
				break;
			}
		}
	}

	/**
   * 클라이언트가 웹소켓서버로 메시지를 전송했을 때 실행되는 메소드
   */
	@Override
	protected void handleTextMessage(
			WebSocketSession session, TextMessage message) throws Exception {
		
		log(session.getId() + "로부터 메시지 수신: " + message.getPayload());
		
		Set<String> keys = pMap.keySet();
		for (String key : keys) {
			Map<String, WebSocketSession> umap = pMap.get(key);
			if(umap.containsKey(session.getId())){
				for (WebSocketSession s : umap.values()) {
					s.sendMessage(message);
				}
			}
		}
	}

	@Override
	public void handleTransportError(
			WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());
	}

	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}

}
