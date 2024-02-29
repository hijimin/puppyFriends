package com.kh.reservation.model.dao;

import static com.kh.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.member.model.dao.MemberDao;
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
	public ArrayList<Reservation> selectReservationList(Connection conn) {
	
		ArrayList<Reservation> list = new ArrayList<Reservation>(); // [텅 빈 리스트]
	
	
	return list;
	
	
	
	
	}
	
	
}
