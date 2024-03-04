package com.kh.member.model.vo;

public class Member {

	private int memberNo;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String memberEmail;
	private String memberPhone;
	private String status;
	
	// 회원조회용 추가
	private int dogNo;
	private String dogName;
	private int count;
	
	
	public Member() {}
	
	public Member(int memberNo, String memberId, String memberName, int dogNo,String dogName
			, String memberEmail, String memberPhone) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberName = memberName;
		this.dogNo = dogNo;
		this.dogName = dogName;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		
	}
	
	
	// 회원 조회용
	public Member(int memberNo, String memberId, String memberName, int dogNo,
			String dogName, String memberEmail, String memberPhone, int count) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.dogNo = dogNo;
		this.dogName = dogName;
		this.count = count;
	}

	
	


	public int getCount() {
		return count;
	}
	

	public void setCount(int count) {
		this.count = count;
	}

	public int getDogNo() {
		return dogNo;
	}
	
	
	public void setDogNo(int dogNo) {
		this.dogNo = dogNo;
	}

	public String getDogName() {
		return dogName;
	}

	public void setDogName(String dogName) {
		this.dogName = dogName;
	}

	
	public Member(String memberId, String memberPwd) {
		super();
		
		this.memberId = memberId;
		this.memberPwd = memberPwd;
	}

	public int getMemberNo() {
		return memberNo;
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

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName="
				+ memberName + ", memberEmail=" + memberEmail + ", memberPhone=" + memberPhone + ", status=" + status
				+ ", dogNo=" + dogNo + ", dogName=" + dogName + ", count=" + count + "]";
	}



	

	

	
}
