package com.kh.spring.member.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.kh.spring.member.vo.Admin;
import com.kh.spring.member.vo.Professor;
import com.kh.spring.member.vo.Student;

public interface MemberService {

	Admin loginAdmin(BCryptPasswordEncoder bCPwdEncoder, Admin a);

	Student loginStudent(BCryptPasswordEncoder bCPwdEncoder, Student s);

	Professor loginProfessor(BCryptPasswordEncoder bCPwdEncoder, Professor p);

	

}
