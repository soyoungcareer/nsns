package com.kh.spring.evaluation.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.evaluation.service.EvaluationService;
import com.kh.spring.evaluation.vo.Evaluation;
import com.kh.spring.evaluation.vo.EvaluationScore;

@Controller
public class EvaluationController {

	 @Autowired 
	  private EvaluationService evaluationService;
	
	@RequestMapping("evaluation.ev") // 강의 평가 페이지- 질문 뜨는곳
	public String evaluationPage(String subCode, String date, Model model) {
		int stuId = 20193019;//임시 아이디 
		
		ArrayList<Evaluation> evalList=evaluationService.evalQuestionList(subCode, date, stuId);
		model.addAttribute("evalList", evalList);
		return "evaluation/evaluation";
	}
	@RequestMapping("insertEval.ev") // 강의 평가 insert
	public String insertEvaluation(EvaluationScore eval) {
		int stuId = 20193019;//임시 아이디 
		int count = evaluationService.countEval(eval, stuId);
		eval.setCount(count);
		evaluationService.insertEvaluation(eval);
		return "redirect:grade.gra";
	}
}
