package com.kh.spring.studentEval.vo;

<<<<<<< HEAD
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
=======
public class Grade {
>>>>>>> refs/heads/master

	private int gradeNo; 		// 	"GRADE_NO"			NUMBER		NOT NULL,
	private int studentId; 		// 	"STU_ID"			NUMBER		NOT NULL,
	private String studentName;	//   --> 학번(Number)으로 학생 테이블과 조인하여 학생이름(String) 가져오기
	private String subCode; 	//	"SUB_CODE"			VARCHAR2(10)		NOT NULL,
	private int gradeYear; 		// 	"GRADE_YEAR"		NUMBER		NOT NULL,
	private int gradeSemester; 	//	"GRADE_SEMESTER"	NUMBER		NOT NULL,
	private String gradeResult; // 	"GRADE_RESULT"		VARCHAR2(5)		NOT NULL,
	private int gradeCredit; 	// 	"GRADE_CREDIT"		NUMBER		NOT NULL
	
	
	public Grade() {
		// TODO Auto-generated constructor stub
	}


	public Grade(int gradeNo, int studentId, String studentName, String subCode, int gradeYear, int gradeSemester,
			String gradeResult, int gradeCredit) {
		super();
		this.gradeNo = gradeNo;
		this.studentId = studentId;
		this.studentName = studentName;
		this.subCode = subCode;
		this.gradeYear = gradeYear;
		this.gradeSemester = gradeSemester;
		this.gradeResult = gradeResult;
		this.gradeCredit = gradeCredit;
	}


	public int getGradeNo() {
		return gradeNo;
	}


	public void setGradeNo(int gradeNo) {
		this.gradeNo = gradeNo;
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


	public int getGradeYear() {
		return gradeYear;
	}


	public void setGradeYear(int gradeYear) {
		this.gradeYear = gradeYear;
	}


	public int getGradeSemester() {
		return gradeSemester;
	}


	public void setGradeSemester(int gradeSemester) {
		this.gradeSemester = gradeSemester;
	}


	public String getGradeResult() {
		return gradeResult;
	}


	public void setGradeResult(String gradeResult) {
		this.gradeResult = gradeResult;
	}


	public int getGradeCredit() {
		return gradeCredit;
	}


	public void setGradeCredit(int gradeCredit) {
		this.gradeCredit = gradeCredit;
	}


	@Override
	public String toString() {
		return "Grade [gradeNo=" + gradeNo + ", studentId=" + studentId + ", studentName=" + studentName + ", subCode="
				+ subCode + ", gradeYear=" + gradeYear + ", gradeSemester=" + gradeSemester + ", gradeResult="
				+ gradeResult + ", gradeCredit=" + gradeCredit + "]";
	}
	
	
}
