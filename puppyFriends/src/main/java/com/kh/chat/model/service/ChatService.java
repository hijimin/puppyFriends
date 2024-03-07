package com.kh.chat.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.chat.model.dao.ChatDao;
import com.kh.chat.model.vo.Chat;
import static com.kh.common.JDBCTemplate.*;

public class ChatService {
	
	public int submit(String fromId, String toId, String content) {
		
		Connection conn = getConnection();
		
		int result = new ChatDao().submit(fromId, toId, content, conn);
				
		if(result > 0) {
			commit(conn);
		}else{
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	public ArrayList<Chat> selectChatList(String fromId, String toId){
		
		Connection conn = getConnection();
		
		ArrayList<Chat> list = new ChatDao().selectChatList(conn, fromId, toId);
		
		close(conn);
		
		return list;
		
	}
	
	public ArrayList<Chat> memberChatList(){
		
		Connection conn = getConnection();
		
		ArrayList<Chat> list = new ChatDao().memberChatList(conn);
		
		close(conn);
				
		return list;
		
	}
	
	/*
	public ArrayList<Chat> memberChat(String userId){
		
		Connection conn = getConnection();
		
		ArrayList<Chat> list = new ChatDao().memberChat(conn, userId);
		
		close(conn);
		
		return list;
		
	}
	*/
	
	

}
