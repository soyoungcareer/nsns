package com.kh.spring.studentEval.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.gradeObject.vo.GradeObject;
import com.kh.spring.lectRegister.vo.LectRegister;
import com.kh.spring.major.vo.Subject;
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
	public ArrayList<Subject> loadSubList(String profId, int gradeYear, int gradeSemester) {
		
		Subject sub = new Subject();
		sub.setProfId(profId);
		sub.setSubYear(gradeYear);
		sub.setSubSmst(gradeSemester);
		
		ArrayList<Subject> result = gradeDao.loadSubList(sqlSession, sub);
		
		return result;
	}
	
	@Override
	public ArrayList<Grade> selectList(String subCode, int gradeYear, int gradeSemester) {
		
		Grade gradeList = new Grade();
		
		ArrayList<Grade> result = gradeDao.selectList(sqlSession, gradeList);
		
		return result;
	}

	@Override
	public ArrayList<GradeObject> loadObjList(String profId) {
		return gradeDao.loadObjList(sqlSession, profId);
	}

	/*
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
	*/

 
}
