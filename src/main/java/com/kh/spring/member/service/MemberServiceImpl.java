package com.kh.spring.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

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
			throw new CommException("관리자 로그인 중 오류가 발생하였습니다.");
		}
		
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
		
		System.out.println(bCPwdEncoder.matches(p.getProfPwd(), loginPrf.getProfPwd()));
		
		if(!bCPwdEncoder.matches(p.getProfPwd(), loginPrf.getProfPwd())) {
			throw new CommException("비밀번호가 일치하지 않습니다. 확인하여 주세요.");
		}
		
		return loginPrf;
	}
	
	

}
