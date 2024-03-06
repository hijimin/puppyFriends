package com.kh.chatting.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.chatting.model.dao.ChattingDao;
import com.kh.chatting.model.vo.Chatting;

public class ChattingService {

	public ArrayList<Chatting> selectChatting(){
		Connection conn = getConnection();
		ArrayList<Chatting> list = new ChattingDao().selectChatting(conn);
		
		close(conn);
		return list;
		
	} // selectChatting
	



	public Chatting ChattingForm(String memberId, String chattingCity){
		Connection conn = getConnection();
		Chatting chat = new ChattingDao().ChattingForm(conn, memberId, chattingCity);
		
		close(conn);
		return chat;
		
	} // ChattingForm
	
	
	
	


}
