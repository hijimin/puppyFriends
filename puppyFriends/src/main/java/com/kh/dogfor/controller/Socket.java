package com.kh.dogfor.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/socket")
public class Socket {
    private static Set<Session> sessions = Collections.synchronizedSet(new HashSet<>());

    
    @OnOpen
    public void onOpen(Session session) {
        sessions.add(session);
        broadcast("New user joined");
    }

    @OnMessage
    public void onMessage(String message, Session session) {
        broadcast(session.getId() + ": " + message);
    }

    @OnClose
    public void onClose(Session session) {
        sessions.remove(session);
        broadcast("User disconnected");
    }

    @OnError
    public void onError(Throwable error) {
        System.err.println("에러 : " + error.getMessage());
    }

    private void broadcast(String message) {
        for (Session session : sessions) {
            try {
                session.getBasicRemote().sendText(message);
            } catch (IOException e) {
                System.err.println("에러 메세지 : " + e.getMessage());
            }
        }
    }
}
