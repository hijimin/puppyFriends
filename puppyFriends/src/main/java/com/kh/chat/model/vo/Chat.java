package com.kh.chat.model.vo;

public class Chat {
	
	private int chatNo;
	private String fromId;
	private String toId;
	private String content;
	private String chatDate;
	
	public Chat() {}

	public Chat(int chatNo, String fromId, String toId, String content, String chatDate) {
		super();
		this.chatNo = chatNo;
		this.fromId = fromId;
		this.toId = toId;
		this.content = content;
		this.chatDate = chatDate;
	}

	public int getChatNo() {
		return chatNo;
	}

	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}

	public String getFromId() {
		return fromId;
	}

	public void setFromId(String fromId) {
		this.fromId = fromId;
	}

	public String getToId() {
		return toId;
	}

	public void setToId(String toId) {
		this.toId = toId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getChatDate() {
		return chatDate;
	}

	public void setChatDate(String chatDate) {
		this.chatDate = chatDate;
	}

	@Override
	public String toString() {
		return "Chat [chatNo=" + chatNo + ", fromId=" + fromId + ", toId=" + toId + ", content=" + content
				+ ", chatDate=" + chatDate + "]";
	}
	
	
	
}
