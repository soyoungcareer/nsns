package com.kh.spring.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
public class ProfController {

	@RequestMapping("profMenu.pr")
	public String profMenu() {
		return "professor/menubarProf";
	}
	
	@RequestMapping("profMypage.pr")
	public String profMypage() {
		return "professor/profMypage";
	}
	
	@RequestMapping("profCreateLec.pr")
	public String profCreateLecture() {
		return "professor/profCreateLecture";
	}
}
