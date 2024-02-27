package com.kh.dogfor.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.Image;
import com.kh.common.model.vo.PageInfo;
import com.kh.dogfor.model.dao.DogforDao;

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
	
	
	
	
	
	
	
	
	
}
