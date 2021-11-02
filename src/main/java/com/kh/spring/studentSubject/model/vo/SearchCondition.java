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
public class SearchCondition {
	private int stuId;
	private String selectYear;
	private String selectSemester;
	private String search;
}
