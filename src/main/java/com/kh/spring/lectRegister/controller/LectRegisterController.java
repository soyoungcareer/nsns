package com.kh.spring.lectRegister.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.kh.spring.common.PageInfo;
import com.kh.spring.common.Pagination;
import com.kh.spring.lectRegister.service.LectRegisterService;
import com.kh.spring.lectRegister.vo.LecRegPro;
import com.kh.spring.lectRegister.vo.LectRegister;
import com.kh.spring.lectRegister.vo.SearchReg;
import com.kh.spring.major.vo.Department;
import com.kh.spring.major.vo.Subject;
import com.kh.spring.member.vo.Professor;
import com.kh.spring.member.vo.Student;
import com.kh.spring.studentEval.service.GradeService;
import com.kh.spring.studentEval.vo.Grade;


@Controller
public class LectRegisterController {

	@Autowired
	private LectRegisterService lectRegisterService;
	
	@Autowired
	private GradeService gradeService;
	
	@RequestMapping("register.reg") // 수강신청 페이지-----------------
	public String registerPage(@RequestParam(value="currentPage", required=false, defaultValue="1") 
								int currentPage, Model model, HttpSession session) {
		int listCount = lectRegisterService.lectReListCount();
		ArrayList<Department> departList = lectRegisterService.departList();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
		//int stuId = 20193019;//임시 아이디 
		ArrayList<LecRegPro> arlist =lectRegisterService.selectRegisterList(stuId);
		ArrayList<LecRegPro> sublist = lectRegisterService.lectReList(pi);
		model.addAttribute("pi",pi);
		model.addAttribute("sublist",sublist);//전체 과목
		model.addAttribute("arlist",arlist);//수강신청한 과목
		model.addAttribute("departList",departList);
		
		return "lectRegister/lectRegister";
	}
	
	@ResponseBody 
	@RequestMapping(value="selectReg.reg", produces="applicatoin/json; charset=utf-8")//수강신청한 과목 리스트
	public String selectRegisterList(HttpSession session) {
		int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
		//int stuId = 20193019;//임시 아이디 
		ArrayList<LecRegPro> reglist =lectRegisterService.selectRegisterList(stuId);
		return new GsonBuilder().create().toJson(reglist);
	}
	
	@ResponseBody 
	@RequestMapping(value="registerDe.reg", produces="applicatoin/json; charset=utf-8")//상세페이지 모달 
	public String registerDePage(String subCode) {
		  LecRegPro reDetail = lectRegisterService.lectReDetail(subCode);
		  return new GsonBuilder().create().toJson(reDetail);
		 
	}
	
