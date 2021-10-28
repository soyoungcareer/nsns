package com.kh.spring.studentSubject.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.acalendar.model.vo.Acalendar;
import com.kh.spring.common.PageInfo;
import com.kh.spring.studentSubject.model.dao.StudentSubjectDao;
import com.kh.spring.studentSubject.model.vo.SearchCondition;
import com.kh.spring.studentSubject.model.vo.StudentSubject;

@Service
public class StudentSubjectServiceImpl implements StudentSubjectService {
	
	
	@Autowired
	private SqlSessionTemplate sqlsession;	

	@Autowired
	private StudentSubjectDao studentSubjectDao;

	@Override
	public ArrayList<String> selectYear(String stuId) {
		
		ArrayList<String> list = studentSubjectDao.selectYear(sqlsession, stuId);
				
		return list;
	}

	@Override
	public ArrayList<String> selectSemester(String stuId) {
		
		ArrayList<String> list = studentSubjectDao.selectSemester(sqlsession, stuId);
		
		return list;
	}

	@Override
	public int selectListCount(String stuId) {
		
		return studentSubjectDao.selectListCount(sqlsession, stuId);
	}	

	
	@Override
	public ArrayList<StudentSubject> selectStuSubjectList(String stuId, PageInfo pi) {
		
		 ArrayList<StudentSubject> list = studentSubjectDao.selectStuSubjectList(sqlsession, stuId, pi);
		 
		 return list;
		
	}
	
	@Override
	public int selectListCount(SearchCondition sc) {
		// TODO Auto-generated method stub
		return studentSubjectDao.selectListCount(sqlsession, sc);
	}

	

	@Override
	public ArrayList<StudentSubject> searchSubject(SearchCondition sc, PageInfo pi) {
		
		ArrayList<StudentSubject> list = studentSubjectDao.searchSubject(sqlsession, sc, pi);
		
		return list;
	}




}
