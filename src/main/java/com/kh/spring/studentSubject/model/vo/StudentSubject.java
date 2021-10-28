package com.kh.spring.studentSubject.model.vo;

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
public class StudentSubject {
	
	private String subCode;
	private String subTitle;
	private String deptTitle;
	private int subDivs;
	private int subCredit;
	private String subTime;
	private String profName;
	private Double gradeCredit;
	 
}
