package com.kh.spring.studentEval.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.notice.vo.PageInfo;
import com.kh.spring.studentEval.vo.Grade;

public class GradeDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("gradeMapper.selectListCount");
	}

	public ArrayList<Grade> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("gradeMapper.selectList", null, rowBounds);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int gno) {
		return sqlSession.update("gradeMapper.increaseCount", gno);
	}

	public Grade selectGrade(SqlSessionTemplate sqlSession, int gno) {
		return sqlSession.selectOne("gradeMapper.selectGrade", gno);
	}

}
 