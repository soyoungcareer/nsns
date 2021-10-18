package com.kh.spring.evaluation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EvaluationController {

	@RequestMapping("evaluation.ev") // 강의 평가 페이지
	public String evaluationPage() {

		return "evaluation/evaluation";
	}
}
