package com.kh.spring.major.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.evaluation.vo.Evaluation;
import com.kh.spring.evaluation.vo.QuestionList;
import com.kh.spring.major.model.service.CreateEvService;

//@Controller
public class CreateEvController {
	
	@Autowired
	private CreateEvService createEvService;
	
	@RequestMapping("ceateEv.adm")
	public String createEv(Evaluation ev, QuestionList ql, Model model) {
		
		ArrayList<QuestionList> questionList = createEvService.createEv(ev, ql);
		
		return "major/subjectEvaluationQ";
	}

}