	@ResponseBody 
	@RequestMapping(value="reInsert.reg", produces="applicatoin/json; charset=utf-8")// 수강신청 추가
	public String registerInsert(String subCode, HttpSession session) {
		int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
		  //int stuId = 20193019;//임시 아이디 
		  int result = lectRegisterService.regiInsert(subCode, stuId);
		  
		  // 수강신청시 성적테이블에 학생정보 insert
		  int gradeResult = gradeService.gradeInsert(subCode, stuId);
		  
		  return new GsonBuilder().create().toJson(result);
		 
	}
	@ResponseBody 
	@RequestMapping(value="reDelete.reg", produces="applicatoin/json; charset=utf-8")// 수강신청 삭제
	public String registerDelete(String subCode, HttpSession session) {
		int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
		  //int stuId = 20193019;//임시 아이디 
		  int result = lectRegisterService.registerDelete(subCode, stuId);
		  
		  // 수강신청취소시 성적테이블에 학생정보 delete
		  int gradeResult = gradeService.gradeDelete(subCode, stuId);
		  return new GsonBuilder().create().toJson(result);
		 
	}
	@ResponseBody 
	@RequestMapping(value="reCheck.reg", produces="applicatoin/json; charset=utf-8")// 이미 수강된 과목인가
	public String checkRegister(String subCode, HttpSession session) {
		  int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
		  //int stuId = 20193019;//임시 아이디 
			LectRegister lect =lectRegisterService.checkRegister(stuId, subCode);//수강과목
			
			return new GsonBuilder().create().toJson(lect);
		 
	}
	@ResponseBody 
	@RequestMapping(value="checkCredit.reg", produces="applicatoin/json; charset=utf-8")// 수강신청 학점 이상인가
	public String checkCredit(HttpSession session) {
		int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
		  //int stuId = 20193019;//임시 아이디 
			Integer countCredit =lectRegisterService.checkCredit(stuId);//수강과목
			return new GsonBuilder().create().toJson(countCredit);
		 
	}
	@ResponseBody 
	@RequestMapping(value="checkDate.reg", produces="applicatoin/json; charset=utf-8")// 수강신청하는데 중복된 시간인가
	public String checkDate(String subCode, HttpSession session) {
		  int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
		  //int stuId = 20193019;//임시 아이디 
		  ArrayList<LecRegPro> arlist =lectRegisterService.selectRegisterList(stuId);//수강신청한 과목
		  System.out.println("arlist"+arlist);
		  int result =lectRegisterService.checkDate(arlist, subCode);//수강과목
		  System.out.println("result"+result);
			return new GsonBuilder().create().toJson(result);
		 
	}
	@RequestMapping("searchReg.reg")// 수강신청 검색
	public String searchRegister(@RequestParam(value="currentPage", required= false, defaultValue = "1") int currentPage,
			@RequestParam(value="condition1", required= false, defaultValue = "0") int condition1,
			@RequestParam(value="condition2", required= false, defaultValue = "0") int condition2,
			@RequestParam(value="search", required= false, defaultValue = "%") String search, Model model, HttpSession session) {
		  
			SearchReg sr = new SearchReg();
			sr.setCondition1(condition1);
			sr.setCondition2(condition2);
			sr.setSearch(search);
		  	int listCount = lectRegisterService.searchListCount(sr);// 검색후 list 갯수
		  	PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		  	int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
		  	//int stuId = 20193019;//
		  	ArrayList<LecRegPro> arlist =lectRegisterService.selectRegisterList(stuId); 
		  	ArrayList<LecRegPro> sublist = lectRegisterService.searchLectReList(sr, pi);
		  	ArrayList<Department> departList = lectRegisterService.departList();
		  	model.addAttribute("pi",pi); 
			model.addAttribute("sublist",sublist);
			model.addAttribute("arlist",arlist);
			model.addAttribute("departList",departList);
			model.addAttribute("condition1",condition1);
			model.addAttribute("condition2",condition2);
			if(search.equals("%")) {
				search="";
			}
			model.addAttribute("search",search);
			return "lectRegister/lectRegister";
		 
	}
	@RequestMapping("cart.reg") // 장바구니 페이지-----------------
	public String cartPage(@RequestParam(value="currentPage", required=false, defaultValue="1") 
				int currentPage, Model model, HttpSession session) {
			int listCount = lectRegisterService.lectReListCount();
			ArrayList<Department> departList = lectRegisterService.departList();
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
			//int stuId = 20193019;//임시 아이디 
			ArrayList<LecRegPro> arlist =lectRegisterService.selectRegisterList(stuId);
			ArrayList<LecRegPro> sublist = lectRegisterService.lectReList(pi);
			
			model.addAttribute("pi",pi);
			model.addAttribute("sublist",sublist);
			model.addAttribute("arlist",arlist);
			model.addAttribute("departList",departList);
					return "lectRegister/registerCart";
	}
	@RequestMapping("searchCart.reg")// 장바구니 검색
	public String searchCart(@RequestParam(value="currentPage", required= false, defaultValue = "1") int currentPage,
			@RequestParam(value="condition1", required= false, defaultValue = "0") int condition1,
			@RequestParam(value="condition2", required= false, defaultValue = "0") int condition2,
			@RequestParam(value="search", required= false, defaultValue = "%") String search, Model model, HttpSession session) {
		  
			SearchReg sr = new SearchReg();
			sr.setCondition1(condition1);
			sr.setCondition2(condition2);
			sr.setSearch(search);
		  	int listCount = lectRegisterService.searchListCount(sr);// 검색후 list 갯수
		  	PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		  	int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
		  	//int stuId = 20193019;//
		  	ArrayList<LecRegPro> arlist =lectRegisterService.selectRegisterList(stuId); 
		  	ArrayList<LecRegPro> sublist = lectRegisterService.searchLectReList(sr, pi);
		  	ArrayList<Department> departList = lectRegisterService.departList();
		  	model.addAttribute("pi",pi); 
			model.addAttribute("sublist",sublist);
			model.addAttribute("arlist",arlist);
			model.addAttribute("departList",departList);
			model.addAttribute("condition1",condition1);
			model.addAttribute("condition2",condition2);
			if(search.equals("%")) {
				search="";
			}
			model.addAttribute("search",search);
			return "lectRegister/registerCart";
		 
	}
	@ResponseBody 
	@RequestMapping(value="selectCartReg.reg", produces="applicatoin/json; charset=utf-8")//장바구니한 과목 리스트
	public String selectRegiCartsterList(HttpSession session) {
		int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
		//int stuId = 20193019;//임시 아이디 
		ArrayList<LecRegPro> cartlist =lectRegisterService.selectRegiCartsterList(stuId);
		return new GsonBuilder().create().toJson(cartlist);
	}
	
