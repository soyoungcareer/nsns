package com.kh.spring.member.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.major.vo.RequestedSubject;
import com.kh.spring.major.vo.Subject;
import com.kh.spring.member.vo.Professor;
import com.kh.spring.member.vo.Student;

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
		
		return sqlSession.selectOne("profMapper.profCreateLecture", reqSubject);
	}

	public Subject subInfoLoad(SqlSessionTemplate sqlSession, String subCode) {
		return sqlSession.selectOne("profMapper.subInfoLoad", subCode);
	}

	public int editMypage(SqlSessionTemplate sqlSession, Professor prof) {
		return sqlSession.selectOne("profMapper.editMypage", prof);
	}

	public Professor loginProfessor(SqlSessionTemplate sqlSession, String profId) {
		return sqlSession.selectOne("profMapper.loginProfessor", profId);
	}

	public ArrayList<Student> profStudentDetail(SqlSessionTemplate sqlSession, String subCode) {
		return (ArrayList)sqlSession.selectList("profMapper.profStudentDetail", subCode);
	}

}
