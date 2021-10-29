package com.kh.spring.studentEval.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.gradeObject.vo.GradeObject;
import com.kh.spring.lectRegister.vo.LecRegPro;
import com.kh.spring.lectRegister.vo.LectRegister;
import com.kh.spring.lectRegister.vo.SearchReg;
import com.kh.spring.studentEval.dao.GradeStuDao;
import com.kh.spring.studentEval.vo.CountCredit;

@Service
public class GradeStuServiceImpl implements GradeStuService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private GradeStuDao gradeStuDao;
	
	@Override
	public ArrayList<LecRegPro> selectGradeList(int stuId) {
		return gradeStuDao.selectGradeList(sqlSession, stuId);
	}

	@Override
	public CountCredit cCredit(int stuId) {
		return gradeStuDao.cCredit(sqlSession, stuId);
	}

	@Override
	public ArrayList<LecRegPro> selectGradeSearchList(SearchReg sr) {
		return gradeStuDao.selectGradeSearchList(sqlSession, sr);
	}

	@Override
	public CountCredit cSearchCredit(SearchReg sr) {
		return gradeStuDao.cSearchCredit(sqlSession, sr);
	}

	@Override
	public ArrayList<LectRegister> selectReYearList(int stuId) {
		return gradeStuDao.selectReYearList(sqlSession, stuId);
	}

	@Override
	public ArrayList<LectRegister> selectReSemeList(int stuId) {
		return gradeStuDao.selectReSemeList(sqlSession, stuId);
	}

	@Override
	public LecRegPro gradeDetailList(int stuId, String subCode, String date) {
		LectRegister re = new LectRegister();
		re.setStuId(stuId);
		re.setSubCode(subCode);
		
		String day[] = date.split(" ");
		int year = Integer.parseInt(day[0]);
		int sem =Integer.parseInt(day[2]);
		
		re.setYear(year);
		re.setSemester(sem);
		return gradeStuDao.gradeDetailList(sqlSession, re);
	}

	@Override
	public ArrayList<GradeObject> objectList(int stuId) {
		return gradeStuDao.objectList(sqlSession, stuId);
	}


}
