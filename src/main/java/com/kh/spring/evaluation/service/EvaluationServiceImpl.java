package com.kh.spring.evaluation.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.evaluation.dao.EvaluationDao;
import com.kh.spring.evaluation.vo.Evaluation;
import com.kh.spring.evaluation.vo.EvaluationScore;
import com.kh.spring.evaluation.vo.ListFor;
import com.kh.spring.lectRegister.vo.LectRegister;

@Service
public class EvaluationServiceImpl implements EvaluationService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private EvaluationDao evaluationDao;

	@Override
	public ArrayList<Evaluation> evalQuestionList(String subCode, String date, int stuId) {
		LectRegister re = new LectRegister();
		re.setStuId(stuId);
		re.setSubCode(subCode);
		
		String day[] = date.split(" ");
		int year = Integer.parseInt(day[0]);
		int sem =Integer.parseInt(day[2]);
		
		re.setYear(year);
		re.setSemester(sem);
		return evaluationDao.evalQuestionList(sqlSession, re);
	}

	@Override
	public int countEval(EvaluationScore eval, int stuId) {
		eval.setCount(stuId);
		return evaluationDao.countEval(sqlSession, eval);
	}
	@Override
	public void insertEvaluation(EvaluationScore eval) {
		ArrayList<ListFor> list = new ArrayList<>();
		Map<String, Object> map = new HashMap<String, Object>();

		/*
		 * for(int i=3;i<eval.getCount()+3;i++) { list.add(eval.getLectNum(),
		 * eval.getCount(), eval.getStuId()); }
		 */
			map.put("list", list);
		evaluationDao.insertEvaluation(sqlSession, map);
	}

}
