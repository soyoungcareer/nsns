package com.kh.spring.member.controller;

import java.text.ParseException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StudentController {
	
	@RequestMapping("/stuinfo.st")
	public String studentPage() { 
		
		return "student/studentInfo";
	}

}
