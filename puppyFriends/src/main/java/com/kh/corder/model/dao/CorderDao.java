package com.kh.corder.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import com.kh.order.model.dao.OrderDao;

public class CorderDao {
	
	private Properties prop = new Properties();
	
	public CorderDao() {
		try {
			prop.loadFromXML(new FileInputStream(CorderDao.class.getResource("/db/sql/corder-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	

}
