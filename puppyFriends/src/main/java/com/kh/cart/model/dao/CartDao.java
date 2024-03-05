package com.kh.cart.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Properties;

public class CartDao {
	private Properties prop = new Properties();
	
	public CartDao() {
		try {
			prop.loadFromXML(new FileInputStream(CartDao.class.getResource("/db/sql/cart-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	

}
