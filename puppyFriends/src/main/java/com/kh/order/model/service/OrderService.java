package com.kh.order.model.service;

import java.sql.Connection;

import static com.kh.common.JDBCTemplate.*;

import com.kh.cart.model.dao.CartDao;
import com.kh.order.model.dao.OrderDao;
import com.kh.order.model.vo.Order;
import com.kh.product.model.dao.ProductDao;

public class OrderService {
	
	/**
	 * @param 단건결제
	 * @return
	 */
	public int orderInsert(Order o, String impUid, String merchantUid, String price) {
		Connection conn = getConnection();
		// insert order
		int result1 = new OrderDao().orderInsert2(conn, o);
		
		int result2 = 1;
		int result3 = 1;
		int result4 = 1;
		
		if(result1 > 0) {
			// insert payment
			result2 = new OrderDao().paymentInsert(conn, impUid, merchantUid, price);
			
			
			if(result2 > 0) {
				// update order
				result3 = new OrderDao().orderUpdate(conn,o, 999);
				if(result1 > 0 && result2 > 0 && result3 > 0) {
					result4 = new ProductDao().updateProductStock(conn,o);				
					if(result4 > 0) {
						commit(conn);						
					}else {
						rollback(conn);
					}
				}
			}
		}
		close(conn);
		return result1 * result2 * result3 * result4;
	}
	
	/**
	 * @param 다건결제
	 * @return
	 */
	public int orderInsert(Order o, String impUid, String merchantUid, String price, int many) {
		Connection conn = getConnection();
		// insert P_ORDER
		int result1 = new OrderDao().orderInsert(conn, o); // 첫번째 상품 P_Order에 인서트 치러감
		
		int result2 = 1;
		
		int result3 = 1;
		
		int result4 = 1;
		
		if(result1 > 0 && many == 999) { // 첫번째 상품 인서트 치고 토스페이먼트에 디비 작업치러감
			// insert TOSS_PAYMENT
			result2 = new OrderDao().paymentInsert(conn, impUid, merchantUid, price);
		}
		
		if(result2 > 0 && many == 999) {
			// update P_ORDER
			result3 = new OrderDao().orderUpdate(conn,o, many);
			if(result1 > 0 && result2 > 0 && result3 > 0) {
				result4 = new ProductDao().updateProductmfStock(conn, o);
				if(result4 > 0) {
					commit(conn);					
				}else {
					rollback(conn);
				}
			}
			
			
		}else { // 첫번째아닌상품들
			result3 = new OrderDao().orderUpdate(conn,o, many);
			if(result1 > 0 && result2 > 0 && result3 > 0) {
				result4 = new ProductDao().updateProductmfStock(conn, o);
				if(result4 > 0) {
					commit(conn);				
				}else {
					rollback(conn);
				}
			}
		}
		close(conn);
		return result1 * result2 * result3 * result4;
	}
	
	public int updateOrderCount(int userNo, int productNo) {
		Connection conn = getConnection();
		int result = new OrderDao().updateOrderCount(conn, userNo, productNo);
		close(conn);
		return result;
	}
	
	public int updateOrderCountMinus(int userNo, int productNo) {
		Connection conn = getConnection();
		int result = new OrderDao().updateOrderCountMinus(conn, userNo, productNo);
		close(conn);
		return result;
	}
	

}
