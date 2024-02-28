package com.kh.dogfor.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;
import com.kh.common.model.vo.Image;
import com.kh.common.model.vo.PageInfo;
import com.kh.dogfor.model.vo.Attendance;
import com.kh.member.model.vo.Dog;

public class DogforDao {

	private Properties prop = new Properties();
	
	public DogforDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(DogforDao.class.getResource("/db/sql/dogfor-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public int insertImage(Connection conn, Image img) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertImage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, img.getFilePath());
			pstmt.setString(2, img.getFileName());
			pstmt.setString(3, img.getChangeName());
			pstmt.setInt(4, Integer.parseInt(img.getDogNo()));
			pstmt.setString(5, img.getContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public int selectThCount(Connection conn) {
		
		int count = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectThCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		return count;
		
	}
	
	
	public ArrayList<Image> selectList(Connection conn, PageInfo pi){
		
		ArrayList<Image> list = new ArrayList<Image>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Image(rset.getInt("file_no"),
						           rset.getString("dog_name"),
						           rset.getString("titleimg")));
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	
	public int levelCheck(Connection conn, int level) {
		
		int check = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("levelCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, level);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				check = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return check;
		
	}
	
	
	public ArrayList<Dog> selectDog(Connection conn){
		
		ArrayList<Dog> list = new ArrayList<Dog>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectDog");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Dog d = new Dog(rset.getInt("dog_no"),rset.getString("dog_name"));
				
				list.add(d);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public int insertAttendance(Connection conn, Attendance at) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttendance");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(at.getMemberNo()));
			pstmt.setString(2, at.getDate());
			pstmt.setString(3, at.getStatus());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
