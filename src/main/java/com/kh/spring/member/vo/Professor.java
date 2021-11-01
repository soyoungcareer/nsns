package com.kh.spring.member.vo;

import java.sql.Date;

import com.kh.spring.major.vo.Department;

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
public class Professor { 

	private String profId;		//  "PROF_ID"		VARCHAR2(20)		NOT NULL,
	private String profPwd;		//  "PROF_PWD"		VARCHAR2(30)		NOT NULL,
	private String profName;	//  "PROF_NAME"		VARCHAR2(20)		NOT NULL,
	private int profDept; 	// 	"DEPT_CODE"		NUMBER		NOT NULL, 
	private String profDeptTitle; 	// 	"DEPT_TITLE"	VARCHAR2(100)		NOT NULL,
	private String profRrn;		//	"PROF_RRN"		VARCHAR2(30)		NOT NULL,
	private String profEmail;	//	"PROF_EMAIL"	VARCHAR2(100)		NOT NULL,
	private String profPhone;	//	"PROF_PHONE"	VARCHAR2(30)		NOT NULL,
	private String profAddress;	//	"PROF_ADDRESS"	VARCHAR2(200)		NOT NULL,
	private String profStatus;	//	"PROF_STATUS"	VARCHAR2(1)	DEFAULT 'Y' CHECK(PROF_STATUS IN('Y','N'))	NOT NULL,
	private Date profEmpdate;	//	"PROF_EMPDATE"	DATE		NOT NULL
	private Department department;
}
