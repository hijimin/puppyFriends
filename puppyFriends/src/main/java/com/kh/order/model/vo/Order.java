package com.kh.order.model.vo;

import java.sql.Date;

public class Order {
	 private int orderNo;
	 private String orderUser; // 회원번호, 회원아이디
	 private String productNo; // 상품번호, 상품명
	 private String orderName;
	 private String orderAddress;
	 private String orderPhone;
	 private String orderReq;
	 private Date orderDate;
	 private int orderDelivery;
	 private int orderCount;
	 private int paymentNo;
	 private String status; 
	 
	 private String cartStatus;
	 
	 public Order() {}

	public Order(int orderNo, String orderUser, String productNo, String orderName, String orderAddress,
			String orderPhone, String orderReq, Date orderDate, int orderDelivery, int orderCount, int paymentNo,
			String cartStatus) {
		super();
		this.orderNo = orderNo;
		this.orderUser = orderUser;
		this.productNo = productNo;
		this.orderName = orderName;
		this.orderAddress = orderAddress;
		this.orderPhone = orderPhone;
		this.orderReq = orderReq;
		this.orderDate = orderDate;
		this.orderDelivery = orderDelivery;
		this.orderCount = orderCount;
		this.paymentNo = paymentNo;
		this.cartStatus = cartStatus;
	}
	
	
	

	public Order(int orderNo, String orderUser, String productNo, String orderName, Date orderDate, int orderDelivery,
			int paymentNo, String status) {
		super();
		this.orderNo = orderNo;
		this.orderUser = orderUser;
		this.productNo = productNo;
		this.orderName = orderName;
		this.orderDate = orderDate;
		this.orderDelivery = orderDelivery;
		this.paymentNo = paymentNo;
		this.status = status;
	}
	
	public Order(int orderNo, String orderUser, String productNo, String orderName, String orderAddress,
			String orderPhone, String orderReq, Date orderDate, int orderDelivery, int orderCount, int paymentNo,
			String status, String cartStatus) {
		super();
		this.orderNo = orderNo;
		this.orderUser = orderUser;
		this.productNo = productNo;
		this.orderName = orderName;
		this.orderAddress = orderAddress;
		this.orderPhone = orderPhone;
		this.orderReq = orderReq;
		this.orderDate = orderDate;
		this.orderDelivery = orderDelivery;
		this.orderCount = orderCount;
		this.paymentNo = paymentNo;
		this.status = status;
		this.cartStatus = cartStatus;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getOrderUser() {
		return orderUser;
	}

	public void setOrderUser(String orderUser) {
		this.orderUser = orderUser;
	}

	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public String getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}

	public String getOrderPhone() {
		return orderPhone;
	}

	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}

	public String getOrderReq() {
		return orderReq;
	}

	public void setOrderReq(String orderReq) {
		this.orderReq = orderReq;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public int getOrderDelivery() {
		return orderDelivery;
	}

	public void setOrderDelivery(int orderDelivery) {
		this.orderDelivery = orderDelivery;
	}

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	public int getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}

	public String getCartStatus() {
		return cartStatus;
	}

	public void setCartStatus(String cartStatus) {
		this.cartStatus = cartStatus;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", orderUser=" + orderUser + ", productNo=" + productNo + ", orderName="
				+ orderName + ", orderAddress=" + orderAddress + ", orderPhone=" + orderPhone + ", orderReq=" + orderReq
				+ ", orderDate=" + orderDate + ", orderDelivery=" + orderDelivery + ", orderCount=" + orderCount
				+ ", paymentNo=" + paymentNo + ", cartStatus=" + cartStatus + "]";
	}
	
	
}
