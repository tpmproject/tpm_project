package tpm.sample.chat;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class EchoHandler extends TextWebSocketHandler {

	 /**
     * 클라이언트 연결 이후에 실행되는 메소드
     */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) 
			throws Exception {
		System.out.printf("%s 연결 됨\n", session.getId());
	}

	/**
     * 클라이언트가 웹소켓서버로 메시지를 전송했을 때 실행되는 메소드
     */
	@Override
	protected void handleTextMessage(
			WebSocketSession session, TextMessage message) throws Exception {
		System.out.printf("%s로부터 [%s] 받음\n", 
				session.getId(), message.getPayload());
		session.sendMessage(new TextMessage("echo: " + message.getPayload()));
	}

	 /**
     * 클라이언트가 연결을 끊었을 때 실행되는 메소드
     */
	@Override
	public void afterConnectionClosed(
			WebSocketSession session, CloseStatus status) throws Exception {
		System.out.printf("%s 연결 끊김\n", session.getId());
		//list
        //sessionList.remove(session);
		
        //map
        //sessions.remove(session.getId());
        //logger.info("{} 연결 끊김", session.getId());
	}

}