	@ResponseBody 
	@RequestMapping(value="reInsertCart.reg", produces="applicatoin/json; charset=utf-8")// 장바구니 추가
	public String registerInsertCart(String subCode, HttpSession session) {
		int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
		//int stuId = 20193019;//임시 아이디 
		  int result = lectRegisterService.regiInsertCart(subCode, stuId);
		  return new GsonBuilder().create().toJson(result);
		 
	}
	@ResponseBody 
	@RequestMapping(value="reDeleteCart.reg", produces="applicatoin/json; charset=utf-8")// 장바구니 삭제
	public String registerDeleteCart(String subCode, HttpSession session) {
		int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
		//int stuId = 20193019;//임시 아이디 
		  int result = lectRegisterService.registerDeleteCart(subCode, stuId);
		  return new GsonBuilder().create().toJson(result);
		 
	}
	@ResponseBody 
	@RequestMapping(value="reCheckCart.reg", produces="applicatoin/json; charset=utf-8")// 이미 장바구니에 추가된 과목인가
	public String checkRegisterCart(String subCode, HttpSession session) {
		int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
		//int stuId = 20193019;//임시 아이디 
			LectRegister lect =lectRegisterService.checkRegisterCart(stuId, subCode);//수강과목
			
			return new GsonBuilder().create().toJson(lect);
		 
	}
	@RequestMapping("timeBoard.reg") // 시간표 페이지-----------------
	public String timeBoardPage(Model model, @RequestParam(value="timeTable", required= false, defaultValue = "1") int timeTable, HttpSession session) {
		int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
		//int stuId = 20193019;//임시 아이디 
		ArrayList<LecRegPro> timeList =lectRegisterService.timeBoardList(stuId);//수강과목 시간표 리스트
		model.addAttribute("timeList",timeList);
		model.addAttribute("timeTable",timeTable);
		return "lectRegister/timeBoard";
	}
	@RequestMapping("timeBCart.reg") // 시간표 장바구니 페이지-----------------
	public String timeBoardCartPage(Model model, @RequestParam(value="timeTable", required= false, defaultValue = "2") int timeTable, HttpSession session) {
		int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
		//int stuId = 20193019;//임시 아이디 
		ArrayList<LecRegPro> timeList =lectRegisterService.timeBoardCartList(stuId);//장바구니 시간표 리스트
		model.addAttribute("timeList",timeList);
		model.addAttribute("timeTable",timeTable);
		return "lectRegister/timeBoard";
	}
	@RequestMapping("registerAdmin.reg") // 관리자 페이지-----------------
	public String registerPageAdmin(@RequestParam(value="currentPage", required=false, defaultValue="1") 
								int currentPage, Model model) {
		int listCount = lectRegisterService.lectReListCount();
		ArrayList<Department> departList = lectRegisterService.departList();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<LecRegPro> sublist = lectRegisterService.lectReList(pi);
		model.addAttribute("pi",pi);
		model.addAttribute("sublist",sublist);//전체 과목
		model.addAttribute("departList",departList);
		
		return "lectRegister/lectRegisterAdmin";
	}

