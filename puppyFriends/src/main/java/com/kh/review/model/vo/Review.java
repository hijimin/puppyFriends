package com.kh.review.model.vo;

/**
 * @author user1
 *
 */
public class Review {
	
	 private int reviewNo;
	 private String product;
	 private String reviewWriter;
	 private String reviewTitle;
	 private String reviewText;
	 private String reviewDate;
	 private String reviewStatus;

	 
	 public Review() {}

	public Review(int reviewNo, String product, String reviewWriter, String reviewTitle, String reviewText,
			String reviewDate, String reviewStatus) {
		super();
		this.reviewNo = reviewNo;
		this.product = product;
		this.reviewWriter = reviewWriter;
		this.reviewTitle = reviewTitle;
		this.reviewText = reviewText;
		this.reviewDate = reviewDate;
		this.reviewStatus = reviewStatus;
	}
	

	public Review(int reviewNo, String product, String reviewWriter, String reviewText, String reviewDate) {
		super();
		this.reviewNo = reviewNo;
		this.product = product;
		this.reviewWriter = reviewWriter;
		this.reviewText = reviewText;
		this.reviewDate = reviewDate;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getReviewWriter() {
		return reviewWriter;
	}

	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewText() {
		return reviewText;
	}

	public void setReviewText(String reviewText) {
		this.reviewText = reviewText;
	}

	public String getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", product=" + product + ", reviewWriter=" + reviewWriter
				+ ", reviewTitle=" + reviewTitle + ", reviewText=" + reviewText + ", reviewDate=" + reviewDate
				+ ", reviewStatus=" + reviewStatus + "]";
	}
	 
	 
	
}
