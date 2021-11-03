package com.kh.spring.major.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.evaluation.vo.Evaluation;
import com.kh.spring.evaluation.vo.QuestionList;
import com.kh.spring.major.model.dao.CreateEvDao;

//@Service
public class CreateEvServiceImpl implements CreateEvService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CreateEvDao createEvDao;

	@Override
	public ArrayList<QuestionList> createEv(Evaluation ev, QuestionList ql) {
		// TODO Auto-generated method stub
		return null;
	}

}
