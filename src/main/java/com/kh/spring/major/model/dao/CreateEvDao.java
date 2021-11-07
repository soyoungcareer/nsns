package com.kh.spring.major.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.evaluation.vo.Evaluation;

@Repository
public class CreateEvDao {

	public int createEv(SqlSessionTemplate sqlSession, Evaluation ev) {
		// TODO Auto-generated method stub
		return sqlSession.insert("majorMapper.createEv", ev);
	}

}
