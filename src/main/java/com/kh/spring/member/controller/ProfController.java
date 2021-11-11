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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
import com.kh.spring.consult.model.vo.ConsultStatus;
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
import com.kh.spring.studentStatus.model.vo.StudentStatus;


@Controller 
public class ProfController { 
	
	@Autowired
	private ProfService profService;
	
	@Autowired
	private GradeService gradeService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	// ============= 교수메뉴바 =============
	@RequestMapping("profMenu.pr")
	public String profMenu() {
		return "professor/menubarProf";
	}
	
	// ============= 교수 마이페이지 =============
	// 마이페이지 조회
	@RequestMapping("profMypage.pr")
	public String profMypage(Model model, HttpSession session) {

		Professor professor = (Professor)session.getAttribute("loginPrf");
		String profId = professor.getProfId();
		
		Professor prof = profService.selectMypage(profId);
		
		model.addAttribute("prof", prof);
		
		return "professor/profMypage";
	}
	
	// 교수 개인정보 수정
	@RequestMapping(value="profEditMypage.pr", method=RequestMethod.POST)
	public String profEditMypage(String profPwd, String profEmail, String profPhone, String profAddress,
								String postNum, String address1, String address2,
								Model model, HttpSession session) {
		
		Professor prof = (Professor)session.getAttribute("loginPrf");
		String profId = prof.getProfId();
		String oldPwd = prof.getProfPwd();
		
		profService.loginProfessor(profId);
		
		String encPwd = bCryptPasswordEncoder.encode(profPwd);
		String newAddress = "";
		
		if (postNum == "" || address1 == "" || address2 == "") {
			newAddress = profAddress;
		} else {
			newAddress = "(" + postNum + ") " + address1 + " " + address2;
		}
		
		prof.setProfId(profId);
		prof.setProfPwd(encPwd);
		prof.setProfEmail(profEmail);
		prof.setProfPhone(profPhone);
		prof.setProfAddress(newAddress);
		
		profService.editMypage(prof);
		
		return "redirect:profMypage.pr";
	}
	
	
	// ============= 강의 관리 ==============
	// 강의 개설시 뷰에 읽기전용 데이터 로드
	@RequestMapping("profLectInfoLoad.pr")
	public String profLectInfoLoad(HttpServletRequest httpServletRequest, Model model, HttpSession session) {
		Professor professor = (Professor)session.getAttribute("loginPrf");
		String profId = professor.getProfId();
		
		Professor prof = profService.profInfoLoad(profId);
		
		model.addAttribute("prof", prof);
		
		return "professor/profCreateLecture";
	}
	
	// 강의 개설 신청
	@RequestMapping("profCreateLecture.pr")
	public String profCreateLecture(HttpSession session, HttpServletRequest request, RequestedSubject reqSubject,
									int subDivs, int subType, String subTitle,
									int subCredit, String subDay, String subStartTime, String subEndTime, 
									@RequestParam(name="createLectFile", required=false) MultipartFile file) {
		
		Professor prof = (Professor)session.getAttribute("loginPrf");
		String profId = prof.getProfId();
		int deptCode = prof.getProfDept();
		
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
		
		profService.profCreateLecture(reqSubject);
		
		return "redirect:profLectureReq.pr";
	}
	
