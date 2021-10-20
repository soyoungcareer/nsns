package com.kh.spring.studentStatus.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.studentStatus.model.vo.StudentOff;

@Repository
public class StudentStatusDao {

	public ArrayList<StudentOff> studentOffProList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("studentStatusMapper.studentOffProList");
	}

}
