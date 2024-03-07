package com.kh.dogfor.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.Image;
import com.kh.common.model.vo.PageInfo;
import com.kh.dogfor.model.dao.DogforDao;
import com.kh.dogfor.model.vo.Attendance;
import com.kh.member.model.vo.Dog;

import static com.kh.common.JDBCTemplate.*;

	public class DogforService {
	
		public int insertImage(Image img) {
			
			Connection conn = getConnection();
			
			int result = new DogforDao().insertImage(conn, img);
			
			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
			close(conn);
			
			return result;
		}
	
	
	public int selectThCount() {
		
		Connection conn = getConnection();
		
		int count = new DogforDao().selectThCount(conn);
		
		close(conn);
		
		return count;
		
	}
	
	public ArrayList<Image> selectList(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Image> list = new DogforDao().selectList(conn, pi);
				
		close(conn);
		
		return list;
		
	}
	
	public ArrayList<Dog> selectDog(){
		
		Connection conn = getConnection();
		
		ArrayList<Dog> list = new DogforDao().selectDog(conn);
		
		close(conn);
		
		return list;
		
	}
	
	public int insertAttendance(Attendance at) {
		
		Connection conn = getConnection();
				
		int result = new DogforDao().insertAttendance(conn, at);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	public ArrayList<Attendance> selectAttendanceList(String userNo){
		
		Connection conn = getConnection();
		
		ArrayList<Attendance> list = new DogforDao().selectAttendanceList(conn, userNo);
		
		close(conn);
		
		return list;
		
	}
	
	
	
	
	
	
	
}
