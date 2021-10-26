package com.kh.spring.gradeObject.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.gradeObject.vo.GradeObject;
import com.kh.spring.lectRegister.vo.LecRegPro;
import com.kh.spring.lectRegister.vo.LectRegister;

@Repository
public class GradeObjectDao {

	public LecRegPro gradeDetailList(SqlSessionTemplate sqlSession, LectRegister re) {
		return sqlSession.selectOne("gradeStuMapper.gradeDetailList", re);
	}

	public void insertGradeObj(SqlSessionTemplate sqlSession, GradeObject go) {
		sqlSession.insert("gradeStuMapper.insertGradeObj", go);
	}

	public ArrayList<LecRegPro> gradeObjectList(SqlSessionTemplate sqlSession, int stuId) {
		return (ArrayList)sqlSession.selectList("gradeStuMapper.gradeObjectList", stuId);
	}

	public LecRegPro gradeObjectDetailPage(SqlSessionTemplate sqlSession, LectRegister re) {
		return sqlSession.selectOne("gradeStuMapper.gradeObjectDetailPage", re);
	}

}
