package com.kh.corder.model.vo;

public class Corder {
	
	 private int orderNo;
	 private int productNo;
	
	public Corder() {}

	public Corder(int orderNo, int productNo) {
		super();
		this.orderNo = orderNo;
		this.productNo = productNo;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	@Override
	public String toString() {
		return "Corder [orderNo=" + orderNo + ", productNo=" + productNo + "]";
	}
}
