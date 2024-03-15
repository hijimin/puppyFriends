package com.kh.common.model.vo;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/ChatingServer")
public class BoardChattingServer {
    private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
    private static Map<String, Integer> voteCounts = Collections.synchronizedMap(new HashMap<String, Integer>());
    private static boolean votingInProgress = false;

    @OnOpen
    public void onOpen(Session session) {
        clients.add(session);
        System.out.println("채팅방 입장: " + session.getId());
    }

    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        System.out.println("메시지 전송: " + session.getId() + ": " + message);
        synchronized (clients) {
            if (message.startsWith("{\"type\":\"vote\",\"option\":\"") && message.endsWith("\"}")) {
                handleVoteMessage(message);
            } else {
                broadcast(message);
            }
        }
    }

    @OnClose
    public void onClose(Session session) {
        clients.remove(session);
        System.out.println("웹소켓 종료: " + session.getId());
    }

    @OnError
    public void onError(Throwable e) {
        System.out.println("에러 발생");
        e.printStackTrace();
    }

    private void broadcast(String message) throws IOException {
        for (Session client : clients) {
            client.getBasicRemote().sendText(message);
        }
    }

    private void handleVoteMessage(String message) {
        if (!votingInProgress) {
            votingInProgress = true;
            String option = message.substring(message.indexOf(":\"") + 2, message.lastIndexOf("\""));
            if (message.contains("vote")) {
                increaseVoteCount(option);
                broadcastVotes();
            } else {
                decreaseVoteCount(option);
                broadcastVotes();
            }
        }
    }

    private void increaseVoteCount(String option) {
        int count = voteCounts.getOrDefault(option, 0);
        voteCounts.put(option, count + 1);
        try {
            broadcast("{\"type\":\"voteUpdate\",\"option\":\"" + option + "\",\"count\":" + (count + 1) + "}");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void decreaseVoteCount(String option) {
        int count = voteCounts.getOrDefault(option, 0);
        if (count > 0) {
            voteCounts.put(option, count - 1);
            try {
                broadcast("{\"type\":\"voteUpdate\",\"option\":\"" + option + "\",\"count\":" + (count - 1) + "}");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void broadcastVotes() {
        StringBuilder voteMessage = new StringBuilder("{\"type\":\"voteCounts\",\"counts\":{");
        for (String option : voteCounts.keySet()) {
            int count = voteCounts.get(option);
            voteMessage.append("\"").append(option).append("\":").append(count).append(",");
        }
        if (!voteCounts.isEmpty()) {
            voteMessage.setLength(voteMessage.length() - 1);
        }
        voteMessage.append("}}");

        try {
            broadcast(voteMessage.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
