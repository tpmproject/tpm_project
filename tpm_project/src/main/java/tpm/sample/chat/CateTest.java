package tpm.sample.chat;

import org.springframework.web.socket.*;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class CateTest extends TextWebSocketHandler{
	
	public CateTest() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		System.out.println("연결!!!");
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionClosed(session, status);
		System.out.println("연결끝!!!!");
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		super.handleTextMessage(session, message);
	}
	
	@Override
	public void handleTransportError(
		WebSocketSession session, Throwable exception) throws Exception {
		
	}

}
