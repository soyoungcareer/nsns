package com.kh.spring.studentEval.vo;

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
public class SearchGrade {
	private String subCode;
	private String gradeYear;
	private String gradeSemester;
	private String profId; 
}
