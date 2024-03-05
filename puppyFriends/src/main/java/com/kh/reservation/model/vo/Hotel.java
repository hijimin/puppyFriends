package com.kh.reservation.model.vo;

public class Hotel {

	private int hotelNo; // 호텔 고유번호 
	private int reservationNo; // 예약번호
	private String hotelName; // 호텔명
	private String hotelText; // 호텔 설명글
	private int dNumber; // 수용 마리 수
	private String memberId; // 회원 아이디

	public Hotel() {}

	public Hotel(int hotelNo, int reservationNo, String hotelName, String hotelText, int dNumber) {
		super();
		this.hotelNo = hotelNo;
		this.reservationNo = reservationNo;
		this.hotelName = hotelName;
		this.hotelText = hotelText;
		this.dNumber = dNumber;
	}

	public Hotel(int hotelNo, String hotelName, String memberId) {
		super();
		this.hotelNo = hotelNo;
		this.hotelName = hotelName;
	}

	
	public int getHotelNo() {
		return hotelNo;
	}

	public void setHotelNo(int hotelNo) {
		this.hotelNo = hotelNo;
	}

	public int getReservationNo() {
		return reservationNo;
	}

	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}

	public String getHotelName() {
		return hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	public String getHotelText() {
		return hotelText;
	}

	public void setHotelText(String hotelText) {
		this.hotelText = hotelText;
	}

	public int getdNumber() {
		return dNumber;
	}

	public void setdNumber(int dNumber) {
		this.dNumber = dNumber;
	}
	
	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "Hotel [hotelNo=" + hotelNo + ", reservationNo=" + reservationNo + ", hotelName=" + hotelName
				+ ", hotelText=" + hotelText + ", dNumber=" + dNumber + "]";
	}

	
	

}