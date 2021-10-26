package com.kh.spring.member.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.consult.model.vo.Consult;
import com.kh.spring.evaluation.vo.Evaluation;
import com.kh.spring.major.vo.RequestedSubject;
import com.kh.spring.major.vo.Subject;
import com.kh.spring.member.dao.ProfessorDao;
import com.kh.spring.member.vo.Professor;
import com.kh.spring.member.vo.Student;
import com.kh.spring.studentStatus.model.vo.StudentStatus;

@Service
public class ProfServiceImpl implements ProfService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ProfessorDao professorDao;
	
	@Override
	public int profLectListCount() {
		return professorDao.profLectListCount(sqlSession);
	}

	@Override
	public ArrayList<Subject> selectSubList(String profId) {
		return professorDao.selectSubList(sqlSession, profId);
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
	public Subject subInfoLoad(String subCode) {
		return professorDao.subInfoLoad(sqlSession, subCode);
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
	public ArrayList<StudentStatus> loadStatusList(String profId) {
		return professorDao.loadStatusList(sqlSession, profId);
	}

	@Override
	public ArrayList<Evaluation> loadEvalList(Subject sub) {
		return professorDao.loadEvalList(sqlSession, sub);
	}

}
