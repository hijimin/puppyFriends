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

import com.kh.common.model.vo.Image;
// import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.dao.MemberDao;
import com.kh.reservation.model.vo.Hotel;
import com.kh.reservation.model.vo.Reservation;

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
	            			   rset.getInt("hotel_writer"),
	                           rset.getString("hotel_name"),
	                           rset.getString("hotel_text"),
	                           rset.getString("hotel_size"),
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

	public ArrayList<Image> selectHotelThumbnailList(Connection conn, int hotelNo) {
		Hotel h = new Hotel();
		
		ArrayList<Image> img = new ArrayList<Image>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectHotelThumbnailList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, hotelNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Image image = new Image();
				
				System.out.println(rset.getInt("file_no"));
				System.out.println(rset.getInt("ref_bno"));
				System.out.println(rset.getString("file_name"));	
				System.out.println(rset.getString("title_img"));
						
						
				image.setFileNo(rset.getInt("file_no"));
				image.setRefBoardNo(rset.getInt("ref_bno"));
				image.setFileName(rset.getString("file_name"));
				image.setTitleImg(rset.getString("title_img"));
				
				img.add(image);
			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return img;
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
				h.setHotelWriter(rset.getInt("hotel_writer"));
				h.setHotelName(rset.getString("hotel_name"));
				h.setHotelText(rset.getString("hotel_text"));
				h.setHotelSize(rset.getString("hotel_size"));
				h.setdNumber(rset.getInt("d_number"));
				h.setHotelStart(rset.getDate("hotel_start"));
				h.setHotelEnd(rset.getDate("hotel_end"));
				h.setMemberId(rset.getString("member_id"));
			}
				
							
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);

		}
		
		return h;
		
	}

	public int insertThHotel(Connection conn, Hotel h) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertThHotel");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, h.getHotelWriter());
			pstmt.setString(2, h.getHotelName());
			pstmt.setString(3, h.getHotelText());
			pstmt.setString(4, h.getHotelSize());
			pstmt.setInt(5, h.getdNumber());
			pstmt.setDate(6, h.getHotelStart());
			pstmt.setDate(7, h.getHotelEnd());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}

	public int insertThumbnailList(Connection conn, ArrayList<Image> list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertThumbnailList");
		
			try {
				
				for(Image img : list) {
				
				pstmt = conn.prepareStatement(sql);
			
				pstmt.setString(1, img.getFileName());
				pstmt.setString(2, img.getChangeName());
				pstmt.setString(3, img.getFilePath());
				pstmt.setInt(4, img.getFileLevel());
				
				result = pstmt.executeUpdate();
				
			}
			
		} catch (SQLException e) {
		e.printStackTrace();
		} finally {
			close(pstmt);
		}
	
		return result;
	}

	public int inserThReservation(Connection conn, Reservation rv) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("inserThReservation");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rv.getReservationPrice());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectRvCount(Connection conn, int hotelNo) {
		int hotelrvCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRvCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, hotelNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				hotelrvCount = rset.getInt("hcount");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);

			//	System.out.println(hotelNo); // 됨
			
		}
		
		
		return hotelrvCount;
	}

	public int deleteHotel(Connection conn, int hotelNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteHotel");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, hotelNo);
		
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Image> selectHotelImgList(Connection conn, int hotelNo) {

		ArrayList<Image> img = new ArrayList<Image>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectHotelImgList");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hotelNo);

			rset = pstmt.executeQuery();

			
			while (rset.next()) {
				Image image = new Image();
				image.setFileNo(rset.getInt("file_no"));
				image.setRefBoardNo(rset.getInt("ref_bno"));
				image.setFileName(rset.getString("file_name"));
				image.setTitleImg(rset.getString("title_img"));

				
				
				img.add(image);
			}
//			System.out.println(img);

			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return img;
	}



	
	

	
	
	
}
