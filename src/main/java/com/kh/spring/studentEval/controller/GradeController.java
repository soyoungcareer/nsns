package com.kh.spring.studentEval.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.gradeObject.vo.GradeObject;
import com.kh.spring.major.vo.Subject;
import com.kh.spring.studentEval.service.GradeService;
import com.kh.spring.studentEval.vo.Grade;

@Controller
public class GradeController {
	
	@Autowired
	private GradeService gradeService;
	
	// 교수 > 성적 관리 > 성적 등록/조회/수정
	// 전체 데이터 조회
	@RequestMapping("profGradeMain.pr")
	public String selectList(Model model) {
		// 임시 데이터
		String profId = "EC1901";
		
		String subCode = "2101001";
		int gradeYear = 2021;
		int gradeSemester = 1;
		
		ArrayList<Subject> subList = gradeService.loadSubList(profId, gradeYear, gradeSemester);
		ArrayList<Grade> gradeList = gradeService.selectList(subCode, gradeYear, gradeSemester);
		
		model.addAttribute("subList", subList);
		model.addAttribute("gradeList", gradeList);
		
		return "professor/profGradeMain";
	}
	/*
	@RequestMapping()
	public ModelAndView selectGrade(int gno, ModelAndView mv) {
		Grade g = gradeService.selectGrade(gno);
		
		mv.addObject("g", g).setViewName("professor/profGradeMain");
		return mv;
	}
	
	
	// 성적 등록
	@RequestMapping()
	public String insertGrade(Grade g, HttpServletRequest request, Model model,
								@RequestParam) {
		
	}
	*/
	
	// 교수 > 성적 관리 > 이의신청 확인
	@RequestMapping("profGradeObj.pr")
	public String profGradeObjection(Model model) {
		// 임시 데이터
		String profId = "EC1901";
		
		ArrayList<GradeObject> objList = gradeService.loadObjList(profId);
		
		System.out.println("===================objList Controller : " + objList);
		
		model.addAttribute("objList", objList);
		
		return "professor/profGradeObjection";
	}
	
	/*
	// 교수 > 성적 관리 > 이의신청 상세
	@RequestMapping("profGradeObjDetail.pr")
	public String profGradeObjDetail() {
		return "professor/profGradeObjDetail";
	}
	*/
	
}
