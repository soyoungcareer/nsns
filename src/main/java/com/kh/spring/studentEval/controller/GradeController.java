package com.kh.spring.studentEval.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.kh.spring.common.PageInfo;
import com.kh.spring.common.Pagination;
import com.kh.spring.gradeObject.vo.GradeObject;
import com.kh.spring.major.vo.Subject;
import com.kh.spring.studentEval.service.GradeService;
import com.kh.spring.studentEval.vo.Grade;
import com.kh.spring.studentEval.vo.SearchGrade;
import com.kh.spring.studentEval.vo.SearchSubject;

@Controller
public class GradeController {
	
	@Autowired
	private GradeService gradeService;
	
	// 교수 > 성적 관리 > 성적 등록/조회/수정
	// 전체 데이터 조회
	
	@RequestMapping("profGradeMain.pr")
	public String selectList(Model model) {
		// 임시 데이터
		/*
		String profId = "EC1901";
		String subCode = "2101001";
		int gradeYear = 2021;
		int gradeSemester = 1;
		
		ArrayList<Subject> subList = gradeService.loadSubList(profId, gradeYear, gradeSemester);
		ArrayList<Grade> gradeList = gradeService.selectList(subCode, gradeYear, gradeSemester);
		
		model.addAttribute("subList", subList);
		model.addAttribute("gradeList", gradeList);
		*/
		
		
		return "professor/profGradeMain";
	}
	
	// 조건 검색
	@RequestMapping("filteredSubject.pr")
	public String filteredList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
							   @RequestParam(name="con1", required=false, defaultValue="0") int con1,
							   @RequestParam(name="con2", required=false, defaultValue="0") int con2,
							   @RequestParam(name="keyword", required=false, defaultValue="%") String keyword,
							   Model model) {
		// 임시 데이터
		String profId = "EC1901";
		
		// 조건별 과목 검색
		SearchSubject searchSubject = new SearchSubject();
		searchSubject.setCon1(con1);
		searchSubject.setCon2(con2);
		searchSubject.setKeyword(keyword);
		searchSubject.setProfId(profId);
		
		int listCount = gradeService.selectSubListCount(searchSubject);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Subject> subList = gradeService.selectFilteredSubList(searchSubject, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("subList", subList);
		model.addAttribute("con1", con1);
		model.addAttribute("con2", con2);
		
		return "professor/profGradeMain";
	}
	
	
	@ResponseBody
	@RequestMapping(value="filteredGrade.pr", produces="application/json; charset=utf-8")
	public String filteredGrade(String subCode, String gradeYear, String gradeSemester) {
		// 임시 데이터
		String profId = "EC1901";
		
		SearchGrade searchGrade = new SearchGrade();
		searchGrade.setSubCode(subCode);
		searchGrade.setGradeYear(gradeYear);
		searchGrade.setGradeSemester(gradeSemester);
		searchGrade.setProfId(profId);
		
		System.out.println("=========searchGrade Controller : " + searchGrade);
		System.out.println("=========subCode Controller : " + subCode);
		System.out.println("=========gradeYear Controller : " + gradeYear);
		System.out.println("=========gradeSemester Controller : " + gradeSemester);
				
		ArrayList<Grade> gList = gradeService.selectFilteredGrade(searchGrade);
		
		return new GsonBuilder().create().toJson(gList);

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
