package com.kh.spring.member.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.spring.major.vo.Subject;
import com.kh.spring.member.dao.ProfessorDao;

public class ProfServiceImpl implements ProfService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ProfessorDao professorDao;
	
	@Override
	public int profLectListCount() {
		return professorDao.profLectListCount(sqlSession);
	}

	@Override
	public ArrayList<Subject> selectSubList(String profId) {
		return professorDao.selectSubList(sqlSession, profId);
	}

}
