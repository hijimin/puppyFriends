package com.kh.order.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

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
