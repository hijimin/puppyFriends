package com.kh.cart.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.cart.model.dao.CartDao;
import com.kh.cart.model.vo.Cart;

import static com.kh.common.JDBCTemplate.*;

public class CartService {
	
	public int insertCart(int productNo, int userNo) {
		Connection conn = getConnection();
		int result = new CartDao().insertCart(conn, productNo, userNo);

		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int cartCheck(int productNo, int userNo) {
		Connection conn = getConnection();
		
		int count = new CartDao().cartCheck(conn, productNo, userNo);
		close(conn);
		return count;
	}
	
	
	public int updateCart(int productNo, int userNo) {
		Connection conn = getConnection();
		int result = new CartDao().updateCart(conn, productNo, userNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public ArrayList<Cart> selectCart(int userNo){
		Connection conn = getConnection();
		ArrayList<Cart> list = new CartDao().selectCart(conn, userNo);
		close(conn);
		return list;				
	}
	
	public int deleteCart(int productNo, int userNo) {
		Connection conn = getConnection();
		int result = new CartDao().deleteCart(conn, productNo, userNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;		
	}
	
	public int cartStatusUpdate(int cno) {
		Connection conn = getConnection();
		int result = new CartDao().cartStatusUpdate(conn, cno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
		
	}
	

}
