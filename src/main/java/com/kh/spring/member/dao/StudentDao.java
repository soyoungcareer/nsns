package com.kh.spring.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.member.vo.Student;

@Repository
public class StudentDao {

	public Student studentInfo(SqlSessionTemplate sqlSession, int stuId) {
		
		return sqlSession.selectOne("studentMapper.studentInfo", stuId);
	}

	public int updateStu(SqlSessionTemplate sqlSession, Student student) {
		
		return sqlSession.update("studentMapper.updateStu", student);
	}

	public int ChangePW(SqlSessionTemplate sqlSession, Student student) {
		
		return sqlSession.update("studentMapper.ChangePW", student);
	}

}
