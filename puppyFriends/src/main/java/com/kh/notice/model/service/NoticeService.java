package com.kh.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.common.model.vo.AdminPageInfo;
import com.kh.notice.model.dao.NoticeDao;
import com.kh.notice.model.vo.Notice;

public class NoticeService {

	public ArrayList<Notice> selectNoticeList(AdminPageInfo pi) {
		
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn, pi);
		
		close(conn);
		return list;
		
	}
	
	public int increaseCount(int noticeNo) {
		
		Connection conn = getConnection();
		int result = new NoticeDao().increaseCount(conn, noticeNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
	}
	
	public Notice selectNotice(int noticeNo) {
		Connection conn = getConnection();
		Notice n = new NoticeDao().selectNotice(conn, noticeNo);
		
		close(conn);
		return n;
	}
	
} // class
