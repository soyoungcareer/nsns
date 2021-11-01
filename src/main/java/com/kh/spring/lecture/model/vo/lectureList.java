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
public class lectureList {

	private int listNo;
	private int regNo;
	private String listContent;
	private Date listDate;
	private int listWeek;
	private String originName;
	private String changeName;
	private int time;
	private int totalTime;
	
}
