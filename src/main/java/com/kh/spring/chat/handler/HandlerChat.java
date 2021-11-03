package com.kh.spring.chat.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.spring.member.vo.Student;



@Component
public class HandlerChat extends TextWebSocketHandler{
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	// 클라이언트가 서버로 연결 처리
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		// 채팅방에 접속한 사용자 세션을 리스트에 저장
		sessionList.add(session);
		
		Student loginStu = (Student) session.getAttributes().get("loginStu");
		
		session.sendMessage(new TextMessage("==============낙성대학교 실시간 채팅방에서는 욕설과 비방을 삼가해주실 바랍니다.=============="));

		// 모든 세션에 채팅 전달
		for (int i = 0; i < sessionList.size(); i++) {
			WebSocketSession s = sessionList.get(i);
			//s.sendMessage(new TextMessage("☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆"));
			s.sendMessage(new TextMessage("☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆"+ loginStu.getStuId() +" "+ loginStu.getStuName() + "님이 입장했습니다.☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆"));
			//s.sendMessage(new TextMessage("☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆"));
			
		}
	}

	// 클라이언트가 서버로 메세지 전송 처리
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		Student loginStu = (Student) session.getAttributes().get("loginStu");

		// 모든 세션에 채팅 전달
		for (int i = 0; i < sessionList.size(); i++) {
			WebSocketSession s = sessionList.get(i);
			s.sendMessage(new TextMessage(loginStu.getStuId() +" "+ loginStu.getStuName() + " : " + message.getPayload()));
		}
	}
	

	// 클라이언트가 연결을 끊음 처리
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		// 채팅방에서 퇴장한 사용자 세션을 리스트에서 제거
		sessionList.remove(session);
		
		Student loginStu = (Student) session.getAttributes().get("loginStu");

		// 모든 세션에 채팅 전달
		for (int i = 0; i < sessionList.size(); i++) {
			WebSocketSession s = sessionList.get(i);
			
			//s.sendMessage(new TextMessage("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★"));
			s.sendMessage(new TextMessage("★★★★★★★★★★★★★★★★★"+ loginStu.getStuId() +" "+ loginStu.getStuName() + "님이 퇴장했습니다."+"★★★★★★★★★★★★★★★"));
			//s.sendMessage(new TextMessage("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★"));
			
		}

	}
}
