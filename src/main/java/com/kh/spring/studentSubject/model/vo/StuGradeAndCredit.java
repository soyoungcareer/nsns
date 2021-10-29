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
public class StuGradeAndCredit {
	
	private int year;
	private int semester;
	private Double gradeCredit;
	private int stuCredit;
	
}
