package com.kh.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;
import com.kh.common.model.vo.Image;
import com.kh.common.model.vo.PageInfo;
import com.kh.product.model.dao.ProductDao;
import com.kh.product.model.vo.Product;

public class ProductService {
	
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
	
	public ArrayList<Product> selectProductList(){
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectProductList(conn);
		
		close(conn);
		
		return list;
	}
	
	public int selectProductListCount() {
		Connection conn = getConnection();
		int listCount = new ProductDao().selectProductListCount(conn);
		close(conn);
		return listCount;
	}
	
	public ArrayList<Product> selectProductPageList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Product> list1 = new ProductDao().selectProductPageList(conn, pi);
		close(conn);
		return list1;
		
	}

}
