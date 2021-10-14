package com.kh.spring.studentStatus.vo;

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
public class StudentDo { //자퇴

	private String stsNo; //번호
	private String stsProcess; // 신청단계
	private String stsAdm; //담당자
	private String stsComplete; //완료여부
	private int applicationNo; //신청번호
	private int stuId; //학번
	private Date doDate; //신청일자
	private String doReason; //자퇴사유
	private String status; //상태값
}
