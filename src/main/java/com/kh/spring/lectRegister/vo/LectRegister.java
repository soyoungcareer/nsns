package com.kh.spring.lectRegister.vo;

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
public class LectRegister {
	private int regNo;
	private String subCode;
	private int stuId;
	private int year;
	private int semester;
	private String status;
}
