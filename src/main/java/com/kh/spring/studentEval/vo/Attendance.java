package com.kh.spring.studentEval.vo;

import java.sql.Date;

public class Attendance {

	private int attendNo; 			// 출석번호	"ATTEND_NO"			NUMBER		NOT NULL,
	private int studentId; 			// 학번		"STU_ID"			NUMBER		NOT NULL,
	private String studentName;		// 학생이름	--> 학번(Number)로 받아와서 학생이름(String) 조회
	private String subCode;			// 과목코드 	"SUB_CODE"			VARCHAR2(10)		NOT NULL,
	private int attendYear; 		// 학년도		"ATTEND_YEAR"		NUMBER		NOT NULL,
	private int attendSemester; 	// 학기		"ATTEND_SEMESTER"	NUMBER		NOT NULL,
	private Date attendDate; 		// 출석일자	"ATTEND_DATE"		DATE		NOT NULL,
	private String attendResult;	// 출석상태	"ATTEND_RESULT"		VARCHAR2(1)	CHECK(ATTEND_RESULT IN('Y','N','E','L'))	NULL


	public Attendance() {
		// TODO Auto-generated constructor stub
	}


	public Attendance(int attendNo, int studentId, String studentName, String subCode, int attendYear,
			int attendSemester, Date attendDate, String attendResult) {
		super();
		this.attendNo = attendNo;
		this.studentId = studentId;
		this.studentName = studentName;
		this.subCode = subCode;
		this.attendYear = attendYear;
		this.attendSemester = attendSemester;
		this.attendDate = attendDate;
		this.attendResult = attendResult;
	}


	public int getAttendNo() {
		return attendNo;
	}


	public void setAttendNo(int attendNo) {
		this.attendNo = attendNo;
	}


	public int getStudentId() {
		return studentId;
	}


	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}


	public String getStudentName() {
		return studentName;
	}


	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}


	public String getSubCode() {
		return subCode;
	}


	public void setSubCode(String subCode) {
		this.subCode = subCode;
	}


	public int getAttendYear() {
		return attendYear;
	}


	public void setAttendYear(int attendYear) {
		this.attendYear = attendYear;
	}


	public int getAttendSemester() {
		return attendSemester;
	}


	public void setAttendSemester(int attendSemester) {
		this.attendSemester = attendSemester;
	}


	public Date getAttendDate() {
		return attendDate;
	}


	public void setAttendDate(Date attendDate) {
		this.attendDate = attendDate;
	}


	public String getAttendResult() {
		return attendResult;
	}


	public void setAttendResult(String attendResult) {
		this.attendResult = attendResult;
	}


	@Override
	public String toString() {
		return "Attendance [attendNo=" + attendNo + ", studentId=" + studentId + ", studentName=" + studentName
				+ ", subCode=" + subCode + ", attendYear=" + attendYear + ", attendSemester=" + attendSemester
				+ ", attendDate=" + attendDate + ", attendResult=" + attendResult + "]";
	}
	
	
}
