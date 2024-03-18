package com.kh.common.model.vo;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


@ServerEndpoint("/ChatingServer")
public class BoardChattingServer {
    private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
    // 3.17: WebSocket session id과 client member id를 match 시키기 위한 HashMap 
    private static HashMap<String, String> clientSessionMap = new HashMap<String, String>();

    @OnOpen
    public void onOpen(Session session) {
        clients.add(session);
        System.out.println("채팅방 입장: " + session.getId());
    }

    @OnMessage
    public void onMessage(String message, Session session) throws IOException, ParseException {
        System.out.println("메시지 전송: " + session.getId() + ": " + message);
        synchronized (clients) {
        	// 3.17: 최초 클라이언트가 접속 할 때 자신이 누구인지 알리기 위해 type에 COMMAND라 넣고 전송하면 member id를 알 수 있음
        	JSONParser parser = new JSONParser();
        	Object obj = parser.parse(message);
        	JSONObject jObj = (JSONObject)obj;
        	
        	String type = (String)jObj.get("type");
        	String sender = (String)jObj.get("sender");
        	
        	// 3.17: 만약에 type이 COMMAND이면 HashMap에 session id와 member id를 넣음
        	if (type.equals("CHAT")) {
        		// 3.17 hasWhisper가 실행될 때 귓속말인지 확인하고 귓속말이면 broadcast를 실행하지 않도록 함
        		if (!hasWhisper(session, message)) {
        			broadcast(message);
        			// clientSessionMap.remove(session.getId());
        		}
        	} else if (type.equals("COMMAND")) {
        		clientSessionMap.put(session.getId(), sender);
        	}
        	
        	System.out.println(clientSessionMap);
        	
        }
    }

    @OnClose
    public void onClose(Session session) {
        clients.remove(session);
        clientSessionMap.remove(session.getId());
        System.out.println("웹소켓 종료: " + session.getId());
    }

    @OnError
    public void onError(Throwable e) {
        System.out.println("에러 발생");
        e.printStackTrace();
    }

    // 3.17 귓속말인지 확인하고 귓속말이면 귓속말전송
    private Boolean hasWhisper(Session session, String originMessage) throws IOException, ParseException {
    	// 3.17 문자열로 되어있는 JSON 메시지를 Object로 변환
    	JSONParser parser = new JSONParser();
    	Object obj = parser.parse(originMessage);
    	JSONObject jObj = (JSONObject)obj;
    	String sender = (String)jObj.get("sender");
    	String message = (String)jObj.get("content");
    
    	// 3.17 정규식을 이용해서 귓속말 member id가 있는지 확인
    	String regEx = "[@]+([a-zA-Z]{1}[a-zA-Z0-9]*)[\\ ]+";
    	Pattern pattern = Pattern.compile(regEx);
    	Matcher matcher = pattern.matcher(message);
    	
    	ArrayList<String> memberIds = new ArrayList<String>();
    	while (matcher.find()) {
    		String matchStr = matcher.group(0);
    		String memberId = matcher.group(1);
    		
    		message = message.replaceAll(matchStr, "");
    		memberIds.add(memberId);
    	}
    	
    	if (memberIds.size() > 0) {
    		String whisperReceiver = new String(memberIds.toString());
    		System.out.println(whisperReceiver);
        	whisperReceiver = whisperReceiver.replaceAll("\\[", "");
        	whisperReceiver = whisperReceiver.replaceAll("\\]",  "");
        	
        	jObj.remove("type");
        	jObj.remove("content");
        	jObj.put("type", "WHISPER");
        	jObj.put("content", message);
        	jObj.put("whisperReceiver", whisperReceiver);
    		
    		for (Session client : clients) {
    			if (memberIds.contains(clientSessionMap.get(client.getId())) ||
    				session.getId() == client.getId()) {
    				client.getBasicRemote().sendText(jObj.toJSONString());
    			}
            }
    		
    		return true;
    	}
    	
    	return false;
    }
    
    private void broadcast(String message) throws IOException {
        for (Session client : clients) {
            client.getBasicRemote().sendText(message);
        }
    }
}
