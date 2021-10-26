package com.kh.spring.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.member.vo.Admin;
import com.kh.spring.member.vo.Professor;
import com.kh.spring.member.vo.Student;

@Repository
public class MemberDao {

	//---------로그인-----------
	public Admin loginAdmin(SqlSessionTemplate sqlSession, Admin a) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.loginAdmin", a);
	}

	public Student loginStudent(SqlSessionTemplate sqlSession, Student s) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.loginStudent", s);
	}

	public Professor loginProfessor(SqlSessionTemplate sqlSession, Professor p) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.loginProfessor", p);
	}

}
