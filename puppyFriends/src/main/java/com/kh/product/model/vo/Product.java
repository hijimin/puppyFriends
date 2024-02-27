package com.kh.product.model.vo;

import java.sql.Date;

public class Product {
	 private int productNo;
	 private String productName;
	 private String productDesc;
	 private String category;
	 private String price; // 원래가격
	 private int stock;
	 private Date productUpdate;
	 private int discount;
	 private String status;
	 private int count;
	 
	 private String titleImg;
	 private String dPrice;
	 
	 
	 public Product() {}

	

	public Product(int productNo, String productName, String productDesc, String category, String price, int stock,
			Date productUpdate, int discount, String status, int count) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productDesc = productDesc;
		this.category = category;
		this.price = price;
		this.stock = stock;
		this.productUpdate = productUpdate;
		this.discount = discount;
		this.status = status;
		this.count = count;
	}

	

	public Product(int productNo, String productName, String productDesc, String price, int discount, String titleImg,
			String dPrice) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productDesc = productDesc;
		this.price = price;
		this.discount = discount;
		this.titleImg = titleImg;
		this.dPrice = dPrice;
	}
	

	public Product(int productNo, String productName, String productDesc, String price, Date productUpdate,
			int discount, int count, String dPrice) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productDesc = productDesc;
		this.price = price;
		this.productUpdate = productUpdate;
		this.discount = discount;
		this.count = count;
		this.dPrice = dPrice;
	}



	public int getProductNo() {
		return productNo;
	}



	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}



	public String getProductName() {
		return productName;
	}



	public void setProductName(String productName) {
		this.productName = productName;
	}



	public String getProductDesc() {
		return productDesc;
	}



	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}



	public String getCategory() {
		return category;
	}



	public void setCategory(String category) {
		this.category = category;
	}



	public String getPrice() {
		return price;
	}



	public void setPrice(String price) {
		this.price = price;
	}



	public int getStock() {
		return stock;
	}



	public void setStock(int stock) {
		this.stock = stock;
	}



	public Date getProductUpdate() {
		return productUpdate;
	}



	public void setProductUpdate(Date productUpdate) {
		this.productUpdate = productUpdate;
	}



	public int getDiscount() {
		return discount;
	}



	public void setDiscount(int discount) {
		this.discount = discount;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public int getCount() {
		return count;
	}



	public void setCount(int count) {
		this.count = count;
	}
	
	public String getTitleImg() {
		return titleImg;
	}



	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}
	

	public String getdPrice() {
		return dPrice;
	}



	public void setdPrice(String dPrice) {
		this.dPrice = dPrice;
	}



	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productName=" + productName + ", productDesc=" + productDesc
				+ ", category=" + category + ", price=" + price + ", stock=" + stock + ", productUpdate="
				+ productUpdate + ", discount=" + discount + ", status=" + status + ", count=" + count + "]";
	}


}
