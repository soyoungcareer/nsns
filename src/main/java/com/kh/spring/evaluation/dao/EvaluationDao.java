package com.kh.spring.evaluation.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.evaluation.vo.Evaluation;
import com.kh.spring.evaluation.vo.EvaluationScore;
import com.kh.spring.lectRegister.vo.LectRegister;

@Repository
public class EvaluationDao {

	public ArrayList<Evaluation> evalQuestionList(SqlSessionTemplate sqlSession, LectRegister re) {
		return (ArrayList)sqlSession.selectList("gradeStuMapper.evalQuestionList", re);
	}

	public int countEval(SqlSessionTemplate sqlSession, EvaluationScore eval) {
		return sqlSession.selectOne("gradeStuMapper.countEval", eval);
	}

	public void insertEvaluation(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		sqlSession.insert("gradeStuMapper.insertEvaluation", map);
		
	}


}
