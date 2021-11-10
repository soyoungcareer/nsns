package com.kh.spring.member.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.common.PageInfo;
import com.kh.spring.member.vo.Admin;
import com.kh.spring.member.vo.Professor;
import com.kh.spring.member.vo.Student;

@Repository
public class MemberDao {
///
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

	public int insertStudent(SqlSessionTemplate sqlSession, Student s) {
		// TODO Auto-generated method stub
		return sqlSession.insert("memberMapper.insertStudent", s);
	}

	public int insertProfessor(SqlSessionTemplate sqlSession, Professor p) {
		// TODO Auto-generated method stub
		return sqlSession.insert("memberMapper.insertProfessor", p);
	}
	
	public int studentListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.studentListCount");
	}

	public ArrayList<Student> studentList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.studentList", null, rowBounds);
	}

	public int professorListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.professorListCount");
	}

	public ArrayList<Professor> professorList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.professorList", null, rowBounds);
	}

	public int deleteStudent(SqlSessionTemplate sqlSession, int stuId) {
		// TODO Auto-generated method stub
		System.out.println("MD stuId : " + stuId);
		return sqlSession.update("memberMapper.deleteStudent", stuId);
	}

	public int deleteProfessor(SqlSessionTemplate sqlSession, String profId) {
		// TODO Auto-generated method stub
		System.out.println("MD profId : " + profId);
		return sqlSession.update("memberMapper.deleteProfessor", profId);
	}

	public int studentStatusListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.studentStatusListCount");
	}
	
	public ArrayList<Student> studentStatusList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.studentStatusList", null, rowBounds);
	}

	public int studentStatusUpdate(SqlSessionTemplate sqlSession, int stsNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.studentStatusUpdate", stsNo);
	}

	public int stuDoUpdateStu(SqlSessionTemplate sqlSession, int stuId) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.stuDoUpdateStu", stuId);
	}

	public ArrayList<Student> studentOffStaList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.studentOffStaList", null, rowBounds);
	}

	public int stuOffStaUpdate(SqlSessionTemplate sqlSession, int stsNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.stuOffStaUpdate", stsNo);
	}

	public int stuOffUpdate(SqlSessionTemplate sqlSession, int stuId) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.stuOffUpdate", stuId);
	}

	public int stuOnStaUpdate(SqlSessionTemplate sqlSession, int stsNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.stuOnStaUpdate", stsNo);
	}

	public int stuOnUpdate(SqlSessionTemplate sqlSession, int stuId) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.stuOnUpdate", stuId);
	}

	public int deleteStuPrf(SqlSessionTemplate sqlSession, String profId) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.deleteStuPrf", profId);
	}

	public int studentUpdatePrf(SqlSessionTemplate sqlSession, int stuId) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.studentUpdatePrf", stuId);
	}

	public int studentUpdatePrf(SqlSessionTemplate sqlSession, int stuId, String profId) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.studentUpdatePrf", stuId);
	}

	

}
