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
	public Student studentInfo(int stuId) {
		
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

	@Override
	public int ChangePW(Student student) {
		
		int result = studentDao.ChangePW(sqlSession, student);
		
		if(result < 0) {
			throw new CommException("비밀번호 변경 실패");
		}
		
		return result;
		
	}

}
