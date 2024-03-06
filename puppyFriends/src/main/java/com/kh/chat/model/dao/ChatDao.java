package com.kh.chat.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.chat.model.vo.Chat;
import static com.kh.common.JDBCTemplate.*;
import com.kh.dogfor.model.dao.DogforDao;

public class ChatDao {

	private Properties prop = new Properties();
	
	public ChatDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(DogforDao.class.getResource("/db/sql/chat-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<Chat> getChatListById(String fromId, String toId, String chatNo, Connection conn){
		
		ArrayList<Chat> list = new ArrayList<Chat>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getChatListById");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, fromId);
			pstmt.setString(2, toId);
			pstmt.setString(3, toId);
			pstmt.setString(4, fromId);
			pstmt.setInt(5, Integer.parseInt(chatNo));
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				int chatDate = Integer.parseInt(rset.getString("chat_date").substring(11, 13));
				String timetype = "오전";
				if(chatDate >= 12) {
					timetype = "오후";
					chatDate -= 12;
				}
				
				Chat ch = new Chat(rset.getInt("chat_no")
							       , rset.getString("from_id").replace(" ", "&nbsp;").replace("<", "&lt;").replace(">", "&gt;").replace("\n", "<br>")
							       , rset.getString("to_id").replace(" ", "&nbsp;").replace("<", "&lt;").replace(">", "&gt;").replace("\n", "<br>")
							       , rset.getString("content").replace(" ", "&nbsp;").replace("<", "&lt;").replace(">", "&gt;").replace("\n", "<br>")
							       , rset.getString("chat_date").substring(0, 11) + " " + timetype + " " + chatDate + ":" + rset.getString("chat_date").substring(14, 16) + "");
				
				list.add(ch);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
		
	}
	
	public ArrayList<Chat> getChatListByRecent(String fromId, String toId, int num, Connection conn){
			
		ArrayList<Chat> list = new ArrayList<Chat>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getChatListByRecent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, fromId);
			pstmt.setString(2, toId);
			pstmt.setString(3, toId);
			pstmt.setString(4, fromId);
			pstmt.setInt(5, num);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				int chatDate = Integer.parseInt(rset.getString("chat_date").substring(11, 13));
				String timetype = "오전";
				if(chatDate >= 12) {
					timetype = "오후";
					chatDate -= 12;
				}
				
				Chat ch = new Chat(rset.getInt("chat_no")
							       , rset.getString("from_id").replace(" ", "&nbsp;").replace("<", "&lt;").replace(">", "&gt;").replace("\n", "<br>")
							       , rset.getString("to_id").replace(" ", "&nbsp;").replace("<", "&lt;").replace(">", "&gt;").replace("\n", "<br>")
							       , rset.getString("content").replace(" ", "&nbsp;").replace("<", "&lt;").replace(">", "&gt;").replace("\n", "<br>")
							       , rset.getString("chat_date").substring(0, 11) + " " + timetype + " " + chatDate + ":" + rset.getString("chat_date").substring(14, 16) + "");
				
				list.add(ch);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
			
	}
	
	public int submit(String fromId, String toId, String content, Connection conn){
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("submit");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, fromId);
			pstmt.setString(2, toId);
			pstmt.setString(3, content);
		
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public ArrayList<Chat> selectChatList(Connection conn, String fromId, String toId){
		
		ArrayList<Chat> list = new ArrayList<Chat>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectChatList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, fromId);
			pstmt.setString(2, toId);
			pstmt.setString(3, toId);
			pstmt.setString(4, fromId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				int chatDate = Integer.parseInt(rset.getString("chat_date").substring(11, 13));
				String timetype = "오전";
				if(chatDate >= 12) {
					timetype = "오후";
					chatDate -= 12;
				}
				
				Chat c = new Chat(rset.getInt("chat_no")
							       , rset.getString("from_id").replace(" ", "&nbsp;").replace("<", "&lt;").replace(">", "&gt;").replace("\n", "<br>")
							       , rset.getString("to_id").replace(" ", "&nbsp;").replace("<", "&lt;").replace(">", "&gt;").replace("\n", "<br>")
							       , rset.getString("content").replace(" ", "&nbsp;").replace("<", "&lt;").replace(">", "&gt;").replace("\n", "<br>")
							       , rset.getString("chat_date").substring(0, 11) + " " + timetype + " " + chatDate + ":" + rset.getString("chat_date").substring(14, 16) + "");
		
				list.add(c);
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
