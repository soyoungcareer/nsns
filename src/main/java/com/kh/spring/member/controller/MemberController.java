package com.kh.spring.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.kh.spring.common.PageInfo;
import com.kh.spring.common.Pagination;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.member.service.LoginAlert;
import com.kh.spring.member.service.MemberService;
import com.kh.spring.member.vo.Admin;
import com.kh.spring.member.vo.Professor;
import com.kh.spring.member.vo.Student;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private BCryptPasswordEncoder bCPwdEncoder;
	
	private static int stuCount = 1;

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

		return "member/loginPage";
	}

	// -------------- 로그인 --------------
	@RequestMapping("login.ber")

	public String loginMember(Admin a, Student s, Professor p, Model model, HttpSession session,
			@RequestParam("position") String position, @RequestParam("userId") String userId,
			@RequestParam("userPwd") String userPwd
			, HttpServletResponse response) throws IOException {

		if(session.getAttribute("loginStu")!=null) {
			session.removeAttribute("loginStu");

		}else if(session.getAttribute("loginAdm")!=null) {
			session.removeAttribute("loginAdm");

		}else if(session.getAttribute("loginPrf")!=null) {
			session.removeAttribute("loginPrf");

		}
		
		session.setAttribute("position", position);
		if (position.equals("admin")) {

			a.setAdmId(userId);
			a.setAdmPwd(userPwd);

			Admin loginAdm = memberService.loginAdmin(bCPwdEncoder, a, response);

			model.addAttribute("loginAdm", loginAdm);
			session.setAttribute("loginAdm", loginAdm);

			return "redirect:subModifyList.adm";		
		}else if(position.equals("student")) {
			
			s.setStuId(Integer.parseInt(userId));
			s.setStuPwd(userPwd);

			Student loginStu = memberService.loginStudent(bCPwdEncoder, s, response);
			model.addAttribute("loginStu", loginStu);

			session.setAttribute("loginStu", loginStu);

			return "redirect:stuinfo.st";
		} else if (position.equals("professor")) {

			p.setProfId(userId);
			p.setProfPwd(userPwd);

			Professor loginPrf = memberService.loginProfessor(bCPwdEncoder, p, response);
			model.addAttribute("loginPrf", loginPrf);

			session.setAttribute("loginPrf", loginPrf);

			return "redirect:profLectureDetail.pr";
		} else {
			
			//LoginAlert.alert(response, "로그인 중 오류가 발생하였습니다.");
			throw new CommException("로그인 중 오류가 발생하였습니다.");
		}
	}

	// -------------- 로그아웃 --------------
	@RequestMapping("logout.adm")
	public String logoutAdmin(HttpSession session) {

		session.invalidate();
		return "redirect:/";
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
	public String insertStudent(@ModelAttribute Student s, HttpSession session
								, @RequestParam("CreateStuId") String CreateStuId) {

		System.out.println("student : " + s);
		System.out.println("기존 비밀번호 : " + s.getStuPwd());

		String encPwd = bCPwdEncoder.encode(s.getStuPwd());
		System.out.println("암호화 비밀번호 : " + encPwd);
		s.setStuPwd(encPwd);
		
		int[] stuIdCount = new int[9999];
		Random r = new Random();
		for(int i = 0; i < 9999; i++) {
			stuIdCount[i] = r.nextInt(9999)+1;
			for(int j = 0; j < i; j++) {
				if(stuIdCount[i] == stuIdCount[j]) {
					i--;
				}
			}
		}
		for(int b = 0; b < 9999; b++) {
			stuCount = stuIdCount[b];
		}
		String grantId = String.format("%04d", stuCount);
		int stuId = Integer.parseInt(CreateStuId + grantId);
		s.setStuId(stuId);
		
		memberService.insertStudent(s);
		session.setAttribute("msg", "학생 등록 성공");

		return "redirect:stuList.adm";
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

		int listCount = memberService.studentListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);

		ArrayList<Student> sList = memberService.studentList(pi);
		model.addAttribute("sList", sList);
		model.addAttribute("pi", pi);

		return "member/studentListView";
	}

	@RequestMapping("prfList.adm") // 전체 교수 조회
	public String professorList(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model) {

		int listCount = memberService.professorListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);

		ArrayList<Professor> prfList = memberService.professorList(pi);
		model.addAttribute("prfList", prfList);
		model.addAttribute("pi", pi);

		return "member/professorListView";
	}

	//-------------- 계정 삭제 --------------
	@RequestMapping("stuDelete.adm") //학생 계정 제한 - 퇴학
	public String deleteStudent(int stuId) {
		
		memberService.deleteStudent(stuId);

		return "redirect:stuList.adm";
	}
	
	@RequestMapping("prfDelete.adm") //교수관리-교수 삭제 - 계약 종료
	public String deleteProfessor(String profId, HttpServletRequest request) {

		profId = request.getParameter("profId");
		memberService.deleteProfessor(profId);

		return "redirect:prfList.adm";
	}

	
	//-------------- 학생 학적 변경 --------------
	@RequestMapping("stuStaList.adm") //학적변경 자퇴 신청 리스트
	public String studentStatusList(@RequestParam(value="currentPage", required = false, defaultValue="1") int currentPage , Model model) {
		
		int listCount = memberService.studentStatusListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Student> staList = memberService.studentStatusList(pi);

		model.addAttribute("staList", staList);
		model.addAttribute("pi", pi);

		return "member/studentStatusUpdate";
	}

	
	@RequestMapping("stuStaUpdate.adm") // 학적변경 자퇴 승인
	public String studentStatusUpdate(int stsNo, int stuId) {

		memberService.studentStatusUpdate(stsNo);
		memberService.stuDoUpdateStu(stuId);

		return "redirect:stuStaList.adm";
	}
	
	@RequestMapping("stuOffStaList.adm") //학적변경 휴학 신청 리스트
	public String studentOffStaList(@RequestParam(value="currentPage", required = false, defaultValue="1") int currentPage , Model model) {
		
		int listCount = memberService.studentStatusListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Student> staList = memberService.studentOffStaList(pi);

		model.addAttribute("staList", staList);
		model.addAttribute("pi", pi);

		return "member/studentOffStatusList";
	}
	
	@RequestMapping("stuOffUpdate.adm") // 학적변경 휴학 승인
	public String stuOffStaUpdate(int stsNo, HttpServletRequest request
								, @RequestParam("stuId") int stuId) {

		memberService.stuOffStaUpdate(stsNo);
		memberService.stuOffUpdate(stuId);

		return "redirect:stuOffStaList.adm";
	}
	
	@RequestMapping("stuOnUpdate.adm") // 학적변경 복학
	public String stuOnStaUpdate(int stsNo, int stuId) {

		memberService.stuOnUpdate(stuId);

		return "redirect:stuOffStaList.adm";
	}
	
	//-------------- 학생 담당교수 변경(담당교수 삭제 시) --------------
	@RequestMapping("stuUpdatePrf.adm")
	public ModelAndView studentUpdate(int stuId, ModelAndView mv) {
		
		Student s = memberService.studentUpdate(stuId);
		mv.addObject("s", s).setViewName("member/studentUpdatePrfForm");
		
		return mv;
	}
	
	@RequestMapping("UpdateProfId.adm")
	public ModelAndView studentUpdateProfId(Student s, ModelAndView mv) {

		memberService.studentUpdateProfId(s);
		mv.addObject("stuId", s.getStuId()).setViewName("redirect:stuList.adm");
		
		return mv;
		}

}
