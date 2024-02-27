package com.kh.admin.model.service;

import java.net.ConnectException;
import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.admin.model.dao.AdminDao;
import com.kh.common.model.vo.AdminPageInfo;
import com.kh.member.model.vo.Member;

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
	
}
