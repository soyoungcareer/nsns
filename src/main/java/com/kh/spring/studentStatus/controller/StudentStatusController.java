package com.kh.spring.studentStatus.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.GsonBuilder;
import com.kh.spring.member.vo.Student;
import com.kh.spring.studentStatus.model.service.StudentStatusService;
import com.kh.spring.studentStatus.model.vo.StudentBack;
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
	public String studentProList(HttpSession session) { 
		
		int stuId = ((Student)session.getAttribute("loginStu")).getStuId(); 
				
		ArrayList<StudentStatus> list = studentStatusService.studentProList(stuId);
		
		return new GsonBuilder().create().toJson(list);
	}
	
	//학생들의 휴학 신청 상세 조회
	@ResponseBody
	@RequestMapping(value="stuOff.stu", produces="application/json; charset=utf-8")
	public String selectStuOff (int appNo) throws ParseException { 
		
		StudentOff stuOff = studentStatusService.selectStuOff(appNo);
		
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일").create().toJson(stuOff);
	}
	
	// 학생들의 자퇴 신청 상세 조회
	@ResponseBody
	@RequestMapping(value="stuDo.stu", produces="application/json; charset=utf-8")
	public String selectStuDo (int appNo) { 
		
		StudentDo stuDo = studentStatusService.selectStuDo(appNo);
			
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일").create().toJson(stuDo);
	}
	
	//휴학 신청 페이지
	@RequestMapping("stuOffPage.stu")
	public String stuOffPage() { 

		return "studentStatus/studentOff";
	}
	
	//해당학생이 현재 휴학 신청 중인지 확인 + 자퇴신청 중인지도 확인
	@ResponseBody 
	@RequestMapping(value="offCount.stu", produces="application/json; charset=utf-8")
	public String selectOffCount (HttpSession session) { 
		
		int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
		
		int count = 0;
		
		int countOff = studentStatusService.selectOffCount(stuId);
		
		int countDo = studentStatusService.selectDoCount(stuId);
		
		count = countOff +  countDo;
			
		return new GsonBuilder().create().toJson(count);
	}
	
	
	//학생 휴학신청 insert 
	@RequestMapping("insertStuOff.stu")
	public String insertStuOff(StudentOff stuOff, RedirectAttributes redirectAttributes, HttpSession session) { 
		
		String stuStatus = ((Student)session.getAttribute("loginStu")).getStuStatus();
		
		int stuId =  ((Student)session.getAttribute("loginStu")).getStuId();
		
		stuOff.setStuId(stuId);
		
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
	public String selectDoCount (HttpSession session) { 
		
		int stuId = ((Student)session.getAttribute("loginStu")).getStuId();	
		
		int count = 0;
		
		int countOff = studentStatusService.selectOffCount(stuId);
		
		int countDo = studentStatusService.selectDoCount(stuId);
		
		count = countOff +  countDo;
				
		return new GsonBuilder().create().toJson(count);
	}
		
	
	//학생 자퇴신청 insert 
	@RequestMapping("insertStuDo.stu")
	public String insertStuDo(StudentDo stuDo, RedirectAttributes redirectAttributes, HttpSession session) { 
			
		String stuStatus = ((Student)session.getAttribute("loginStu")).getStuStatus();//세션 로그인 학생정보에서 stuStatus를 가져온다.
		
		int stuId =  ((Student)session.getAttribute("loginStu")).getStuId();
		
		stuDo.setStuId(stuId);
		
		if(stuStatus.equals("재학")) {
			
			studentStatusService.insertStuDo(stuDo);
			redirectAttributes.addFlashAttribute("message", "성공적으로 자퇴 신청이 완료되었습니다.");
			
		} else {
			
			redirectAttributes.addFlashAttribute("message", "현재 재학상태가 아니라 자퇴 신청이 불가합니다. 관리자에게 문의해주세요");
		}
		
				
		return "redirect:stuDoPage.stu";
	} 
	
	//학생 휴학 신청 취소
	@RequestMapping("deleteOff.st")
	public String deleteOff(int appNo, RedirectAttributes redirectAttributes) { 
		
		studentStatusService.deleteOff(appNo);
		
		redirectAttributes.addFlashAttribute("message", "해당 휴학 신청이 취소되었습니다.");
		
		return  "redirect:stuStatusPage.stu";
	}
	
	//학생 지퇴 신청 취소
	@RequestMapping("deleteDo.st")
	public String deleteDo(int appNo, RedirectAttributes redirectAttributes) { 
			
		studentStatusService.deleteDo(appNo);
		
		redirectAttributes.addFlashAttribute("message", "해당 자퇴 신청이 취소되었습니다.");
			
		return  "redirect:stuStatusPage.stu";
	}
	
	// 복학 신청페이지
	@RequestMapping("stuBackPage.stu")
	public String stuBackPage(Model model) { 
		
	    int category = 100;
		
	    StudentBack stuBack =  studentStatusService.stuBackPage(category);
		
		model.addAttribute("stuBack", stuBack);
		
		return "studentStatus/studentBack"; 
	}
	

	

}
