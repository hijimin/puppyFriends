package com.kh.reservation.model.dao;

import static com.kh.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

// import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.dao.MemberDao;
import com.kh.reservation.model.vo.Hotel;

public class ReservationDao {
	private Properties prop = new Properties();

	public ReservationDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(MemberDao.class.getResource("/db/sql/reservation-mapper.xml").getPath()));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}public ArrayList<Hotel> selectHotelList(Connection conn) {

		ArrayList<Hotel> list = new ArrayList<Hotel>(); // [텅 빈 리스트]
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectHotelList");
		
		try {
			pstmt = conn.prepareStatement(sql);			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
	            list.add(new Hotel(rset.getInt("hotel_no"),
	                           rset.getString("hotel_name"),
	                           rset.getString("hotel_text"),
	                           rset.getString("hotel_size"),
	                           rset.getDate("writing_date"),
	                           rset.getString("member_id")
	                           ));
	         }
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rset);
			close(pstmt);
		}
		
	return list;
	
	}

	public Hotel selectHotelDetail(Connection conn, int hotelNo) {
		Hotel h = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectHotelDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);	
			
			pstmt.setInt(1, hotelNo);
	
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				h = new Hotel();
				h.setHotelNo(rset.getInt("hotel_no"));
				h.setHotelName(rset.getString("hotel_name"));
				h.setHotelText(rset.getString("hotel_text"));
				h.setHotelSize(rset.getString("hotel_size"));
				h.setdNumber(rset.getInt("d_number"));
				h.setWritingDate(rset.getDate("writing_date"));
				h.setReservationDate(rset.getDate("reservation_date"));
				h.setMemberId(rset.getString("member_id"));
				h.setDogSize(rset.getString("dog_size"));
			}
				
							
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);

		}
		
		return h;
		
	}
	
	
	/*

	public ArrayList<Hotel> selectHotelList(Connection conn, PageInfo pi) {

		ArrayList<Hotel> list = new ArrayList<Hotel>(); // [텅 빈 리스트]
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectHotelList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Hotel(rset.getInt("hotel_no"),
								   rset.getString("hotel_name"),
								   rset.getString("member_id")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rset);
			close(pstmt);
		}
		
	return list;
	
	}
	
	*/
	
	
}
