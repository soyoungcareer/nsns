package com.kh.spring.studentSubject.controller;


import java.util.ArrayList;
import java.util.HashMap;

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
import com.kh.spring.member.vo.Student;
import com.kh.spring.studentSubject.model.service.StudentSubjectService;
import com.kh.spring.studentSubject.model.vo.SearchCondition;
import com.kh.spring.studentSubject.model.vo.StuGradeAndCredit;
import com.kh.spring.studentSubject.model.vo.StudentSubject;

@Controller
public class StudentSubjectController {

	@Autowired
	private StudentSubjectService studentSubjectService;
	
	//수강과목 전체 조회하기 (페이징 처리)
	@RequestMapping("subject.li")
	public String selectStuSubjectList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, Model model, HttpSession session) { 
			
		int stuId =  ((Student)session.getAttribute("loginStu")).getStuId();  //로그인한 세션의 학생 학번 가져오기
			
		ArrayList<String> yearList = studentSubjectService.selectYear(stuId);
		
		ArrayList<String> semesterList = studentSubjectService.selectSemester(stuId);
		
		int listCount = studentSubjectService.selectListCount(stuId);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 7);
		
		ArrayList<StudentSubject> list = studentSubjectService.selectStuSubjectList(stuId, pi);
		
		ArrayList<StuGradeAndCredit> gradeList = studentSubjectService.selectGradeList(stuId);
		
		model.addAttribute("yearList", yearList);
		
		model.addAttribute("semesterList", semesterList);
		
		model.addAttribute("pi", pi);
		
		model.addAttribute("list", list);
		
		model.addAttribute("gradeList", gradeList);
			
		return "student/studentSubject";
	}
	
	
	 @ResponseBody
	 @RequestMapping(value="searchList.su", produces="application/json; charset=utf-8;")
	 public String searchSubject(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, String sYear, String sMonth, String search, HttpSession session ) {
		 
		 	int stuId =  ((Student)session.getAttribute("loginStu")).getStuId();  //로그인한 세션의 학생 학번 가져오기
			
			if(search.equals("")) {
				search = "%";
			}
			
			SearchCondition sc = new SearchCondition(stuId, sYear, sMonth, search);
			
			System.out.println("sc : " + sc);
			
			HashMap<String, Object> result = new HashMap<String, Object>();
			
			int listCount = studentSubjectService.selectListCount(sc);
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 7);
			
			ArrayList<StudentSubject> list = studentSubjectService.searchSubject(sc, pi);
			
			result.put("list", list);
			
			result.put("pi", pi);
			
			return new GsonBuilder().create().toJson(result);
	            
	}

	 
}
