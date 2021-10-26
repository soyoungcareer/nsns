package com.kh.spring.studentEval.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.gradeObject.vo.GradeObject;
import com.kh.spring.lectRegister.vo.LecRegPro;
import com.kh.spring.lectRegister.vo.LectRegister;
import com.kh.spring.lectRegister.vo.SearchReg;
import com.kh.spring.studentEval.vo.CountCredit;

@Repository
public class GradeStuDao {

	public ArrayList<LecRegPro> selectGradeList(SqlSessionTemplate sqlSession, int stuId) {
		return (ArrayList)sqlSession.selectList("gradeStuMapper.selectGradeList", stuId);
	}

	public CountCredit cCredit(SqlSessionTemplate sqlSession, int stuId) {
		return sqlSession.selectOne("gradeStuMapper.cCredit", stuId);
	}

	public ArrayList<LecRegPro> selectGradeSearchList(SqlSessionTemplate sqlSession, SearchReg sr) {
		return (ArrayList)sqlSession.selectList("gradeStuMapper.selectGradeSearchList", sr);
	}

	public CountCredit cSearchCredit(SqlSessionTemplate sqlSession, SearchReg sr) {
		return sqlSession.selectOne("gradeStuMapper.cSearchCredit", sr);
	}

	public ArrayList<LectRegister> selectReYearList(SqlSessionTemplate sqlSession, int stuId) {
		return (ArrayList)sqlSession.selectList("gradeStuMapper.selectReYearList", stuId);
	}

	public ArrayList<LectRegister> selectReSemeList(SqlSessionTemplate sqlSession, int stuId) {
		return (ArrayList)sqlSession.selectList("gradeStuMapper.selectReSemeList", stuId);
	}

	public LecRegPro gradeDetailList(SqlSessionTemplate sqlSession, LectRegister re) {
		return sqlSession.selectOne("gradeStuMapper.gradeDetailList", re);
	}

	public ArrayList<GradeObject> objectList(SqlSessionTemplate sqlSession, int stuId) {
		return (ArrayList)sqlSession.selectList("gradeStuMapper.objectList", stuId);
	}

}
