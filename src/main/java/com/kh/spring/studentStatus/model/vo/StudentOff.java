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
public class StudentOff {
	private int applicationNo; //신청번호
	private String stuId;
	private String offCategory; //휴학구분 (일반, 군)
	private Date offDate; // 휴학신청일 (sysdate)
	private int offSemCnt; // 휴학학기수
	private String offSem; //휴학학기
	private String offReason; //휴학사유
	private String status; // 상태값
}


