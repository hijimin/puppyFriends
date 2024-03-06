package com.kh.chatting.model.vo;

import java.sql.Date;

public class Chatting {

	private int chattingNo; 
	private int chattingMemberNo;
	private String chattingCity;
	private Date chattingDate; 
	private String chattingCheck; 
	private String memberId;
	
	public Chatting() {}

	public Chatting(int chattingNo, int chattingMemberNo, String chattingCity, Date chattingDate, String chattingCheck,
			String memberId) {
		super();
		this.chattingNo = chattingNo;
		this.chattingMemberNo = chattingMemberNo;
		this.chattingCity = chattingCity;
		this.chattingDate = chattingDate;
		this.chattingCheck = chattingCheck;
		this.memberId = memberId;
	}
	
	
	
	public Chatting(int chattingNo, String chattingCity, Date chattingDate, String chattingCheck, String memberId) {
		super();
		this.chattingNo = chattingNo;
		this.chattingCity = chattingCity;
		this.chattingDate = chattingDate;
		this.chattingCheck = chattingCheck;
		this.memberId = memberId;
	}
	
	
	

	public Chatting(int chattingNo, int chattingMemberNo, String chattingCity, Date chattingDate,
			String chattingCheck) {
		super();
		this.chattingNo = chattingNo;
		this.chattingMemberNo = chattingMemberNo;
		this.chattingCity = chattingCity;
		this.chattingDate = chattingDate;
		this.chattingCheck = chattingCheck;
	}

	public int getChattingNo() {
		return chattingNo;
	}

	public void setChattingNo(int chattingNo) {
		this.chattingNo = chattingNo;
	}

	public int getChattingMemberNo() {
		return chattingMemberNo;
	}

	public void setChattingMemberNo(int chattingMemberNo) {
		this.chattingMemberNo = chattingMemberNo;
	}

	public String getChattingCity() {
		return chattingCity;
	}

	public void setChattingCity(String chattingCity) {
		this.chattingCity = chattingCity;
	}

	public Date getChattingDate() {
		return chattingDate;
	}

	public void setChattingDate(Date chattingDate) {
		this.chattingDate = chattingDate;
	}

	public String getChattingCheck() {
		return chattingCheck;
	}

	public void setChattingCheck(String chattingCheck) {
		this.chattingCheck = chattingCheck;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "Chatting [chattingNo=" + chattingNo + ", chattingMemberNo=" + chattingMemberNo + ", chattingCity="
				+ chattingCity + ", chattingDate=" + chattingDate + ", chattingCheck=" + chattingCheck + ", memberId="
				+ memberId + "]";
	}

	
	
	
	
	
	
	
} // Class
