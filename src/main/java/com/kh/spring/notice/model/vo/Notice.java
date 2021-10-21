package com.kh.spring.notice.model.vo;

import java.sql.Date;

public class Notice {
	
	private int ntcNo; //공지사항 번호(시퀀스)
	private int ntcCategory; //분류
	private String ntcTitle;
	private String ntcContent;
	private String ntcWriter;
	private String originName; //파일 원본명
	private String changeName; //파일 수정명
	private int count; //조회수
	private Date createDate;
	private String status;
	
	public Notice() {}

	public Notice(int ntcNo, int ntcCategory, String ntcTitle, String ntcContent, String ntcWriter, String originName,
			String changeName, int count, Date createDate, String status) {
		super();
		this.ntcNo = ntcNo;
		this.ntcCategory = ntcCategory;
		this.ntcTitle = ntcTitle;
		this.ntcContent = ntcContent;
		this.ntcWriter = ntcWriter;
		this.originName = originName;
		this.changeName = changeName;
		this.count = count;
		this.createDate = createDate;
		this.status = status;
	}

	public int getNtcNo() {
		return ntcNo;
	}

	public void setNtcNo(int ntcNo) {
		this.ntcNo = ntcNo;
	}

	public int getNtcCategory() {
		return ntcCategory;
	}

	public void setNtcCategory(int ntcCategory) {
		this.ntcCategory = ntcCategory;
	}

	public String getNtcTitle() {
		return ntcTitle;
	}

	public void setNtcTitle(String ntcTitle) {
		this.ntcTitle = ntcTitle;
	}

	public String getNtcContent() {
		return ntcContent;
	}

	public void setNtcContent(String ntcContent) {
		this.ntcContent = ntcContent;
	}

	public String getNtcWriter() {
		return ntcWriter;
	}

	public void setNtcWriter(String ntcWriter) {
		this.ntcWriter = ntcWriter;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Notice [ntcNo=" + ntcNo + ", ntcCategory=" + ntcCategory + ", ntcTitle=" + ntcTitle + ", ntcContent="
				+ ntcContent + ", ntcWriter=" + ntcWriter + ", originName=" + originName + ", changeName=" + changeName
				+ ", count=" + count + ", createDate=" + createDate + ", status=" + status + "]";
	}

	/*
	public Notice(int ntcNo, int ntcCategory, String ntcTitle, String ntcContent, String ntcWriter, int count,
			Date createDate, String status) {
		super();
		this.ntcNo = ntcNo;
		this.ntcCategory = ntcCategory;
		this.ntcTitle = ntcTitle;
		this.ntcContent = ntcContent;
		this.ntcWriter = ntcWriter;
		this.count = count;
		this.createDate = createDate;
		this.status = status;
	}*/
	
	

}
