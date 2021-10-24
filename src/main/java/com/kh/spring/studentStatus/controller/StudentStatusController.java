package com.kh.spring.studentStatus.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.GsonBuilder;
import com.kh.spring.studentStatus.model.service.StudentStatusService;
import com.kh.spring.studentStatus.model.vo.StudentDo;
import com.kh.spring.studentStatus.model.vo.StudentOff;
import com.kh.spring.studentStatus.model.vo.StudentStatus;

@Controller	
public class StudentStatusController { 
	
	@Autowired
	private StudentStatusService studentStatusService;
	
	//학생 상태 조회 페이지
	@RequestMapping("stuStatusPage.stu")
	public String studentStatusPage() { 
		
		return "studentStatus/studentStatus";
	}
	
	//학생들의 휴복학 신청 현황
	@ResponseBody
	@RequestMapping(value="stuStsPro.stu", produces="application/json; charset=utf-8")
	public String studentProList () { 
		
		String userId = "20193019"; //로그인한 세션의 학생 학번 가져오기
				
		ArrayList<StudentStatus> list = studentStatusService.studentProList(userId);
		
		System.out.println("list : " + list);
		
		return new GsonBuilder().create().toJson(list);
	}
	
	//학생들의 휴학 신청 상세 조회
	@ResponseBody
	@RequestMapping(value="stuOff.stu", produces="application/json; charset=utf-8")
	public String selectStuOff (int appNo) { 
		
		System.out.println("appNo : " + appNo);
		
		StudentOff stuOff = studentStatusService.selectStuOff(appNo);
			
		return new GsonBuilder().create().toJson(stuOff);
	}
	
	// 학생들의 자퇴 신청 상세 조회
	@ResponseBody
	@RequestMapping(value="stuDo.stu", produces="application/json; charset=utf-8")
	public String selectStuDo (int appNo) { 
		
		System.out.println("appNo : " + appNo);
		
		StudentDo stuDo = studentStatusService.selectStuDo(appNo);
			
		return new GsonBuilder().create().toJson(stuDo);
	}
	
	//휴학 신청 페이지
	@RequestMapping("stuOffPage.stu")
	public String stuOffPage() { 

		return "studentStatus/studentOff";
	}
	
	//해당학생이 현재 휴학 신청 중인지 확인
	@ResponseBody 
	@RequestMapping(value="offCount.stu", produces="application/json; charset=utf-8")
	public String selectOffCount (String stuId) { 
		
		int count = studentStatusService.selectOffCount(stuId);
			
		return new GsonBuilder().create().toJson(count);
	}
	
	
	//학생 휴학신청 insert 
	@RequestMapping("insertStuOff.stu")
	public String insertStuOff(StudentOff stuOff, RedirectAttributes redirectAttributes) { 
		
		String stuStatus = "재학"; //세션 로그인 학생정보에서 stuStatus를 가져온다. 
		
		if(stuStatus.equals("재학")) {
			
			studentStatusService.insertStuOff(stuOff);
			redirectAttributes.addFlashAttribute("message", "성공적으로 휴학 신청이 완료되었습니다.");
			
		} else {
			
			redirectAttributes.addFlashAttribute("message", "현재 재학 상태가 아니라 휴학 신청이 불가합니다.");
		}
		
		return "redirect:stuOffPage.stu";
	} 
		
	//자퇴 신청 페이지
	@RequestMapping("stuDoPage.stu")
	public String stuDoPage() { 
				
		return "studentStatus/studentDo";
	}
	
	//해당학생이 현재 자퇴 신청 중인지 확인
	@ResponseBody 
	@RequestMapping(value="DoCount.stu", produces="application/json; charset=utf-8")
	public String selectDoCount (String stuId) { 
			
		int count = studentStatusService.selectDoCount(stuId);
				
		return new GsonBuilder().create().toJson(count);
	}
		
	
	//학생 자퇴신청 insert 
	@RequestMapping("insertStuDo.stu")
	public String insertStuDo(StudentDo stuDo, RedirectAttributes redirectAttributes) { 
			
		String stuStatus = "재학"; //세션 로그인 학생정보에서 stuStatus를 가져온다. 
		
		if(stuStatus.equals("재학")) {
			
			studentStatusService.insertStuDo(stuDo);
			redirectAttributes.addFlashAttribute("message", "성공적으로 자퇴 신청이 완료되었습니다.");
			
		} else {
			
			redirectAttributes.addFlashAttribute("message", "현재 재학상태가 아니라 자퇴 신청이 불가합니다. 관리자에게 문의해주세요");
		}
		
				
		return "redirect:stuDoPage.stu";
	} 
	
	//학생 휴학 신청 취소
	@RequestMapping("deleteOff.stu")
	public String deleteOff(int appNo, RedirectAttributes redirectAttributes) { 
		
		studentStatusService.deleteOff(appNo);
		
		redirectAttributes.addFlashAttribute("message", "해당 휴학 신청이 취소되었습니다.");
		
		return  "redirect:stuStatusPage.stu";
	}
	
	//학생 지퇴 신청 취소
	@RequestMapping("deleteDo.stu")
	public String deleteDo(int appNo, RedirectAttributes redirectAttributes) { 
			
		studentStatusService.deleteDo(appNo);
		
		redirectAttributes.addFlashAttribute("message", "해당 자퇴 신청이 취소되었습니다.");
			
		return  "redirect:stuStatusPage.stu";
	}

}
