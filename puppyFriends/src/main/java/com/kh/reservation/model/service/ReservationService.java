package com.kh.reservation.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.common.model.vo.PageInfo;
import com.kh.reservation.model.dao.ReservationDao;
import com.kh.reservation.model.vo.Hotel;

public class ReservationService {

	public ArrayList<Hotel> selectHotelList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Hotel> list = new ReservationDao().selectHotelList(conn, pi);
		
		close(conn);
		return list;
	}


	
	


}
