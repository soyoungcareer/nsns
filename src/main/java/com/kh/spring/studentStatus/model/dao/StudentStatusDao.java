package com.kh.spring.studentStatus.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.studentStatus.model.vo.StudentOff;
import com.kh.spring.studentStatus.model.vo.StudentStatus;

@Repository
public class StudentStatusDao {


	public ArrayList<StudentStatus> studentProList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("studentStatusMapper.studentProList");
		
	}

	public StudentOff studentOff(SqlSessionTemplate sqlSession, int appNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("studentStatusMapper.studentOff", appNo);
	}

}
