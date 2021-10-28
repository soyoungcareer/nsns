package com.kh.spring.evaluation.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.evaluation.vo.Evaluation;
import com.kh.spring.evaluation.vo.evalList;
import com.kh.spring.lectRegister.vo.LectRegister;

@Repository
public class EvaluationDao {

	public ArrayList<Evaluation> evalQuestionList(SqlSessionTemplate sqlSession, LectRegister re) {
		return (ArrayList)sqlSession.selectList("gradeStuMapper.evalQuestionList", re);
	}

	public void insertEvaluation(SqlSessionTemplate sqlSession, evalList eval) {
		sqlSession.update("gradeStuMapper.insertEvaluation", eval);
		
	}


}
