package com.kh.reservation.model.vo;

import java.sql.Date;

public class Reservation {
	
	private int reservationNo; // 예약번호
	private int memberNo; // 회원번호
	private int programNo; // HOTEL_NO 또는 CLASS_NO
	private int facilityNo; // 시설고유번호 1또는2  // 추후 db에서 끌어올 때 where절 써서 가져오기
	private Date writingDate; // 작성일
	private Date reservationStart;
	private Date reservationEnd;
	private int reservationPrice; // 가격
	private int paymentNo; // 결제번호
	private String reservationStatus; 
	
	private int hcount; // selectRvCount

	
	public Reservation() {}

	
	public Reservation(int reservationNo, int memberNo, int programNo, int facilityNo, Date writingDate, Date reservationStart,
			Date reservationEnd, int reservationPrice, int paymentNo) {
		super();
		this.reservationNo = reservationNo;
		this.memberNo = memberNo;
		this.programNo = programNo;
		this.facilityNo = facilityNo;
		this.writingDate = writingDate;
		this.reservationStart = reservationStart;
		this.reservationEnd = reservationEnd;
		this.reservationPrice = reservationPrice;
		this.paymentNo = paymentNo;
		
	}
	
	
	  // HotelEnrollController
	public Reservation(Date reservationStart, Date reservationEnd, int reservationPrice) {
		super();
		this.reservationStart = reservationStart;
		this.reservationEnd = reservationEnd;
		this.reservationPrice = reservationPrice;
	}

	// selectHotelDetail
	public Reservation(int reservationNo, int hcount) {
		super();
		this.reservationNo = reservationNo;
		this.hcount = hcount;
	}

	
	public int getHcount() {
		return hcount;
	}

	public void setHcount(int hcount) {
		this.hcount = hcount;
	}


	public String getReservationStatus() {
		return reservationStatus;
	}


	public void setReservationStatus(String reservationStatus) {
		this.reservationStatus = reservationStatus;
	}


	public int getProgramNo() {
		return programNo;
	}


	public void setProgramNo(int programNo) {
		this.programNo = programNo;
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

	public Date getReservationStart() {
		return reservationStart;
	}

	public void setReservationStart(Date reservationStart) {
		this.reservationStart = reservationStart;
	}

	public Date getReservationEnd() {
		return reservationEnd;
	}

	public void setReservationEnd(Date reservationEnd) {
		this.reservationEnd = reservationEnd;
	}

	public int getReservationPrice() {
		return reservationPrice;
	}

	public void setReservationPrice(int reservationPrice) {
		this.reservationPrice = reservationPrice;
	}

	public int getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}

	@Override
	public String toString() {
		return "Reservation [reservationNo=" + reservationNo + ", memberNo=" + memberNo + ", programNo=" + programNo + 
				"facilityNo=" + facilityNo + ", writingDate=" + writingDate + ", reservationStart=" + reservationStart + ", reservationEnd="
				+ reservationEnd + ", reservationPrice=" + reservationPrice + ", paymentNo=" + paymentNo + "]";
	}

	
	
}