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
import com.kh.common.model.vo.PageInfo;
import com.kh.order.model.vo.Order;
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
	
	public int selectProductListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	public ArrayList<Product> selectProductPageList(Connection conn, PageInfo pi){
		ArrayList<Product> list1 = new ArrayList<Product>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProductPageList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list1.add(new Product(rset.getInt("product_no"),
									   rset.getString("product_name"),
									   rset.getString("product_desc"),
									   rset.getString("price"),
									   rset.getDate("product_update"),
									   rset.getInt("product_discount"),								
									   rset.getInt("product_count"),
									   rset.getString("titleimg"),
									   rset.getString("dprice")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list1;	
	}
	
	public int increaseCount(Connection conn, int productNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, productNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Product> selectProductDetailList(Connection conn, int productNo) {
		ArrayList<Product> list = new ArrayList<Product>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProductDetailList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, productNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Product(rset.getInt("product_no"),
								rset.getString("product_name"),
								rset.getString("product_desc"),
								rset.getString("price"),
								rset.getInt("product_stock"),
								rset.getInt("product_discount"),
								rset.getString("titleimg"),
								rset.getString("dprice"),
								rset.getInt("file_level")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public Product selectPrice(Connection conn, int productNo) {
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPrice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, productNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Product();
				p.setProductNo(rset.getInt("product_no"));
				p.setdPrice(rset.getString("dprice"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return p;		
	}
	
	public ArrayList<Product> selectGoodList(Connection conn, PageInfo pi){
		ArrayList<Product> list = new ArrayList<Product>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectGoodList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
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
	
	public ArrayList<Product> selectRecentList(Connection conn, PageInfo pi){
		ArrayList<Product> list = new ArrayList<Product>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRecentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
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
	
	public ArrayList<Product> selectCountList(Connection conn, PageInfo pi){
		ArrayList<Product> list = new ArrayList<Product>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCountList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
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
	
	public int updateProductStock(Connection conn, Order o) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateProductStock");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(o.getProductNo()));
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateProductmfStock(Connection conn, Order o) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateProductmfStock");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, o.getOrderCount());
			pstmt.setInt(2, Integer.parseInt(o.getProductNo()));
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Product> selectStockList(Connection conn){
		ArrayList<Product> list = new ArrayList<Product>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectStockList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Product(rset.getInt("product_no"),
									 rset.getInt("product_stock")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Product> selectProductNum(Connection conn){
		ArrayList<Product> list = new ArrayList<Product>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProductNum");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Product(rset.getInt("product_no")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public Product selectProduct(Connection conn, int produtNo) {
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, produtNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Product();
				p.setProductName(rset.getString("product_name"));
				p.setProductDesc(rset.getString("product_desc"));
				p.setPrice(rset.getString("product_price"));
				p.setDiscount(rset.getInt("product_discount"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return p;
	}
	
	public ArrayList<Image> selectImgList(Connection conn, int productNo){
		ArrayList<Image> list = new ArrayList<Image>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectImgList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, productNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Image im = new Image();
				im.setFileNo(rset.getInt("file_no"));
				im.setChangeName(rset.getString("change_name"));
				im.setFilePath(rset.getString("file_path"));
				
				list.add(im);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;	
	}
	
	public int updateProduct(Connection conn, Product p) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, p.getProductName());
			pstmt.setString(2, p.getProductDesc());
			pstmt.setInt(3, Integer.parseInt(p.getPrice()));
			pstmt.setInt(4, p.getDiscount());
			pstmt.setInt(5, p.getProductNo());
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateImg(Connection conn, Image im, Product p) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, im.getFilePath());
			pstmt.setString(2, im.getFileName());
			pstmt.setString(3, im.getChangeName());
			pstmt.setInt(4, p.getProductNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	

	

}
