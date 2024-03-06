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
	



	public ArrayList<Chatting> ChattingForm(String memberId){
		Connection conn = getConnection();
		ArrayList<Chatting> list = new ChattingDao().ChattingForm(conn, memberId);
		
		close(conn);
		return list;
		
	} // ChattingForm



}
