package com.kh.spring.member.controller;

import java.text.ParseException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StudentController {
	
	@RequestMapping("stuinfo.st")
	public String studentPage() { //학생 정보 페이지 
		
		return "student/studentInfo";
	}
	
	@RequestMapping("subject.li")
	public String studentSubject() { //수강과목 
		
		return "student/studentSubject";
	}

}
