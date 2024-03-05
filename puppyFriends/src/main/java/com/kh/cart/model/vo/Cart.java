package com.kh.cart.model.vo;

public class Cart {
	 private int cartNo;
	 private int memberNo;
	 private int productNo;
	 private int cartAmount;
	 private int cartPrice;
	 
	 public Cart() {}

	public Cart(int cartNo, int memberNo, int productNo, int cartAmount, int cartPrice) {
		super();
		this.cartNo = cartNo;
		this.memberNo = memberNo;
		this.productNo = productNo;
		this.cartAmount = cartAmount;
		this.cartPrice = cartPrice;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getCartAmount() {
		return cartAmount;
	}

	public void setCartAmount(int cartAmount) {
		this.cartAmount = cartAmount;
	}

	public int getCartPrice() {
		return cartPrice;
	}

	public void setCartPrice(int cartPrice) {
		this.cartPrice = cartPrice;
	}

	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", memberNo=" + memberNo + ", productNo=" + productNo + ", cartAmount="
				+ cartAmount + ", cartPrice=" + cartPrice + "]";
	} 
}
