package com.kh.spring.lectRegister.vo;

import com.kh.spring.major.vo.Department;
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
public class LecRegPro {
	private Subject subject;
	private Professor professor;
	private LectRegister lectRegister;
	private Department department;
	
}
