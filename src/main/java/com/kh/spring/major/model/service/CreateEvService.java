package com.kh.spring.major.model.service;

import java.util.ArrayList;

import com.kh.spring.evaluation.vo.Evaluation;
import com.kh.spring.evaluation.vo.QuestionList;

public interface CreateEvService {

	ArrayList<QuestionList> createEv(Evaluation ev, QuestionList ql);

}
