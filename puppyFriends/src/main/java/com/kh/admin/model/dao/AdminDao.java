package com.kh.admin.model.dao;

import java.io.Closeable;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Properties;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.kh.member.model.dao.MemberDao.*;

import static com.kh.common.JDBCTemplate.*;

import com.kh.common.model.vo.AdminPageInfo;
import com.kh.member.model.vo.Dog;
import com.kh.member.model.vo.Member;

public class AdminDao {
	
	private Properties prop = new Properties();
	
	public AdminDao() {
		
		String filePath = AdminDao.class.getResource("/db/sql/admin-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}

	
	public int adminSelectListCount(Connection conn) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql =prop.getProperty("adminSelectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
				
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	} // adminSelectListCount
	
	
	public ArrayList<Member> adminSelectMember(Connection conn, AdminPageInfo pi){
		
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminSelectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getInt("member_no"),
									rset.getString("member_id"),
									rset.getString("member_name"),
									rset.getInt("dog_no"),
									rset.getString("dog_name"),
									rset.getString("member_email"),
									rset.getString("member_phone")
									));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	} // adminSelectMember
	
	
	public Dog adminDogInfo(Connection conn, int memberNo){
		
		Dog d = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminDogInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
						d = new Dog(rset.getInt("dog_no"),
								 rset.getInt("member_no"),
								 rset.getString("dog_name"),
								 rset.getString("dog_value"),
								 rset.getInt("dog_age"),
								 rset.getString("dog_gender"),
								 rset.getString("dog_vaccine"),
								 rset.getString("dog_significant")
								 );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return d;
		
	} // adminDogInfo()
	
	public int[] adminDeleteMember(Connection conn, int[] adminDeleteMember) {
        int[] result = null;
        PreparedStatement pstmt = null;
        String sql = prop.getProperty("adminDeleteMember");
        
        try {
            pstmt = conn.prepareStatement(sql);
            
            for (int i = 0; i < adminDeleteMember.length; i++) {
                pstmt.setInt(1, adminDeleteMember[i]);
                pstmt.executeUpdate();
            }
            
            result = adminDeleteMember;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        
        return result;
        
    } // adminDeleteMember
	
}
