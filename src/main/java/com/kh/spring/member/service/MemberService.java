package com.kh.spring.member.service;

import java.util.ArrayList;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.kh.spring.common.PageInfo;
import com.kh.spring.member.vo.Admin;
import com.kh.spring.member.vo.Professor;
import com.kh.spring.member.vo.Student;

public interface MemberService {
///
	Admin loginAdmin(BCryptPasswordEncoder bCPwdEncoder, Admin a); //BCryptPasswordEncoder bCPwdEncoder, 

	Student loginStudent(BCryptPasswordEncoder bCPwdEncoder, Student s);

	Professor loginProfessor(BCryptPasswordEncoder bCPwdEncoder, Professor p);

	void insertStudent(Student s);

	void insertProfessor(Professor p);

	int studentListCount();
	
	ArrayList<Student> studentList(PageInfo pi);

	int professorListCount();

	ArrayList<Professor> professorList(PageInfo pi);

	void deleteStudent(int stuId);

	void deleteProfessor(String profId);

	int studentStatusListCount();

	ArrayList<Student> studentStatusList(PageInfo pi);

	void studentStatusUpdate(int stsNo);

	void stuDoUpdateStu(int stuId);

	ArrayList<Student> studentOffStaList(PageInfo pi);

	void stuOffStaUpdate(int stsNo);

	void stuOffUpdate(int stuId);

	void stuOnStaUpdate(int stsNo);

	void stuOnUpdate(int stuId);

	void deleteStuPrf(String profId);
//
	//void studentUpdatePrf(int stuId);

	//void studentUpdatePrf(String profId);

}
