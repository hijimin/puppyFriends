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
import com.kh.member.model.vo.Member;

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
						           rset.getString("content"),
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
	
	public ArrayList<Attendance> selectAttendanceList(Connection conn, String userNo){
		
		ArrayList<Attendance> list = new ArrayList<Attendance>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttendanceList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(userNo));
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Attendance at = new Attendance(rset.getInt("attendance_no"),
									           rset.getString("member_no"),
									           rset.getString("date"),
									           rset.getString("attendance_status"),
									           rset.getString("member_name"));
				
				list.add(at);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public ArrayList<Image> searchDog(Connection conn, String name){
		
		ArrayList<Image> list = new ArrayList<Image>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchDog");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Image i = new Image();
				i.setFilePath(rset.getString("file_path"));
				i.setContent(rset.getString("content"));
				i.setDogNo(rset.getString("dog_name"));
				
				list.add(i);		      
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public ArrayList<Member> selectMember(Connection conn){
		
		ArrayList<Member> list = new ArrayList<Member>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member m = new Member(rset.getInt("member_no"),
						              rset.getString("member_id"),
						              rset.getString("member_name"));
				
				list.add(m);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public int checkAttendance(Connection conn, String userNo, String date) {
		
		int check = 0; // 날짜가 이미 있으면 1, 없으면 0
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("checkAttendance");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userNo);
			pstmt.setString(2, date);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				check++;
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return check;
		
	}
	
	public int updateAttendance(Connection conn, Attendance at) {
		
		int insert = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateAttendance");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getStatus());
			pstmt.setInt(2, Integer.parseInt(at.getMemberNo()));
			pstmt.setString(3, at.getDate());
			
			insert = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return insert;
		
	}
	
	
	
	
	
	
	
	
	
}
