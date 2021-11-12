package com.kh.spring.major.vo;

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
public class LectEvaluation {

	private int lectEvaNo; //"LECT_EVA_NO"	NUMBER		NOT NULL, 강의평가번호 PK SEQ
	private int lectRegNum; //"LECT_REG_NO"	NUMBER		NOT NULL, 수강신청번호
	private int stuId; //"STU_ID"	NUMBER		NOT NULL, 학번
	private String question; //"QUESTION"	VARCHAR2(1000)	NOT NULL, 강의평가 질문
	private int score; //"SCORE"	NUMBER		NULL, 점수
	private int year; //"YEAR"	NUMBER		NOT NULL, 학년도
	private int semester; //"SEMESTER"	NUMBER		NOT NULL, 학기
	private String status; //"STATUS"	VARCHAR2(3)	DEFAULT 'N' CHECK (STATUS IN('Y', 'N'))	NOT NULL 제출여부
}
