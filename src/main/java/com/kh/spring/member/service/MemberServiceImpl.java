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
	public Admin loginAdmin(BCryptPasswordEncoder bCPwdEncoder, Admin a) {

		Admin loginAdm = memberDao.loginAdmin(sqlSession, a);
		
		if(loginAdm == null) {
			//throw new CommException("관리자 로그인 중 오류가 발생하였습니다.");
			
			
			
			/////////
			/*HttpServletResponse response = null;
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e) {
				out.println("<script>alert('옵션 체크를 다시 확인해 주세요.'); </script>");
				out.flush();
			}*/
			///////////
			
		}
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + bCPwdEncoder.encode(a.getAdmPwd()));
		System.out.println(bCPwdEncoder.matches(a.getAdmPwd(), loginAdm.getAdmPwd()));
		
		if(!bCPwdEncoder.matches(a.getAdmPwd(), loginAdm.getAdmPwd())) {
			throw new CommException("비밀번호가 일치하지 않습니다. 확인하여 주세요.");
		}
		
		
		
		return loginAdm;
	}

	@Override
	public Student loginStudent(BCryptPasswordEncoder bCPwdEncoder, Student s) {
		
		Student loginStu = memberDao.loginStudent(sqlSession, s);
		
		if(loginStu == null) {
			throw new CommException("학생 로그인 중 오류가 발생하였습니다.");
		}
		
		System.out.println("");
		System.out.println(bCPwdEncoder.matches(s.getStuPwd(), loginStu.getStuPwd()));
		
		if(!bCPwdEncoder.matches(s.getStuPwd(), loginStu.getStuPwd())) {
			throw new CommException("비밀번호가 일치하지 않습니다. 확인하여 주세요.");
		}
		
		return loginStu;
	}

	@Override
	public Professor loginProfessor(BCryptPasswordEncoder bCPwdEncoder, Professor p) {

		Professor loginPrf = memberDao.loginProfessor(sqlSession, p);
		
		if(loginPrf == null) {
			throw new CommException("교수 로그인 중 오류가 발생하였습니다.");
		}
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + bCPwdEncoder.encode(p.getProfPwd()));


		System.out.println(bCPwdEncoder.matches(p.getProfPwd(), loginPrf.getProfPwd()));
		
		if(!bCPwdEncoder.matches(p.getProfPwd(), loginPrf.getProfPwd())) {
			throw new CommException("비밀번호가 일치하지 않습니다. 확인하여 주세요.");
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
		// TODO Auto-generated method stub
		return memberDao.professorList(sqlSession, pi);
	}

	@Override
	public void deleteStudent(int stuId) {
		
		int result = memberDao.deleteStudent(sqlSession, stuId);
		
		if(result < 0) {
			throw new CommException("해당 학생 계정을 삭제하는 도중 에러가 발생하였습니다.");
		}
		System.out.println("MSI stuId : " + stuId);
	}

	@Override
	public void deleteProfessor(String profId) {
		
		System.out.println("MSI profId : " + profId);
		
		int result = memberDao.deleteProfessor(sqlSession, profId);
		
		if(result < 0) {
			throw new CommException("해당 교수 계정 권한을 제한하는 도중 에러가 발생하였습니다.");
		}
		
	}

	@Override
	public int studentStatusListCount() {
		// TODO Auto-generated method stub
		return memberDao.studentStatusListCount(sqlSession);
	}

	@Override
	public ArrayList<Student> studentStatusList(PageInfo pi) {
		// TODO Auto-generated method stub
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
		
		System.out.println("MSI start stuId : " + stuId);
		int result = memberDao.stuDoUpdateStu(sqlSession, stuId);
		
		if(result < 0) {
			throw new CommException("학적 변경 중 에러가 발생하였습니다.");
		}
		
	}

	@Override
	public ArrayList<Student> studentOffStaList(PageInfo pi) {
		// TODO Auto-generated method stub
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
		
		System.out.println("MSI start stuId : " + stuId);
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
//
	@Override
	public void deleteStuPrf(String profId) {

		int result = memberDao.deleteStuPrf(sqlSession, profId);
		
		if(result < 0) {
			throw new CommException("학적 변경 중 에러가 발생하였습니다.");
		}
		
	}
/*
	@Override
	public void studentUpdatePrf(int stuId) {

		int result = memberDao.studentUpdatePrf(sqlSession, stuId);
		
		if(result < 0) {
			throw new CommException("학적 변경 중 에러가 발생하였습니다.");
		}
		
	}
	*/

}
