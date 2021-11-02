package com.kh.spring.major.vo;

import java.util.Date;

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
public class Subject {
	
	private String subCode; //과목코드
	private String subTitle; //과목이름
	private int deptCode; //학과코드
	private int subDivs; //과목분류 (1:전공/2:교양)
	private String profId; //교번
	private int subCredit; //학점
	private int subClass; //강의실
	private String subTime; //강의시간
	private int subType; //강의형태(1:집체/2:온라인)
	private int subYear; //학년도
	private int subSmst; //학기
	private String status; //상태값
	private String originName; //파일원본명
	private String changeName; //파일수정명
	private String deptTitle; // 학과명
	private String profName; // 교수명
	//private String test; // 교수명

	
}
