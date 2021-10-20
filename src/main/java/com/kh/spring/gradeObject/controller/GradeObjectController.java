package com.kh.spring.gradeObject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GradeObjectController {

	@RequestMapping("gradeObject.obj") // 이의 신청 리스트 페이지
	public String gradeObjectPage() {

		return "gradeObject/gradeObjectListPage";
	}
	@RequestMapping("gradeObjNewPop.obj") // 이의 신청 팝업 페이지
	public String gradeObjectPopPage() {

		return "studentEval/gradeSearchPage";
	}
}
