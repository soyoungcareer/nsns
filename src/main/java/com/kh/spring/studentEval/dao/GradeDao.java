package com.kh.spring.studentEval.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.common.PageInfo;
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

	public ArrayList<GradeObject> loadObjList(SqlSessionTemplate sqlSession, String profId, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("gradeMapper.loadObjList", profId, rowBounds);
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

	public int updateGrade(SqlSessionTemplate sqlSession, Grade grade) {
		System.out.println("============================map Dao : " + grade);
		return sqlSession.update("gradeMapper.updateGrade", grade);
	}

	public int objListCount(SqlSessionTemplate sqlSession, String profId) {
		return sqlSession.selectOne("gradeMapper.objListCount", profId);
	}

	public GradeObject detailObjection(SqlSessionTemplate sqlSession, String objNo) {
		return sqlSession.selectOne("gradeMapper.detailObjection", objNo);
	}

	public int profObjCheck(SqlSessionTemplate sqlSession, GradeObject gradeObject) {
		return sqlSession.update("gradeMapper.profObjCheck", gradeObject);
	}

	public int gradeInsert(SqlSessionTemplate sqlSession, Grade grade) {
		return sqlSession.insert("gradeMapper.gradeInsert", grade);
	}

	public int gradeDelete(SqlSessionTemplate sqlSession, Grade grade) {
		return sqlSession.delete("gradeMapper.gradeDelete", grade);
	}

	public int mainSubCount(SqlSessionTemplate sqlSession, String profId) {
		return sqlSession.selectOne("gradeMapper.mainSubCount", profId);
	}

	public ArrayList<Subject> selectMainSub(SqlSessionTemplate sqlSession, String profId, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("gradeMapper.selectMainSub", profId, rowBounds);
	}

}
 