package com.kh.spring.studentStatus.model.vo;

import java.util.Date;

import com.kh.spring.member.vo.Student;

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
public class StudentDo { //자퇴

	private int applicationNo; //신청번호
	private int stuId; //학번
	private Date doDate; //신청일자
	private String doReason; //자퇴사유
	private String status; //상태값
	
	private String stuName;
	private String stuStatus;
	private Student student;
	private StudentStatus studentStatus;
}
