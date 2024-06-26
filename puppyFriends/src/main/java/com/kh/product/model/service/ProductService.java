package com.kh.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;
import com.kh.common.model.vo.Image;
import com.kh.common.model.vo.PageInfo;
import com.kh.product.model.dao.ProductDao;
import com.kh.product.model.vo.Product;

public class ProductService {
	
	/**
	 * 상품등록
	 */
	public int insertPdBoard(Product p, ArrayList<Image> list) {
		Connection conn = getConnection();
		
		int result1 = new ProductDao().insertPdBoard(conn, p);
		
		int result2 = new ProductDao().insertImgList(conn, list);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}
	
	
	/**
	 * 메인화면베스트상품조회
	 */
	public ArrayList<Product> selectProductList(){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectProductList(conn);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * 게시글 전체갯수 조회
	 */
	public int selectProductListCount() {
		Connection conn = getConnection();
		int listCount = new ProductDao().selectProductListCount(conn);
		close(conn);
		return listCount;
	}
	
	/**
	 * 일반상품 페이징바
	 */
	public ArrayList<Product> selectProductPageList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Product> list1 = new ProductDao().selectProductPageList(conn, pi);
		close(conn);
		return list1;	
	}
	
	/**
	 * 상품상세조회시 조회수 증가
	 */
	public int increaseCount(int productNo) {
		Connection conn = getConnection();
		
		int result = new ProductDao().increaseCount(conn, productNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public ArrayList<Product> selectProductDetailList(int productNo) {
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectProductDetailList(conn, productNo);
		close(conn);
		return list;
	}
	
	public Product selectPrice(int productNo) {
		Connection conn = getConnection();
		Product p = new ProductDao().selectPrice(conn, productNo);
		close(conn);
		return p;
	}
	
	public ArrayList<Product> selectGoodList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectGoodList(conn, pi);
		close(conn);
		return list;
	}
	
	public ArrayList<Product> selectRecentList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectRecentList(conn, pi);
		close(conn);
		return list;
	}
	
	public ArrayList<Product> selectCountList(PageInfo pi){
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectCountList(conn, pi);
		close(conn);
		return list;
	}
	
	public ArrayList<Product> selectStockList(){
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectStockList(conn);
		close(conn);
		return list;
	}
	
	public ArrayList<Product> selectProductNum(){
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectProductNum(conn);
		close(conn);
		return list;
	}
	
	public Product selectProduct(int productNo) {
		Connection conn = getConnection();
		
		Product p = new ProductDao().selectProduct(conn, productNo);
		
		close(conn);
		return p;
	}
	
	public ArrayList<Image> selectImgList(int productNo){
		Connection conn = getConnection();
		ArrayList<Image> list = new ProductDao().selectImgList(conn, productNo);
		close(conn);
		return list;		
	}
	
	public int updateProduct(Product p, Image im) {
		Connection conn = getConnection();
		
		int result1 = new ProductDao().updateProduct(conn,p);
		int result2 = 1;		
		result2 = new ProductDao().updateImg(conn,im,p);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
	}
	
	public ArrayList<Product> keywordSearch(String keyWord){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().keywordSearch(conn, keyWord);
		close(conn);
		return list;
	}
	
	
	

}
