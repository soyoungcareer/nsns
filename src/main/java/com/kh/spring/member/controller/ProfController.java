package com.kh.spring.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.major.vo.RequestedSubject;
import com.kh.spring.major.vo.Subject;
import com.kh.spring.member.service.ProfService;
import com.kh.spring.member.vo.Professor;
import com.kh.spring.member.vo.Student;


@Controller 
public class ProfController {
	
	@Autowired
	private ProfService profService;
	
	// ============= 교수메뉴바 =============
	@RequestMapping("profMenu.pr")
	public String profMenu() {
		return "professor/menubarProf";
	}
	
	// ============= 교수 마이페이지 =============
	// 마이페이지 조회
	@RequestMapping("profMypage.pr")
	public String profMypage(Model model) {
		// 임시 데이터
		String profId = "EC1901";
		Professor prof = profService.selectMypage(profId);
		
		model.addAttribute("prof", prof);
		
		return "professor/profMypage";
	}
	
	// 교수 개인정보 수정
	@RequestMapping("profEditMypage.pr")
	public String profEditMypage(String profPwd, String profEmail, String profPhone, String profAddress,
								Model model, HttpSession session) {
		
		// 임시 데이터
		String profId = "EC1901";
		
//		Professor loginProfessor = (Professor)session.getAttribute("loginProfessor");
		Professor loginProfessor = profService.loginProfessor(profId);
		
		
		Professor prof = new Professor();
		prof.setProfId(loginProfessor.getProfId());
		prof.setProfPwd(profPwd);
		prof.setProfEmail(profEmail);
		prof.setProfPhone(profPhone);
		prof.setProfAddress(profAddress);
		
		profService.editMypage(prof);
		
		/////////////////////////////////////////
		// 정보 수정 안됨. 화면이 기존 데이터로 다시 로딩됨.
		/////////////////////////////////////////
		
		return "redirect:/profMypage";
	}
	
	// ============= 강의 관리 ==============
	// 강의 개설시 뷰에 읽기전용 데이터 로드
	@RequestMapping("profLectInfoLoad.pr")
	public String profLectInfoLoad(HttpServletRequest httpServletRequest, Model model) {
		String profId = "EC1901";
		Professor prof = profService.profInfoLoad(profId);
		
		model.addAttribute("prof", prof);
		
		return "professor/profCreateLecture";
	}
	
	// 강의 개설 신청
	@RequestMapping("profCreateLecture.pr")
	public String profCreateLecture(int subDivs, int subType, String subTitle,
									int subCredit, String subDay, String subStartTime, String subEndTime, 
									@RequestParam(name="uploadFile", required=false) MultipartFile file) {
		// 임시 데이터
		String profId = "EC1901";
		int deptCode = 1;
		
		// 강의시간 합치기 (ex. 월123)
		if (subEndTime.equals("1")) {
			subEndTime = "";
		} else {
			int intStart = Integer.parseInt(subStartTime);
			int intEnd = Integer.parseInt(subEndTime);
			subEndTime = "";
			
			for (int i = intStart + 1; i <= intEnd; i++) {
				subEndTime += i;
			}
		}
		
		String subTime = subDay + subStartTime + subEndTime;
		
		// 강의 개설 데이터 뷰에서 받아오기
		RequestedSubject reqSubject = new RequestedSubject();
		reqSubject.setDeptCode(deptCode);
		reqSubject.setSubDivs(subDivs);
		reqSubject.setSubType(subType);
		reqSubject.setSubTitle(subTitle);
		reqSubject.setProfId(profId);
		reqSubject.setSubCredit(subCredit);
		reqSubject.setSubTime(subTime);
		
		System.out.println("======================= reqSubject Controller : " + reqSubject + "====================");
		
		profService.profCreateLecture(reqSubject);
		
		////////////////////////////////////////////////////
		// 1022 - 강의개설신청 테이블(REQ_SUBJECT) 추가. 
		// 강의개설 신청시 NullPointerException 발생.
		////////////////////////////////////////////////////
		
		
		////////////////////////////////////////////////////
		// 강의계획서 첨부파일 처리하기
		////////////////////////////////////////////////////
		
		return "professor/profCreateLecture";
	}

	// 강의목록 조회
	@RequestMapping("profLectureDetail.pr")
	public String profLectureDetail(Model model) {
		
		String profId = "EC1901";
		ArrayList<Subject> subList = profService.selectSubList(profId);
		
		System.out.println("================= subList Controller : " + subList);
		
		model.addAttribute("subList", subList);
		
		////////////////////////////////////////////////////
		// subList 데이터 정상적으로 넘어감. 반복문 불러오기에서 실패.
		// NumberFormatException: For input string: "subCode"
		////////////////////////////////////////////////////
		
		
		return "professor/profLectureView";
	}
	
	// 강의정보 수정
	// 강의 수정시 뷰에 데이터 로드
	@RequestMapping("lectEditInfoLoad.pr")
	public String lectEditInfoLoad(HttpServletRequest httpServletRequest, Model model) {
		String profId = "EC1901";
		String subCode = "2101001";
		
		Professor prof = profService.profInfoLoad(profId);
		Subject sub = profService.subInfoLoad(subCode);
		
		System.out.println("=================== prof controller : " + prof);
		System.out.println("=================== sub controller : " + sub);
		/////////////////////////////////////
		// sub 값이 안넘어옴 - null
		/////////////////////////////////////
		
		model.addAttribute("prof", prof);
		model.addAttribute("sub", sub);
		
		return "professor/profEditLecture";
	}
	
	
	@RequestMapping("profEditLec.pr")
	public String profEditLecture() {
		return "professor/profEditLecture";
	}
	
	// 강의 삭제
	@RequestMapping("profDeleteLec.pr")
	public String profDeleteLecture() {
		return "professor/profDeleteLecture";
	}
	
	// ============= 학생 관리 =============
	// 학생목록 조회
	@RequestMapping("profStudentDetail.pr")
	public String profStudentDetail(Model model) {
		// 임시 데이터
		String profId = "EC1901";
		String subCode = "2101001";
		int year = 1;
		int semester = 1;
		
		ArrayList<Subject> subList = profService.selectSubList(profId);
		ArrayList<Student> stuList = profService.profStudentDetail(subCode);
		
		model.addAttribute(stuList);
		
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

