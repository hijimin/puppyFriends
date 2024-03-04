package com.kh.order.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;
import com.kh.order.model.vo.Order;

public class OrderDao {
	
	private Properties prop = new Properties();
	
	public OrderDao() {
		try {
			prop.loadFromXML(new FileInputStream(OrderDao.class.getResource("/db/sql/order-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

}
