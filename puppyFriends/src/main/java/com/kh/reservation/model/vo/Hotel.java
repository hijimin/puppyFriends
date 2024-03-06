package com.kh.reservation.model.vo;

import java.sql.Date;

public class Hotel {

   private int hotelNo; // 호텔 고유번호 
   private int reservationNo; // 예약번호
   private String hotelName; // 호텔명
   private String hotelText; // 호텔 설명글
   private String hotelSize; // 허용 사이즈
   private int dNumber; // 수용 마리 수
   private String hotelStatus;
   
   private Date writingDate;
   private Date reservationDate;
   private int reservationPrice;
   
   private int memberNo;
   private String memberId; // 회원 아이디
  
   private String dogSize;

   
   
   public Hotel() {}

   
  // selectHotelList
   public Hotel(int hotelNo, String hotelName, String hotelText, String hotelSize, Date writingDate, String memberId) {
      super();
      this.hotelNo = hotelNo;
      this.hotelName = hotelName;
      this.hotelText = hotelText;
      this.hotelSize = hotelSize;
      this.writingDate = writingDate;
      this.memberId = memberId;
   }

   // selectHotelDetail
   
   public Hotel(int hotelNo, String hotelName, String hotelText, String hotelSize, int dNumber, Date writingDate, Date reservationDate,
			String memberId, String dogSize, String hotelStatus) {
		super();
		this.hotelNo = hotelNo;
		this.hotelName = hotelName;
		this.hotelText = hotelText;
		this.hotelSize = hotelSize;
		this.dNumber = dNumber;
		this.hotelStatus = hotelStatus;
		this.writingDate = writingDate;
		this.reservationDate = reservationDate;
		this.memberId = memberId;
		this.dogSize = dogSize;
	}
   
      
   
	public Hotel(int hotelNo, String hotelName, String hotelText, String hotelSize, int dNumber, Date reservationDate,
		int reservationPrice, int memberNo) {
	super();
	this.hotelNo = hotelNo;
	this.hotelName = hotelName;
	this.hotelText = hotelText;
	this.hotelSize = hotelSize;
	this.dNumber = dNumber;
	this.reservationDate = reservationDate;
	this.reservationPrice = reservationPrice;
	this.memberNo = memberNo;
}


	public int getReservationPrice() {
		return reservationPrice;
	}
	
	
	public void setReservationPrice(int reservationPrice) {
		this.reservationPrice = reservationPrice;
	}


	public int getMemberNo() {
		return memberNo;
	}
	
	
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getHotelSize() {
		return hotelSize;
	}
	
	
	public void setHotelSize(String hotelSize) {
		this.hotelSize = hotelSize;
	}


	public String getHotelStatus() {
		return hotelStatus;
	}
	
	
	public void setHotelStatus(String hotelStatus) {
		this.hotelStatus = hotelStatus;
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


	public String getDogSize() {
		return dogSize;
	}


	public void setDogSize(String dogSize) {
		this.dogSize = dogSize;
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
			+ ", hotelText=" + hotelText + ", hotelSize=" + hotelSize + ", dNumber=" + dNumber + ", hotelStatus="
			+ hotelStatus + "]";
}
   													

   


   
   

}