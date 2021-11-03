package com.kh.spring.evaluation.vo;

import com.kh.spring.major.vo.Subject;
import com.kh.spring.member.vo.Professor;

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
	private Subject subject;
	private Professor professor;
	private double dscore; // 소수점 출력
}
