package com.kh.spring.member.vo;

import java.sql.Date;

public class Professor {

	private String profId;		//  "PROF_ID"		VARCHAR2(20)		NOT NULL,
	private String profPwd;		//  "PROF_PWD"		VARCHAR2(30)		NOT NULL,
	private String profName;	//  "PROF_NAME"		VARCHAR2(20)		NOT NULL,
	private String profDept; 	// 	"DEPT_CODE"		NUMBER		NOT NULL, 
								//   --> 학과코드(Number)로 받아와서 학과명(String)으로 변환해야함
	private String profRrn;		//	"PROF_RRN"		VARCHAR2(30)		NOT NULL,
	private String profEmail;	//	"PROF_EMAIL"	VARCHAR2(100)		NOT NULL,
	private String profPhone;	//	"PROF_PHONE"	VARCHAR2(30)		NOT NULL,
	private String profAddress;	//	"PROF_ADDRESS"	VARCHAR2(200)		NOT NULL,
	private String profStatus;	//	"PROF_STATUS"	VARCHAR2(1)	DEFAULT 'Y' CHECK(PROF_STATUS IN('Y','N'))	NOT NULL,
	private Date profEmpdate;	//	"PROF_EMPDATE"	DATE		NOT NULL
	
	public Professor() {
		// TODO Auto-generated constructor stub
	}
	

	public Professor(String profId, String profPwd, String profName, String profDept, String profRrn, String profEmail,
			String profPhone, String profAddress, String profStatus, Date profEmpdate) {
		super();
		this.profId = profId;
		this.profPwd = profPwd;
		this.profName = profName;
		this.profDept = profDept;
		this.profRrn = profRrn;
		this.profEmail = profEmail;
		this.profPhone = profPhone;
		this.profAddress = profAddress;
		this.profStatus = profStatus;
		this.profEmpdate = profEmpdate;
	}



	public String getProfId() {
		return profId;
	}

	public void setProfId(String profId) {
		this.profId = profId;
	}

	public String getProfPwd() {
		return profPwd;
	}

	public void setProfPwd(String profPwd) {
		this.profPwd = profPwd;
	}

	public String getProfName() {
		return profName;
	}

	public void setProfName(String profName) {
		this.profName = profName;
	}

	public String getProfDept() {
		return profDept;
	}

	public void setProfDept(String profDept) {
		this.profDept = profDept;
	}

	public String getProfRrn() {
		return profRrn;
	}

	public void setProfRrn(String profRrn) {
		this.profRrn = profRrn;
	}

	public String getProfEmail() {
		return profEmail;
	}

	public void setProfEmail(String profEmail) {
		this.profEmail = profEmail;
	}

	public String getProfPhone() {
		return profPhone;
	}

	public void setProfPhone(String profPhone) {
		this.profPhone = profPhone;
	}

	public String getProfAddress() {
		return profAddress;
	}

	public void setProfAddress(String profAddress) {
		this.profAddress = profAddress;
	}

	public String getProfStatus() {
		return profStatus;
	}

	public void setProfStatus(String profStatus) {
		this.profStatus = profStatus;
	}

	public Date getProfEmpdate() {
		return profEmpdate;
	}

	public void setProfEmpdate(Date profEmpdate) {
		this.profEmpdate = profEmpdate;
	}


	@Override
	public String toString() {
		return "Professor [profId=" + profId + ", profPwd=" + profPwd + ", profName=" + profName + ", profDept="
				+ profDept + ", profRrn=" + profRrn + ", profEmail=" + profEmail + ", profPhone=" + profPhone
				+ ", profAddress=" + profAddress + ", profStatus=" + profStatus + ", profEmpdate=" + profEmpdate + "]";
	}
	
	
}
