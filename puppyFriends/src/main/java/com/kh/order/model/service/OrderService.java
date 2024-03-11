package com.kh.order.model.service;

import java.sql.Connection;

import static com.kh.common.JDBCTemplate.*;

import com.kh.order.model.dao.OrderDao;
import com.kh.order.model.vo.Order;

public class OrderService {
	
	public int orderInsert(Order o, String impUid, String merchantUid, String price) {
		Connection conn = getConnection();
		// insert order
		int result1 = new OrderDao().orderInsert(conn, o);
		
		int result2 = 1;
		int result3 = 1;
		
		if(result1 > 0) {
			// insert payment
			result2 = new OrderDao().paymentInsert(conn, impUid, merchantUid, price);
			
			
			if(result2 > 0) {
				// update order
				result3 = new OrderDao().orderUpdate(conn,o);
				if(result1 > 0 && result2 > 0 && result3 > 0) {
					commit(conn);
				}else {
					rollback(conn);
				}
			}
		}
		close(conn);
		return result1 * result2 * result3;
	}
	
	public int orderInsert(Order o, String impUid, String merchantUid, String price, int many) {
		Connection conn = getConnection();
		// insert order
		int result1 = new OrderDao().orderInsert(conn, o);
		
		int result2 = 1;
		int result3 = 1;
		
		if(result1 > 0 && many == 999) {
			// insert payment
			result2 = new OrderDao().paymentInsert(conn, impUid, merchantUid, price);	
		}
		
		if(result2 > 0 && many == 999) {
			// update order
			result3 = new OrderDao().orderUpdate(conn,o);
			if(result1 > 0 && result2 > 0 && result3 > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
		}else { // 첫번째아닌상품들
			result3 = new OrderDao().orderUpdate1(conn,o);
			if(result1 > 0 && result2 > 0 && result3 > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
		}
		close(conn);
		return result1 * result2 * result3;
	}
	

}
