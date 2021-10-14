package com.kh.spring.certificate.vo;

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
public class Graduation {
	private int gradNo;
	private int stuId;
	private String stuName;
	private String ssn;
	private Date gradDate;
}
