package com.kh.spring.studentEval.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.kh.spring.common.PageInfo;
import com.kh.spring.common.Pagination;
import com.kh.spring.gradeObject.vo.GradeObject;
import com.kh.spring.major.vo.Subject;
import com.kh.spring.member.vo.Professor;
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
	public String selectList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
							 HttpSession session, Model model) {
		Professor prof = (Professor)session.getAttribute("loginPrf");
		String profId = prof.getProfId();
		
		int listCount = gradeService.mainSubCount(profId);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Subject> subList = gradeService.selectMainSub(profId, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("subList", subList);
		
		return "professor/profGradeMain";
	}
	
	// 조건 검색
	@RequestMapping("filteredSubject.pr")
	public String filteredList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
							   @RequestParam(name="con1", required=false, defaultValue="0") int con1,
							   @RequestParam(name="con2", required=false, defaultValue="0") int con2,
							   @RequestParam(name="keyword", required=false, defaultValue="%") String keyword,
							   Model model, HttpSession session) {

		Professor prof = (Professor)session.getAttribute("loginPrf");
		String profId = prof.getProfId();
		
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
	
	// 성적 조회
	@ResponseBody
	@RequestMapping(value="filteredGrade.pr", produces="application/json; charset=utf-8")
	public String filteredGrade(String subCode, String gradeYear, String gradeSemester, HttpSession session, Model model) {
		
		Professor prof = (Professor)session.getAttribute("loginPrf");
		String profId = prof.getProfId();
		
		SearchGrade searchGrade = new SearchGrade();
		searchGrade.setSubCode(subCode);
		searchGrade.setGradeYear(gradeYear);
		searchGrade.setGradeSemester(gradeSemester);
		searchGrade.setProfId(profId);
		
		ArrayList<Grade> gList = gradeService.selectFilteredGrade(searchGrade);
		
		return new GsonBuilder().create().toJson(gList);

	}
	
	// 성적 등록
	@ResponseBody
	@RequestMapping(value="updateGrade.pr", produces="application/json; charset=utf-8")
	public String updateGrade(int attend, int assign, int mid, int fin, int stuId,
			String subCode, int gradeYear, int gradeSemester) {
		
		int total = attend+assign+mid+fin;
		String gradeResult = String.valueOf(total);
		Double gradeCredit = 0.0;
		
		if (total==100) {
			gradeCredit = 4.5;
		} else if (total>=98 && total<100) {
			gradeCredit = 4.3;
		} else if (total>=95 && total<98) {
			gradeCredit = 4.0;
		} else if (total>=93 && total<95) {
			gradeCredit = 3.8;
		} else if (total>=90 && total<93) {
			gradeCredit = 3.5;
		} else if (total>=88 && total<90) {
			gradeCredit = 3.3;
		} else if (total>=85 && total<88) {
			gradeCredit = 3.0;
		} else if (total>=83 && total<85) {
			gradeCredit = 2.8;
		} else if (total>=80 && total<83) {
			gradeCredit = 2.5;
		} else if (total>=78 && total<80) {
			gradeCredit = 2.3;
		} else if (total>=75 && total<78) {
			gradeCredit = 2.0;
		} else if (total>=73 && total<75) {
			gradeCredit = 1.8;
		} else if (total>=70 && total<73) {
			gradeCredit = 1.5;
		} else {
			gradeCredit = 0.0;
		}
		
		
		Grade grade = new Grade();
		grade.setAttendance(attend);
		grade.setAssignment(assign);
		grade.setMidExam(mid);
		grade.setFinExam(fin);
		grade.setStudentId(stuId);
		grade.setSubCode(subCode);
		grade.setGradeYear(gradeYear);
		grade.setGradeSemester(gradeSemester);
		grade.setGradeResult(gradeResult);
		grade.setGradeCredit(gradeCredit);
		
		int result = gradeService.updateGrade(grade);
		
		return new GsonBuilder().create().toJson(result);
	}
	
	
	// 교수 > 성적 관리 > 이의신청 확인
	@RequestMapping("profGradeObj.pr")
	public String profGradeObjection(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
									 Model model, HttpSession session) {
		
		Professor prof = (Professor)session.getAttribute("loginPrf");
		String profId = prof.getProfId();
		
		int listCount = gradeService.objListCount(profId);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<GradeObject> objList = gradeService.loadObjList(profId, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("objList", objList);
		
		return "professor/profGradeObjection";
	}
	
	
	// 교수 > 성적 관리 > 이의신청 상세
	@ResponseBody
	@RequestMapping(value="profGradeObjDetail.pr", produces="applicatoin/json; charset=utf-8;")
	public String profGradeObjDetail(String objNo) {
		
		GradeObject detailObj = gradeService.detailObjection(objNo);
		
		return new GsonBuilder().create().toJson(detailObj);
	}
	
	// 이의신청 승인
	@ResponseBody
	@RequestMapping(value="profObjCheck.pr", produces="applicatoin/json; charset=utf-8;")
	public String profObjCheck(String status, String reason,
			@RequestParam(value="objNo", defaultValue = "0") int objNo) {
	
		GradeObject gradeObject = new GradeObject();
		gradeObject.setObjNo(objNo);
		gradeObject.setStatus(status);
		gradeObject.setReason(reason);
		
		int checkObj = gradeService.profObjCheck(gradeObject);
		
		return new GsonBuilder().create().toJson(checkObj);
	}
	
	
}
