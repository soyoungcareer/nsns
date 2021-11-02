package com.kh.spring.member.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.PageInfo;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.consult.model.vo.Consult;
import com.kh.spring.evaluation.vo.Evaluation;
import com.kh.spring.major.vo.RequestedSubject;
import com.kh.spring.major.vo.Subject;
import com.kh.spring.member.dao.ProfessorDao;
import com.kh.spring.member.vo.Professor;
import com.kh.spring.member.vo.SearchStudent;
import com.kh.spring.member.vo.Student;
import com.kh.spring.studentStatus.model.vo.StudentDo;
import com.kh.spring.studentStatus.model.vo.StudentOff;

@Service
public class ProfServiceImpl implements ProfService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ProfessorDao professorDao;
	
	@Override
	public ArrayList<Subject> selectSubList(String profId, PageInfo pi) {
		return professorDao.selectSubList(sqlSession, profId, pi);
	}

	@Override
	public Professor selectMypage(String profId) {
		return professorDao.selectMypage(sqlSession, profId);
	}

	@Override
	public Professor profInfoLoad(String profId) {
		return professorDao.profInfoLoad(sqlSession, profId);
	}

	@Override
	public void profCreateLecture(RequestedSubject reqSubject) {
		int result = professorDao.profCreateLecture(sqlSession, reqSubject);
		
		if (result < 0) {
			throw new CommException("강의개설 신청 실패");
		}
	}

	@Override
	public Subject subInfoLoad(Map map) {
		return professorDao.subInfoLoad(sqlSession, map);
	}

	@Override
	public void editMypage(Professor prof) {
		int result = professorDao.editMypage(sqlSession, prof);
		
		if (result < 0) {
			throw new CommException("교수 개인정보수정 실패");
		} 
	}

	@Override
	public Professor loginProfessor(String profId) {
		return professorDao.loginProfessor(sqlSession, profId);
	}

	@Override
	public ArrayList<Student> profStudentDetail(String subCode) {
		return professorDao.profStudentDetail(sqlSession, subCode);
	}

	@Override
	public ArrayList<Consult> loadConsultList(String profId) {
		return professorDao.loadConsultList(sqlSession, profId);
	}

	@Override
	public ArrayList<Evaluation> loadEvalList(Subject sub) {
		return professorDao.loadEvalList(sqlSession, sub);
	}

	@Override
	public ArrayList<StudentDo> loadDoList(String profId, PageInfo pi) {
		return professorDao.loadDoList(sqlSession, profId, pi);
	}

	@Override
	public ArrayList<StudentOff> loadOffList(String profId, PageInfo pi) {
		return professorDao.loadOffList(sqlSession, profId, pi);
	}

	@Override
	public ArrayList<RequestedSubject> selectReqSubList(String profId, PageInfo pi) {
		return professorDao.selectReqSubList(sqlSession, profId, pi);
	}

	@Override
	public int subListCount(String profId) {
		return professorDao.subListCount(sqlSession, profId);
	}

	@Override
	public int reqSubListCount(String profId) {
		return professorDao.reqSubListCount(sqlSession, profId);
	}

	@Override
	public int offListCount(String profId) {
		return professorDao.offListCount(sqlSession, profId);
	}

	@Override
	public int doListCount(String profId) {
		return professorDao.doListCount(sqlSession, profId);
	}

	@Override
	public ArrayList<Student> selectFilteredStu(SearchStudent searchStudent) {
		return professorDao.selectFilteredStu(sqlSession, searchStudent);
	}

	@Override
	public void editLectReq(RequestedSubject reqSubject) {
		int result = professorDao.editLectReq(sqlSession, reqSubject);
		
		if (result < 0) {
			throw new CommException("강의정보수정 실패");
		} 
		
	}

	@Override
	public void delLectReq(RequestedSubject reqSubject) {
		int result = professorDao.delLectReq(sqlSession, reqSubject);
		
		if (result < 0) {
			throw new CommException("강의삭제 실패");
		}
		
	}

	@Override
	public Subject delSubInfo(Map map) {
		return professorDao.delSubInfo(sqlSession, map);
	}

	@Override
	public StudentOff detailOff(String offNo) {
		return professorDao.detailOff(sqlSession, offNo);
	}

	@Override
	public StudentDo detailDo(String doNo) {
		return professorDao.detailDo(sqlSession, doNo);
	}

	@Override
	public int profOffCheck(String offNo) {
		return professorDao.profOffCheck(sqlSession, offNo);
	}

	@Override
	public int profDoCheck(String doNo) {
		return professorDao.profDoCheck(sqlSession, doNo);
	}

	@Override
	public Consult detailConsult(String conNo) {
		return professorDao.detailConsult(sqlSession, conNo);
	}

	@Override
	public int profConCheck(Consult consult) {
		return professorDao.profConCheck(sqlSession, consult);
	}

}
