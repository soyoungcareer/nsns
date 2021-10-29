package com.kh.spring.member.service;

import java.util.ArrayList;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.kh.spring.common.PageInfo;
import com.kh.spring.member.vo.Admin;
import com.kh.spring.member.vo.Professor;
import com.kh.spring.member.vo.Student;

public interface MemberService {

	Admin loginAdmin(Admin a); //BCryptPasswordEncoder bCPwdEncoder, 

	Student loginStudent(Student s);

	Professor loginProfessor(Professor p);

	void insertStudent(Student s);

	void insertProfessor(Professor p);

	int studentListCount();
	
	ArrayList<Student> studentList(PageInfo pi);

	int professorListCount();

	ArrayList<Professor> professorList(PageInfo pi);

	void deleteStudent(int stuId);

	void deleteProfessor(int profId);

	int studentStatusFormCount();

	ArrayList<Student> studentStatusForm(PageInfo pi);

	void studentStatusUpdate(int stuId);
	

	

}