	@RequestMapping("lectRegAdmin.reg") // 관리자용 과목 설명 수정페이지 띄우기
	public String lectRegisterEditPage(String subCode, Model model, @RequestParam(value="message", required= false) String message) {
		LecRegPro reDetail = lectRegisterService.lectReDetail(subCode);
		ArrayList<Department> departList = lectRegisterService.departList();
		ArrayList<Professor> proList = lectRegisterService.proList();
		System.out.println(reDetail.getSubject());
		model.addAttribute("departList",departList);
		model.addAttribute("proList",proList);
		model.addAttribute("reDetail",reDetail);
		if(message!=null) {
			model.addAttribute("message","과목 수정이 완료되었습니다.");
		}
		return "lectRegister/lectRegisterEdit";
	}

	@ResponseBody 
	@RequestMapping(value="deleteAtt.reg", produces="applicatoin/json; charset=utf-8")// 첨부파일 지우기
	public String deleteAttachment(String subCode, String origin, HttpServletRequest request) {
		  deleteFile(origin, request);
		  int result = lectRegisterService.deleteAttachment(subCode);
		  return new GsonBuilder().create().toJson(result);
		 
	}
	
	@RequestMapping("searchRegAdmin.reg")// 수강신청 관리자 검색- 수정
	public String searchRegisterAdmin(@RequestParam(value="currentPage", required= false, defaultValue = "1") int currentPage,
			@RequestParam(value="condition1", required= false, defaultValue = "0") int condition1,
			@RequestParam(value="condition2", required= false, defaultValue = "0") int condition2,
			@RequestParam(value="search", required= false, defaultValue = "%") String search, Model model) {
		  
			SearchReg sr = new SearchReg();
			sr.setCondition1(condition1);
			sr.setCondition2(condition2);
			sr.setSearch(search);
		  	int listCount = lectRegisterService.searchListCount(sr);// 검색후 list 갯수
		  	PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		  	ArrayList<LecRegPro> sublist = lectRegisterService.searchLectReList(sr, pi);
		  	ArrayList<Department> departList = lectRegisterService.departList();
		  	model.addAttribute("pi",pi); 
			model.addAttribute("sublist",sublist);
			model.addAttribute("departList",departList);
			model.addAttribute("condition1",condition1);
			model.addAttribute("condition2",condition2);
			if(search.equals("%")) {
				search="";
			}
			model.addAttribute("search",search);
			return "lectRegister/lectRegisterAdmin";
		 
	}
	
		@RequestMapping("updateAdmin.reg") // 관리자용 과목 설명 수정페이지 update
	public ModelAndView lectUpdateAdminPage(ModelAndView mv, @RequestParam(name="day") String day,@RequestParam(name="start") int start
			,@RequestParam(name="end") int end, Subject subject, @RequestParam(name="reUploadFile", required= false) MultipartFile file
			, HttpServletRequest request) {
			
			
			if (!file.getOriginalFilename().equals("")) {
				if (subject.getChangeName() != null) {
					deleteFile(subject.getOriginName(), request);
				}
				String changeName = saveFile(file, request);

				subject.setOriginName(file.getOriginalFilename());
				subject.setChangeName(changeName);
			}
			
			lectRegisterService.lectUpdateAdmin(subject,day,start,end);

			mv.addObject("subCode", subject.getSubCode());
			mv.addObject("message", "과목 수정이 완료되었습니다.").setViewName("redirect:lectRegAdmin.reg");
			return mv;
	}
	@RequestMapping("deleteAd.reg") // 관리자용 과목 삭제 페이지
	public String lectDeleteAdminPage(String subCode, @RequestParam(name="changeName", required= false) String changeName, 
			HttpServletRequest request) {
		
		if (!changeName.equals("")) {
			deleteFile(changeName, request);
			int result = lectRegisterService.deleteAttachment(subCode);
		}
			lectRegisterService.lectDeleteAdmin(subCode);
		return "redirect:registerAdmin.reg";
	}
	private String saveFile(MultipartFile file, HttpServletRequest request) { //공통으로 사용하기 위해 따로 뺌
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources +"\\upload_files\\";
		
		String originName = file.getOriginalFilename();//원본 파일명
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + ext;
		
			try {
				file.transferTo(new File(savePath+changeName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		return changeName;
	}
	private void deleteFile(String fileName, HttpServletRequest request) {  //공통으로 사용하기 위해 따로 뺌
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources +"\\upload_files\\";
		
		System.out.println("savePath"+savePath);
		
		File deleteFile = new File(savePath+fileName);
		deleteFile.delete();// 파일 삭제
		
	}
}

