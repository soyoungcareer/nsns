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
								, @RequestParam(name="originName", required=false) String originName
								, @RequestParam(name="changeName", required=false) String changeName
								, @RequestParam("deptCode") int deptCode
								, @RequestParam("profId") String profId
								, Subject sub
								, RequestedSubject reqSub
								) {
		
		
		
		System.out.println("=======sub : " + sub);
		System.out.println("=======deptCode : " + deptCode);
		System.out.println("=======profId : " + profId);
		
		
		System.out.println("=======originName : " + originName);
		System.out.println("=======changeName : " + changeName);
		//sub.setOriginName(attOrigin);
		//sub.setChangeName(attChange);
		
		
		
		
	
		subjectService.createSubject(sub);
		
		System.out.println("========sub : " + sub);
		
		subjectService.createRequestSubject(reqSub);
		
		System.out.println("==========controller reqSub : " + reqSub);
		
		return "redirect:subModifyList.adm";
	}
	
	
	@RequestMapping("modifySub.adm") //
	public String modifySubject(Model model, HttpServletRequest request
								, @RequestParam(value="subAttachment", required=false) MultipartFile file
								, @RequestParam(name="originName", required=false) String originName
								, @RequestParam(name="changeName", required=false) String changeName
								, @RequestParam("deptCode") int deptCode
								, @RequestParam("profId") String profId
								, Subject sub
								, RequestedSubject reqSub
								) {
		
		
		System.out.println("=======modify sub : " + sub);

		System.out.println("=======modify deptCode : " + deptCode);
		System.out.println("=======modify profId : " + profId);	
		System.out.println("=======modify originName : " + originName);
		System.out.println("=======modify changeName : " + changeName);
	
		subjectService.modifySubject(sub);
		
		
		
		System.out.println("========modify sub : " + sub);
		
		subjectService.modifyRequestedSubject(reqSub);
		
		System.out.println("==========modify controller reqSub : " + reqSub);
		
		return "redirect:subModifyList.adm";
	}
	
	@RequestMapping("deleteSub.adm")
	public String deleteSubject(Model model, HttpServletRequest request
								, @RequestParam(value="subAttachment", required=false) MultipartFile file
								, @RequestParam(name="originName", required=false) String originName
								, @RequestParam(name="changeName", required=false) String changeName
								, @RequestParam("deptCode") int deptCode
								, @RequestParam("profId") String profId
								, Subject sub
								, RequestedSubject reqSub
								, @RequestParam("subClass") int subClass
								, @RequestParam("subYear") int subYear
								, @RequestParam("subSmst") int subSmst
								, @RequestParam("subCode") int subCode
								) {
		
		
		System.out.println("=======delete sub : " + sub);

		System.out.println("=======delete deptCode : " + deptCode);
		System.out.println("=======delete profId : " + profId);	
		System.out.println("=======delete originName : " + originName);
		System.out.println("=======delete changeName : " + changeName);
		System.out.println("=======delete changeName : " + subCode);
	
		//sub.setSubClass(subClass);
		//sub.setSubYear(subYear);
		//sub.setSubSmst(subSmst);
		
		subjectService.deleteSubject(sub);
		
		
		
		System.out.println("========delete sub : " + sub);
		
		subjectService.deleteRequestedSubject(reqSub);	
		System.out.println("==========delete controller reqSub : " + reqSub);
		
		return "redirect:subModifyList.adm";
	}

	@RequestMapping("subAllList.adm")
	public String subAllList(@RequestParam(value="currentPage", required = false, defaultValue="1") int currentPage , Model model) {
		
		int listCount = subjectService.subAllListCount();
		System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Subject> subAllList = subjectService.subAllList(pi);
		System.out.println("subAllList : " + subAllList);
		model.addAttribute("subAllList", subAllList);
		model.addAttribute("pi", pi);
		
		return "major/subjectAllList";
	}
	
	
	
}
