package com.kh.spring.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.GsonBuilder;
import com.kh.spring.common.PageInfo;
import com.kh.spring.common.Pagination;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.consult.model.vo.Consult;
import com.kh.spring.evaluation.vo.Evaluation;
import com.kh.spring.major.vo.RequestedSubject;
import com.kh.spring.major.vo.Subject;
import com.kh.spring.member.service.ProfService;
import com.kh.spring.member.vo.Professor;
import com.kh.spring.member.vo.SearchStudent;
import com.kh.spring.member.vo.Student;
import com.kh.spring.studentEval.service.GradeService;
import com.kh.spring.studentEval.vo.SearchSubject;
import com.kh.spring.studentStatus.model.vo.StudentDo;
import com.kh.spring.studentStatus.model.vo.StudentOff;


@Controller 
public class ProfController {
	
	@Autowired
	private ProfService profService;
	
	@Autowired
	private GradeService gradeService;
	
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
	@RequestMapping(value="profEditMypage.pr", method=RequestMethod.POST)
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
		
		System.out.println("============prof Controller : " + prof);

		return "redirect:profMypage.pr";
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
	public String profCreateLecture(HttpServletRequest request, RequestedSubject reqSubject,
									int subDivs, int subType, String subTitle,
									int subCredit, String subDay, String subStartTime, String subEndTime, 
									@RequestParam(name="createLectFile", required=false) MultipartFile file) {
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
		
		///////////////////////////////////////
		// 파일 첨부 기능 넣은 이후로 오류남
		///////////////////////////////////////
		
		// 파일명
		if (!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file, request);

			if (changeName != null) {
				reqSubject.setAttOrigin(file.getOriginalFilename());
				reqSubject.setAttChange(changeName);
			}
		}
		
		// 강의 개설 데이터 뷰에서 받아오기
		reqSubject.setDeptCode(deptCode);
		reqSubject.setSubDivs(subDivs);
		reqSubject.setSubType(subType);
		reqSubject.setSubTitle(subTitle);
		reqSubject.setProfId(profId);
		reqSubject.setSubCredit(subCredit);
		reqSubject.setSubTime(subTime);
		
		System.out.println("======================= reqSubject Controller : " + reqSubject + "====================");
		
		profService.profCreateLecture(reqSubject);
		
