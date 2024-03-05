package com.kh.order.model.vo;

public class tossPayment {
	 private int tossPaymentNo; // 결제번호(시퀀스로 들어갈꺼임)
	 private int tossPaymentOno; // 주문번호
	 private String cardName;
	 private String impUid;
	 private String merchantUid;
	 private int payAmount;
	 
	 public tossPayment() {}

	public tossPayment(int tossPaymentNo, int tossPaymentOno, String cardName, String impUid, String merchantUid,
			int payAmount) {
		super();
		this.tossPaymentNo = tossPaymentNo;
		this.tossPaymentOno = tossPaymentOno;
		this.cardName = cardName;
		this.impUid = impUid;
		this.merchantUid = merchantUid;
		this.payAmount = payAmount;
	}

	public int getTossPaymentNo() {
		return tossPaymentNo;
	}

	public void setTossPaymentNo(int tossPaymentNo) {
		this.tossPaymentNo = tossPaymentNo;
	}

	public int getTossPaymentOno() {
		return tossPaymentOno;
	}

	public void setTossPaymentOno(int tossPaymentOno) {
		this.tossPaymentOno = tossPaymentOno;
	}

	public String getCardName() {
		return cardName;
	}

	public void setCardName(String cardName) {
		this.cardName = cardName;
	}

	public String getImpUid() {
		return impUid;
	}

	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}

	public String getMerchantUid() {
		return merchantUid;
	}

	public void setMerchantUid(String merchantUid) {
		this.merchantUid = merchantUid;
	}

	public int getPayAmount() {
		return payAmount;
	}

	public void setPayAmount(int payAmount) {
		this.payAmount = payAmount;
	}

	@Override
	public String toString() {
		return "tossPayment [tossPaymentNo=" + tossPaymentNo + ", tossPaymentOno=" + tossPaymentOno + ", cardName="
				+ cardName + ", impUid=" + impUid + ", merchantUid=" + merchantUid + ", payAmount=" + payAmount + "]";
	}
}
