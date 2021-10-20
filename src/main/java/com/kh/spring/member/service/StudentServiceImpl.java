package com.kh.spring.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.member.dao.StudentDao;
import com.kh.spring.member.vo.Student;

@Service
public class StudentServiceImpl implements StudentService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private StudentDao studentDao;

	@Override
	public Student studentInfo(String stuId) {
		
		Student student = studentDao.studentInfo(sqlSession, stuId);
		
		return student;
	}

	@Override
	public void updateStu(Student student) {
		
		int result = studentDao.updateStu(sqlSession, student);
		
		if(result < 0) {
			throw new CommException("학생정보 수정 실패");
		}
		
	}

}
