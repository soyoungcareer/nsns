package com.kh.spring.lectRegister.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.kh.spring.common.Pagination;
import com.kh.spring.lectRegister.service.LectRegisterService;
import com.kh.spring.lectRegister.vo.LecRegPro;
import com.kh.spring.lectRegister.vo.SearchReg;
import com.kh.spring.major.vo.Department;
import com.kh.spring.notice.vo.PageInfo;

@Controller
public class LectRegisterController {

	@Autowired
	private LectRegisterService lectRegisterService;
	
	@RequestMapping("register.reg") // 수강신청
	public String registerPage(@RequestParam(value="currentPage", required=false, defaultValue="1") 
								int currentPage, Model model) {
		int listCount = lectRegisterService.lectReListCount();
		ArrayList<Department> departList = lectRegisterService.departList();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		int stuId = 20193019;//임시 아이디 
		ArrayList<LecRegPro> arlist =lectRegisterService.selectRegisterList(stuId);
		ArrayList<LecRegPro> sublist = lectRegisterService.lectReList(pi);
		
		model.addAttribute("pi",pi);
		model.addAttribute("sublist",sublist);
		model.addAttribute("arlist",arlist);
		model.addAttribute("departList",departList);
		
		return "lectRegister/lectRegister";
	}
	
	@ResponseBody 
	@RequestMapping(value="selectReg.reg", produces="applicatoin/json; charset=utf-8")//수강신청한 과목 리스트
	public String selectRegisterList() {
		int stuId = 20193019;//임시 아이디 
		ArrayList<LecRegPro> reglist =lectRegisterService.selectRegisterList(stuId);
		return new GsonBuilder().create().toJson(reglist);
	}
	
	@ResponseBody 
	@RequestMapping(value="registerDe.reg", produces="applicatoin/json; charset=utf-8")//상세페이지 모달 
	public String registerDePage(int subCode) {
		  LecRegPro reDetail = lectRegisterService.lectReDetail(subCode);
		  return new GsonBuilder().create().toJson(reDetail);
		 
	}
	
	@ResponseBody 
	@RequestMapping(value="reInsert.reg", produces="applicatoin/json; charset=utf-8")// 수강신청 추가
	public String registerInsert(String subCode) {
		  int stuId = 20193019;//임시 아이디 
		  int result = lectRegisterService.regiInsert(subCode, stuId);
		  return new GsonBuilder().create().toJson(result);
		 
	}
	@ResponseBody 
	@RequestMapping(value="reDelete.reg", produces="applicatoin/json; charset=utf-8")// 수강신청 삭제
	public String registerDelete(String subCode) {
		  int stuId = 20193019;//임시 아이디 
		  int result = lectRegisterService.registerDelete(subCode, stuId);
		  return new GsonBuilder().create().toJson(result);
		 
	}

	@RequestMapping("searchReg.reg")// 수강신청 검색
	public String searchRegister(@RequestParam(value="currentPage", required= false, defaultValue = "1") int currentPage,
			@RequestParam(value="condition1", required= false, defaultValue = "0") int condition1,
			@RequestParam(value="condition2", required= false, defaultValue = "0") int condition2,
			@RequestParam(value="search", required= false, defaultValue = "%") String search, Model model) {
		  
			SearchReg sr = new SearchReg();
			sr.setCondition1(condition1);
			sr.setCondition2(condition2);
			sr.setSearch(search);
		  	int listCount = lectRegisterService.searchListCount(sr);// 검색후 list 갯수
		  	PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		  	int stuId = 20193019;
		  	ArrayList<LecRegPro> arlist =lectRegisterService.selectRegisterList(stuId); 
		  	ArrayList<LecRegPro> sublist = lectRegisterService.searchLectReList(sr, pi);
		  	ArrayList<Department> departList = lectRegisterService.departList();
		  	model.addAttribute("pi",pi); 
			model.addAttribute("sublist",sublist);
			model.addAttribute("arlist",arlist);
			model.addAttribute("departList",departList);
			model.addAttribute("condition1",condition1);
			model.addAttribute("condition2",condition2);
			model.addAttribute("search",search);
			return "lectRegister/lectRegister";
		 
	}
	@RequestMapping("cart.reg") // 장바구니
	public String cartPage() {
		return "lectRegister/registerCart";
	}

	@RequestMapping("timeBoard.reg") // 시간표
	public String timeBoardPage() {
		return "lectRegister/timeBoard";
	}

	@RequestMapping("lectRegisterEdit.reg") // 관리자용 과목 설명 수정페이지
	public String lectRegisterEditPage() {
		return "lectRegister/lectRegisterEdit";
	}

	@RequestMapping("grade.gra") // 성적 조회 페이지
	public String gradeSearchPage() {
		return "studentEval/gradeSearchPage";
	}

	@RequestMapping("credit.reg") // 학점 조회 페이지
	public String creditSearchPage() {
		return "studentEval/creditSearchPage";
	}
}

