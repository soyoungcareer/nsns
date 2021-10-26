package com.kh.spring.studentEval.vo;

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
public class Grade { 

	private int gradeNo; 		// 	"GRADE_NO"			NUMBER		NOT NULL,
	private int studentId; 		// 	"STU_ID"			NUMBER		NOT NULL,
	private String studentName;	//   --> 학번(Number)으로 학생 테이블과 조인하여 학생이름(String) 가져오기
	private String subCode; 	//	"SUB_CODE"			VARCHAR2(10)		NOT NULL,
	private int gradeYear; 		// 	"GRADE_YEAR"		NUMBER		NOT NULL,
	private int gradeSemester; 	//	"GRADE_SEMESTER"	NUMBER		NOT NULL,
	private String gradeResult; // 	"GRADE_RESULT"		VARCHAR2(5)		NOT NULL,
	private double gradeCredit; 	// 	"GRADE_CREDIT"		NUMBER		NOT NULL
	
	private String deptName;	  	// 학과(전공)
	private String studentStatus; 	// 학적상태
	private int attendance;			// 출석
	private int assignment;			// 과제
	private int midExam;			// 중간
	private int finExam;			// 기말
	//private int total;				// 점수(총점)
	
	// 학년, 평가방법?
}
