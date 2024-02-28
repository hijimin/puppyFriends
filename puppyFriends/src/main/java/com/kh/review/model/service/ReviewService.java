package com.kh.review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.review.model.dao.ReviewDao;
import com.kh.review.model.vo.Review;

public class ReviewService {
	
	public int selectListCount(int productNo) {
		Connection conn = getConnection();
		int listCount = new ReviewDao().selectListCount(conn, productNo);
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<Review> selectReviewList(int productNo){
		Connection conn = getConnection();
		
		ArrayList<Review> reviewList = new ReviewDao().selectReviewList(conn, productNo);
		close(conn);
		return reviewList;
		
	}
	
	public int insertReview(Review r) {
		Connection conn = getConnection();
		
		int result = new ReviewDao().insertReview(conn, r);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}
