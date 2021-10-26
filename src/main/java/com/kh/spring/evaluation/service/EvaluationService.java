package com.kh.spring.evaluation.service;

import java.util.ArrayList;

import com.kh.spring.evaluation.vo.Evaluation;
import com.kh.spring.evaluation.vo.EvaluationScore;

public interface EvaluationService {

	ArrayList<Evaluation> evalQuestionList(String subCode, String date, int stuId);

	void insertEvaluation(EvaluationScore eval);

	int countEval(EvaluationScore eval, int stuId);

}
