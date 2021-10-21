package com.kh.spring.member.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.major.vo.Subject;

@Repository
public class ProfessorDao {

	public int profLectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("profMapper.profLectListCount");
	}

	public ArrayList<Subject> selectSubList(SqlSessionTemplate sqlSession, String profId) {
		return (ArrayList)sqlSession.selectList("profMapper.selectSubList", profId);
	}
 
	
}
