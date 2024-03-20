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

public class AdminService {
	
	public int adminSelectListCount() {
		Connection conn = getConnection();
		int listCount = new AdminDao().adminSelectListCount(conn);
		
		close(conn);
		return listCount;
		
	}

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
	
} // class