	// 강의 개설 중복 확인
	@ResponseBody
	@RequestMapping(value="createDuplCheck.pr", produces="application/json; charset=utf-8")
	public String createDuplCheck(HttpSession session, String subTitle) {
		
		Professor prof = (Professor)session.getAttribute("loginPrf");
		String profId = prof.getProfId();
		
		RequestedSubject reqSubject = new RequestedSubject();
		reqSubject.setProfId(profId);
		reqSubject.setSubTitle(subTitle);
		
		int result = profService.createDuplCheck(reqSubject);
		
		return new GsonBuilder().create().toJson(result);
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
									Model model, HttpSession session) {
		
		Professor prof = (Professor)session.getAttribute("loginPrf");
		String profId = prof.getProfId();
		
		int listCount = profService.subListCount(profId);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Subject> subList = profService.selectSubList(profId, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("subList", subList);
		
		return "professor/profLectureView";
	}
	
	// 강의정보 수정
	// 강의 수정시 뷰에 데이터 로드
	@RequestMapping("lectEditInfoLoad.pr")
	public String lectEditInfoLoad(HttpSession session, Model model, String subCode) {
		
		Professor professor = (Professor)session.getAttribute("loginPrf");
		String profId = professor.getProfId();
		
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
	public String profEditLecture(HttpSession session, HttpServletRequest request, RequestedSubject reqSubject,
								  @RequestParam(value="subDay") String subDay,
								  @RequestParam(value="subStartTime") String subStartTime,
								  @RequestParam(value="subEndTime") String subEndTime,
								  @RequestParam(name="changeName", required=false, defaultValue="") String changeName,
								  @RequestParam(name="originName", required=false, defaultValue="") String originName,
							      @RequestParam(name="file", required=false) MultipartFile file, 
							      Model model) {
		
		Professor prof = (Professor)session.getAttribute("loginPrf");
		String profId = prof.getProfId();
		int deptCode = prof.getProfDept();
		
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
		
		// 파일명
		if (!changeName.equals("")) { // 이전 첨부파일이 있으면
			reqSubject.setAttOrigin(originName);
			
			if (!file.getOriginalFilename().equals("")) { // 새로 첨부된 파일이 있으면
				String attChange = saveFile(file, request);
				
				if (attChange != null) {
					reqSubject.setAttChange(attChange);
				}
			} else {
				reqSubject.setAttChange(changeName);
			}
		} else { // 이전 첨부파일 없으면
			if (!file.getOriginalFilename().equals("")) { // 새로 첨부된 파일이 있으면
				String attOrigin = file.getOriginalFilename();
				reqSubject.setAttOrigin(attOrigin);
				
				String attChange = saveFile(file, request);
				reqSubject.setAttChange(attChange);
			}
		}
		
		// 강의 수정 데이터 뷰에서 받아오기
		reqSubject.setDeptCode(deptCode);
		reqSubject.setProfId(profId);
		reqSubject.setSubTime(subTime);
		
		profService.editLectReq(reqSubject);
		
		return "redirect:profLectureReq.pr";
	}
	
	// 강의 수정 중복 확인
	@ResponseBody
	@RequestMapping(value="editDuplCheck.pr", produces="application/json; charset=utf-8")
	public String editDuplCheck(HttpSession session, String subCode) {
		
		Professor prof = (Professor)session.getAttribute("loginPrf");
		String profId = prof.getProfId();
		
		RequestedSubject reqSubject = new RequestedSubject();
		reqSubject.setProfId(profId);
		reqSubject.setSubCode(subCode);
		
		int result = profService.editDuplCheck(reqSubject);
		
		return new GsonBuilder().create().toJson(result);
	}
	
	
	// 강의 삭제
	// 강의 삭제시 뷰에 데이터 로드
	@RequestMapping("lectDelInfoLoad.pr")
	public String lectDelInfoLoad(HttpServletRequest httpServletRequest, Model model, HttpSession session
								  ,String subCode) {
		
		Professor professor = (Professor)session.getAttribute("loginPrf");
		String profId = professor.getProfId();
		
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
	public String profDeleteLecture(HttpSession session, HttpServletRequest request, 
								    @RequestParam(value="subCode", defaultValue="") String subCode) {
		
		Professor prof = (Professor)session.getAttribute("loginPrf");
		String profId = prof.getProfId();
		
		Map map = new HashMap();
		map.put("profId", profId);
		map.put("subCode", subCode);
		
		Subject sub = profService.delSubInfo(map);
		
		RequestedSubject reqSubject = new RequestedSubject();
		reqSubject.setProfId(profId);
		reqSubject.setSubCode(sub.getSubCode());
		reqSubject.setSubDivs(sub.getSubDivs());
		reqSubject.setSubTitle(sub.getSubTitle());
		reqSubject.setSubCredit(sub.getSubCredit());
		reqSubject.setSubType(sub.getSubType());
		reqSubject.setSubTime(sub.getSubTime());
		reqSubject.setDeptCode(sub.getDeptCode());
		
		profService.delLectReq(reqSubject);
		
		return "redirect:profLectureReq.pr";
	}
	
	// 강의 삭제 중복 확인
	@ResponseBody
	@RequestMapping(value="delDuplCheck.pr", produces="application/json; charset=utf-8")
	public String delDuplCheck(HttpSession session, String subCode) {
		
		Professor prof = (Professor)session.getAttribute("loginPrf");
		String profId = prof.getProfId();
		
		RequestedSubject reqSubject = new RequestedSubject();
		reqSubject.setProfId(profId);
		reqSubject.setSubCode(subCode);
		
		int result = profService.delDuplCheck(reqSubject);
		
		return new GsonBuilder().create().toJson(result);
	}
	
	// 강의 개설/수정/삭제 신청내역 조회
	@RequestMapping("profLectureReq.pr")
	public String profLectureReq(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
								 Model model, HttpSession session) {

		Professor prof = (Professor)session.getAttribute("loginPrf");
		String profId = prof.getProfId();
		
		int listCount = profService.reqSubListCount(profId);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<RequestedSubject> reqSub = profService.selectReqSubList(profId, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("reqSub", reqSub);
		
		return "professor/profLectureReq";
	}
	
	// ============= 학생 관리 =============
	// 학생목록 조회
	@RequestMapping("profStudentDetail.pr")
	public String profStudentDetail(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
			 HttpSession session, Model model) {
		
		Professor prof = (Professor)session.getAttribute("loginPrf");
		String profId = prof.getProfId();
		
		int listCount = gradeService.mainSubCount(profId);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Subject> subList = gradeService.selectMainSub(profId, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("subList", subList);
		
		return "professor/profStudentDetail";
	}
	
	// 학생목록 조회 > 과목 조회
	@RequestMapping("filteredSub.pr")
	public String filteredSub(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
					    	  @RequestParam(name="con1", required=false, defaultValue="0") int con1,
					    	  @RequestParam(name="con2", required=false, defaultValue="0") int con2,
					    	  @RequestParam(name="keyword", required=false, defaultValue="%") String keyword,
					    	  Model model, HttpSession session) {
		
		Professor prof = (Professor)session.getAttribute("loginPrf");
		String profId = prof.getProfId();
		
		// 조건별 과목 검색
		SearchSubject searchSubject = new SearchSubject();
		searchSubject.setCon1(con1);
		searchSubject.setCon2(con2);
		searchSubject.setKeyword(keyword);
		searchSubject.setProfId(profId);
		
		int listCount = gradeService.selectSubListCount(searchSubject);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Subject> subList = gradeService.selectFilteredSubList(searchSubject, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("con1", con1);
		model.addAttribute("con2", con2);
		model.addAttribute("subList", subList);
		
		return "professor/profStudentDetail";
	}
	
	// 과목별 학생목록 조회
	@ResponseBody
	@RequestMapping(value="filteredStudent.pr", produces="application/json; charset=utf-8")
	public String filteredStudent(String subCode, String year, String semester, HttpSession session) {
		
		Professor prof = (Professor)session.getAttribute("loginPrf");
		String profId = prof.getProfId();
		
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
	public String profConsult(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
							  Model model, HttpSession session) {
		
		Professor prof = (Professor)session.getAttribute("loginPrf");
		String profId = prof.getProfId();
		
		int listCount = profService.loadConsultCount(profId);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Consult> conList = profService.loadConsultList(profId, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("conList", conList);
		
		return "professor/profConsult";
	}
	
	// 상담 관리 상세
	@ResponseBody
	@RequestMapping(value="profConsultDetail.pr", produces="applicatoin/json; charset=utf-8;")
	public String profConsultDetail(String conNo) {
		Consult detailCon = profService.detailConsult(conNo);
		
		return new GsonBuilder().create().toJson(detailCon);
	}
	
	// 상담신청 승인
	@ResponseBody
	@RequestMapping(value="profConCheck.pr", produces="applicatoin/json; charset=utf-8;")
	public String profConCheck(String status, String rejectReason,
							   @RequestParam(value="conNo", defaultValue = "0") int conNo) {
	
		Consult consult = new Consult();
		consult.setConNo(conNo);
		consult.setRejectReason(rejectReason);
		
		ConsultStatus conStatus = new ConsultStatus();
		conStatus.setConNo(conNo);
		conStatus.setStatus(status);
		
		int checkCon = profService.profConCheck(consult);
		int completeCon = profService.profConComplete(conStatus);
		
		return new GsonBuilder().create().toJson(checkCon);
	}
	
	// 강의평가
	@RequestMapping("profEvaluation.pr")
	public String profEvaluation(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
								 HttpSession session, Model model) {
		Professor prof = (Professor)session.getAttribute("loginPrf");
		String profId = prof.getProfId();
		
		int listCount = gradeService.mainSubCount(profId);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Subject> subList = gradeService.selectMainSub(profId, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("subList", subList);
		
		return "professor/profEvaluation";
	}
	
	// 강의평가 조회
	@RequestMapping("evalSubLoad.pr")
	public String evalSubLoad(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
							  @RequestParam(name="con1", required=false, defaultValue="0") int con1,
							  @RequestParam(name="con2", required=false, defaultValue="0") int con2,
							  @RequestParam(name="keyword", required=false, defaultValue="%") String keyword,
							  Model model, HttpSession session) {
		
		Professor prof = (Professor)session.getAttribute("loginPrf");
		String profId = prof.getProfId();
		
		// 조건별 과목 검색
		SearchSubject searchSubject = new SearchSubject();
		searchSubject.setCon1(con1);
		searchSubject.setCon2(con2);
		searchSubject.setKeyword(keyword);
		searchSubject.setProfId(profId);
		
		int listCount = gradeService.selectSubListCount(searchSubject);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Subject> subList = gradeService.selectFilteredSubList(searchSubject, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("con1", con1);
		model.addAttribute("con2", con2);
		model.addAttribute("subList", subList);
		
		return "professor/profEvaluation";
	}
	
	// 강의평가점수 조회
	@ResponseBody
	@RequestMapping(value="filteredEval.pr", produces="application/json; charset=utf-8")
	public String filteredEval(int subCode, HttpSession session) {
		
		Professor prof = (Professor)session.getAttribute("loginPrf");
		String profId = prof.getProfId();
		
		Map map = new HashMap();
		map.put("profId", profId);
		map.put("subCode", subCode);
		
		Evaluation evalList = profService.selectFilteredEval(map);
		
		return new GsonBuilder().create().toJson(evalList);

	}
	
	// 학적변동 - 휴학 승인
	@RequestMapping("profStudentOff.pr")
	public String profStudentOff(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
								 Model model, HttpSession session) {
		
		Professor prof = (Professor)session.getAttribute("loginPrf");
		String profId = prof.getProfId();
		
		int listCount = profService.offListCount(profId);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<StudentOff> offList = profService.loadOffList(profId, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("offList", offList);
		
		return "professor/profStudentStatus";
	}
	
	// 휴학 상세 모달
	@ResponseBody
	@RequestMapping(value="detailOff.pr", produces="applicatoin/json; charset=utf-8;")
	public String detailOff(int applicationNo) {
		
		StudentOff detailOff = profService.detailOff(applicationNo);
		
		return new GsonBuilder().create().toJson(detailOff);
	}
	
	// 휴학신청 승인
	@ResponseBody
	@RequestMapping(value="profOffCheck.pr", produces="applicatoin/json; charset=utf-8;")
	public String profOffCheck(@RequestParam(value="applicationNo", defaultValue = "0") int applicationNo,
								String stsProcess, String stsComplete) {
	
		StudentStatus stuOff = new StudentStatus();
		stuOff.setApplicationNo(applicationNo);
		stuOff.setStsProcess(stsProcess);
		stuOff.setStsComplete(stsComplete);
		
		int checkOff = profService.profOffCheck(stuOff);
		return new GsonBuilder().create().toJson(checkOff);
	}
	
	// 학적변동 - 자퇴 승인
	@RequestMapping("profStudentDo.pr")
	public String profStudentDo(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage,
								Model model, HttpSession session) {
		
		Professor prof = (Professor)session.getAttribute("loginPrf");
		String profId = prof.getProfId();
		
		int listCount = profService.doListCount(profId);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<StudentDo> doList = profService.loadDoList(profId, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("doList", doList);
		
		return "professor/profStudentDo";
	}
	
	// 자퇴 상세 모달
	@ResponseBody
	@RequestMapping(value="detailDo.pr", produces="applicatoin/json; charset=utf-8;")
	public String detailDo(int applicationNo) {
		
		StudentDo detailDo = profService.detailDo(applicationNo);
		return new GsonBuilder().create().toJson(detailDo);
	}
	
	// 자퇴신청 승인
	@ResponseBody
	@RequestMapping(value="profDoCheck.pr", produces="applicatoin/json; charset=utf-8;")
	public String profDoCheck(@RequestParam(value="applicationNo", defaultValue = "0") int applicationNo,
							  String stsProcess, String stsComplete) {
	
		StudentStatus stuDo = new StudentStatus();
		stuDo.setApplicationNo(applicationNo);
		stuDo.setStsProcess(stsProcess);
		stuDo.setStsComplete(stsComplete);
		
		int checkDo = profService.profDoCheck(stuDo);
		return new GsonBuilder().create().toJson(checkDo);
	}
	

}

