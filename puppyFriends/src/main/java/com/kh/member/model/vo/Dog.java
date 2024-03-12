package com.kh.member.model.vo;

public class Dog {

	private int dogNo;
	private int memberNo;
	private String dogName;
	private String dogValue;
	private String dogSize;
	private int dogAge;
	private String dogGender;
	private String dogVaccine;
	private String dogSignificant;
	
	
	public Dog() {}

	public Dog(int dogNo, int memberNo, String dogName, String dogValue, String dogSize, int dogAge, String dogGender,
			String dogVaccine, String dogSignificant) {
		super();
		this.dogNo = dogNo;
		this.memberNo = memberNo;
		this.dogName = dogName;
		this.dogValue = dogValue;
		this.dogSize = dogSize;
		this.dogAge = dogAge;
		this.dogGender = dogGender;
		this.dogVaccine = dogVaccine;
		this.dogSignificant = dogSignificant;
	}
	
	public Dog(int dogNo, String dogName) {
		super();
		this.dogNo = dogNo;
		this.dogName = dogName;
	}
	
	public Dog(int dogNo, int memberNo, String dogName, String dogValue, int dogAge, String dogGender,
			String dogVaccine, String dogSignificant) {
		super();
		this.dogNo = dogNo;
		this.memberNo = memberNo;
		this.dogName = dogName;
		this.dogValue = dogValue;
		this.dogAge = dogAge;
		this.dogGender = dogGender;
		this.dogVaccine = dogVaccine;
		this.dogSignificant = dogSignificant;
	}

	public int getDogNo() {
		return dogNo;
	}
	
	public void setDogNo(int dogNo) {
		this.dogNo = dogNo;
	}
	
	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getDogName() {
		return dogName;
	}


	public void setDogName(String dogName) {
		this.dogName = dogName;
	}


	public String getDogValue() {
		return dogValue;
	}

	public void setDogValue(String dogValue) {
		this.dogValue = dogValue;
	}

	public String getDogSize() {
		return dogSize;
	}

	public void setDogSize(String dogSize) {
		this.dogSize = dogSize;
	}

	public int getDogAge() {
		return dogAge;
	}


	public void setDogAge(int dogAge) {
		this.dogAge = dogAge;
	}


	public String getDogGender() {
		return dogGender;
	}


	public void setDogGender(String dogGender) {
		this.dogGender = dogGender;
	}


	public String getDogVaccine() {
		return dogVaccine;
	}


	public void setDogVaccine(String dogVaccine) {
		this.dogVaccine = dogVaccine;
	}


	public String getDogSignificant() {
		return dogSignificant;
	}


	public void setDogSignificant(String dogSignificant) {
		this.dogSignificant = dogSignificant;
	}


	@Override
	public String toString() {
		return "Dog [dogNo=" + dogNo + ", memberNo=" + memberNo + ", dogName=" + dogName + ", dogValue=" + dogValue 
				+ ", dogSize=" + dogSize + ", dogAge=" + dogAge + ", dogGender=" + dogGender 
				+ ", dogVaccine=" + dogVaccine + ", dogSignificant=" + dogSignificant + "]";
	}
	
	
	
	
}
