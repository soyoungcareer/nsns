package com.kh.spring.studentStatus.controller;

import java.text.ParseException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.kh.spring.studentStatus.model.service.StudentStatusService;
import com.kh.spring.studentStatus.model.vo.StudentStatus;

@Controller	
public class StudentStatusController {
	
	@Autowired
	private StudentStatusService studentStatusService;
	
	//학생 상태 조회 페이지
	@RequestMapping("stuStatusPage.stu")
	public String studentStatusPage(Model model) throws ParseException { 
		
		return "studentStatus/studentStatus";
	}
	
	//학생들의 휴학 신청 현황
	@ResponseBody
	@RequestMapping(value="stuOffPro.stu", produces="application/json; charset=utf-8")
	public String studentProList () { 
		
		ArrayList<StudentStatus> list = studentStatusService.studentDoProList();
	
		return new GsonBuilder().create().toJson(list);
	}
}
