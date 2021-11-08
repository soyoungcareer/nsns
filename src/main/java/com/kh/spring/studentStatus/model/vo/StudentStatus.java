package com.kh.spring.studentStatus.model.vo;

import java.util.Date;

import com.kh.spring.major.vo.Department;
import com.kh.spring.member.vo.Professor;
import com.kh.spring.member.vo.Student;

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
	
	//관리자
	private int deptCode;
	private String deptTitle;
	private String profId;
	private String profName;
	private int stuId;
	private String stuName;
	private String offCategory; //휴학구분 (일반, 군)
	private Date offDate; // 휴학신청일 (sysdate)
	private int offSemCnt; // 휴학학기수
	private String offSem; //휴학학기
	
}
