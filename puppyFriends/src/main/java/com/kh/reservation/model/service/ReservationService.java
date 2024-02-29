package com.kh.reservation.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.reservation.model.dao.ReservationDao;
import com.kh.reservation.model.vo.Reservation;

public class ReservationService {

	public ArrayList<Reservation> selectReservationList() {
		Connection conn = getConnection();
		
		ArrayList<Reservation> list = new ReservationDao().selectReservationList(conn);
		
		close(conn);
		return list;
	}

}
