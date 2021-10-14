package com.otb.vo;

public class ReplyVo {
	
	private int replyNo;
	private int commentNo;
	private int userNo;
	private String replyContent;
	private String replyRegDate;
	private String userNickname;
	
	public ReplyVo() {
		super();
	}
	
	public ReplyVo(int replyNo, int commentNo, int userNo, String replyContent, String replyRegDate, String userNickname) {
		super();
		this.replyNo = replyNo;
		this.commentNo = commentNo;
		this.userNo = userNo;
		this.replyContent = replyContent;
		this.replyRegDate = replyRegDate;
		this.userNickname = userNickname;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyRegDate() {
		return replyRegDate;
	}

	public void setReplyRegDate(String replyRegDate) {
		this.replyRegDate = replyRegDate;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	@Override
	public String toString() {
		return "ReplyVo [replyNo=" + replyNo + ", commentNo=" + commentNo + ", userNo=" + userNo + ", replyContent="
				+ replyContent + ", replyRegDate=" + replyRegDate + ", userNickname=" + userNickname + "]";
	}

}
