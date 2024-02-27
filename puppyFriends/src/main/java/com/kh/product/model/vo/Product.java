package com.kh.product.model.vo;

import java.sql.Date;

public class Product {
	 private int productNo;
	 private String productName;
	 private String productDesc;
	 private String category;
	 private int Price;
	 private int stock;
	 private Date productUpdate;
	 private int discount;
	 private String status;
	 private int count;
	 
	 public Product() {}

	public Product(int productNo, String productName, String productDesc, String category, int price, int stock,
			Date productUpdate, int discount, String status, int count) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productDesc = productDesc;
		this.category = category;
		Price = price;
		this.stock = stock;
		this.productUpdate = productUpdate;
		this.discount = discount;
		this.status = status;
		this.count = count;
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

	public int getPrice() {
		return Price;
	}

	public void setPrice(int price) {
		Price = price;
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

	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productName=" + productName + ", productDesc=" + productDesc
				+ ", category=" + category + ", Price=" + Price + ", stock=" + stock + ", productUpdate="
				+ productUpdate + ", discount=" + discount + ", status=" + status + ", count=" + count + "]";
	}
}
