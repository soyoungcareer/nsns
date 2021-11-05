package com.kh.spring.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.kh.spring.common.PageInfo;
import com.kh.spring.common.Pagination;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.member.service.MemberService;
import com.kh.spring.member.vo.Admin;
import com.kh.spring.member.vo.Professor;
import com.kh.spring.member.vo.Student;

@Controller
public class MemberController {
	///
	@Autowired
	private MemberService memberService;

	// 암호화 등록
	@Autowired
	private BCryptPasswordEncoder bCPwdEncoder;

	@ResponseBody
	@RequestMapping("boom.me") // 로그인 페이지 이동
	public String loginboom(HttpSession session) {

		System.out.println("&&&&&&&&&&&&&&&&&");
		session.invalidate();

		String a = "a";
		
		return new GsonBuilder().create().toJson(a);
	}
	
	
	
	@RequestMapping("login.mem") // 로그인 페이지 이동
	public String loginPage(HttpSession session) {

		//session.invalidate();

		return "member/loginPage";
	}

	// -------------- 로그인 --------------
	@RequestMapping("login.ber")

	public String loginMember(Admin a, Student s, Professor p, Model model, HttpSession session,
			@RequestParam("position") String position, @RequestParam("userId") String userId,
			@RequestParam("userPwd") String userPwd) {

		if(session.getAttribute("loginStu")!=null) {
			session.removeAttribute("loginStu");

		}else if(session.getAttribute("loginAdm")!=null) {
			session.removeAttribute("loginAdm");

		}else if(session.getAttribute("loginPrf")!=null) {
			session.removeAttribute("loginPrf");

		}
		
		

		System.out.println("position : " + position);
		session.setAttribute("position", position);
		if (position.equals("admin")) {


			a.setAdmId(userId);
			a.setAdmPwd(userPwd);

			Admin loginAdm = memberService.loginAdmin(bCPwdEncoder, a); // bCPwdEncoder,

			// a.setAdmId(userId);
			// a.setAdmPwd(userPwd);

			System.out.println("loginAdm : " + loginAdm);

			model.addAttribute("loginAdm", loginAdm);

			session.setAttribute("loginAdm", loginAdm);
			System.out.println("session 저장 : " + session.getAttribute("loginAdm"));

			
			return "redirect:subModifyList.adm";
			
		}else if(position.equals("student")) {
			

			s.setStuId(Integer.parseInt(userId));
			s.setStuPwd(userPwd);

			Student loginStu = memberService.loginStudent(bCPwdEncoder, s); // bCPwdEncoder,
			System.out.println("loginStu : " + loginStu);
			model.addAttribute("loginStu", loginStu);

			session.setAttribute("loginStu", loginStu);
			System.out.println("session 저장 : " + session.getAttribute("loginStu"));

			return "redirect:stuinfo.st";

		} else if (position.equals("professor")) {

			p.setProfId(userId);
			p.setProfPwd(userPwd);

			Professor loginPrf = memberService.loginProfessor(bCPwdEncoder, p); // (bCPwdEncoder, p);
			System.out.println("loginPrf : " + loginPrf);
			model.addAttribute("loginPrf", loginPrf);

			session.setAttribute("loginPrf", loginPrf);
			System.out.println("session 저장 : " + session.getAttribute("loginPrf"));

			return "redirect:profMypage.pr";

		} else {
			throw new CommException("로그인 실패");
			// System.out.println("로그인 중 오류가 발생하였습니다.");

			// return "redirect:/";
		}

	}

	// -------------- 로그아웃 --------------
	@RequestMapping("logout.adm")
	public String logoutAdmin(HttpSession session) {

		session.invalidate();
		System.out.println("로그아웃되었습니다.");

		return "redirect:/"; // 로그아웃 세션 종료 후 페이지
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

	// -------------- 계정 등록 --------------
	@RequestMapping("stuEnrollForm.adm") // 학생관리-학생 등록
	public String enrollFormStudent() {
		return "member/studentEnrollForm";
	}

	@RequestMapping("prfEnrollForm.adm") // 교수관리-교수등록
	public String enrollFormProfessor() {
		return "member/professorEnrollForm";
	}

	// -------------- 계정 등록 --------------
	@RequestMapping("insertStu.adm") // 학생관리-학생 등록
	public String insertStudent(@ModelAttribute Student s, HttpSession session) {

		System.out.println("student : " + s);
		System.out.println("기존 비밀번호 : " + s.getStuPwd());

		String encPwd = bCPwdEncoder.encode(s.getStuPwd());
		System.out.println("암호화 비밀번호 : " + encPwd);
		s.setStuPwd(encPwd);

		memberService.insertStudent(s);
		session.setAttribute("msg", "학생 등록 성공");

		return "redirect:/";
	}

	@RequestMapping("insertPrf.adm") // 교수관리-교수 등록
	public String insertProfessor(@ModelAttribute Professor p, HttpSession session) {

		System.out.println("professor : " + p);
		System.out.println("기존 비밀번호 : " + p.getProfPwd());

		String encPwd = bCPwdEncoder.encode(p.getProfPwd());
		System.out.println("암호화 비밀번호 : " + encPwd);
		p.setProfPwd(encPwd);

		memberService.insertProfessor(p);
		session.setAttribute("msg", "교수 등록 성공");

		return "redirect:prfList.adm";
	}

	// -------------- 계정 목록 조회 --------------
	@RequestMapping("stuList.adm") // 전체 학생 조회
	public String studentList(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model) {

		int listCount = memberService.studentListCount(); // 전체 학생 수 조회
		System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);

		ArrayList<Student> sList = memberService.studentList(pi);
		System.out.println("sList : " + sList);
		model.addAttribute("sList", sList);
		model.addAttribute("pi", pi);

		return "member/studentListView";
	}

	@RequestMapping("prfList.adm") // 전체 교수 조회
	public String professorList(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model) {

		int listCount = memberService.professorListCount();
		System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);

		ArrayList<Professor> list = memberService.professorList(pi);
		System.out.println("list : " + list);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);

		return "member/professorListView";
	}

	//-------------- 계정 삭제 --------------
	@RequestMapping("stuDelete.adm") //학생 계정 제한 - 퇴학
	public String deleteStudent(int stuId, HttpServletRequest request) {
		

		System.out.println("MC_start stuId : " + stuId);
		memberService.deleteStudent(stuId);
		System.out.println("MC_finish stuId : " + stuId);

		return "redirect:stuList.adm";
	}

	
	@RequestMapping("prfDelete.adm") //교수관리-교수 삭제 - 계약 종료
	public String deleteProfessor(String profId) {

		memberService.deleteProfessor(profId);

		return "redirect:stuList.adm";
	}

	
	//-------------- 학생 학적 변경 --------------
	//학적변경 리스트
/*
	@RequestMapping("stuStaList.adm")
	public String studentStatusList(@RequestParam(value="currentPage", required = false, defaultValue="1") int currentPage , Model model) {
		
		int listCount = memberService.studentStatusListCount();
		System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Student> staList = memberService.studentStatusList(pi);

		System.out.println("staList : " + staList);
		model.addAttribute("staList", staList);
		model.addAttribute("pi", pi);

		return "member/studentStatusUpdate";
	}

	// 학적변경 승인
	@RequestMapping("stuStaUpdate.adm")
	public String studentStatusUpdate(int stuId, HttpServletRequest request) {

		memberService.studentStatusUpdate(stuId);
		System.out.println("MC stuId : " + stuId);

		return "redirect:stuStaUpdateList.adm";
	}

=======
	*/

}
