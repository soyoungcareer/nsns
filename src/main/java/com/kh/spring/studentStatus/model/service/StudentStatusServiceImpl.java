package com.kh.spring.studentStatus.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.studentStatus.model.dao.StudentStatusDao;
import com.kh.spring.studentStatus.model.vo.StudentDo;
import com.kh.spring.studentStatus.model.vo.StudentOff;
import com.kh.spring.studentStatus.model.vo.StudentStatus;
@Service
public class StudentStatusServiceImpl implements StudentStatusService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private StudentStatusDao studentStatusDao;

	@Override
	public ArrayList<StudentStatus> studentProList() {
		
		ArrayList<StudentStatus> list = studentStatusDao.studentProList(sqlSession);
				
		return list;
	}

	@Override
	public StudentOff studentOff(int appNo) {
	
		StudentOff stuOff = studentStatusDao.studentOff(sqlSession, appNo);
		
		return stuOff;
	}
	
	
}
