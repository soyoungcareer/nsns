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

	@RequestMapping("profLectureDetail.pr")
	public String profLectureDetail() {
		return "professor/profLectureView";
	}
	
	@RequestMapping("profEditLec.pr")
	public String profEditLecture() {
		return "professor/profEditLecture";
	}
	
	@RequestMapping("profDeleteLec.pr")
	public String profDeleteLecture() {
		return "professor/profDeleteLecture";
	}
	
	@RequestMapping("profConsult.pr")
	public String profConsult() {
		return "professor/profConsult";
	}
	
	@RequestMapping("profStudentStatus.pr")
	public String profStudentStatus() {
		return "professor/profStudentStatus";
	}
	
	@RequestMapping("profStudentDetail.pr")
	public String profStudentDetail() {
		return "professor/profStudentDetail";
	}
}
