package com.kh.spring.studentEval.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.notice.vo.PageInfo;
import com.kh.spring.studentEval.dao.GradeDao;
import com.kh.spring.studentEval.vo.Grade;

@Service
public class GradeServiceImpl implements GradeService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private GradeDao gradeDao;
	
	@Override
	public int selectListCount() {
		return gradeDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Grade> selectList(PageInfo pi, String subCode, int gradeYear, int gradeSemester) {
		return gradeDao.selectList(sqlSession, pi, subCode, gradeYear, gradeSemester);
	}

	@Override
	public Grade selectGrade(int gno) {
		Grade g = null;
		int result = gradeDao.increaseCount(sqlSession, gno);
		if (result < 0) {
			throw new CommException("increaseCount 실패");
		} else {
			g = gradeDao.selectGrade(sqlSession, gno);
		}
		
		return g;
	}


 
}
