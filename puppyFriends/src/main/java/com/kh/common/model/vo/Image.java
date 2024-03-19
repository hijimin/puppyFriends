package com.kh.common.model.vo;

import java.sql.Date;
import java.util.ArrayList;

public class Image {
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
	 
	 public Image() {}

	public Image(int fileNo, int refBoardNo, int imageType, String filePath, int fileLevel, String fileName,
			String changeName, Date imageUpdate, String dogNo) {
		super();
		this.fileNo = fileNo;
		this.refBoardNo = refBoardNo;
		this.imageType = imageType;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
		this.fileName = fileName;
		this.changeName = changeName;
		this.imageUpdate = imageUpdate;
		this.dogNo = dogNo;
	}

	// selectHotelImgList ?

	public Image(int fileNo, String filePath, String fileName,
			String changeName) {
		super();
		this.fileNo = fileNo;
		this.filePath = filePath;
		this.fileName = fileName;
		this.changeName = changeName;
		
		
	}

 // selectHotelThumbnailList
	public Image(int fileNo, int refBoardNo, String fileName, String titleImg) {
		super();
		this.fileNo = fileNo;
		this.refBoardNo = refBoardNo;
		this.fileName = fileName;
		this.titleImg = titleImg;
	}

	public Image(int fileNo, String dogNo, String content, String titleImg) {
		super();
		this.fileNo = fileNo;
		this.dogNo = dogNo;
		this.content = content;
		this.titleImg = titleImg;
	}

	public Image(int fileNo, String dogNo, String titleImg) {
		super();
		this.fileNo = fileNo;
		this.dogNo = dogNo;
		this.titleImg = titleImg;
	}

	

	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
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

	@Override
	public String toString() {
		return "Image [fileNo=" + fileNo + ", refBoardNo=" + refBoardNo + ", imageType=" + imageType + ", filePath="
				+ filePath + ", fileLevel=" + fileLevel + ", fileName=" + fileName + ", changeName=" + changeName
				+ ", imageUpdate=" + imageUpdate + ", dogNo=" + dogNo + "]";
	}

	public void add(ArrayList<Image> img) {
		// TODO Auto-generated method stub
		
	}

	 
}
