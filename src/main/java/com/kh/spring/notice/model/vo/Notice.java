package com.kh.spring.notice.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
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
