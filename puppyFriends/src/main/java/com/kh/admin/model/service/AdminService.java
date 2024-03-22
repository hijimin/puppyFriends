package com.kh.admin.model.service;

import java.net.ConnectException;
import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.admin.model.dao.AdminDao;
import com.kh.common.model.vo.AdminPageInfo;
import com.kh.member.model.vo.Dog;
import com.kh.member.model.vo.Member;
import com.kh.order.model.vo.Order;
import com.kh.product.model.vo.Product;
import com.kh.reservation.model.vo.Reservation;

public class AdminService {
	
	
	
	public int adminSelectListCount() {
		Connection conn = getConnection();
		int listCount = new AdminDao().adminSelectListCount(conn);
		
		close(conn);
		return listCount;
		
	} //
	
	public int adminRestore() {
		Connection conn = getConnection();
		int listCount = new AdminDao().adminRestore(conn);
		
		close(conn);
		return listCount;
		
	} //
	
	public int adminProduct() {	
		Connection conn = getConnection();
		int listCount = new AdminDao().adminProduct(conn);
		
		close(conn);
		return listCount;
		
	} //
	
	public int adminSelectOrderList() {	
		Connection conn = getConnection();
		int listCount = new AdminDao().adminSelectOrderList(conn);
		
		close(conn);
		return listCount;
		
	} //
	
	public int adminDelivery() {	
		Connection conn = getConnection();
		int listCount = new AdminDao().adminDelivery(conn);
		
		close(conn);
		return listCount;
		
	} //
	
	
	
	public int adminHotelCount() {	
		Connection conn = getConnection();
		int listCount = new AdminDao().adminHotelCount(conn);
		
		close(conn);
		return listCount;
		
	} //
	
	public int adminClassCount() {	
		Connection conn = getConnection();
		int listCount = new AdminDao().adminClassCount(conn);
		
		close(conn);
		return listCount;
		
	} //
	
	public ArrayList<Member> adminSelectMember(AdminPageInfo pi){
			Connection conn = getConnection();
			ArrayList<Member> list = new AdminDao().adminSelectMember(conn, pi);
			
			close(conn);
			return list;
			
		} // adminSelectMember
		
	public Dog adminDogInfo(int memberNo){
		Connection conn = getConnection();
		Dog d = new AdminDao().adminDogInfo(conn, memberNo);
		
		close(conn);
		return d;
		
	}
	
	
	public int[] adminDeleteMember(int[] adminDeleteMember) {
	    Connection conn = getConnection();
	    int[] result = new AdminDao().adminDeleteMember(conn, adminDeleteMember);

	    if (result != null) {
	        commit(conn);
	    } else {
	        rollback(conn);
	    }
	    close(conn);
	    return result;
	} // adminDeleteMember
	
	
	public ArrayList<Member> adminRestoreMember(AdminPageInfo pi){
		
		Connection conn = getConnection();
		ArrayList<Member> dList = new AdminDao().adminRestoreMember(conn, pi);
		
		close(conn);
		return dList;
		
	}
	
	
	public int[] adminStartRestoreMember(int[] adminStartRestoreMember) {
		Connection conn = getConnection();
		int[] result = new AdminDao().adminStartRestoreMember(conn,  adminStartRestoreMember);
		
		 if (result != null) {
		        commit(conn);
		    } else {
		        rollback(conn);
		    }
		    close(conn);
		    return result;		
	} // adminStartRestoreMember

	
	public ArrayList<Product> adminSelectPRoductList(AdminPageInfo pi){
		Connection conn = getConnection();
		ArrayList<Product> pList = new AdminDao().adminSelectProductList(conn, pi);
		
		close(conn);
		return pList;
		
	} // adminSelectPRoductList
	
	
	public int[] adminDeleteProduct(int[] adminDeleteProduct) {
		Connection conn = getConnection();
	    int[] result = new AdminDao().adminDeleteProduct(conn, adminDeleteProduct);

	    if (result != null) {
	        commit(conn);
	    } else {
	        rollback(conn);
	    }
	    close(conn);
	    return result;
	}
	
	
	public int yCountMember() {
		Connection conn = getConnection();
		int yResult = new AdminDao().yCountMember(conn);
		
		close(conn);
		return yResult;
	}
	
	
	public int nCountMember() {
		Connection conn = getConnection();
		int nResult = new AdminDao().nCountMember(conn);
		
		close(conn);
		return nResult;
	}

	
	public ArrayList<Order> adminSelectOrder(AdminPageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Order> oList = new AdminDao().adminSelectOrder(conn, pi);
		
		close(conn);
	    return oList;	
	} // adminSelectOrder
	
	
	public ArrayList<Product> adminMainSelectProduct(){
		Connection conn = getConnection();
		ArrayList<Product> apList = new AdminDao().adminMainSelectProduct(conn);
		
		close(conn);
		return apList;
	}
	
	public int[] changeOrder(int[] changeOrder) {
		Connection conn = getConnection();
		int[] result = new AdminDao().changeOrder(conn, changeOrder);
		
		 if (result != null) {
		        commit(conn);
		    } else {
		        rollback(conn);
		    }
		    close(conn);
		    return result;		
	} // changeOrder
	
	
	
	public ArrayList<Order> adminSelectDelivery(AdminPageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Order> deList = new AdminDao().adminSelectDelivery(conn, pi);
		
		close(conn);
	    return deList;	
	} // adminSelectOrder
	
	
	public Order adminOrderInfo(int orderNo){
		Connection conn = getConnection();
		Order o = new AdminDao().adminOrderInfo(conn,orderNo);
		
		close(conn);
		return o;
		
	}
	
	public ArrayList<Reservation> adminSelectHotel(AdminPageInfo pi){
		Connection conn = getConnection();
		ArrayList<Reservation> hrList = new AdminDao().adminSelectHotel(conn, pi);
		
		close(conn);
		return hrList;
	}
	
	public ArrayList<Reservation> adminSelectClass(AdminPageInfo pi){
		Connection conn = getConnection();
		ArrayList<Reservation> crList = new AdminDao().adminSelectClass(conn, pi);
		
		close(conn);
		return crList;
	}
	
	
	public int[] adminDeleteRe(int[] adminReservation) {
		Connection conn = getConnection();
	    int[] result = new AdminDao().adminDeleteRe(conn, adminReservation);

	    if (result != null) {
	        commit(conn);
	    } else {
	        rollback(conn);
	    }
	    close(conn);
	    return result;
	}
	
} // class


	
