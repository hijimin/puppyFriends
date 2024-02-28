package com.kh.dogfor.model.vo;

public class Attendance {
	
	private int attendanceNo;
	private String memberNo;
	private String date;
	private String status;
	
	public Attendance() {}
	
	public Attendance(int attendanceNo, String memberNo, String date, String status) {
		super();
		this.attendanceNo = attendanceNo;
		this.memberNo = memberNo;
		this.date = date;
		this.status = status;
	}

	public int getAttendanceNo() {
		return attendanceNo;
	}

	public void setAttendanceNo(int attendanceNo) {
		this.attendanceNo = attendanceNo;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Attendance [attendanceNo=" + attendanceNo + ", memberNo=" + memberNo + ", date=" + date + ", status="
				+ status + "]";
	}
	
	

}
