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

@Controller
public class CreateEvController {
	
	@Autowired
	private CreateEvService createEvService;
	
	@RequestMapping("subEvQ.adm")
	public String createEv(Evaluation ev, Model model, HttpServletRequest request) { //QuestionList ql, 
		
		System.out.println("=========ev=========" + ev);
		//ArrayList<QuestionList> questionList = createEvService.createEv(ev);
		createEvService.createEv(ev);
		
		return "major/subjectEvaluationQ";
	}

}
