package com.kh.spring.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.member.service.MemberService;
import com.kh.spring.member.vo.Admin;
import com.kh.spring.member.vo.Professor;
import com.kh.spring.member.vo.Student;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	//암호화 등록
	@Autowired
	private BCryptPasswordEncoder bCPwdEncoder;
	
	/*
	@RequestMapping("login.mem")//메뉴바 테스트
	public String loginPageTest() {
		return "member/loginPage";
	}
	*/

	//-------------- 로그인 --------------
	/*
	@RequestMapping("login.adm")
	public String loginAdmin(Admin a, Model model) {
		
		Admin loginAdm = memberService.loginAdmin(bCPwdEncoder, a);
		System.out.println("loginAdm : " + loginAdm);
		model.addAttribute("loginAdm", loginAdm);
		
		return "admin/noticeListView"; //로그인 후 띄울 페이지
	}
	
	@RequestMapping("login.stu")
	public String loginStudent(Student s, Model model) {
		
		Student loginStu = memberService.loginStudent(bCPwdEncoder, s);
		System.out.println("loginStu : " + loginStu);
		model.addAttribute("loginStu", loginStu);
		
		return "admin/noticeListView"; //로그인 후 띄울 페이지
	}
	
	@RequestMapping("login.prf")
	public String loginProfessor(Professor p, Model model) {
		
		Professor loginPrf = memberService.loginProfessor(bCPwdEncoder, p);
		System.out.println("loginPrf : " + loginPrf);
		model.addAttribute("loginPrf", loginPrf);
		
		return "admin/noticeListView"; //로그인 후 띄울 페이지
	}*/
	
	@RequestMapping("login.mem") //로그인 화면 테스트
	public String loginAdmin(Admin a, Student s, Professor p, Model model) {
		
		return "admin/noticeListView";
	}
	
	//-------------- 로그아웃 --------------
	@RequestMapping("logout.adm")
	public String logoutAdmin(HttpSession session) {
		
		session.invalidate();
		//request.getSession().invalidate();
		
		return "redirect:/"; //로그아웃 세션 종료 후 페이지
	}
	
	@RequestMapping("logout.stu")
	public String logoutStudent(HttpSession session) {
		
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("logout.prf")
	public String logoutProfessor(HttpSession session) {
		
		session.invalidate();
		return "redirect:/";
	}
	
	//학생관리-학생 등록
	@RequestMapping("enrollForm.stu")
	public String enrollFormStudent() {
		return null;
	}
	
	//교수관리-교수등록
	@RequestMapping("enrollForm.prf")
	public String enrollFormProfessor() {
		return null;
	}
	
	//학생관리-학생 등록
	@RequestMapping("insert.stu")
	public String insertStudent() {
		return null;
	}
	
	//교수관리-교수 등록
	@RequestMapping("insert.prf")
	public String insertProfessor() {
		return null;
	}
	
	//학생관리-학생 삭제
	@RequestMapping("delete.stu")
	public String deleteStudent() {
		return null;
	}
	
	//교수관리-교수 삭제
	@RequestMapping("delete.prf")
	public String deleteProfessor() {
		return null;
	}
	
	
	
}
