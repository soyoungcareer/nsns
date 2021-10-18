package com.kh.spring.studentEval.vo;

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
public class Attendance { 

	private int attendNo; 			// 출석번호	"ATTEND_NO"			NUMBER		NOT NULL,
	private int studentId; 			// 학번		"STU_ID"			NUMBER		NOT NULL,
	private String studentName;		// 학생이름	--> 학번(Number)로 받아와서 학생이름(String) 조회
	private String subCode;			// 과목코드 	"SUB_CODE"			VARCHAR2(10)		NOT NULL,
	private int attendYear; 		// 학년도		"ATTEND_YEAR"		NUMBER		NOT NULL,
	private int attendSemester; 	// 학기		"ATTEND_SEMESTER"	NUMBER		NOT NULL,
	private Date attendDate; 		// 출석일자	"ATTEND_DATE"		DATE		NOT NULL,
	private String attendResult;	// 출석상태	"ATTEND_RESULT"		VARCHAR2(1)	CHECK(ATTEND_RESULT IN('Y','N','E','L'))	NULL

}
