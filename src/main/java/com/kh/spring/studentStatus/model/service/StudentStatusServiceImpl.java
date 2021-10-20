package com.kh.spring.studentStatus.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.studentStatus.model.dao.StudentStatusDao;
import com.kh.spring.studentStatus.model.vo.StudentDo;
import com.kh.spring.studentStatus.model.vo.StudentOff;
@Service
public class StudentStatusServiceImpl implements StudentStatusService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private StudentStatusDao studentStatusDao;
	
	@Override
	public ArrayList<StudentOff> studentOffProList() {
		
		return studentStatusDao.studentOffProList(sqlSession);
	}

	@Override
	public ArrayList<StudentDo> studentDoProList() {
		
		return null;
	}

}
