package com.kh.spring.studentEval.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.gradeObject.vo.GradeObject;
import com.kh.spring.major.vo.Subject;
import com.kh.spring.studentEval.vo.Grade;
import com.kh.spring.studentEval.vo.SearchGrade;
import com.kh.spring.studentEval.vo.SearchSubject;

@Repository
public class GradeDao {
	/*
	public ArrayList<Grade> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String subCode, int gradeYear, int gradeSemester) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("gradeMapper.selectList", null, rowBounds);
	}
	*/
	public ArrayList<Subject> loadSubList(SqlSessionTemplate sqlSession, Subject sub) {
		return (ArrayList)sqlSession.selectList("gradeMapper.loadSubList", sub);
	}
	
	public ArrayList<Grade> selectList(SqlSessionTemplate sqlSession, Grade gradeList) {
		return (ArrayList)sqlSession.selectList("gradeMapper.selectList", gradeList);
	}

	public ArrayList<GradeObject> loadObjList(SqlSessionTemplate sqlSession, String profId) {
		return (ArrayList)sqlSession.selectList("gradeMapper.loadObjList", profId);
	}

	public int selectSubListCount(SqlSessionTemplate sqlSession, SearchSubject searchSubject) {
		return sqlSession.selectOne("gradeMapper.selectSubListCount", searchSubject);
	}

	public ArrayList<Subject> selectFilteredSubList(SqlSessionTemplate sqlSession, SearchSubject searchSubject,
			com.kh.spring.common.PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("gradeMapper.selectFilteredSubList", searchSubject , rowBounds);
	}

	public ArrayList<Grade> selectFilteredGrade(SqlSessionTemplate sqlSession, SearchGrade searchGrade) {
		return (ArrayList)sqlSession.selectList("gradeMapper.selectFilteredGrade", searchGrade);
	}

}
 