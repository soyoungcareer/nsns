package com.kh.spring.studentEval.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.PageInfo;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.gradeObject.vo.GradeObject;
import com.kh.spring.major.vo.Subject;
import com.kh.spring.studentEval.dao.GradeDao;
import com.kh.spring.studentEval.vo.Grade;
import com.kh.spring.studentEval.vo.SearchGrade;
import com.kh.spring.studentEval.vo.SearchSubject;

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
	public ArrayList<GradeObject> loadObjList(String profId, PageInfo pi) {
		return gradeDao.loadObjList(sqlSession, profId, pi);
	}

	@Override
	public int selectSubListCount(SearchSubject searchSubject) {
		return gradeDao.selectSubListCount(sqlSession, searchSubject);
	}

	@Override
	public ArrayList<Subject> selectFilteredSubList(SearchSubject searchSubject, com.kh.spring.common.PageInfo pi) {
		return gradeDao.selectFilteredSubList(sqlSession, searchSubject, pi);
	}

	@Override
	public ArrayList<Grade> selectFilteredGrade(SearchGrade searchGrade) {
		return gradeDao.selectFilteredGrade(sqlSession, searchGrade);
		
	}

	@Override
	public int updateGrade(Map map) {
		return gradeDao.updateGrade(sqlSession, map);
	}

	@Override
	public int objListCount(String profId) {
		return gradeDao.objListCount(sqlSession, profId);
	}

	
	
	/*
	@Override
	public ArrayList<Grade> selectFilteredGrade(String subCode, int subYear, int subSmst) {
		
		Grade grade = new Grade();
		grade.setSubCode(subCode);
		grade.setGradeYear(subYear);
		grade.setGradeSemester(subSmst);
		
		ArrayList<Grade> result = gradeDao.selectFilteredGrade(sqlSession, grade);
		
		return result;
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
	*/

 
}
