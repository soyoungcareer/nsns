package com.kh.spring.major.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.evaluation.vo.Evaluation;
import com.kh.spring.major.vo.LectEvaluation;

@Repository
public class CreateEvDao {

	public int createQuestion(SqlSessionTemplate sqlSession, LectEvaluation le) {
		// TODO Auto-generated method stub
		return sqlSession.insert("majorMapper.createQuestion", le);
	}

	

}
