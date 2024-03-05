package com.kh.notice.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;

import com.kh.common.model.vo.AdminPageInfo;
import com.kh.notice.model.dao.NoticeDao;
import com.kh.notice.model.vo.Notice;

public class NoticeDao {

	private Properties prop = new Properties();
	
		public NoticeDao() {
		
		String filePath = NoticeDao.class.getResource("/db/sql/notice-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
		
	
		
		
	public ArrayList<Notice> selectNoticeList(Connection conn, AdminPageInfo pi) {
		
		ArrayList<Notice> list = new ArrayList<Notice>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNoticeList");
		
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while(rset.next()) {
				
				list.add(new Notice(rset.getInt("notice_no"),
						 			rset.getString("notice_writer"),
						 			rset.getString("notice_title"),
						 			rset.getString("notice_content"),
						 			rset.getInt("count"),
						 			rset.getDate("create_date"),
						 			rset.getDate("modify_date")
						 			));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	
	public int increaseCount(Connection conn, int noticeNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("noticeIncreaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	} // increaseCount
	
	public Notice selectNotice(Connection conn, int noticeNo) {
		
		Notice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new Notice(rset.getInt("notice_no"),
							   rset.getString("notice_writer"),
							   rset.getString("notice_title"),
							   rset.getString("notice_content"),
							   rset.getDate("create_date"),
							   rset.getString("status")
							   );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
		
	}
		
} // class
	
