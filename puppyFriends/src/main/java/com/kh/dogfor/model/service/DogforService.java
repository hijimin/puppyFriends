package com.kh.dogfor.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.Image;
import com.kh.common.model.vo.PageInfo;
import com.kh.dogfor.model.dao.DogforDao;
import com.kh.dogfor.model.vo.Attendance;
import com.kh.member.model.vo.Dog;
import com.kh.member.model.vo.Member;

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
	
	public ArrayList<Image> searchDog(String name){
		
		Connection conn = getConnection();
		
		ArrayList<Image> list = new DogforDao().searchDog(conn, name);
		
		close(conn);
		
		return list;
		
	}
	
	public ArrayList<Member> selectMember(){
		
		Connection conn = getConnection();
		
		ArrayList<Member> list = new DogforDao().selectMember(conn);
		
		close(conn);
		
		return list;
		
	}
	
	public int checkAttendance(String userNo, String date) {
		
		Connection conn = getConnection();
				
		int check = new DogforDao().checkAttendance(conn, userNo, date);
		
		close(conn);
		
		return check;
		
		
	}
	
	public int updateAttendance(Attendance at) {
		
		Connection conn = getConnection();
		
		int insert = new DogforDao().updateAttendance(conn, at);
		
		if(insert > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return insert;
		
	}
	
	public ArrayList<Image> selectImage(){
		
		Connection conn = getConnection();
		
		ArrayList<Image> imgList = new DogforDao().selectImage(conn);
		
		close(conn);

		return imgList;
		
	}
	
	public int deleteImg(String pnum) {
		
		Connection conn = getConnection();
		
		int result = new DogforDao().deleteImg(conn, pnum);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	
	
	
	
	
	
	
	
	
}
