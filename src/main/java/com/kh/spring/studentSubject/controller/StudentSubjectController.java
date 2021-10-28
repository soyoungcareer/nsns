package com.kh.spring.studentSubject.controller;


import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.kh.spring.common.PageInfo;
import com.kh.spring.common.Pagination;
import com.kh.spring.studentSubject.model.service.StudentSubjectService;
import com.kh.spring.studentSubject.model.vo.SearchCondition;
import com.kh.spring.studentSubject.model.vo.StudentSubject;

@Controller
public class StudentSubjectController {

	@Autowired
	private StudentSubjectService studentSubjectService;
	
	//수강과목 전체 조회하기 (페이징 처리)
	@RequestMapping("subject.li")
	public String selectStuSubjectList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, Model model) { 
			
		String stuId = "20193019";
			
		ArrayList<String> yearList = studentSubjectService.selectYear(stuId);
		
		ArrayList<String> semesterList = studentSubjectService.selectSemester(stuId);
		
		int listCount = studentSubjectService.selectListCount(stuId);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<StudentSubject> list = studentSubjectService.selectStuSubjectList(stuId, pi);
		
		model.addAttribute("yearList", yearList);
		
		model.addAttribute("semesterList", semesterList);
		
		model.addAttribute("pi", pi);
		
		model.addAttribute("list", list);
	
			
		return "student/studentSubject";
	}
	
	
	 @ResponseBody
	 @RequestMapping(value="searchList.su", produces="application/json; charset=utf-8;")
	 public String searchSubject(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, String sYear, String sMonth, String search ) {
		 
		 	String stuId = "20193019";
			
			if(search.equals("")) {
				search = "%";
			}
			
			SearchCondition sc = new SearchCondition(stuId, sYear, sMonth, search);
			
			System.out.println("sc : " + sc);
			
			HashMap<String, Object> result = new HashMap<String, Object>();
			
			int listCount = studentSubjectService.selectListCount(sc);
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
			
			ArrayList<StudentSubject> list = studentSubjectService.searchSubject(sc, pi);
			
			result.put("list", list);
			
			result.put("pi", pi);
			
			System.out.println("list : " + list);

			return new GsonBuilder().create().toJson(result);
	            
	}

	 
}
