package com.kh.product.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;

import com.kh.common.model.vo.Image;
import com.kh.product.model.vo.Product;

public class ProductDao {
	
	private Properties prop = new Properties();
	
	public ProductDao() {
		try {
			prop.loadFromXML(new FileInputStream(ProductDao.class.getResource("/db/sql/product-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertPdBoard(Connection conn, Product p) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPdBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, p.getProductName());
			pstmt.setString(2, p.getProductDesc());
			pstmt.setInt(3, Integer.parseInt(p.getPrice()));
			pstmt.setInt(4, p.getDiscount());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertImgList(Connection conn, ArrayList<Image> list) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertImgList");
		
		try {
			
			for(Image im : list) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, im.getFilePath());
				pstmt.setInt(2, im.getFileLevel());
				pstmt.setString(3, im.getFileName());
				pstmt.setString(4, im.getChangeName());
				
				result = pstmt.executeUpdate();					
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Product> selectProductList(Connection conn){
		ArrayList<Product> list = new ArrayList<Product>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Product(rset.getInt("product_no"),
										rset.getString("product_name"),
										rset.getString("product_desc"),
										rset.getString("price"),
										rset.getInt("product_discount"),
										rset.getString("titleimg"),
										rset.getString("dprice")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	

}
