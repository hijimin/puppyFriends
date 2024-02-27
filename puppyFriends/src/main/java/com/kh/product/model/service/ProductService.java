package com.kh.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;
import com.kh.common.model.vo.Image;
import com.kh.product.model.dao.ProductDao;
import com.kh.product.model.vo.Product;

public class ProductService {
	
	public int insertPdBoard(Product p, Image im) {
		Connection conn = getConnection();
		
		int result1 = new ProductDao().insertPdBoard(conn, p);
		
		int result2 = new ProductDao().insertImgList(conn, im);
		
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

}