		return "professor/profCreateLecture";
	}
	
	// 첨부파일
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\upload_files\\";
		
		System.out.println("savePath" + savePath);
		
		String originName = file.getOriginalFilename();
		String saveTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = saveTime + ext;
		
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) { //change project compliance and jre to 1.7
			e.printStackTrace();
			throw new CommException("파일 첨부 오류가 발생하였습니다.");
		} catch (IOException e) {
			e.printStackTrace();
			throw new CommException("파일 첨부 오류가 발생하였습니다.");
		}
		
		return changeName;
	}

	// 강의목록 조회
	@RequestMapping("profLectureDetail.pr")
	public String profLectureDetail(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
									Model model) {
		
		// 임시데이터
		String profId = "EC1901";
		
		int listCount = profService.subListCount(profId);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Subject> subList = profService.selectSubList(profId, pi);
		
		System.out.println("================= subList Controller : " + subList);
		
		model.addAttribute("pi", pi);
		model.addAttribute("subList", subList);
		
		return "professor/profLectureView";
	}
	
	// 강의정보 수정
	// 강의 수정시 뷰에 데이터 로드
	@RequestMapping("lectEditInfoLoad.pr")
	public String lectEditInfoLoad(HttpServletRequest httpServletRequest, Model model) {
		// 임시데이터
		String profId = "EC1901";
		String subCode = "2101001";
		
		Map map = new HashMap();
		map.put("profId", profId);
		map.put("subCode", subCode);
		
		Professor prof = profService.profInfoLoad(profId);
		Subject sub = profService.subInfoLoad(map);
		
		model.addAttribute("prof", prof);
		model.addAttribute("sub", sub);
		
		return "professor/profEditLecture";
	}
	
	// 강의 수정
	@RequestMapping("profEditLec.pr")
	public String profEditLecture() {
		return "professor/profEditLecture";
	}
	
	// 강의 삭제
	// 강의 수정시 뷰에 데이터 로드
	@RequestMapping("lectDelInfoLoad.pr")
	public String lectDelInfoLoad(HttpServletRequest httpServletRequest, Model model) {
		// 임시데이터
		String profId = "EC1901";
		String subCode = "2101001";
		
		Map map = new HashMap();
		map.put("profId", profId);
		map.put("subCode", subCode);
		
		Professor prof = profService.profInfoLoad(profId);
		Subject sub = profService.subInfoLoad(map);

		model.addAttribute("prof", prof);
		model.addAttribute("sub", sub);
		
		return "professor/profDeleteLecture";
	}
	
	// 강의 삭제
	@RequestMapping("profDeleteLec.pr")
	public String profDeleteLecture() {
		return "professor/profDeleteLecture";
	}
	
	// 강의 개설/수정/삭제 신청내역 조회
	@RequestMapping("profLectureReq.pr")
	public String profLectureReq(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
								 Model model) {
		// 임시 데이터
		String profId = "EC1901";
		
		int listCount = profService.reqSubListCount(profId);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<RequestedSubject> reqSub = profService.selectReqSubList(profId, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("reqSub", reqSub);
		
		return "professor/profLectureReq";
	}
	
	// ============= 학생 관리 =============
	// 학생목록 조회 nothing
	@RequestMapping("profStudentDetail.pr")
	public String profStudentDetail() {
		return "professor/profStudentDetail";
	}
	
	// 학생목록 조회 > 과목 조회
	@RequestMapping("filteredSub.pr")
	public String filteredSub(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
								    @RequestParam(name="con1", required=false, defaultValue="0") int con1,
								    @RequestParam(name="con2", required=false, defaultValue="0") int con2,
								    @RequestParam(name="keyword", required=false, defaultValue="%") String keyword,
								    Model model) {
		// 임시 데이터
		String profId = "EC1901";
		// 조건별 과목 검색
		SearchSubject searchSubject = new SearchSubject();
		searchSubject.setCon1(con1);
		searchSubject.setCon2(con2);
		searchSubject.setKeyword(keyword);
		searchSubject.setProfId(profId);
		
		int listCount = gradeService.selectSubListCount(searchSubject);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Subject> subList = gradeService.selectFilteredSubList(searchSubject, pi);
		// ArrayList<Student> stuList = profService.profStudentDetail(subCode); // 학년도, 학기 반영해야함
		
		model.addAttribute("pi", pi);
		model.addAttribute("con1", con1);
		model.addAttribute("con2", con2);
		model.addAttribute("subList", subList);
		
		return "professor/profStudentDetail";
	}
	
	// 과목별 학생목록 조회
	@ResponseBody
	@RequestMapping(value="filteredStudent.pr", produces="application/json; charset=utf-8")
	public String filteredStudent(String subCode, String year, String semester) {
		// 임시 데이터
		String profId = "EC1901";
		
		SearchStudent searchStudent = new SearchStudent();
		searchStudent.setSubCode(subCode);
		searchStudent.setYear(year);
		searchStudent.setSemester(semester);
		searchStudent.setProfId(profId);
		
		ArrayList<Student> stuList = profService.selectFilteredStu(searchStudent);
		
		return new GsonBuilder().create().toJson(stuList);

	}
	
	// 상담 관리
	@RequestMapping("profConsult.pr")
	public String profConsult(Model model) {
		// 임시 데이터
		String profId = "HI1301";
		
		ArrayList<Consult> conList = profService.loadConsultList(profId);
		
		System.out.println("============ conList Controller : " + conList);
		
		model.addAttribute("conList", conList);
		
		return "professor/profConsult";
	}
	
	// 상담 관리 상세
	@RequestMapping("profConsultDetail.pr")
	public String profConsultDetail() {
		
		
		return "professor/profConsultDetail";
	}
	
	// 강의평가 조회
	@RequestMapping("profEvaluation.pr")
	public String profEvaluation(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
								 Model model, String subYear, String subSmst) {
		// 임시 데이터
		String profId = "EC1901";
		String subCode = "2101001";
		
//		int intYear = Integer.parseInt(subYear);
//		int intSemester = Integer.parseInt(subSmst);
		
		int intYear = 2021;
		int intSemester = 1;
		
		int listCount = profService.subListCount(profId);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		Subject sub = new Subject();
		sub.setSubYear(intYear);
		sub.setSubSmst(intSemester);
		sub.setSubCode(subCode);
		sub.setProfId(profId);
		
		//========== 교수별 강의목록 먼저 조회 후, 강의별 강의평가 조회하기.
		ArrayList<Subject> subList = profService.selectSubList(profId, pi);
		ArrayList<Evaluation> evalList = profService.loadEvalList(sub);
		
		model.addAttribute("pi", pi);
		model.addAttribute("subList", subList);
		model.addAttribute("evalList", evalList);
		
		return "professor/profEvaluation";
	}
	
	// 학적변동 - 휴학 승인
	@RequestMapping("profStudentOff.pr")
	public String profStudentOff(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
								 Model model) {
		// 임시 데이터
		String profId = "EC1901";
		
		int listCount = profService.offListCount(profId);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<StudentOff> offList = profService.loadOffList(profId, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("offList", offList);
		
		return "professor/profStudentStatus";
	}
	
	
	// 학적변동 - 자퇴 승인
	@RequestMapping("profStudentDo.pr")
	public String profStudentDo(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
								Model model) {
		// 임시 데이터
		String profId = "EC1901";
		
		int listCount = profService.doListCount(profId);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<StudentDo> doList = profService.loadDoList(profId, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("doList", doList);
		
		return "professor/profStudentDo";
	}
	

}

