package com.kh.spring.notice.model.vo;

import java.sql.Date;

public class Notice {
	
	private int ntcNo;
	private int ntcCategory;//
	private String ntcTitle;
	private String ntcContent;
	private String ntcWriter;
	private int count;
	private Date createDate;
	private String status;
	
	public Notice() {}

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
				+ ntcContent + ", ntcWriter=" + ntcWriter + ", count=" + count + ", createDate=" + createDate
				+ ", status=" + status + "]";
	}

}