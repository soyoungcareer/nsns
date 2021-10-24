package com.kh.spring.consult.model.vo;

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
public class ConsultStatus {
	private int conStsNo; //신청번호
	private String conProcess; // 신청단계
	private String conCompleted; // 완료여부
	private String status; // 상태값
	private int conNo; //상담번호
	
}
