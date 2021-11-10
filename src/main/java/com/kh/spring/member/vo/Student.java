package com.kh.spring.member.vo;

import java.util.Date;

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
public class Student { //학생
	private int stuId; //학생아이디
	private String stuName; //학생이름
	private int deptCode; //학부코드
	private String deptName; 
	private String profId; //담당교수
	private String proName;
	private String stuPwd; //학생비번
	private String ssn; //주민번호
	private String email; //이메일
	private String phone; //핸드폰
	private String address; //주소
	private int stuCredit; // 수강학점 
	private Date graduationDate; //졸업날짜
	private Date addmissionDate; //입학날짜
	private String stuStatus; //학적상태 (재학, 졸업, 휴학, 자퇴)
	private String profStatus;
}
