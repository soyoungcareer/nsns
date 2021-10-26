package com.kh.spring.member.service;

import java.util.ArrayList;

import com.kh.spring.consult.model.vo.Consult;
import com.kh.spring.evaluation.vo.Evaluation;
import com.kh.spring.major.vo.RequestedSubject;
import com.kh.spring.major.vo.Subject;
import com.kh.spring.member.vo.Professor;
import com.kh.spring.member.vo.Student;
import com.kh.spring.studentStatus.model.vo.StudentStatus;

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

	ArrayList<Consult> loadConsultList(String profId);

	ArrayList<StudentStatus> loadStatusList(String profId);

	ArrayList<Evaluation> loadEvalList(Subject sub);



}
