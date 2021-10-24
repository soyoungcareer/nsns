package com.kh.spring.member.service;

import java.util.ArrayList;

import com.kh.spring.major.vo.RequestedSubject;
import com.kh.spring.major.vo.Subject;
import com.kh.spring.member.vo.Professor;
import com.kh.spring.member.vo.Student;

public interface ProfService {

	int profLectListCount();

	ArrayList<Subject> selectSubList(String profId);

	Professor selectMypage(String profId);

	Professor profInfoLoad(String profId);

	void profCreateLecture(RequestedSubject reqSubject);

	Subject subInfoLoad(String subCode);

	void editMypage(Professor prof);

	Professor loginProfessor(String profId);

	ArrayList<Student> profStudentDetail(String subCode);



}
