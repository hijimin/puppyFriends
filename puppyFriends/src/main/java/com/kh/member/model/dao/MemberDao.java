package com.kh.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;

import com.kh.member.model.vo.Dog;
import com.kh.member.model.vo.Member;

public class MemberDao {

private Properties prop = new Properties();
	
	public MemberDao() {
	String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Member loginMember(Connection conn, String userId, String userPwd) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);

			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member();
				m.setMemberNo(rset.getInt("member_no"));
				m.setMemberId(rset.getString("member_id")); 
				m.setMemberPwd(rset.getString("member_pwd")); 
				m.setMemberName(rset.getString("member_name"));
				m.setMemberEmail(rset.getString("member_email"));
				m.setMemberPhone(rset.getString("member_phone"));
				m.setDogNo(rset.getInt("dog_no"));
				m.setDogName(rset.getString("dog_name"));
				m.setDogSize(rset.getString("dog_size"));
				m.setDogValue(rset.getString("dog_value"));
				m.setDogAge(rset.getInt("dog_age"));
				m.setDogGender(rset.getString("dog_gender"));
				m.setDogVaccine(rset.getString("dog_vaccine"));
				m.setDogSignificant(rset.getString("dog_significant"));
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
		
	}
	
	
	public int updateMember(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMemberEmail());
			pstmt.setString(2, m.getMemberPhone());
			pstmt.setString(3, m.getMemberId());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateDog(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateDog");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getDogName());
			pstmt.setString(2, m.getDogValue());
			pstmt.setInt(3, m.getDogAge());
			pstmt.setString(4, m.getDogGender());
			pstmt.setString(5, m.getDogSize());
			pstmt.setString(6, m.getDogVaccine());
			pstmt.setString(7, m.getDogSignificant());
			pstmt.setInt(8, m.getMemberNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public Member selectMember(Connection conn, String memberId) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("member_no"),
							   rset.getString("member_id"),
							   rset.getString("member_pwd"),
							   rset.getString("member_name"),
							   rset.getString("member_email"),
							   rset.getString("member_phone"),
							   rset.getInt("dog_no"),
							   rset.getString("dog_name"),
							   rset.getString("dog_value"),
							   rset.getString("dog_size"),
							   rset.getInt("dog_age"),
							   rset.getString("dog_gender"),
							   rset.getString("dog_vaccine"),
							   rset.getString("dog_significant")
							 
							   );
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}
	
	
	
	
	public Member kakaoLoginMember(Connection conn, String memberId, String memberName, String memberEmail) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("kakaoLoginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("member_no"),
							   rset.getString("member_id"),
							   rset.getString("member_name"),
							   rset.getString("member_email"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}
	
	
	
	
	public int insertMember(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPwd());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getMemberEmail());
			pstmt.setString(5, m.getMemberPhone());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public int insertDog(Connection conn, Dog d) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertDog");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, d.getDogName());
			pstmt.setString(2, d.getDogValue());
			pstmt.setString(3, d.getDogSize());
			pstmt.setInt(4, d.getDogAge());
			pstmt.setString(5, d.getDogGender());
			pstmt.setString(6, d.getDogVaccine());
			pstmt.setString(7, d.getDogSignificant());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public int idCheck(Connection conn, String checkId) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, checkId);
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
	
	public Member selectOrderMember(Connection conn, int userNo) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOrderMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				m = new Member(rset.getInt("member_no"),
								rset.getString("member_name"),
								rset.getString("email1"),
								rset.getString("email2"),
								rset.getString("phone1"),
								rset.getString("phone2"));
								
			}		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
	
	
}
