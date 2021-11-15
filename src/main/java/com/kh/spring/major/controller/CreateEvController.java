package com.kh.spring.major.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.major.model.service.CreateEvService;
import com.kh.spring.major.vo.LectEvaluation;

@Controller
public class CreateEvController {
	
	@Autowired
	private CreateEvService createEvService;
	
	@RequestMapping("LectEvQ.adm") //강의 평가 항목 생성 페이지 이동
	public String lectEvQuestion(Model model) {
		
		ArrayList<LectEvaluation> evQList = createEvService.selectEvQList();
		model.addAttribute("evQList", evQList);
		
		return "major/subjectEvaluationQ";
	}
	
	@RequestMapping("createEvQ.adm") //강의 평가 항목 생성
	public String createEvQuestion(LectEvaluation le) {

		createEvService.createQuestion(le);
		
		return "major/subjectEvaluationQ";
	}
	
}
