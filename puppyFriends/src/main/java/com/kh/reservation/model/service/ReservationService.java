package com.kh.reservation.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.common.model.vo.Image;
//import com.kh.common.model.vo.PageInfo;
import com.kh.reservation.model.dao.ReservationDao;
import com.kh.reservation.model.vo.Hotel;

public class ReservationService {
	
	public ArrayList<Hotel> selectHotelList() {
		Connection conn = getConnection();
		
		ArrayList<Hotel> list = new ReservationDao().selectHotelList(conn);
		
		close(conn);
		return list;
	}

	public Hotel selectHotelDetail(int hotelNo) {
		Connection conn = getConnection();
		
		Hotel h = new ReservationDao().selectHotelDetail(conn, hotelNo);
		
		close(conn);

		return h;
	}

	public int insertThumbnailHotel(Hotel h, ArrayList<Image> list) {
		Connection conn = getConnection();
		
		int result1 = new ReservationDao().insertThHotel(conn, h); // dao의 result 담김
		int result2 = new ReservationDao().insertThumbnailList(conn, list);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
	}

/*
	public ArrayList<Hotel> selectHotelList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Hotel> list = new ReservationDao().selectHotelList(conn, pi);
		
		close(conn);
		return list;
	}

	public ArrayList<Hotel> selectHotelList(int page) {
		return null;
	}

*/
	
	


}
