package com.kh.spring.major.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.evaluation.vo.Evaluation;
import com.kh.spring.evaluation.vo.QuestionList;
import com.kh.spring.major.model.dao.CreateEvDao;
import com.kh.spring.major.vo.LectEvaluation;

@Service
public class CreateEvServiceImpl implements CreateEvService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CreateEvDao createEvDao;

	@Override
	public void createQuestion(LectEvaluation le) {

		int result = createEvDao.createQuestion(sqlSession, le);
		
		if(result < 0) {
			throw new CommException("강의 평가 항목 등록이 실패하였습니다.");
		}
		
	}

	/*
	@Override
	public ArrayList<QuestionList> createEv(Evaluation ev, QuestionList ql) {
		// TODO Auto-generated method stub
		return null;
	}*/

}
