package com.kh.chatting.model.dao;

import static com.kh.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import javax.naming.spi.DirStateFactory.Result;

import com.kh.chatting.model.vo.Chatting;

public class ChattingDao {

   private Properties prop = new Properties();
   
   public ChattingDao() {
         
         String filePath = ChattingDao.class.getResource("/db/sql/chatting-mapper.xml").getPath();
         
         try {
            prop.loadFromXML(new FileInputStream(filePath));
         } catch (IOException e) {
            e.printStackTrace();
         }   
      }
   
   
   
   public ArrayList<Chatting> selectChatting(Connection conn){
      ArrayList<Chatting> list = new ArrayList<Chatting>();
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = prop.getProperty("selectChatting");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         
         rset = pstmt.executeQuery();
         
         while(rset.next()) {      
            list.add(new Chatting(rset.getInt("CHATTING_NO"),
                             rset.getInt("CHATTING_MEMBER_NO"),
                             rset.getString("CHATTING_CITY"),
                             rset.getDate("CHATTING_DATE"),
                             rset.getString("CHATTING_CHECK")
                             ));
            
         }
      
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return list;
      
   } // selectChatting
   
   
   
   public Chatting ChattingForm(Connection conn, String memberId){
      Chatting chat = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = prop.getProperty("chattingForm");
      
      System.out.println(memberId);
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, memberId);
         
         rset = pstmt.executeQuery();
         
         while(rset.next()) {      
            chat = new Chatting(rset.getInt("CHATTING_NO"),
                             rset.getDate("CHATTING_DATE"),
                             rset.getString("CHATTING_STATUS"),
                             rset.getString("MEMBER_ID")
                             );
            
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         System.out.println(chat);
         close(rset);
         close(pstmt);
      }
      
      return chat;
      
   }
   
   
   
   
   
   
   
} // Class