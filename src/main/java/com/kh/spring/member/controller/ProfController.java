package com.kh.spring.member.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.common.PageInfo;
import com.kh.spring.common.Pagination;
import com.kh.spring.major.vo.Subject;
import com.kh.spring.member.service.ProfService;


@Controller 
public class ProfController {
	
	@Autowired
	private ProfService profService;
	
	// 교수메뉴바
	@RequestMapping("profMenu.pr")
	public String profMenu() {
		return "professor/menubarProf";
	}
	
	// 교수 마이페이지
	@RequestMapping("profMypage.pr")
	public String profMypage() {
		return "professor/profMypage";
	}
	
	// 강의 관리
	// 강의 개설
	@RequestMapping("profCreateLec.pr")
	public String profCreateLecture() {
		return "professor/profCreateLecture";
	}

	// 강의목록 조회
	@RequestMapping("profLectureDetail.pr")
	public String profLectureDetail(@RequestParam(value="currentPage", required=false, defaultValue="1")
									int currentPage, Model model) {
		
		int listCount = profService.profLectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		String profId = "EC1901";
		
		ArrayList<Subject> subList = profService.selectSubList(profId);
		
		model.addAttribute("pi", pi);
		model.addAttribute("subList", subList);
		
		
		return "professor/profLectureView";
	}
	
	// 강의정보 수정
	@RequestMapping("profEditLec.pr")
	public String profEditLecture() {
		return "professor/profEditLecture";
	}
	
	// 강의 삭제
	@RequestMapping("profDeleteLec.pr")
	public String profDeleteLecture() {
		return "professor/profDeleteLecture";
	}
	
	// 학생 관리
	// 학생목록 조회
	@RequestMapping("profStudentDetail.pr")
	public String profStudentDetail() {
		return "professor/profStudentDetail";
	}
	
	// 상담 관리
	@RequestMapping("profConsult.pr")
	public String profConsult() {
		return "professor/profConsult";
	}
	
	// 상담 관리 상세
	@RequestMapping("profConsultDetail.pr")
	public String profConsultDetail() {
		return "professor/profConsultDetail";
	}
	
	// 강의평가 조회
	@RequestMapping("profEvaluation.pr")
	public String profEvaluation() {
		return "professor/profEvaluation";
	}
	
	// 학적변동 승인
	@RequestMapping("profStudentStatus.pr")
	public String profStudentStatus() {
		return "professor/profStudentStatus";
	}
	
}

