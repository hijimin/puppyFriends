package com.kh.review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.common.model.vo.PageInfo;
import com.kh.review.model.dao.ReviewDao;
import com.kh.review.model.vo.Review;

public class ReviewService {
	
	public int selectListCount(int productNo) {
		Connection conn = getConnection();
		int listCount = new ReviewDao().selectListCount(conn, productNo);
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<Review> selectReviewList(int productNo, PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Review> reviewList = new ReviewDao().selectReviewList(conn, productNo, pi);
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
	
	public int deleteReview(int userNo, int reviewNum) {
		Connection conn = getConnection();
		
		int result = new ReviewDao().deleteReview(conn, userNo, reviewNum);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	public int updateReview(int userNo, int reviewNum, String reviewText) {
		Connection conn = getConnection();
		
		int result = new ReviewDao().updateReview(conn, userNo, reviewNum, reviewText);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;	
	}

}
