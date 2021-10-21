package com.kh.spring.studentStatus.model.vo;

import java.util.Date;

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
public class StudentStatus {
	private String stsNo; //번호
	private String stsProcess; // 신청단계
	private String stsCategory; //휴학, 자퇴
	private String stsComplete; //완료여부
	private String status;
	private int applicationNo; //신청번호
	
}
