package com.kh.reservation.model.vo;

import java.sql.Date;

public class Reservation {
	
	private int reservationNo; // 예약번호
	private int memberNo; // 회원번호
	private int facilityNo; // 시설고유번호 1또는2  // 추후 db에서 끌어올 때 where절 써서 가져오기
	private Date writingDate; // 작성일
	private Date reservationDate; // 시설고유번호 1또는2 // 추후 db에서 끌어올 때 where절 써서 가져오기
	private int price; // 가격
	private int paymentNo; // 결제번호
	
	public Reservation() {}

	public Reservation(int reservationNo, int memberNo, int facilityNo, Date writingDate, Date reservationDate,
			int price, int paymentNo) {
		
		super();
		this.reservationNo = reservationNo;
		this.memberNo = memberNo;
		this.facilityNo = facilityNo;
		this.writingDate = writingDate;
		this.reservationDate = reservationDate;
		this.price = price;
		this.paymentNo = paymentNo;
	}

	public int getReservationNo() {
		return reservationNo;
	}

	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getFacilityNo() {
		return facilityNo;
	}

	public void setFacilityNo(int facilityNo) {
		this.facilityNo = facilityNo;
	}

	public Date getWritingDate() {
		return writingDate;
	}

	public void setWritingDate(Date writingDate) {
		this.writingDate = writingDate;
	}

	public Date getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(Date reservationDate) {
		this.reservationDate = reservationDate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}

	@Override
	public String toString() {
		return "Reservation [reservationNo=" + reservationNo + ", memberNo=" + memberNo + ", facilityNo=" + facilityNo
				+ ", writingDate=" + writingDate + ", reservationDate=" + reservationDate + ", price=" + price
				+ ", paymentNo=" + paymentNo + "]";
	}

	
	
}