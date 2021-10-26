package com.kh.spring.studentEval.vo;

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
public class CountCredit {
	private int majorC; //전공학점
	private int elseC; //교양학점
	private int allC; //전체학점
	private float avgCredit; //평균학점
	private float gradeRe; //등급
}
