package com.kh.spring.member.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.spring.common.PageInfo;
import com.kh.spring.consult.model.vo.Consult;
import com.kh.spring.consult.model.vo.ConsultStatus;
import com.kh.spring.evaluation.vo.Evaluation;
import com.kh.spring.major.vo.RequestedSubject;
import com.kh.spring.major.vo.Subject;
import com.kh.spring.member.vo.Professor;
import com.kh.spring.member.vo.SearchStudent;
import com.kh.spring.member.vo.Student;
import com.kh.spring.studentEval.vo.SearchSubject;
import com.kh.spring.studentStatus.model.vo.StudentDo;
import com.kh.spring.studentStatus.model.vo.StudentOff;
import com.kh.spring.studentStatus.model.vo.StudentStatus;

public interface ProfService { 

	ArrayList<Subject> selectSubList(String profId, PageInfo pi);

	Professor selectMypage(String profId);

	Professor profInfoLoad(String profId);

	void profCreateLecture(RequestedSubject reqSubject);

	Subject subInfoLoad(Map map);

	void editMypage(Professor prof);

	Professor loginProfessor(String profId);

	ArrayList<Consult> loadConsultList(String profId, PageInfo pi);

	ArrayList<StudentDo> loadDoList(String profId, PageInfo pi);

	ArrayList<StudentOff> loadOffList(String profId, PageInfo pi);

	ArrayList<RequestedSubject> selectReqSubList(String profId, PageInfo pi);

	int subListCount(String profId);

	int reqSubListCount(String profId);

	int offListCount(String profId);

	int doListCount(String profId);

	ArrayList<Student> selectFilteredStu(SearchStudent searchStudent);

	void editLectReq(RequestedSubject reqSubject);

	void delLectReq(RequestedSubject reqSubject);

	Subject delSubInfo(Map map);

	StudentOff detailOff(int applicationNo);

	StudentDo detailDo(int applicationNo);

	int profOffCheck(StudentStatus stuOff);

	int profDoCheck(StudentStatus stuDo);

	Consult detailConsult(String conNo);

	int profConCheck(Consult consult);

	Evaluation selectFilteredEval(Map map);

	int profConComplete(ConsultStatus conStatus);

	int loadConsultCount(String profId);

	int createDuplCheck(RequestedSubject reqSubject);

	int delDuplCheck(RequestedSubject reqSubject);

	int editDuplCheck(RequestedSubject reqSubject);






}
