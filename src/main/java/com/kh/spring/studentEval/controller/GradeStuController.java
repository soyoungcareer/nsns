package com.kh.spring.studentEval.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.kh.spring.lectRegister.vo.LecRegPro;
import com.kh.spring.lectRegister.vo.LectRegister;
import com.kh.spring.lectRegister.vo.SearchReg;
import com.kh.spring.member.vo.Student;
import com.kh.spring.studentEval.service.GradeStuService;
import com.kh.spring.studentEval.vo.CountCredit;

@Controller
public class GradeStuController {

	@Autowired
	private GradeStuService gradeStuService;
	
	@RequestMapping("grade.gra") // 성적 조회 페이지
	public String gradePage(Model model, HttpSession session) {
		int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
		//int stuId = 20193019;//임시 아이디 
		ArrayList<LectRegister> yearList =gradeStuService.selectReYearList(stuId);
		ArrayList<LectRegister> seList =gradeStuService.selectReSemeList(stuId);
		ArrayList<LecRegPro> arlist =gradeStuService.selectGradeList(stuId);
		CountCredit cCredit = gradeStuService.cCredit(stuId);
		for(int i=0; i<arlist.size();i++) {
			System.out.println("controller"+arlist.get(i).getCountEval());
		}
		model.addAttribute("arlist",arlist);//수강신청한 과목
		model.addAttribute("yearList",yearList);//수강신청한 년도
		model.addAttribute("seList",seList);//수강신청한 날짜 학기 리스트
		model.addAttribute("cCredit",cCredit);//전체 학점 점수
		return "studentEval/gradeSearchPage";
	}
	@RequestMapping("gradeSearch.eval") // 성적 조회 검색창
	public String gradeSearchPage(
			@RequestParam(value="condition1", required= false, defaultValue = "0") int condition1,
			@RequestParam(value="condition2", required= false, defaultValue = "0") int condition2, Model model
			, HttpSession session) {
		int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
		//int stuId = 20193019;//임시 아이디 
		SearchReg sr = new SearchReg();
		sr.setCondition1(condition1);
		sr.setCondition2(condition2);
		sr.setStuId(stuId);
		ArrayList<LectRegister> yearList =gradeStuService.selectReYearList(stuId);
		ArrayList<LectRegister> seList =gradeStuService.selectReSemeList(stuId);
		ArrayList<LecRegPro> arlist =gradeStuService.selectGradeSearchList(sr);
		CountCredit cCredit = gradeStuService.cSearchCredit(sr);
		model.addAttribute("arlist",arlist);//수강신청한 과목 중 해당 년도, 학기
		model.addAttribute("yearList",yearList);//수강신청한 년도
		model.addAttribute("seList",seList);//수강신청한 날짜 학기 리스트
		model.addAttribute("cCredit",cCredit);//전체 학점 점수
		model.addAttribute("condition1",condition1);
		model.addAttribute("condition2",condition2);
		return "studentEval/gradeSearchPage";
	}

	@RequestMapping("credit.reg") // 학점 조회 페이지
	public String creditPage(Model model, HttpSession session) {
		int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
		//int stuId = 20193019;//임시 아이디 
		ArrayList<LectRegister> yearList =gradeStuService.selectReYearList(stuId);
		ArrayList<LectRegister> seList =gradeStuService.selectReSemeList(stuId);
		ArrayList<LecRegPro> arlist =gradeStuService.selectGradeList(stuId);
		CountCredit cCredit = gradeStuService.cCredit(stuId);
		model.addAttribute("arlist",arlist);//수강신청한 과목
		model.addAttribute("yearList",yearList);//수강신청한 년도
		model.addAttribute("seList",seList);//수강신청한 날짜 학기 리스트
		model.addAttribute("cCredit",cCredit);//전체 학점 점수
		return "studentEval/creditSearchPage";
	}
	@RequestMapping("creditSearch.eval") // 학점 조회 페이지 검색창
	public String creditSearchPage(
			@RequestParam(value="condition1", required= false, defaultValue = "0") int condition1,
			@RequestParam(value="condition2", required= false, defaultValue = "0") int condition2, Model model
			, HttpSession session) {
		int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
		//int stuId = 20193019;//임시 아이디 
		SearchReg sr = new SearchReg();
		sr.setCondition1(condition1);
		sr.setCondition2(condition2);
		sr.setStuId(stuId);
		ArrayList<LectRegister> yearList =gradeStuService.selectReYearList(stuId);
		ArrayList<LectRegister> seList =gradeStuService.selectReSemeList(stuId);
		ArrayList<LecRegPro> arlist =gradeStuService.selectGradeSearchList(sr);
		CountCredit cCredit = gradeStuService.cSearchCredit(sr);
		model.addAttribute("arlist",arlist);//수강신청한 과목 중 해당 년도, 학기
		model.addAttribute("yearList",yearList);//수강신청한 년도
		model.addAttribute("seList",seList);//수강신청한 날짜 학기 리스트
		model.addAttribute("cCredit",cCredit);//전체 학점 점수
		model.addAttribute("condition1",condition1);
		model.addAttribute("condition2",condition2);
		return "studentEval/creditSearchPage";
	}
	@ResponseBody 
	@RequestMapping(value="gradeDe.ev", produces="applicatoin/json; charset=utf-8") // 성적 상세보기
	public String gradeDetailPage(String subCode, String date, HttpSession session) {
		int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
		//int stuId = 20193019;//임시 아이디 
		LecRegPro grDetail =gradeStuService.gradeDetailList(stuId, subCode, date);
		return new GsonBuilder().create().toJson(grDetail);
	}
}
