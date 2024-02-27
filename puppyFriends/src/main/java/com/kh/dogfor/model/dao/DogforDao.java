package com.kh.dogfor.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class DogforDao {

	private Properties prop = new Properties();
	
	public DogforDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(DogforDao.class.getResource("/db/sql/dogfor-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
}
