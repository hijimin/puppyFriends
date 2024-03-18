package com.kh.reservation.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.common.model.vo.Image;
//import com.kh.common.model.vo.PageInfo;
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

	/*
	public ArrayList<Image> selectHotelThumbnailList(int hotelNo) {
		Connection conn = getConnection();
		
		ArrayList<Image> img = new ReservationDao().selectHotelThumbnailList(conn, hotelNo);
		
		close(conn);
		
		
		return img;
	}
	*/
	
	public Hotel selectHotelDetail(int hotelNo) {
		Connection conn = getConnection();
		
		Hotel h = new ReservationDao().selectHotelDetail(conn, hotelNo);
		
		close(conn);

		return h;
	}

	public int insertThumbnailHotel(Hotel h, ArrayList<Image> list, Reservation rv) {
		Connection conn = getConnection();
		
		int result1 = new ReservationDao().insertThHotel(conn, h); // dao의 result 담김
		int result2 = new ReservationDao().insertThumbnailList(conn, list);
		int result3 = new ReservationDao().inserThReservation(conn, rv);
		
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);

		return result1 * result2 * result3;
	}

	public int selectRvCount(int hotelNo) {
		Connection conn = getConnection();
		int hotelrvCount = new ReservationDao().selectRvCount(conn, hotelNo);
		
		close(conn); 
		return hotelrvCount;
	}

	public int deleteHotel(int hotelNo) {
		Connection conn = getConnection();
		
		int result = new ReservationDao().deleteHotel(conn, hotelNo);
		
		if(result>0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<Image> selectHotelImgList(int hotelNo) {

		Connection conn = getConnection();
		ArrayList<Image> img = new ReservationDao().selectHotelImgList(conn, hotelNo);
		close(conn);
		
		return img;
	}

	

	
	
	/*

	public ArrayList<Hotel> selectHotelThumbnailList() {
		Connection conn = getConnection();
		
		ArrayList<Hotel> h = new ReservationDao().selectHotelThumbnailList(conn);
		
		close(conn);
		
		return h;
		
	}

*/


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
