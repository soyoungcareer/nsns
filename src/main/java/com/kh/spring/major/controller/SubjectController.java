package com.kh.spring.major.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.common.PageInfo;
import com.kh.spring.common.Pagination;
import com.kh.spring.major.model.service.SubjectService;
import com.kh.spring.major.vo.RequestedSubject;
import com.kh.spring.major.vo.Subject;

@Controller
public class SubjectController {
	
	@Autowired
	private SubjectService subjectService;
	
	@RequestMapping("subModifyList.adm") //강의 신청 내역 조회
	public String subjectModifyList(@RequestParam(value="currentPage", required = false, defaultValue="1") int currentPage , Model model) {
		
		int listCount = subjectService.subjectModifyListCount();
		System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<RequestedSubject> subList = subjectService.subjectModifyList(pi);
		System.out.println("subList : " + subList);
		model.addAttribute("subList", subList);
		model.addAttribute("pi", pi);
		
		return "major/subjectModifyList";
	}
	
	@RequestMapping("detailSub.adm") //강의 신청 내역 상세보기
	public ModelAndView selectSubjectModify(int sno, ModelAndView mv) {
		
		RequestedSubject reqSub = subjectService.selectSubjectModify(sno);
		mv.addObject("reqSub", reqSub).setViewName("major/subjectDetailView");
		
		System.out.println("=======================" + reqSub);
		
		return mv;
	}
	
	@RequestMapping("createSub.adm") //강의 신청 승인 - 등록
	public String createSubject(Model model, HttpServletRequest request
								, @RequestParam(value="subAttachment", required=false) MultipartFile file
								, @RequestParam(value="attOrigin", required=false) String attOrigin
								, @RequestParam(value="attChange", required=false) String attChange
								, Subject sub
								) {
		
		//3,4,7,10 SET //value="" ?
		/*Subject sub, 
		, @RequestParam("deptCode") int deptCode
		, @RequestParam("profId") String profId
		, @RequestParam("subClass") int subClass
		, @RequestParam("subYear") int subYear
		, @RequestParam("subSmst") int subSmst
		attOrigin
		
		, @RequestParam("subCode") String subCode
								, @RequestParam("deptCode") int deptCode
								, @RequestParam("profId") String profId
								, @RequestParam("subClass") int subClass
								, @RequestParam("subYear") int subYear
								, @RequestParam("subSmst") int subSmst
		*/
		
		//Subject sub = new Subject();
		System.out.println(sub);
//		System.out.println("=======subCode : " + subCode);
//		System.out.println("=======deptCode : " + deptCode);
//		System.out.println("=======profId : " + profId);
//		System.out.println("=======subClass : " + subClass);
//		System.out.println("=======subYear : " + subYear);
//		System.out.println("=======subSmst : " + subSmst);
		
		//, RequestedSubject reqSub
		//System.out.println(reqSub);
		//System.out.println(sub);
		
//		sub.setSubCode(subCode);
//		sub.setDeptCode(deptCode);
//		sub.setProfId(profId);
//		sub.setSubClass(subClass);
//		sub.setSubYear(subYear);
//		sub.setSubSmst(subSmst);
		sub.setOriginName(attOrigin);
		sub.setChangeName(attChange);
		
		
		
		
	
		//subjectService.createSubject(sub);
		
		
		//subjectService.createRequestSubject(reqSub);
		
		return "redirect:subModifyList.adm";
	}
	/*
	@RequestMapping("createReqSub.adm")
	public String createRequestSubject(RequestedSubject reqSub) {
		
		System.out.println(reqSub);
		subjectService.createRequestSubject(reqSub);
		
		return "redirect:subModifyList.adm";
	}*/

}
