package com.kh.spring.major.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.evaluation.vo.Evaluation;
import com.kh.spring.evaluation.vo.QuestionList;
import com.kh.spring.major.model.service.CreateEvService;
import com.kh.spring.major.vo.LectEvaluation;

@Controller
public class CreateEvController {
	
	@Autowired
	private CreateEvService createEvService;
	
	@RequestMapping("LectEvQ.adm")
	public String lectEvQuestion() {
		
		return "major/subjectEvaluationQ";
	}
	
	@RequestMapping("createEvQ.adm")
	public String createEvQuestion(LectEvaluation le) {
		
		System.out.println("==========le : " + le);
		createEvService.createQuestion(le);
		
		return "major/subjectEvaluationQ";
	}

}
