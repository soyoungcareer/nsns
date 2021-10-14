package com.kh.spring.gradeObject.vo;

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
public class GradeObject {

	private int objNo;
	private int gradeNo;
	private int stuId;
	private Date objDate;
	private String title;
	private String content;
	private String status;
	private Date reason;
}
