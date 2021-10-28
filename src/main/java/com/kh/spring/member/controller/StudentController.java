package com.kh.spring.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.member.service.StudentService;
import com.kh.spring.member.vo.Student;

@Controller
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
	//학생 정보 페이지
	@RequestMapping("stuinfo.st")
	public String selectStuInfo(Model model) {  
		
		//로그인 세션의 학번을 가져와서 전달
		String stuId = "20193019";
		
		Student student = studentService.studentInfo(stuId);
		
		model.addAttribute("student", student);
		
		return "student/studentInfo";
	}
	
	//학생 정보 업데이트 
	@RequestMapping("updateStudent.stu")
	public String updateStu(Student student, RedirectAttributes redirectAttributes) { 
		
		studentService.updateStu(student);
		
		redirectAttributes.addFlashAttribute("message", "학생정보 업데이트 성공");
		
		return "redirect:stuinfo.st";
	}
	
	

}
