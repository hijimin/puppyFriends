package com.kh.reservation.model.vo;

import java.sql.Date;

public class Hotel {

   private int hotelNo; // 호텔 고유번호 
   private int hotelWriter;
   private String hotelName; // 호텔명
   private String hotelText; // 호텔 설명글
   private String hotelSize; // 허용 사이즈
   private int dNumber; // 수용 마리 수
   private Date hotelStart; // 호텔 시작일
   private Date hotelEnd; // 호텔 종료일
   private String hotelStatus;
   
   private Date writingDate;
   private Date reservationStart;
   private Date reservationEnd;
   private int reservationPrice;
   
   private int memberNo;
   private String memberId; // 회원 아이디
  
   private String dogSize;

	private int fileNo;
	private int refBoardNo;
	private int imageType;
	private String filePath;
	private int fileLevel;
	private String fileName;
	private String changeName;
	private Date imageUpdate;
	private String dogNo;
	private String content; 
	private String titleImg;

   
   public Hotel() {}

   
  // selectHotelList
   public Hotel(int hotelNo, int hotelWriter, String hotelName, String hotelText, String hotelSize, String memberId) {
      super();
      this.hotelNo = hotelNo;
      this.hotelWriter = hotelWriter;
      this.hotelName = hotelName;
      this.hotelText = hotelText;
      this.hotelSize = hotelSize;
      this.memberId = memberId;
   }

   // selectHotelDetail
  
	public Hotel(int hotelNo, int hotelWriter, String hotelName, String hotelText, String hotelSize, int dNumber,
		Date hotelStart, Date hotelEnd, String memberId) {
	super();
	this.hotelNo = hotelNo;
	this.hotelWriter = hotelWriter;
	this.hotelName = hotelName;
	this.hotelText = hotelText;
	this.hotelSize = hotelSize;
	this.dNumber = dNumber;
	this.hotelStart = hotelStart;
	this.hotelEnd = hotelEnd;
	this.memberId = memberId;
}

      
   // HotelEnrollController
	public Hotel(int hotelNo, int hotelWriter, String hotelName, String hotelText, String hotelSize, int dNumber) {
	super();
	this.hotelNo = hotelNo;
	this.hotelWriter = hotelWriter;
	this.hotelName = hotelName;
	this.hotelText = hotelText;
	this.hotelSize = hotelSize;
	this.dNumber = dNumber;

}

	
	
	public int getFileNo() {
		return fileNo;
	}


	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}


	public int getRefBoardNo() {
		return refBoardNo;
	}


	public void setRefBoardNo(int refBoardNo) {
		this.refBoardNo = refBoardNo;
	}


	public int getImageType() {
		return imageType;
	}


	public void setImageType(int imageType) {
		this.imageType = imageType;
	}


	public String getFilePath() {
		return filePath;
	}


	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}


	public int getFileLevel() {
		return fileLevel;
	}


	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public String getChangeName() {
		return changeName;
	}


	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}


	public Date getImageUpdate() {
		return imageUpdate;
	}


	public void setImageUpdate(Date imageUpdate) {
		this.imageUpdate = imageUpdate;
	}


	public String getDogNo() {
		return dogNo;
	}


	public void setDogNo(String dogNo) {
		this.dogNo = dogNo;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getTitleImg() {
		return titleImg;
	}


	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}


	public int getHotelWriter() {
		return hotelWriter;
	}


	public void setHotelWriter(int hotelWriter) {
		this.hotelWriter = hotelWriter;
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

	public Date getHotelStart() {
		return hotelStart;
	}


	public void setHotelStart(Date hotelStart) {
		this.hotelStart = hotelStart;
	}


	public Date getHotelEnd() {
		return hotelEnd;
	}


	public void setHotelEnd(Date hotelEnd) {
		this.hotelEnd = hotelEnd;
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
	return "Hotel [hotelNo=" + hotelNo + ", hotelName=" + hotelName
			+ ", hotelText=" + hotelText + ", hotelSize=" + hotelSize + ", dNumber=" + dNumber + ", hotelStart" + hotelStart + ", hotelEnd" + hotelEnd + ", hotelStatus="
			+ hotelStatus + "]";
}




   
   

}