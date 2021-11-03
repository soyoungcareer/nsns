package com.kh.spring.evaluation.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.evaluation.service.EvaluationService;
import com.kh.spring.evaluation.vo.Evaluation;
import com.kh.spring.evaluation.vo.evalList;
import com.kh.spring.member.vo.Student;

@Controller
public class EvaluationController {

	 @Autowired 
	  private EvaluationService evaluationService;
	
	@RequestMapping("evaluation.ev") // 강의 평가 페이지- 질문 뜨는곳
	public String evaluationPage(String subCode, String date, Model model,HttpSession session) {
		int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
		//int stuId = 20193019;//임시 아이디 
		
		ArrayList<Evaluation> evalList=evaluationService.evalQuestionList(subCode, date, stuId);
		model.addAttribute("evalList", evalList);
		return "evaluation/evaluation";
	}
	@RequestMapping("insertEval.ev" ) // 강의 평가 insert
	public String insertEvaluation( @ModelAttribute(value="evalList") evalList eval,HttpSession session ) {
		int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
		//int stuId = 20193019;//임시 아이디 
		
		evaluationService.insertEvaluation(eval);
		return "redirect:grade.gra";
	}
}
