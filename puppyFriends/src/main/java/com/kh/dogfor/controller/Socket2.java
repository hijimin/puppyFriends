package com.kh.dogfor.controller;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@ServerEndpoint("/chat/{username}")
public class Socket2 {

    private static Map<String, Session> connectedSessions = new HashMap<>();

    @OnOpen
    public void onOpen(Session session, @PathParam("username") String username) {
        // 클라이언트가 연결될 때 호출됩니다.
        // 세션을 저장하거나 초기화 작업을 수행할 수 있습니다.
        connectedSessions.put(username, session);
    }

    @OnMessage
    public void onMessage(String message, Session session, @PathParam("username") String username) {
        // 클라이언트로부터 메시지를 받을 때 호출됩니다.
        // 메시지를 처리하고 필요한 작업을 수행합니다.

        // 상대방의 세션을 찾아 메시지를 전송합니다.
        String[] parts = message.split(":", 2);
        String recipient = parts[0].trim();
        String content = parts[1].trim();

        Session recipientSession = connectedSessions.get(recipient);
        if (recipientSession != null) {
            try {
                recipientSession.getBasicRemote().sendText(username + ": " + content);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @OnClose
    public void onClose(Session session, @PathParam("username") String username) {
        // 클라이언트와의 연결이 닫힐 때 호출됩니다.
        // 세션을 제거하거나 정리 작업을 수행할 수 있습니다.
        connectedSessions.remove(username);
    }

    @OnError
    public void onError(Session session, Throwable error) {
        // 에러가 발생했을 때 호출됩니다.
        error.printStackTrace();
    }
}
