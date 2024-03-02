package com.kh.reservation.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.reservation.model.dao.ReservationDao;
import com.kh.reservation.model.vo.Hotel;
import com.kh.reservation.model.vo.Reservation;

public class ReservationService {

	public ArrayList<Hotel> selectHotelList() {
		Connection conn = getConnection();
		
		ArrayList<Hotel> list = new ReservationDao().selectHotelList(conn);
		
		close(conn);
		return list;
	}

}
