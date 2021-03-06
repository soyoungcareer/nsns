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
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<RequestedSubject> subList = subjectService.subjectModifyList(pi);
		model.addAttribute("subList", subList);
		model.addAttribute("pi", pi);
		
		return "major/subjectModifyList";
	}
	
	@RequestMapping("detailSub.adm") //강의 신청 내역 상세보기
	public ModelAndView selectSubjectModify(int sno, ModelAndView mv) {
		
		RequestedSubject reqSub = subjectService.selectSubjectModify(sno);
		mv.addObject("reqSub", reqSub).setViewName("major/subjectDetailView");
		
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
			
		subjectService.createSubject(sub);
		
		subjectService.createRequestSubject(reqSub);
		
		return "redirect:subModifyList.adm";
	}
	
	
	@RequestMapping("modifySub.adm") //강의 신청 승인 - 수정
	public String modifySubject(Model model, HttpServletRequest request
								, @RequestParam(value="subAttachment", required=false) MultipartFile file
								, @RequestParam(name="originName", required=false) String originName
								, @RequestParam(name="changeName", required=false) String changeName
								, @RequestParam("deptCode") int deptCode
								, @RequestParam("profId") String profId
								, Subject sub
								, RequestedSubject reqSub
								) {
		
		subjectService.modifySubject(sub);

		subjectService.modifyRequestedSubject(reqSub);
		
		return "redirect:subModifyList.adm";
	}
	
	@RequestMapping("deleteSub.adm") //강의 신청 승인 - 삭제
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
				
		subjectService.deleteSubject(sub);
		
		subjectService.deleteRequestedSubject(reqSub);	
		
		return "redirect:subModifyList.adm";
	}

	@RequestMapping("subAllList.adm") //전체 강의 목록 조회
	public String subAllList(@RequestParam(value="currentPage", required = false, defaultValue="1") int currentPage , Model model) {
		
		int listCount = subjectService.subAllListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Subject> subAllList = subjectService.subAllList(pi);
		model.addAttribute("subAllList", subAllList);
		model.addAttribute("pi", pi);
		
		return "major/subjectAllList";
	}
	
	
	
}
