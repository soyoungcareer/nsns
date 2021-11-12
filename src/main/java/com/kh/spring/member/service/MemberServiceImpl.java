package com.kh.spring.member.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.spring.common.PageInfo;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.member.dao.MemberDao;
import com.kh.spring.member.vo.Admin;
import com.kh.spring.member.vo.Professor;
import com.kh.spring.member.vo.Student;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;

	@Override
	public Admin loginAdmin(BCryptPasswordEncoder bCPwdEncoder, Admin a, HttpServletResponse response) throws IOException {

		Admin loginAdm = memberDao.loginAdmin(sqlSession, a);
		
		if(loginAdm == null) {
			
			String path = "login.mem";
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('계정 속성 또는 아이디 및 비밀번호가 일치하지 않습니다.'); location.href='" + path + "' </script>");
			out.close();
		}
		
		if(!bCPwdEncoder.matches(a.getAdmPwd(), loginAdm.getAdmPwd())) {
			//throw new CommException("비밀번호가 일치하지 않습니다. 확인하여 주세요.");
			String path = "login.mem";
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('계정 속성 또는 아이디 및 비밀번호가 일치하지 않습니다.'); location.href='" + path + "' </script>");
			out.close();
		}
		
		return loginAdm;
	}

	@Override
	public Student loginStudent(BCryptPasswordEncoder bCPwdEncoder, Student s, HttpServletResponse response) throws IOException {
		
		Student loginStu = memberDao.loginStudent(sqlSession, s);
		
		if(loginStu == null) {
			
			String path = "login.mem";
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('계정 속성 또는 아이디 및 비밀번호가 일치하지 않습니다.'); location.href='" + path + "' </script>");
			out.close();
		}
		
		if(!bCPwdEncoder.matches(s.getStuPwd(), loginStu.getStuPwd())) {
			//throw new CommException("비밀번호가 일치하지 않습니다. 확인하여 주세요.");
			String path = "login.mem";
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('계정 속성 또는 아이디 및 비밀번호가 일치하지 않습니다.'); location.href='" + path + "' </script>");
			out.close();
		}
		
		return loginStu;
	}

	@Override
	public Professor loginProfessor(BCryptPasswordEncoder bCPwdEncoder, Professor p, HttpServletResponse response) throws IOException {

		Professor loginPrf = memberDao.loginProfessor(sqlSession, p);
		
		if(loginPrf == null) {
			
			String path = "login.mem";
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('계정 속성 또는 아이디 및 비밀번호가 일치하지 않습니다.'); location.href='" + path + "' </script>");
			out.close();
		}
		
		if(!bCPwdEncoder.matches(p.getProfPwd(), loginPrf.getProfPwd())) {
			//throw new CommException("비밀번호가 일치하지 않습니다. 확인하여 주세요.");
			String path = "login.mem";
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('계정 속성 또는 아이디 및 비밀번호가 일치하지 않습니다.'); location.href='" + path + "' </script>");
			out.close();
		}
		
		return loginPrf;
	}

	@Override
	public void insertStudent(Student s) {
		
		int result = memberDao.insertStudent(sqlSession, s);
		
		if(result < 0) {
			throw new CommException("학생 등록 중 오류가 발생하였습니다.");
		}
		
	}

	@Override
	public void insertProfessor(Professor p) {
		
		int result = memberDao.insertProfessor(sqlSession, p);
		
		if(result < 0) {
			throw new CommException("교수 등록 중 오류가 발생하였습니다.");
		}
		
	}
	
	@Override
	public int studentListCount() {
		
		return memberDao.studentListCount(sqlSession);
	}

	@Override
	public ArrayList<Student> studentList(PageInfo pi) {
		
		return memberDao.studentList(sqlSession, pi);
	}

	@Override
	public int professorListCount() {
		
		return memberDao.professorListCount(sqlSession);
	}

	@Override
	public ArrayList<Professor> professorList(PageInfo pi) {
		
		return memberDao.professorList(sqlSession, pi);
	}

	@Override
	public void deleteStudent(int stuId) {
		
		int result = memberDao.deleteStudent(sqlSession, stuId);
		
		if(result < 0) {
			throw new CommException("해당 학생 계정을 삭제하는 도중 에러가 발생하였습니다.");
		}
		
	}

	@Override
	public void deleteProfessor(String profId) {
		
		int result = memberDao.deleteProfessor(sqlSession, profId);
		
		if(result < 0) {
			throw new CommException("해당 교수 계정 권한을 제한하는 도중 에러가 발생하였습니다.");
		}
		
	}

	@Override
	public int studentStatusListCount() {
		
		return memberDao.studentStatusListCount(sqlSession);
	}

	@Override
	public ArrayList<Student> studentStatusList(PageInfo pi) {
		
		return memberDao.studentStatusList(sqlSession, pi);
	}
	
	@Override
	public void studentStatusUpdate(int stsNo) {
		
		int result = memberDao.studentStatusUpdate(sqlSession, stsNo);
		
		if(result < 0) {
			throw new CommException("학적 변경 중 에러가 발생하였습니다.");
		}
		
	}

	@Override
	public void stuDoUpdateStu(int stuId) {
		
		int result = memberDao.stuDoUpdateStu(sqlSession, stuId);
		
		if(result < 0) {
			throw new CommException("학적 변경 중 에러가 발생하였습니다.");
		}
		
	}

	@Override
	public ArrayList<Student> studentOffStaList(PageInfo pi) {
		
		return memberDao.studentOffStaList(sqlSession, pi);
	}

	@Override
	public void stuOffStaUpdate(int stsNo) {

		int result = memberDao.stuOffStaUpdate(sqlSession, stsNo);
		
		if(result < 0) {
			throw new CommException("학적 변경 중 에러가 발생하였습니다.");
		}
		
	}

	@Override
	public void stuOffUpdate(int stuId) {
		
		int result = memberDao.stuOffUpdate(sqlSession, stuId);
		
		if(result < 0) {
			throw new CommException("학적 변경 중 에러가 발생하였습니다.");
		}
		
	}

	@Override
	public void stuOnStaUpdate(int stsNo) {

		int result = memberDao.stuOnStaUpdate(sqlSession, stsNo);
		
		if(result < 0) {
			throw new CommException("학적 변경 중 에러가 발생하였습니다.");
		}
		
	}

	@Override
	public void stuOnUpdate(int stuId) {
		
		int result = memberDao.stuOnUpdate(sqlSession, stuId);
		
		if(result < 0) {
			throw new CommException("학적 변경 중 에러가 발생하였습니다.");
		}
		
	}

	@Override
	public Student studentUpdate(int stuId) {
		
		Student s = memberDao.studentUpdate(sqlSession, stuId);
		
		return s;
	}

	@Override
	public void studentUpdateProfId(Student s) {

		int result = memberDao.studentUpdateProfId(sqlSession, s);
		
		if(result < 0) {
			throw new CommException("학생 정보 수정 중 오류가 발생하였습니다.");
		}	
	}

}
