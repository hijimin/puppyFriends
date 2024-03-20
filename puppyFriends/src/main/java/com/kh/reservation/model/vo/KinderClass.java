package com.kh.reservation.model.vo;

import java.sql.Date;

public class KinderClass {

	
	private int classNo;
	private int classWriter;
	private String className;
	private String classText;
	private String classSize;
	private int dNumber;
	private String classStatus;
	private int cCount;
	
	private Date writingDate;
	private Date reservationStart;
	private Date reservationEnd;
	private int reservationPrice;
	
	private int memberNo;
	private String memberId; 
	   
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
	
	
	
	public KinderClass() {}

	
	public KinderClass(int classNo, int classWriter, String className, String classText, String classSize,
			String memberId, String titleImg) {
		super();
		this.classNo = classNo;
		this.classWriter = classWriter;
		this.className = className;
		this.classText = classText;
		this.classSize = classSize;
		this.memberId = memberId;
		this.titleImg = titleImg;
	}
	
	// selectClassDetail
	public KinderClass(int classNo, int classWriter, String className, String classText, String classSize, int dNumber, int cCount, 
			Date reservationStart, Date reservationEnd, int reservationPrice, String memberId) {
		super();
		this.classNo = classNo;
		this.classWriter = classWriter;
		this.className = className;
		this.classText = classText;
		this.classSize = classSize;
		this.dNumber = dNumber;
		this.cCount = cCount;
		this.reservationStart = reservationStart;
		this.reservationEnd = reservationEnd;
		this.reservationPrice = reservationPrice;
		this.memberId = memberId;
		
	}
	
	// insertThClass
	public KinderClass(int classNo, int classWriter, String className, String classText, String classSize,
			int dNumber) {
		super();
		this.classNo = classNo;
		this.classWriter = classWriter;
		this.className = className;
		this.classText = classText;
		this.classSize = classSize;
		this.dNumber = dNumber;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public int getcCount() {
		return cCount;
	}


	public void setcCount(int cCount) {
		this.cCount = cCount;
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


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
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

	public int getClassNo() {
		return classNo;
	}

	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}

	public int getClassWriter() {
		return classWriter;
	}

	public void setClassWriter(int classWriter) {
		this.classWriter = classWriter;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getClassText() {
		return classText;
	}

	public void setClassText(String classText) {
		this.classText = classText;
	}

	public String getClassSize() {
		return classSize;
	}

	public void setClassSize(String classSize) {
		this.classSize = classSize;
	}

	public int getdNumber() {
		return dNumber;
	}

	public void setdNumber(int dNumber) {
		this.dNumber = dNumber;
	}

	public String getClassStatus() {
		return classStatus;
	}

	public void setClassStatus(String classStatus) {
		this.classStatus = classStatus;
	}

	@Override
	public String toString() {
		return "KinderClass [classNo=" + classNo + ", classWriter=" + classWriter + ", className=" + className
				+ ", classText=" + classText + ", classSize=" + classSize + ", dNumber=" + dNumber + ", classStatus="
				+ classStatus + "]";
	}
	
	
	
	
}
