package com.kh.spring.evaluation.vo;

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
public class Evaluation {

	private int lectEvaNo;
	private int lectRegNo;
	private int stuId;
	private String question;
	private int score;
	private int year;
	private int semester;
	private String status;
	private int count;
}
