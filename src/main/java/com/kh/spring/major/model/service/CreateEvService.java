package com.kh.spring.major.model.service;

import java.util.ArrayList;

import com.kh.spring.evaluation.vo.Evaluation;
import com.kh.spring.evaluation.vo.QuestionList;
import com.kh.spring.major.vo.LectEvaluation;

public interface CreateEvService {

	void createQuestion(LectEvaluation le);

	//ArrayList<QuestionList> createEv(Evaluation ev, QuestionList ql);

}
