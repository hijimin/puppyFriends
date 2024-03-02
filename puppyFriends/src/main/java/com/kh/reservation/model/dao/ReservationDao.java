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

import com.kh.member.model.dao.MemberDao;
import com.kh.reservation.model.vo.Hotel;
import com.kh.reservation.model.vo.Reservation;

public class ReservationDao {
	private Properties prop = new Properties();

	public ReservationDao() {
		
		String filePath = MemberDao.class.getResource("db/sql/reservation-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	public ArrayList<Hotel> selectHotelList(Connection conn) {
	
		ArrayList<Hotel> list = new ArrayList<Hotel>(); // [텅 빈 리스트]
	
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectReservationList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Hotel(rset.getInt("hotel_no"),
								   rset.getString("hotel_name"),
								   rset.getString("member_id"))); // db 확인 후 마저 하자
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rset);
			close(pstmt);
		}
		
	return list;
	
	}
	
	
}
