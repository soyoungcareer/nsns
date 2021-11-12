package com.kh.spring.major.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.evaluation.vo.Evaluation;
import com.kh.spring.major.vo.LectEvaluation;

@Repository
public class CreateEvDao {
	
	public ArrayList<LectEvaluation> selectEvQList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("majorMapper.selectEvQList");
	}

	public int createQuestion(SqlSessionTemplate sqlSession, LectEvaluation le) {
		
		return sqlSession.insert("majorMapper.createQuestion", le);
	}

}
