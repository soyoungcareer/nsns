package com.kh.spring.member.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.consult.model.vo.Consult;
import com.kh.spring.evaluation.vo.Evaluation;
import com.kh.spring.major.vo.RequestedSubject;
import com.kh.spring.major.vo.Subject;
import com.kh.spring.member.vo.Professor;
import com.kh.spring.member.vo.Student;
import com.kh.spring.studentStatus.model.vo.StudentStatus;

@Repository
public class ProfessorDao {

	public int profLectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("profMapper.profLectListCount");
	}

	public ArrayList<Subject> selectSubList(SqlSessionTemplate sqlSession, String profId) {
		return (ArrayList)sqlSession.selectList("profMapper.selectSubList", profId);
	}

	public Professor selectMypage(SqlSessionTemplate sqlSession, String profId) {
		return sqlSession.selectOne("profMapper.selectMypage", profId);
	}

	public Professor profInfoLoad(SqlSessionTemplate sqlSession, String profId) {
		return sqlSession.selectOne("profMapper.profInfoLoad", profId);
	}

	public int profCreateLecture(SqlSessionTemplate sqlSession, RequestedSubject reqSubject) {
		System.out.println("======================= reqSubject Dao : " + reqSubject + "====================");
		
		return sqlSession.insert("profMapper.profCreateLecture", reqSubject);
	}

	public Subject subInfoLoad(SqlSessionTemplate sqlSession, String subCode) {
		return sqlSession.selectOne("profMapper.subInfoLoad", subCode);
	}

	public int editMypage(SqlSessionTemplate sqlSession, Professor prof) {
		System.out.println("======================= prof Dao : " + prof + "====================");
		
		return sqlSession.update("profMapper.editMypage", prof);
	}

	public Professor loginProfessor(SqlSessionTemplate sqlSession, String profId) {
		return sqlSession.selectOne("profMapper.loginProfessor", profId);
	}

	public ArrayList<Student> profStudentDetail(SqlSessionTemplate sqlSession, String subCode) {
		return (ArrayList)sqlSession.selectList("profMapper.profStudentDetail", subCode);
	}

	public ArrayList<Consult> loadConsultList(SqlSessionTemplate sqlSession, String profId) {
		return (ArrayList)sqlSession.selectList("profMapper.loadConsultList", profId);
	}

	public ArrayList<StudentStatus> loadStatusList(SqlSessionTemplate sqlSession, String profId) {
		return (ArrayList)sqlSession.selectList("profMapper.loadStatusList", profId);
	}

	public ArrayList<Evaluation> loadEvalList(SqlSessionTemplate sqlSession, Subject sub) {
		return (ArrayList)sqlSession.selectList("profMapper.loadEvalList", sub);
	}

}
