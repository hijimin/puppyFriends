package com.kh.common.model.vo;

import java.sql.Date;

public class Image {
	private int fileNo;
	 private int refBoardNo;
	 private int imageType;
	 private String filePath;
	 private int fileLevel;
	 private String fileName;
	 private String changeName;
	 private Date imageUpdate;
	 
	 public Image() {}

	public Image(int fileNo, int refBoardNo, int imageType, String filePath, int fileLevel, String fileName,
			String changeName, Date imageUpdate) {
		super();
		this.fileNo = fileNo;
		this.refBoardNo = refBoardNo;
		this.imageType = imageType;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
		this.fileName = fileName;
		this.changeName = changeName;
		this.imageUpdate = imageUpdate;
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

	@Override
	public String toString() {
		return "Image [fileNo=" + fileNo + ", refBoardNo=" + refBoardNo + ", imageType=" + imageType + ", filePath="
				+ filePath + ", fileLevel=" + fileLevel + ", fileName=" + fileName + ", changeName=" + changeName
				+ ", imageUpdate=" + imageUpdate + "]";
	}

}
