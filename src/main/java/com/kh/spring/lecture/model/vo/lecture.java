package com.kh.spring.lecture.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class lecture {

	private int lecNo;
	private int stuId;
	private String lecTitle;
	private int lecYear;
	private int lecTer;
	private String deptTitle;
	private String proName;
	
	
}
