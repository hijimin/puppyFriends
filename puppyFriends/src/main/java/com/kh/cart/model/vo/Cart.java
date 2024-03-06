package com.kh.cart.model.vo;

public class Cart {
	 private int cartNo;
	 private String memberNo;
	 private String productNo;
	 private int cartAmount;
	 private String cartStatus;
	 
	 // 장바구니 조회용 가격
	 private String oPrice;
	 private String dPrice;
	 private String titleImg;
	 private int pno;
	 
	 public Cart() {}

	public Cart(int cartNo, String memberNo, String productNo, int cartAmount, String cartStatus) {
		super();
		this.cartNo = cartNo;
		this.memberNo = memberNo;
		this.productNo = productNo;
		this.cartAmount = cartAmount;
		this.cartStatus = cartStatus;
	}
	
	
	
	
	

	public Cart(int cartNo, String memberNo, String productNo, int cartAmount, String oPrice, String dPrice,
			String titleImg, int pno) {
		super();
		this.cartNo = cartNo;
		this.memberNo = memberNo;
		this.productNo = productNo;
		this.cartAmount = cartAmount;
		this.oPrice = oPrice;
		this.dPrice = dPrice;
		this.titleImg = titleImg;
		this.pno = pno;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}

	public int getCartAmount() {
		return cartAmount;
	}

	public void setCartAmount(int cartAmount) {
		this.cartAmount = cartAmount;
	}

	public String getCartStatus() {
		return cartStatus;
	}

	public void setCartStatus(String cartStatus) {
		this.cartStatus = cartStatus;
	}
	
	

	public String getoPrice() {
		return oPrice;
	}

	public void setoPrice(String oPrice) {
		this.oPrice = oPrice;
	}

	public String getdPrice() {
		return dPrice;
	}

	public void setdPrice(String dPrice) {
		this.dPrice = dPrice;
	}
	
	

	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}
	

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", memberNo=" + memberNo + ", productNo=" + productNo + ", cartAmount="
				+ cartAmount + ", cartStatus=" + cartStatus + "]";
	}
}
