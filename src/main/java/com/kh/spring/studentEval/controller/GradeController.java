package com.kh.spring.studentEval.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.common.Pagination;
import com.kh.spring.notice.model.vo.PageInfo;
import com.kh.spring.studentEval.service.GradeService;
import com.kh.spring.studentEval.vo.Grade;

@Controller
public class GradeController {

	@Autowired
	private GradeService gradeService;
	
	/*
	// 교수 > 성적 관리 > 성적 등록/조회/수정
	@RequestMapping("profGradeMain.pr")
	public String profGradeMain() {
		return "professor/profGradeMain";
	}
	*/
	
	// 성적 조회
	@RequestMapping("profGradeMain.pr")
	public String selectList(@RequestParam(value="currentPage", required=false, defaultValue="1") 
								int currentPage, Model model) {
		int listCount = gradeService.selectListCount();
		
		String subCode = "2101001";
		int gradeYear = 2021;
		int gradeSemester = 1;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Grade> list = gradeService.selectList(pi, subCode, gradeYear, gradeSemester);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
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
	public String profGradeObjection() {
		return "professor/profGradeObjection";
	}
	
	// 교수 > 성적 관리 > 이의신청 상세
	@RequestMapping("profGradeObjDetail.pr")
	public String profGradeObjDetail() {
		return "professor/profGradeObjDetail";
	}
	
}
