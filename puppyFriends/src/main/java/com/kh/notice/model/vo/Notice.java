package com.kh.notice.model.vo;

import java.sql.Date;

public class Notice {

	private int noticeNo;
	private String noticeWriter;
	private String noticeTitile;
	private String noticeContent;
	private int count;
	private Date createDate;
	private Date modifyDate;
	private String status;
	
	public Notice() {}

	public Notice(int noticeNo, String noticeWriter, String noticeTitile, String noticeContent, int count,
			Date createDate, Date modifyDate, String status) {
		super();
		this.noticeNo = noticeNo;
		this.noticeWriter = noticeWriter;
		this.noticeTitile = noticeTitile;
		this.noticeContent = noticeContent;
		this.count = count;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	public Notice(int noticeNo, String noticeWriter, String noticeTitile, String noticeContent, int count,
			Date createDate, Date modifyDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeWriter = noticeWriter;
		this.noticeTitile = noticeTitile;
		this.noticeContent = noticeContent;
		this.count = count;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
	}


	public Notice(int noticeNo, String noticeWriter, String noticeTitile, String noticeContent, Date createDate, String status) {
		super();
		this.noticeNo = noticeNo;
		this.noticeWriter = noticeWriter;
		this.noticeTitile = noticeTitile;
		this.noticeContent = noticeContent;
		this.createDate = createDate;
		this.status = status;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public String getNoticeTitile() {
		return noticeTitile;
	}

	public void setNoticeTitile(String noticeTitile) {
		this.noticeTitile = noticeTitile;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeWriter=" + noticeWriter + ", noticeTitile=" + noticeTitile
				+ ", noticeContent=" + noticeContent + ", count=" + count + ", createDate=" + createDate
				+ ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}

	
	

	
		
} // class