package com.kh.spring.consult.vo;

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
public class Consult {

	private int conStsNo; //신청번호
	private String conProcess; // 신청단계
	private String conCompleted; // 완료여부
	private int conNo; //상담번호
	private String conCategory; // 구분 (일반, 진로)
	private Date conDate; // 희망날짜
	private String conReason; //상담사유
	private String rejectReason; //반려사유
	private String status; //상태값
	private String stuId; //학번
}
