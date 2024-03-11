package com.kh.order.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;
import com.kh.order.model.vo.Order;

public class OrderDao {
	
	private Properties prop = new Properties();
	
	public OrderDao() {
		try {
			prop.loadFromXML(new FileInputStream(OrderDao.class.getResource("/db/sql/order-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int orderInsert(Connection conn, Order o) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("orderInsert");
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(o.getOrderUser()));
			pstmt.setInt(2, Integer.parseInt(o.getProductNo()));
			pstmt.setString(3, o.getOrderName());
			pstmt.setString(4, o.getOrderAddress());
			pstmt.setString(5, o.getOrderPhone());
			pstmt.setString(6, o.getOrderReq());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;			
	}
	
	public int paymentInsert(Connection conn, String impUid, String merchantUid, String price) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("paymentInsert");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, impUid);
			pstmt.setString(2, merchantUid);
			pstmt.setInt(3, Integer.parseInt(price));
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int orderUpdate(Connection conn, Order o) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("orderUpdate1");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(o.getProductNo()));
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int orderUpdate1(Connection conn, Order o) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("orderUpdate2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(o.getProductNo()));
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateOrderCount(Connection conn, int userNo, int orderCount) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateOrderCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, orderCount);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	

}
