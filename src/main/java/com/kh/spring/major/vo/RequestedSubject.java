package com.kh.spring.major.vo;

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
public class RequestedSubject {

	private int reqSubNo;	// "REQSUB_NO"	NUMBER		NOT NULL,
	private int deptCode;	// "DEPT_CODE"	NUMBER		NOT NULL,
	private int subDivs;	// "SUB_DIVS"	NUMBER		NOT NULL,
	private int subType;	// "SUB_TYPE"	NUMBER		NOT NULL,
	private String subTitle;	// "SUB_TITLE"	VARCHAR2(100)		NOT NULL,
	private String profId;	// "PROF_ID"	VARCHAR2(20)		NOT NULL,
	private int subCredit;	// "SUB_CREDIT"	NUMBER		NULL,
	private String subTime;	// "SUB_TIME"	VARCHAR2(100)		NOT NULL,
	private String status;	// "STATUS"		VARCHAR2(1)	DEFAULT 'N'	CHECK(STATUS IN('Y','N'))		NOT NULL
	private String attOrigin;
	private String attChange;
	
}
